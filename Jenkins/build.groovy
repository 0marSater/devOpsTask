def buildDockerImage() {
    echo "Start building the docker image ... "
    sh "cd ${WORKSPACE} && docker build -t $IMAGE_NAME ."
}


return this
