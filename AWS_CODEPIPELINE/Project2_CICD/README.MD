# AWS CICD PIPEPLINE
<div align="center">
  <img src="./public/cicd.jpg" alt="Logo" width="100%" height="50%">
</div>

1. Create AWS CodeDeploy Application 
2. As a DevOps Engineer You can follow the following method for each microservices
3. Create Application 
4. Application configuration -> Application name (python-Deploy_flask) -> Compute platform -> EC2 -> Create (For each MicroService we use this methods) Attach Tag to the EC2 service
5. This codedeploy must take the application and deploy that application on the EC2 instance , Now i am need the EC2 instance in default or custom VPC
6. Providing Tags to services helps to optimize the cost of services , Indentify the accurate AWS services in case multiple same services
7. In this case with same key value of 10 or more ec2 instance it will deploy to all ec2 instance
8. Download the agent inside the ec2 instance why ?
9. This agent is ' code deploy agent '  https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html

```
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
```

10. Agent installation done
11. Now give permission to the ec2 instances (codedeploy and ec2 instance talk to each other) attach the role to the ec2 instance
12. Role are (policies) -> 
   - with usecase of EC2 instatnce Only -> Attach policies to this aws codedeploy 
   - Attach this to a ec2 instance

13. Restart the codedeploy service 
```
sudo service codedeploy-agent restart
```
14. CodeDeploy python application
15. Create Deployment groups and provide the EC2 instance
16. Service role -> Code Deploy + EC2 Service role
    - AWSCodeDeployRole
    - AmazonEC2FullAccess
17. Choose how to deploy your application -> In-place
18. Disable LB
19. Create Deployement Group
### 20. Application deployment history Create 
21. Attach the deployment group
22. Revision type -> My application is stored in GitHub
23. Repository name -> adarshadshetty/AWS
24. Commit ID -> Varifying CICD efa7959f80e99ae01f744ea423a1238b289ba235
25. Create Deployment

26. Deployment Process will fail because apps.yml always present at the root of the repository along with start and stop .sh 
27. Now Create a new deployment 
28. Install the docker on EC2-Instance
### 29. Install the Docker 
```
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER  # Replace with your system's username, e.g., 'ubuntu'
newgrp docker
sudo chmod 777 /var/run/docker.sock
```
30. Result of deployment  
<div align="center">
  <img src="./public/deployment.png" alt="Logo" width="100%" height="50%">
</div>

### Build Stage 
<div align="center">
  <img src="./public/buildStage.png" alt="Logo" width="100%" height="50%">
</div>

## 31. Go to code pipeline and add one more stage
Click CodePipeline created -> Edit Button -> add stage (code Deploy) -> Click On Action Group ->  Name -> provider (AWS Code Deploy) ->Input Artifact (Source Artifact) -> Application name -> Deployment group -> Done -> Save 

32. Make Changes in code repo
33. Code pipeline will trigger 

34. Check docker images is creates or not
```
sudo docker images
```

```
sudo docker ps
```
<div align="center">
  <img src="./public/docker.png" alt="Logo" width="100%" height="50%">
</div>

35. Code Deploy failed because 
    - The Port already registered because of 2 twice run of code deploy 1. for testing 2. is triggered. The port is already binded
    
    - To solve this 
    - we use stop container

<div align="center">
  <img src="./public/error.png" alt="Logo" width="100%" height="50%">
</div>

## Result 
<div align="center">
  <img src="./public/pipeline.png" alt="Logo" width="100%" height="50%">
</div>