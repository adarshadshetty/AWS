### Auto Scaling Group create number of ec2 instance based on traffic , request receiving . Based on the CPU Usage.

1. Create a Custom VPC with 2 public subnet.
2. Create target group 
GO-TO -> EC2Instance -> targetGroup -> Instance -> Target-group-name -> With Your VPC ->Create
3. Here blank ec2 instance create means with no ec2 instance 
4. Create a Target

5. Next Creaete Load balancer
Image
GOTO LB -> ALB(Application Load Balancer)
Use SG with port 80(http) create new one here

##### Listeners and routing 
Select the Target Group & Create
-> To provision it will take couple of miniute.


## Create Auto Scaling 
Image

1. Open Auto Scaling group
2. Create
3. To create auto scaling it will ask launch template
image & SG with http & ssh & auto assign public ip.


After this 2  ec2 instance will start running. If you manully delete the any ec2 instance auto scaling group create another one automatically.
