for dir in ./lambda/*/  
do
    LAMBDA_NAME=$(basename "$dir")
    LAMBDA_PATH=$PWD/lambda/$LAMBDA_NAME
    cd $LAMBDA_PATH

    rm -rf venv
    python3 -m venv venv
    ./venv/bin/pip3 install --no-cache-dir -r requirements.txt

    zip -r9 ./function.zip .
    zip -g function.zip function.py

    GIT_BRANCH_NAME_OUTPUT=$(aws cloudformation describe-stacks --stack-name pipeline --query "Stacks[0].Outputs[?OutputKey=='GitBranchNameOutput'].OutputValue" --output text)

    aws s3 cp function.zip s3://$GIT_BRANCH_NAME_OUTPUT-s3-lambda-deployment/$LAMBDA_NAME/$CODEBUILD_BUILD_ID.zip

    rm -rf venv
    rm function.zip

    cd ../..
    
done

python3 ./scripts/update_config.py $CODEBUILD_BUILD_ID