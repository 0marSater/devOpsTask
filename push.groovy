def pushImage(){
    echo "Login to ecr ..."
    docker.withRegistry('https://815919245801.dkr.ecr.eu-west-3.amazonaws.com/flask-app', 'ecr:eu-west-3:aws-ecr-credentials'){
        echo "Start pushing image $IMAGE_NAME ..."
        sh "docker tag $IMAGE_NAME $REPO_NAME:latest"
        sh "docker push $REPO_NAME:latest"
    }
}

return this