#!/bin/bash
set -e

git config user.email "quesobot@users.noreply.github.com"
git config user.name "quesobot"

if [ "$(git rev-parse --abbrev-ref HEAD)" != "gh-pages" ]; then
  git checkout -B gh-pages origin/gh-pages
fi

if [ -z $SUBMODULE_NAME ]; then
  git merge master --no-edit
else
  # Read path matching $SUBMODULE_NAME from .gitmodules
  SUBMODULE_PATH="$(git config --file .gitmodules --get "submodule.$SUBMODULE_NAME.path" || true)"

  if [ -n "$SUBMODULE_PATH" ]; then
    git submodule sync -- $SUBMODULE_PATH
    git submodule update --init --remote -- $SUBMODULE_PATH

    if [ -n "$(git status --porcelain)" ]; then
      git add --update
      SUBMODULE_SHA="$(git submodule status -- guides/developer-guide | cut -c2-8)"
      git commit -m "Update $SUBMODULE_PATH to $REPOSITORY_NAME@$SUBMODULE_SHA"
    fi
  fi
fi

# Push new commits, if any
if [ -n "$(git log origin/gh-pages..gh-pages)" ]; then
  git push https://$QUESOBOT_ACCESS_TOKEN@github.com/cityofaustin/pages.git gh-pages
fi
