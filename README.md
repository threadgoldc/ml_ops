# Hemloc: A high-End Enviornment for MLOps in the Cloud

Hemloc provides a Amazon Web Services (AWS) based platform for machine learning practitioners to automatically 
train, host and deploy machine learning models in a reliable way, translating the entire machine learning
pipeline into code. 

## Configurations: 

1. ```git clone https://github.com/threadgoldc/ml_ops.git```

### Anaconda
1. ```conda env create -f environment.yml```
2. ```conda activate hemloc```

### Venv 
1. ```sudo pip install virtualenv```
2. ```virtualenv ~/hemloc --no-site-packages```
3. ```~/hemloc/bin/pip install -r requirements.txt```

### Pipeline: 
1. Make sure you have a AWS account. If you do not have one yet, follow the instructions here: https://aws.amazon.com/getting-started/
2. Configure the AWS Command Line Interface (CLI) following the instructions from https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
3. Optimize your machine learning experience by configuring your AWS region to ```us-east-1```
4. Authenticate your github account through AWS services.
    1. In the AWS Console, go to Systems Manager -> Parameter Store ((https://console.aws.amazon.com/systems-manager/parameters?region=us-east-1)) 
    2. Create a new parameter -> ```Name=Github Value=Github-Repository-Token```
5. To create the feature pipeline for dev deployment, run: ```sh ./scripts/create-update-feature.sh <commit message>```
6. To create the production pipeline for staging and production, run ```sh ./scripts/create-update-pipeline.sh <commit message>```
7. Make changes to the code, test it in development by running ```sh ./scripts/create-update-feature.sh <commit message>```
8. To commit changes to staging and production, run  ```sh ./scripts/main-pipeline-run.sh <commit message>```

### Machine learning environment 
Once you have configured the pipeline you are ready to launch some Sagemaker notebook instances. Depending on your 
preferences you can now launch: 
1. Exploratory machine learning environment: ```sh ./scripts/create-sm-exploratory-nb-instance.sh```
2. Inference machine learning environment: ```sh ./scripts/create-sm-inference-nb-instance.sh```
3. Both: ```sh ./scripts/create-sm-nb-instances.sh```