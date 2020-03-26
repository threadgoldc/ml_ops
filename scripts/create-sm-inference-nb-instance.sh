aws cloudformation create-stack  \
    --stack-name sagemaker-inference-nb-instance2  \
    --template-body file://cf-templates/sm-inference-nb-instance.yml \
    --parameters file://cf-templates-params/sm-nb-instance.json \
    --capabilities CAPABILITY_NAMED_IAM \
