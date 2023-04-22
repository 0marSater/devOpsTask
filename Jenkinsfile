
pipeline {
  agent any
   environment{
    IMAGE_NAME = "flask:v-1.0.0"
    REPO_NAME = "815919245801.dkr.ecr.eu-west-3.amazonaws.com/flask-app"
   }

    stages {
        stage('Clone repository') {
            steps {
                script{
                    checkout scm
                }
            }
        }
        stage("Build image") {
            steps{
                script{
                    def file= load "build.groovy"
                    file.buildDockerImage()
                }
            }
        }

        stage("Push to ECR") {
            steps{
                script{
                    def file = load "push.groovy"
                    file.pushImage()
                }
            }
        }
    }
}
