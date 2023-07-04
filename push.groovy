def pushImage(){
    echo "Login to ecr ..."
    // replace <account-id> with your account id, <region> with your region, <repo-name> with your repository name,
   // and <jenkins_aws_credentials> with ur credentials for iam jenkins on aws
    docker.withRegistry('https://<account-id>.dkr.ecr.<region>.amazonaws.com/<repo-name>',
                            'ecr:<region>:<jenkins_aws_credentials>'){
        echo "Start pushing image $IMAGE_NAME ..."
        sh "docker tag $IMAGE_NAME $REPO_NAME:latest"
        sh "docker push $REPO_NAME:latest"
    }
}

return this
