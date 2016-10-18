# Terraform configuration https://www.terraform.io/intro/index.html

variable "account_id" {} # 12-digit number e.g. `-var 'account_id="111122223333"'`
variable "region" {
  default = "us-east-1"
}

data "terraform_remote_state" "state" {
    backend = "s3"
    config {
        bucket = "dti-terraform-state"
        key = "pages-lambda/terraform.tfstate"
        region = "${var.region}"
    }
}

provider "aws" {
  region = "${var.region}"
}

resource "aws_kms_key" "kms_key" {
  description = "Key for https://github.com/cityofaustin/pages"
}

resource "aws_kms_alias" "kms_alias" {
  name = "alias/pages"
  target_key_id = "${aws_kms_key.kms_key.key_id}"
}

resource "aws_iam_role" "iam_role" {
  name = "pages-lambda-execution-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "iam_execution_policy" {
    role = "${aws_iam_role.iam_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "iam_kms_policy" {
    name = "kms-decrypt"
    role = "${aws_iam_role.iam_role.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kms:Decrypt"
      ],
      "Resource": [
        "${aws_kms_key.kms_key.arn}"
      ]
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda" {
  function_name = "pages-lambda"
  role = "${aws_iam_role.iam_role.arn}"
  handler = "index.handler"
  runtime = "nodejs4.3"
  timeout = 10
  filename = "build/pages-lambda-production.zip"
  source_code_hash = "${base64sha256(file("build/pages-lambda-production.zip"))}"
}

resource "aws_api_gateway_rest_api" "api" {
  name = "pages-lambda"
  description = "Webhook receiver to update cityofaustin/pages"
  depends_on = ["aws_lambda_function.lambda"]
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  parent_id = "${aws_api_gateway_rest_api.api.root_resource_id}"
  path_part = "build"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "200" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  type = "AWS_PROXY"
  integration_http_method = "${aws_api_gateway_method.method.http_method}"
  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.lambda.arn}/invocations"
}

resource "aws_api_gateway_integration_response" "integration_response" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  resource_id = "${aws_api_gateway_resource.resource.id}"
  http_method = "${aws_api_gateway_method.method.http_method}"
  status_code = "${aws_api_gateway_method_response.200.status_code}"
  depends_on = ["aws_api_gateway_integration.integration"]
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id = "AllowExecutionFromApiGateway"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.arn}"
  principal = "apigateway.amazonaws.com"
  source_arn = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.api.id}/${aws_api_gateway_deployment.deployment.stage_name}/${aws_api_gateway_method.method.http_method}${aws_api_gateway_resource.resource.path}"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = "${aws_api_gateway_rest_api.api.id}"
  stage_name = "latest"
  depends_on = ["aws_api_gateway_integration.integration"]
}

output "url" {
  value = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.region}.amazonaws.com/${aws_api_gateway_deployment.deployment.stage_name}${aws_api_gateway_resource.resource.path}"
}
