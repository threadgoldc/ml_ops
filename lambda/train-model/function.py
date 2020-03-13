import json

def lambda_handler(event, context):
    import boto3


    codepipeline = boto3.client('codepipeline')
    jobId = event["CodePipeline.job"]["id"]

    try:
    
        codepipeline.put_job_success_result(jobId=jobId)

    except Exception as e:
        print(e)
        resp = codepipeline.put_job_failure_result(jobId=jobId,
                                                    failureDetails={
                                                        'type': 'ConfigurationError',
                                                        'message': str(e),
                                                        'externalExecutionId': context.aws_request_id
                                                    }
                                                )

    print('donzos')