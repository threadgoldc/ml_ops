aws cloudformation create-stack  \
    --stack-name test-stack  \
    --template-body file://cf-templates/aws_tutorial_mlops.yml \
    --parameters file://cf-templates-params/aws_tutorial_mlops.json \
    --capabilities CAPABILITY_NAMED_IAM