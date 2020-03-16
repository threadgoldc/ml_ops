TOKEN=$(aws ssm get-parameter --name github --query Parameter.Value)
GITHUB_TOKEN=${TOKEN//[^[:alnum:]]/}

export GITHUB_TOKEN=$GITHUB_TOKEN

hub clone https://$GITHUB_TOKEN@github.com/threadgoldc/ml_ops.git

cd ml_ops

hub fetch 

{ # try

    hub pull-request -m "automated pull request to dev" -b threadgoldc:dev -h threadgoldc:feature-add-dev-prod

} || { # catch
    echo 'Skipping adding pull request'
}