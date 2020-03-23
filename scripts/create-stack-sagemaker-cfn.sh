aws cloudformation create-stack  \
    --stack-name sagemaker-nb-stack  \
    --template-body file://cf-templates/sagemaker-cfn.yml \
    --parameters file://cf-templates-params/sagemaker-nb.json \
    --capabilities CAPABILITY_NAMED_IAM