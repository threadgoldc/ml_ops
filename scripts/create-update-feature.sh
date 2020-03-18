GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

python ./scripts/update-config-feature.py $GIT_BRANCH

{ 
    aws cloudformation create-stack  \
    --stack-name $GIT_BRANCH-mlops-resources  \
    --template-body file://cf-templates/mlops-resources.yml \
    --parameters file://cf-templates-params/feature/mlops-resources.json \
    --capabilities CAPABILITY_NAMED_IAM
    
} || { 
     aws cloudformation update-stack  \
    --stack-name $GIT_BRANCH-mlops-resources  \
    --template-body file://cf-templates/mlops-resources.yml \
    --parameters file://cf-templates-params/feature/mlops-resources.json \
    --capabilities CAPABILITY_NAMED_IAM
}