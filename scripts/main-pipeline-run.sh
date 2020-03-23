GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

GIT_COMMIT_MESSAGE=$(git log -1 --pretty=%B)

git checkout staging

git pull

git merge $GIT_BRANCH -m $GIT_COMMIT_MESSAGE

git push