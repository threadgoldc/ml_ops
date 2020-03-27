# Hemloc
## A high-End Enviornment for MLOps in the Cloud

Hemloc provides a Amazon Web Services (AWS) based platform for machine learning practitioners to automatically 
train, host and deploy machine learning models in a reliable way, translating the entire machine learning
pipeline into code. 

## Configurations 
Set up your Hemloc platform within a few minutes: 

1. ```git clone https://github.com/threadgoldc/ml_ops.git```
2. Create an Anaconda or Venv environment:  
### Anaconda
```conda env create -f environment.yml```
```conda activate hemloc```

### Plain Python/Venv
```sudo pip install virtualenv```
```virtualenv ~/hemloc --no-site-packages```
```~/hemloc/bin/pip install -r requirements.txt```


### Pipeline: 
1. Make sure you have a AWS account. If you do not have one yet, follow the instructions here: https://aws.amazon.com/getting-started/
2. Configure the AWS Command Line Interface (CLI) following the instructions from https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
3. Optimize your machine learning experience by configuring your AWS region to ```us-east-1```
4. Authenticate your github account through AWS services.
    1. In the AWS Console, go to Systems Manager -> Parameter Store ((https://console.aws.amazon.com/systems-manager/parameters?region=us-east-1)) 
    2. Create a new paramter -> Name=Github Value=```Github-Repository-Token``
5. Run: ```sh ./scripts/create-stack.sh pipeline```

### Notebook environment 
Once you have configured the pipeline you are ready to launch some Sagemaker notebook instances. Depending on your 
preferences you can now launch: 
1. Exploratory machine learning environment: ```sh ./scripts/create-sm-exploratory-nb-instance.sh```
2. Inference machine learning environment: ```sh ./scripts/create-sm-inference-nb-instance.sh```
3. Both: ```sh ./scripts/create-sm-nb-instances.sh```
