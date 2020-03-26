aws cloudformation create-stack  \
    --stack-name sagemaker-exploratory-nb-instance  \
    --template-body file://cf-templates/sm-exploratory-nb-instance.yml \
    --parameters file://cf-templates-params/sm-nb-instance.json \
    --capabilities CAPABILITY_NAMED_IAM \

aws cloudformation create-stack  \
    --stack-name sagemaker-inference-nb-instance  \
    --template-body file://cf-templates/sm-inference-nb-instance.yml \
    --parameters file://cf-templates-params/sm-nb-instance.json \
    --capabilities CAPABILITY_NAMED_IAM \
