### AWS EC2 Service

1. EC2 Stands for Elastic Cloud Compute Service.
2. Elastic means this service can be scale down and scale up this service
3. Compute means CPU, RAM, Disk, Virtual Server

###### Why EC2 Instance ? 
1. Timely Upgrade
2. Security issue
3. Server is up or down 
To avoid these maintainance we are moving from private to public cloud.
4. We buy this service from AWS as PAY-AS-GO service.



###### Types Of AWS EC2 Instance
## 1. General
General purpose instances provide a balance of compute, memory and networking resources, and can be used for a variety of diverse workloads. These instances are ideal for applications that use these resources in equal proportions such as web servers and code repositories. 

###### Use cases

Applications built on open-source software such as application servers, microservices, gaming servers, midsize data stores, and caching fleets.

## 2.Compute Optimized
Compute Optimized instances are ideal for compute bound applications that benefit from high performance processors. Instances belonging to this category are well suited for batch processing workloads, media transcoding, high performance web servers, high performance computing (HPC), scientific modeling, dedicated gaming servers and ad server engines, machine learning inference and other compute intensive applications.

###### Use Cases

High performance computing (HPC), batch processing, ad serving, video encoding, gaming, scientific modelling, distributed analytics, and CPU-based machine learning inference.

## 3.Memory Optimized
Memory optimized instances are designed to deliver fast performance for workloads that process large data sets in memory.

###### Use cases

Memory-intensive workloads such as open source databases, in-memory caches, and real-time big data analytics.

## 4.Accelerated Computing
Accelerated computing instances use hardware accelerators, or co-processors, to perform functions, such as floating point number calculations, graphics processing, or data pattern matching, more efficiently than is possible in software running on CPUs.

###### Use Cases

Generative AI applications, including question answering, code generation, video and image generation, speech recognition, and more.

HPC applications at scale in pharmaceutical discovery, seismic analysis, weather forecasting, and financial modeling.

## 5.Storage Optimized
Storage optimized instances are designed for workloads that require high, sequential read and write access to very large data sets on local storage. They are optimized to deliver tens of thousands of low-latency, random I/O operations per second (IOPS) to applications.

###### Use Cases

Amazon EC2 I4g instances are optimized for I/O intensive applications and are targeted to customers using transactional databases (Amazon DynamoDB, MySQL, and PostgreSQL), Amazon OpenSearch Service, and real-time analytics such as Apache Spark.

## 6.HPC Optimized
High performance computing (HPC) instances are purpose built to offer the best price performance for running HPC workloads at scale on AWS. HPC instances are ideal for applications that benefit from high-performance processors such as large, complex simulations and deep learning workloads.

######  Use Case
*500 Mbps network bandwidth outside of the virtual private cloud (VPC) and Amazon Simple Storage Service (Amazon S3)

###### For more detail follow this link 
 https://aws.amazon.com/ec2/instance-types/


-> Steps to create a these instance are same and aws charges to this instance differently.
