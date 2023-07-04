# DevOps Assignment

This project is a part of a DevOps assignment that aims to assess your knowledge in various DevOps topics and tools. The assignment is divided into three parts, as outlined below:

## Part 1: Infrastructure Provisioning with Terraform
- EKS (Elastic Kubernetes Service) cluster
- ECR (Elastic Container Registry)
- RDS (Relational Database Service)
- ALB (Application Load balancer controller) 

## Part 2: Building a Simple Web Application and Setting up CI/CD Pipeline

Here, you will develop a simple web application and establish a CI/CD pipeline for it. The web application will have the following APIs:

- `http//hostname/client-ip` - Accepts client requests and saves the public IP in the RDS database.
- `http//hostname/client-ip/list` - Displays the list of IPs saved in the RDS database.
- Build a Docker image for the web application.
- Automate the Docker image build and push process to the private ECR using scripts (in my case i did with external groovy script) 
		-> "__build.groovy__" and "__push.groovy__".
  
## Part 3: Deployment with Helm Chart on __AWS EKS__
   - Create a Helm chart that includes all the necessary Kubernetes resources to deploy the web application on AWS EKS.
   - The Helm chart can be found in the __taskchart__ folder.

-----------------------------------------------------------------------------------------------------------------------
For first part This repository contains the necessary resources for provisioning the infrastructure using Terraform. 

## Getting Started

1. Navigate to the `terraform` folder.
2. Run `terraform init` to initialize all modules and providers.
3. Use `terraform apply --auto-approve` to create the entire infrastructure.
4. Once the infrastructure is created, two outputs will be displayed on your screen: `db_instance_address` and `repository_url`.
 Copy these values and paste them in the appropriate locations in the build.groovy and push.groovy files.

For more information about the resources used, please refer to the README file inside the `terraform` folder.

# Web App Development with Flask and Docker

- I have developed a simple web app with two APIs (client-ip, client-ip) using __FLASK__

The CI/CD pipeline for this project is implemented using Jenkins. It consists of three stages:

1. **Clone Repository:** Clone the project repository into the Jenkins pipeline workspace.
2. **Build Docker Image:** Build the Docker image using the `build.groovy` script.
3. **Push Docker Image:** Push the Docker image to a private ECR repository using the `push.groovy` script.

Refer to the `Jenkinsfile` for more details about the CI/CD pipeline stages.

##



helpful commands you will use 
-----------------------------
- `AWS congiure`: remotly connect to ur aws account with AWS_ACCESS_KEY_ID, AWS_SECRET_KEY_ID, and region
- `aws eks update-kubeconfig --region <region-name> --name <cluster-name>`: Update your kubeconfig file to include the credentials for your IAM user.
- `kubectl config use-context <cluster-name>`: to point the kube to ur EKS cluster on AWS.

	


