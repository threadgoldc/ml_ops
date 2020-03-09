import json 
from sys import argv

def update_config(git_hash):
    with open('../../cf-templates-params/mlops-resources.json') as json_file:
        data = json.load(json_file)
        data['Parameters']['LambdaVersion'] = git_hash

    with open('../../cf-templates-params/mlops-resources.json', 'w') as outfile:
        json.dump(data, outfile)

if __name__ == '__main__':
    git_hash = argv[1]
    update_config(git_hash)