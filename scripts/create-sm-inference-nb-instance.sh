#!/bin/bash

# first retrieve default security groups and subnet
DEFAULT_SECURITY_GROUP="$(aws ec2 describe-security-groups --group-names default \
 --query 'SecurityGroups[*].[GroupId]' --output text)"
DEFAULT_SUBNET="$(aws ec2 describe-subnets --filters Name=availability-zone,Values=us-east-1f \
--query 'Subnets[*].[SubnetId]' --output text)" ||  DEFAULT_SUBNET="$(aws ec2 create-default-subnet  \
--availability-zone us-east-1f --query 'Subnets[*].[SubnetId]' --output text)"

# launch stacks
aws cloudformation create-stack  \
    --stack-name sagemaker-inference-nb-instance  \
    --template-body file://cf-templates/sm-inference-nb-instance.yml \
    --parameters ParameterKey=NotebookInstanceSubNetId,ParameterValue="$DEFAULT_SUBNET" ParameterKey=NotebookInstanceSecGroupId,ParameterValue="$DEFAULT_SECURITY_GROUP"  \
    --capabilities CAPABILITY_NAMED_IAM \
