TOKEN=$(aws ssm get-parameter --name github --query Parameter.Value)
GITHUB_TOKEN=${TOKEN//[^[:alnum:]]/}

export GITHUB_TOKEN=$GITHUB_TOKEN

hub clone https://$GITHUB_TOKEN@github.com/threadgoldc/ml_ops.git

cd ml_ops

git fetch 

git checkout test

git merge origin/feature-add-dev-prod -m 'merging to test'

git push