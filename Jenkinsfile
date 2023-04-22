
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
                    docker.withRegistry('815919245801.dkr.ecr.eu-west-3.amazonaws.com/flask-app', 'ecr:eu-west-3:aws-ecr-credentials')
                    echo "Start pushing image $IMAGE_NAME ..."
                    sh "docker tag $IMAGE_NAME $REPO_NAME:$IMAGE_NAME"
                    sh "docker push  $REPO_NAME:$IMAGE_NAME"
                }
            }
        }
    }
}
