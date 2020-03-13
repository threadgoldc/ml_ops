aws cloudformation create-stack  \
    --stack-name model-hosting-stack  \
    --template-body file://cf-templates/model-hosting.yml \
    --parameters file://cf-templates-params/model-hosting.json \
    --capabilities CAPABILITY_NAMED_IAM