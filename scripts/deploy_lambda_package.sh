# for dir in ./lambda/*/  
# do
#     LAMBDA_NAME=$(basename "$dir")
#     LAMBDA_PATH=$PWD/lambda/$LAMBDA_NAME
#     cd $LAMBDA_PATH

#     rm -rf venv
#     python3 -m venv venv
#     ./venv/bin/pip3 install --no-cache-dir -r requirements.txt

#     zip -r9 ./function.zip .
#     zip -g function.zip function.py

#     USERNAME_OUTPUT=$(aws cloudformation describe-stacks --stack-name pipeline --query "Stacks[0].Outputs[?OutputKey=='UsernameOutput'].OutputValue" --output text)

#     aws s3 cp function.zip s3://$USERNAME_OUTPUT-s3-lambda-deployment/$LAMBDA_NAME/$CODEBUILD_BUILD_ID.zip

#     rm -rf venv
#     rm function.zip

#     cd ../..
    
# done

# python3 ./scripts/update_config.py $CODEBUILD_BUILD_ID

TOKEN=$(aws ssm get-parameter --name github --query Parameter.Value)
GITHUB_TOKEN=${TOKEN//[^[:alnum:]]/}

hub clone https://$GITHUB_TOKEN@github.com/threadgoldc/ml_ops.git

cd ml_ops

hub fetch 

hub pull-request -m "Implemented feature X" -b threadgoldc:feature-add-dev-prod -h threadgoldc:dev

cd ..

rm -rf ml_ops