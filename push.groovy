def pushImage(){
    echo "Login to ecr ..."
    // replace <account-id> with your account id, and <database-name> with your ECR name.
    docker.withRegistry('https://<account-id>.dkr.ecr.eu-west-3.amazonaws.com/<ECR-name>',
                            'ecr:<region-code>:<aws-credentials>'){

        echo "Start pushing image $IMAGE_NAME ..."
        tag
        sh "docker tag $IMAGE_NAME $REPO_NAME:latest"
        sh "docker push $REPO_NAME:latest"
    }
}

return this