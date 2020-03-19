GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

git checkout staging

git pull

git merge $GIT_BRANCH -m $(git log -1 --pretty=%B)

git push