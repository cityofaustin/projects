'use strict';

const cryptex = require('cryptex'),
      crypto = require('crypto'),
      https = require('https'),
      url = require('url');

// NB: Lambda waits to return until the event loop is empty, including cryptex's setTimeout
// http://docs.aws.amazon.com/lambda/latest/dg/nodejs-prog-model-context.html
cryptex.update({ env: process.env.NODE_ENV, cacheTimeout: 100 });

// Expects input from API Gateway's Lambda proxy (AWS_PROXY)
// http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-set-up-simple-proxy.html
exports.handler = (event, context, callback) => {
  const success = () => callback(null, { "statusCode": 200 });

  const submoduleName = event.queryStringParameters ? event.queryStringParameters.submodule : null;

  verifySignature(event)
    .then(checkEvent)
    .then(checkBranch)
    .then(payload => requestBuild(payload, submoduleName))
    .then(success)
    .catch(error => {
      if (error instanceof Error) {
        callback(error);
      } else {
        callback(null, { "statusCode": error })
      }
    });
}

function getSecret (key) {
  if (!getSecret.cache) { getSecret.cache = {}; }
  if (key in getSecret.cache) return Promise.resolve(getSecret.cache[key]);
  return cryptex.getSecret(key).then(secret => getSecret.cache[key] = secret);
}

// https://developer.github.com/webhooks/securing/
function verifySignature (event) {
  return getSecret('webhookSecret').then(secret => {
    const hmac = crypto.createHmac('sha1', secret);
    hmac.update(event.body);
    const signature = 'sha1=' + hmac.digest('hex');

    return new Promise((resolve, reject) => {
      event.headers['X-Hub-Signature'] === signature ? resolve(event) : reject(401);
    });
  });
}

// https://developer.github.com/webhooks/#delivery-headers
function checkEvent (event) {
  return new Promise((resolve, reject) => {
    event.headers['X-GitHub-Event'] === 'push' ? resolve(JSON.parse(event.body)) : reject(200);
  });
}

// https://developer.github.com/v3/activity/events/types/#pushevent
function checkBranch (payload) {
  return new Promise((resolve, reject) => {
    payload.ref == 'refs/heads/master' ? resolve(payload) : reject(200);
  });
}

function requestBuild (payload, submoduleName) {
  return getSecret('circleToken').then(circleToken => {
    return new Promise((resolve, reject) => {
      if (!process.env.CIRCLE_URL) return resolve();

      const circleUrl = url.parse(process.env.CIRCLE_URL);

      const options = {
        method: 'POST',
        hostname: circleUrl.hostname,
        path: circleUrl.path + '?circle-token=' + circleToken,
        headers: {
          'Content-Type': 'application/json'
        }
      }

      const body = {
        build_parameters: {
          REPOSITORY_NAME: payload.repository.full_name,
          SUBMODULE_NAME: submoduleName || payload.repository.full_name
        }
      }

      var request = https.request(options);

      request.on('response', response => {
        response.statusCode == 201 ? resolve() : reject(502);
      });

      request.on('error', (error) => reject(error));

      request.end(JSON.stringify(body));
    });
  });
}
