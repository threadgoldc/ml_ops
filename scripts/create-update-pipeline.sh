{ 
    aws cloudformation create-stack  \
    --stack-name uva-deployment-pipeline  \
    --template-body file://cf-templates/uva-deployment-pipeline.yml \
    --parameters file://cf-templates-params/uva-deployment-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
    
} || { 
     aws cloudformation update-stack  \
    --stack-name uva-deployment-pipeline  \
    --template-body file://cf-templates/uva-deployment-pipeline.yml \
    --parameters file://cf-templates-params/uva-deployment-pipeline.json \
    --capabilities CAPABILITY_NAMED_IAM
}