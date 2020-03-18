TOKEN=$(aws ssm get-parameter --name github --query Parameter.Value)
GITHUB_TOKEN=${TOKEN//[^[:alnum:]]/}

export GITHUB_TOKEN=$GITHUB_TOKEN

git clone https://$GITHUB_TOKEN@github.com/threadgoldc/ml_ops.git

cd ml_ops

git fetch 

git checkout prod

git merge origin/dev -m 'merging to prod'

git push