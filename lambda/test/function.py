import json

def lambda_handler(event, context):
    # TODO banter
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda')
    }