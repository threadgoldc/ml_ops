COMMIT_MESSAGE=$1

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

git add .

git commit -m $COMMIT_MESSAGE

git push --set-upstream origin $GIT_BRANCH

git checkout staging

git pull

git merge $GIT_BRANCH -m $COMMIT_MESSAGE

git push