# devOpsTask
This is project as a part of devops assignment that test my knowledge in most devops topics and daily tasks.

The assignment is divided into three parts:
-------------------------------------------

1) Create EKS, ECR, RDS with terraform
      --will be updated alter--

2) Create a simple web app and its pipeline for building, pushing app on private ECR:
- Two Apis :
(a) (http//hostname/client-ip) 
     -> it takes the client request public ip and saves it to RDS.
(B) (http//hostname/client-ip/list)
     -> it shows the list of IPs that triggred the link.

- Building docker image 

- Pushing and automate docker iamge to ECR with script (in my case i did with external groovy script) 
		-> "build.groovy" and "push.groovy".
	
3) Create helm chart that will allow deploying the app with its appropriate k8s resources.
		-> "taskchart" folder.




Some notes you should consider on point 2
--------------------------------------------
- Make sure you installed AWS ECR plugins for Jenkins.
- CREATE IAM user that has the right permission to access to ECR.
- Create an (AWS_ACCESS_KEY_ID and AWS_SECRET_KEY_ID) for that user, and add them to jenkins credentials.




Some notes you should consider on point 3
--------------------------------------------
In case of creating EKS and deploy helm chart on it, first:
1) Create an IAM group with following permissions:
- AmazonEKSClusterPolicy
- AmazonEKSWorkerNodePolicy
- AmazonEC2ContainerRegistryReadOnly
- AmazonEKS_CNI_Policy
- AmazonElasticContainerRegistryPublicReadOnly
- EC2InstanceProfileForImageBuilderECRContainerBuilds
- AmazonElasticContainerRegistryPublicFullAccess
- AWSAppRunnerServicePolicyForECRAccess
- AmazonElasticContainerRegistryPublicPowerUser
- SecretsManagerReadWrite
2) Create an IAM user (AWS_ACCESS_KEY_ID and AWS_SECRET_KEY_ID will be provided) and add the user to the IAM Group created above. 
3) Create with pervious account the EKS infrastructure (VPC, subnets, security group).
4) Create EKS role with policies (AmazonEKSClusterPolicy, AmazonEKSVPCResourceController).
5) Create EKS node group role with policies (AmazonEKSWorkerNodePolicy, AmazonEC2ContainerRegistryReadOnly, AmazonEKS_CNI_Policy)
6) Create node group (EKS-Workers) and attach the pervious node to it.
7) After creating a vpc for The EKS, make sure you tag the two public subsnet with kubernetes.io/role/elb and value 1 or follow the instruction here: https://repost.aws/knowledge-center/eks-load-balancer-controller-subnets
8) Create ODIC for EKS cluster and by following the instruction here: https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html
9) Create AWS load balancer controller by following the instruction here: https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html
	-> that inculde:
		- create loadbalancer-controller-policy.
		- create loadbalancer-controller-role and attach the pervious policy to it.
10) Finally, install helm chart that contains the resource to deploy app.

helpful command you will use 
-----------------------------
- AWS congiure: remotly connect to ur aws account with AWS_ACCESS_KEY_ID, AWS_SECRET_KEY_ID, and region
- aws eks update-kubeconfig --region <region-name> --name <cluster-name>: Update your kubeconfig file to include the credentials for your IAM user.
- kubectl config use-context <cluster-name>: to point the kube to ur EKS cluster on AWS.

	
	
