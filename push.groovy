
def ecrLogin(){

    withCredentials([awsAccessKey(credentialsId: 'aws-ecr-credentials', variable: 'AWS_ACCESS_KEY_ID'),
        awsSecretKey(credentialsId: 'aws-ecr-credentials', variable: 'AWS_SECRET_ACCESS_KEY')]) {
        sh 'aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 815919245801.dkr.ecr.eu-west-3.amazonaws.com'
    }
}

def pushImage(){
    echo "Start pushing image $IMAGE_NAME ..."
    def repo_name = "815919245801.dkr.ecr.eu-west-3.amazonaws.com"
    sh "docker tag $IMAGE_NAME $repo_name:$IMAGE_NAME"
    sh "docker push  $repo_name:$IMAGE_NAME"
}
return this