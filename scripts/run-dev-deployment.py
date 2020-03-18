import json 
from sys import argv
import boto3

def update_config(git_branch):

    with open('./cf-templates-params/uva-dev-pipeline.json') as json_file:
        data = json.load(json_file)
        data[0]['ParameterValue'] = git_branch

    with open('./cf-templates-params/uva-dev-pipeline.json', 'w') as outfile:
        json.dump(data, outfile)

    with open('./cf-templates-params/dev/mlops-resources.json') as json_file:
        data = json.load(json_file)
        data['Parameters']['GitBranchName'] = git_branch

    with open('./cf-templates-params/dev/mlops-resources.json', 'w') as outfile:
        json.dump(data, outfile)

if __name__ == '__main__':
    git_branch = argv[1]
    update_config(git_branch)