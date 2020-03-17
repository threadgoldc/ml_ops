import json 
from sys import argv

def update_config(git_hash, git_branch_name):
    if '-' in git_branch_name:
        git_branch_name = git_branch_name.split('-')[0]
    with open('./cf-templates-params/%s/mlops-resources.json' % git_branch_name) as json_file:
        data = json.load(json_file)
        data['Parameters']['LambdaVersion'] = git_hash

    with open('./cf-templates-params/%s/mlops-resources.json' % git_branch_name, 'w') as outfile:
        json.dump(data, outfile)

if __name__ == '__main__':
    git_hash = argv[1]
    git_branch_name = argv[2]
    update_config(git_hash)