# devOpsTask
This project consider as a part of devops assignment that test my knowledge in most devops topics and tools.

The assignment is divided into three parts:
-------------------------------------------

1) Create EKS, ECR, RDS with terraform

2) Building a simple web application and setting up CI/CD pipeline.
 - Develop a simple web application with two APIs: `http//hostname/client-ip`: Accepts client requests and saves the public IP in the RDS database.
 ,`http//hostname/client-ip/list`: Displays the list of IPs saved in the RDS database.

- Build a Docker image for the web application.

- Automate the Docker image build and push process to the private ECR using scripts (in my case i did with external groovy script) 
		-> "__build.groovy__" and "__push.groovy__".
	
3) Deployment with Helm Chart on AWS EKS: __AWS EKS__.
   - Create a Helm chart that includes all the necessary Kubernetes resources to deploy the web application on AWS EKS.
		-> The Helm chart can be found in the "__taskchart__" folder.

Some notes you should consider on point 2
--------------------------------------------
- Make sure you installed __AWS ECR plugins__ and __docker plugins__ for Jenkins.
- CREATE IAM user that has the right permission to access to __ECR__.
- Create an (__AWS_ACCESS_KEY_ID__ and __AWS_SECRET_KEY_ID__) for that user, and add them to jenkins credentials.




Some notes you should consider on point 3
--------------------------------------------
In case of creating EKS and deploy helm chart on it, first:
1) Create an IAM group with following permissions:
- __AmazonEKSClusterPolicy__
- __AmazonEKSWorkerNodePolicy__
- __AmazonEC2ContainerRegistryReadOnly__
- __AmazonEKS_CNI_Policy__
- __AmazonElasticContainerRegistryPublicReadOnly__
- __EC2InstanceProfileForImageBuilderECRContainerBuilds__
- __AmazonElasticContainerRegistryPublicFullAccess__
- __AWSAppRunnerServicePolicyForECRAccess__
- __AmazonElasticContainerRegistryPublicPowerUser__
- __SecretsManagerReadWrite___
2) Create an IAM user (__AWS_ACCESS_KEY_ID__ and __AWS_SECRET_KEY_ID__ will be provided) and add the user to the IAM Group created above. 
3) Create with pervious account the EKS infrastructure (__VPC__, __subnets__, __security group__).
4) Create EKS role with policies (__AmazonEKSClusterPolicy__, __AmazonEKSVPCResourceController__).
5) Create EKS node group role with policies (__AmazonEKSWorkerNodePolicy__, __AmazonEC2ContainerRegistryReadOnly__, __AmazonEKS_CNI_Policy__)
6) Create node group (EKS-Workers) and attach the pervious node to it.
7) After creating a vpc for The EKS, make sure you tag the two public subsnet with `kubernetes.io/role/elb `and value `1 ` or follow the instruction here [Resolve the single subnet discovery error](https://repost.aws/knowledge-center/eks-load-balancer-controller-subnets)
8) Create an IAM OIDC provider for your cluster by following the instruction here [Creating an IAM OIDC provider for your cluster](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)
9) Create AWS load balancer controller by following the instruction here [Installing the AWS Load Balancer Controller add-on](https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html)
> that inculde:
- create loadbalancer-controller-policy.
- create loadbalancer-controller-role and attach the pervious policy to it.
10) Finally, install helm chart that contains the resource to deploy app.

helpful commands you will use 
-----------------------------
- `AWS congiure`: remotly connect to ur aws account with AWS_ACCESS_KEY_ID, AWS_SECRET_KEY_ID, and region
- `aws eks update-kubeconfig --region <region-name> --name <cluster-name>`: Update your kubeconfig file to include the credentials for your IAM user.
- `kubectl config use-context <cluster-name>`: to point the kube to ur EKS cluster on AWS.

	
	
