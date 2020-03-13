STACK_NAME=$1

aws cloudformation update-stack  \
    --stack-name craig-$STACK_NAME  \
    --template-body file://cf-templates/$STACK_NAME.yml \
    --parameters file://cf-templates-params/temp.json \
    --capabilities CAPABILITY_NAMED_IAM