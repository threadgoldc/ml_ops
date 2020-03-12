import boto3 
from sys import argv
import subprocess
from collections import defaultdict

def empty_ecr(ecr_name):
    ecr_client = boto3.client('ecr')

    images = ecr_client.list_images(repositoryName=ecr_name)['imageIds']
    
    image_digest_list = []
    if len(images) != 0:
        for image in images:
            image_digest_list.append({'imageDigest': image['imageDigest'], 'imageTag': 'latest'})
        ecr_client.batch_delete_image(repositoryName=ecr_name, imageIds=image_digest_list)


def empty_s3_bucket(bucket_name):
    s3_client = boto3.resource('s3')

    versioning = s3_client.BucketVersioning(bucket_name)
    versioning.suspend()
    
    bucket = s3_client.Bucket(bucket_name)
    bucket.object_versions.delete()


def check_stack_s3_ecr(stack_name, cf_client):
    resources = cf_client.list_stack_resources(StackName=stack_name)['StackResourceSummaries']

    for resource in resources:
        if resource['ResourceType'] == 'AWS::S3::Bucket':
            empty_s3_bucket(resource['PhysicalResourceId'])
        if resource['ResourceType'] == 'AWS::ECR::Repository':
            empty_ecr(resource['PhysicalResourceId'])

    cf_client = boto3.client('cloudformation')

def delete_stack(stack_name):
    cf_client = boto3.client('cloudformation')
    check_stack_s3_ecr(stack_name, cf_client)
    cf_client.delete_stack(StackName=stack_name)

if __name__ == '__main__':
    stack_name = argv[1] 

    delete_stack(stack_name)