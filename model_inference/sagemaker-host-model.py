import boto3

def deploy_sagemaker_endpoint(trainingJobName, cf_template):
    """
    Deploys Sagemaker endpoint for inference using trained Sagemaker model
    and CloudFormation template.

    :param trainingJobName: trainJobName of trained Sagemaker model.
    :param cf_template: CloudFormation template to create endpoint.
    :return: Sagemaker endpoint which can be used to deploy model.
    """

    # boto sagemaker and cloudformation instances
    sm = boto3.client("sagemaker")
    cf = boto3.client("cloudformation")

    # get train params
    train_params = sm.describe_training_job(TrainingJobName=trainingJobName)
    trainingImage = train_params['AlgorithmSpecification']["TrainingImage"]
    modelDataUrl = train_params['ModelArtifacts']['S3ModelArtifacts']
    roleArn = train_params['RoleArn']

    # create stack
    with open(cf_template, "r") as f:
        stack = cf.create_stack(StackName=cf_template,
                                TemplateBody=f.read(),
                                Parameters=[
                                    {"ParameterKey": "ModelName", "ParameterValue": trainingJobName},
                                    {"ParameterKey": "TrainingImage", "ParameterValue": trainingImage},
                                    {"ParameterKey": "ModelDataUrl", "ParameterValue": modelDataUrl},
                                    {"ParameterKey": "RoleArn", "ParameterValue": roleArn}
                                ])
        print(stack)

if __name__== "__main__":

    # define your training job name, e.g.,
    trainingJobName = "sagemaker-lstm-2020-03-26-17-01-05-775"

    # define template for sagemaker endpoint, e.g,
    cf_deploy_template = "cf-templates/sm-model-hosting.yml"

    # deploy endpoint for inference
    deploy_sagemaker_endpoint(trainingJobName, cf_deploy_template)
