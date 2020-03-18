{ 
    aws cloudformation create-stack  \
    --stack-name uva-dev-pipeline  \
    --template-body file://cf-templates/uva-dev-pipeline.yml \
    --parameters file://cf-templates-params/uva-dev-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
    
} || { 
     aws cloudformation update-stack  \
    --stack-name uva-dev-pipeline  \
    --template-body file://cf-templates/uva-dev-pipeline.yml \
    --parameters file://cf-templates-params/uva-dev-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
}