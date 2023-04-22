//
// def pushImage(){
//     docker.withRegistry('815919245801.dkr.ecr.eu-west-3.amazonaws.com/flask-app', 'ecr:eu-west-3:aws-ecr-credentials')
//     echo "Start pushing image $IMAGE_NAME ..."
//     sh "docker tag $IMAGE_NAME $REPO_NAME:$IMAGE_NAME"
//     sh "docker push  $REPO_NAME:$IMAGE_NAME"
// }
//
//
// return this

def pushImage(){
    docker.withRegistry('https://815919245801.dkr.ecr.eu-west-3.amazonaws.com/flask-app', 'ecr:eu-west-3:aws-ecr-credentials'){
        echo "Start pushing image $IMAGE_NAME ..."
        sh "docker tag $IMAGE_NAME $REPO_NAME:$IMAGE_NAME"
        sh "docker push $REPO_NAME:$IMAGE_NAME"
    }
}

return this