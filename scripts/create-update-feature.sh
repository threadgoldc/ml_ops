COMMIT_MESSAGE=$1

git add .

git commit -m $COMMIT_MESSAGE

git push --set-upstream origin feature-pipeline-cleanup

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

python ./scripts/run-dev-deployment.py $GIT_BRANCH

{ 
    aws cloudformation create-stack  \
    --stack-name uva-dev-pipeline  \
    --template-body file://cf-templates/uva-dev-pipeline.yml \
    --parameters file://cf-templates-params/uva-dev-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
    
} || { 
     aws cloudformation update-stack  \
    --stack-name uva-dev-pipeline  \
    --template-body file://cf-templates/uva-dev-pipeline.yml \
    --parameters file://cf-templates-params/uva-dev-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
}

python ./scripts/dev-pipeline-run.py