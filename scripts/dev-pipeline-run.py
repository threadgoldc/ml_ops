import boto3 

def wait_run_pipeline():
    client = boto3.client('cloudformation')

    status = client.describe_stacks(StackName='uva-dev-pipeline')['Stacks'][0]['StackStatus']

    if status == 'CREATE_IN_PROGRESS':
        waiter = client.get_waiter('stack_create_complete') 
        waiter.wait(StackName='uva-dev-pipeline')  

    elif status == 'UPDATE_IN_PROGRESS':
        waiter = client.get_waiter('stack_update_complete') 
        waiter.wait(StackName='uva-dev-pipeline')  
        cp_client = boto3.client('cloudformation')
        cp_client.start_pipeline_execution(name='uva-dev-pipeline')
    
    else:
        print('state is %s' % status)

if __name__ == '__main__':
    wait_run_pipeline()