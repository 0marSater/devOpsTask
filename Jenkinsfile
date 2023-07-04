
pipeline {
  agent any
   environment{
    IMAGE_NAME = "flask:v-1.0.0"

    // replace <account-id> with your account id, <region> with your region and <repo-name> with your repository name.
    REPO_NAME = "<account-id>.dkr.ecr.<region>.amazonaws.com/<repo-name>"

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
                    // loading external build.groovy script
                    def file= load "build.groovy"
                    file.buildDockerImage()
                }
            }
        }

        stage("Push to ECR") {
            steps{
                script{
                    // loading external push.groovy script
                    def file = load "push.groovy"
                    file.pushImage()
                }
            }
        }
    }
}
