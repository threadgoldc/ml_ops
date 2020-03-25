aws cloudformation create-stack  \
    --stack-name sagemaker-nb-instance  \
    --template-body file://cf-templates/sagemaker-nb-instance.yml \
    --parameters file://cf-templates-params/sagemaker-nb-instance.json \
    --capabilities CAPABILITY_NAMED_IAM \
