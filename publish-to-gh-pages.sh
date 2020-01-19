#!/bin/bash
set -ev


# get clone master
git clone https://${GH_REF} .deploy_git
cd .deploy_git
git checkout hexo

cd ../
mv .deploy_git/.git/ ./public/

cd ./public

git config user.name "Gabon"
git config user.email "1431629699@qq.com"

# add commit timestamp
git add .
git commit -m "Travis CI Auto Builder at `date +"%Y-%m-%d %H:%M"`"

# Github Pages
git push --force --quiet "https://${GITHUB_TOKEN}@${GH_REF}" master:master
