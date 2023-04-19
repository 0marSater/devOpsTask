
pipeline {
  agent any
   environment{
    IMAGE_NAME = "flask:v-1.0.0"
   }
    stages {
        stage("Build image") {
            steps{
                script{
                    def file= load "build.groovy"
                    file.buildDockerImage()
                }
            }
        }

        stage("Push image") {
            steps{
                script{
                    def file= load "push.groovy"
                    file.ecrLogin()
                    file.pushImage()
                }
            }
        }
    }
}
