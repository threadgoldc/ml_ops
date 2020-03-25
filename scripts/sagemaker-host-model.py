import boto3

def create_model_stack(trainingJobName, host_template):
    sm = boto3.client("sagemaker")
    cf = boto3.client("cloudformation")

    # get train params
    train_params = sm.describe_training_job(TrainingJobName=trainingJobName)
    trainingImage = train_params['AlgorithmSpecification']["TrainingImage"]
    modelDataUrl = train_params['ModelArtifacts']['S3ModelArtifacts']
    roleArn = train_params['RoleArn']

    # create stack
    with open(host_template, "r") as f:
        stack = cf.create_stack(StackName=host_template,
                                TemplateBody=f.read(),
                                Parameters=[
                                    {"ParameterKey": "ModelName", "ParameterValue": trainingJobName},
                                    {"ParameterKey": "TrainingImage", "ParameterValue": trainingImage},
                                    {"ParameterKey": "ModelDataUrl", "ParameterValue": modelDataUrl},
                                    {"ParameterKey": "RoleArn", "ParameterValue": roleArn}
                                ])
        print(stack)


