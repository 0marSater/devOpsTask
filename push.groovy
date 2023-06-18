def pushImage(){
    echo "Login to ecr ..."
    // replace <account-id> with your account id, and <ECR-name> with your ECR name.
    docker.withRegistry('https://815919245801.dkr.ecr.eu-west-2.amazonaws.com/task-repo',
                            'ecr:eu-west-2:aws-credentials'){
        echo "Start pushing image $IMAGE_NAME ..."
        sh "docker tag $IMAGE_NAME $REPO_NAME:latest"
        sh "docker push $REPO_NAME:latest"
    }
}

return this
