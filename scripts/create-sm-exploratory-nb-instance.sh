aws cloudformation create-stack  \
    --stack-name sagemaker-exploratory-nb-instance2  \
    --template-body file://cf-templates/sm-exploratory-nb-instance.yml \
    --parameters file://cf-templates-params/sm-nb-instance.json \
    --capabilities CAPABILITY_NAMED_IAM \
