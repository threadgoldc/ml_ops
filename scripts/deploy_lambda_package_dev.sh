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

    aws s3 cp function.zip s3://dev-s3-lambda-deployment/$LAMBDA_NAME/$CODEBUILD_BUILD_ID.zip

    rm -rf venv
    rm function.zip

    cd ../..
    
done

python3 ./scripts/update_config.py $CODEBUILD_BUILD_ID