STACK_NAME=$1

aws cloudformation create-stack  \
    --stack-name test-stack  \
    --template-body file://cf-templates/$STACK_NAME.yml \
    --parameters file://cf-templates-params/$STACK_NAME.json \
    --capabilities CAPABILITY_NAMED_IAM