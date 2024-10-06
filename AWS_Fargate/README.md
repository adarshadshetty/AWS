# AWS Fargate

AWS Fargate is a technology that allows customer to run containers without having to manage servers or clusters. With AWS Fargate, customers no longer have to provision, configure, and scale clusters of virtual machines to run containers. This removes the need to choose server types, decide when to scale clusters, or optimize cluster packing. AWS Fargate removes the need for customers to interact with or think about servers or clusters. With Fargate, customers focus on designing and building their applications instead of managing the infrastructure that runs them. 

Fargate does not require any additional configuration in order to work with workloads that process PHI. Customers can run container workloads on Fargate using container orchestration services like Amazon ECS. Fargate only manages the underlying infrastructure and does not operate with or upon data within the workload being orchestrated. In keeping with the requirements for HIPAA, PHI should still be encrypted whenever in transit or at-rest when accessed by containers launched with Fargate. Various mechanisms for encrypting at-rest are available with each AWS storage option described in this paper. For additional HIPAA security and configuration information, see the Architecting for HIPAA Security and Compliance on Amazon EKS whitepaper.


1. Serverless Computing service for Docker Container
2. We can only monitor this container through the built in monitoring services
3.  
### With and Without Fargate 
Image

Open the AWS ECS