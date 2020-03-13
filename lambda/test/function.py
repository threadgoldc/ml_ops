import json

def lambda_handler(event, context):
    import boto3

    codepipeline = boto3.client('codepipeline')

    pipeline_name = '${AWS::StackName}'
    token = None

    try:
        response = codepipeline.get_pipeline_state( name=pipeline_name )
        executionId = response['stageStates'][0]['latestExecution']['pipelineExecutionId']
        
        # Get the approve train status token
        for stageState in response['stageStates']:
            if stageState['stageName'] == 'TrainApproval':
            for actionState in stageState['actionStates']:
                if actionState['actionName'] == 'ApproveTrain':
                latestExecution = actionState['latestExecution']
                if latestExecution['status'] != 'InProgress':
                    raise(Exception("Train approval is not awaiting for approval: %s" % latestExecution['status']))
                token = latestExecution['token']

        if token is None:
            raise(Exception("Action token wasn't found. Aborting..."))

        codepipeline.put_approval_result(
              pipelineName=pipeline_name,
              stageName='TrainApproval',
              actionName='ApproveTrain',
              token=token
            )

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }