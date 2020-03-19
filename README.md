# ml_ops

make sure to add your github oauth to a ssm parameter called 'github' manually before launching stack:

1. Go to Systems Manager -> Parameter Store (https://console.aws.amazon.com/systems-manager/parameters?region=us-east-1)
2. Create parameter -> Name=github Value=*ill send this via whatsapp*
3. Checkout to the prod branch
4. git pull
5. git checkout -b feature-<name of the branch>
6. make code changes
7. source ./scripts/create-update-feature.sh '<your git commit message>'
8. will deploy as a dev stack