# ml_ops

alrighty. In order to run this, you need to do a few things (this will all be automated later)

Firstly, set up your virtualenv so there are no dependency issues. Run 'source run-virtual-env.sh'.

When thats done, go to AWS and get a default security group and subnet. Paste the IDs into the aws_tutorial_mlops.json

Then you can launch the stack by running 'sh ./scripts/create-stack.sh'

After that, go to Sagemaker and open up the Jupyter notebook of the instance. You can follow tutorials to see whats going on.

When you are done, MAKE SURE TO DELETE THE STACK. These instances are expensive. I have written a script that should do this for you. Just run 'python ./scripts/delete-stack.py test-stack'