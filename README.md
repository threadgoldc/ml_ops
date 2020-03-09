# ml_ops

make sure to add your github oauth to a ssm parameter called 'github' manually before launching stack:

1. Go to Systems Manager -> Parameter Store (https://console.aws.amazon.com/systems-manager/parameters?region=us-east-1)
2. Create parameter -> Name=github Value=*ill send this via whatsapp*
3. Run: sh ./scripts/create-stack.sh pipeline