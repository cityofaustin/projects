cd $HOME/pages

git checkout -b gh-pages origin/gh-pages

git submodule sync --recursive
git submodule init
git submodule update --recursive --remote

if [ -n "$(git status --porcelain)" ]; then
  git config --global user.email "quesobot@users.noreply.github.com"
  git config --global user.name "quesobot"
  git add --update
  git commit -m "Update gh-pages submodules"
  git push https://$QUESOBOT_ACCESS_TOKEN@github.com/cityofaustin/pages.git gh-pages
fi
