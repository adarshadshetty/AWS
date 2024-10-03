# S3 Bucket (Simple Storage Service) AWS S3
1. Storage is like certain kind of data that is associated with your application
2. Store and retrive as much as possible
3. S3 is an object based storage
Image
4. Amazon S3 , Store and retrieve any amount of data from anywhere


#### Data performance and durability
Scale storage resources to meet fluctuating demands, with no upfront investments or resource procurement cycles. Your data is available when needed and protected against failures, errors, and threats.

#### Security, compliance, and auditing
Secure your data from unauthorized access using encryption and access management features. S3 also maintains compliance programs and supports numerous auditing capabilities.

#### Flexible storage options
Save costs without sacrificing performance. Store data across a wide range of cost-effective storage classes that support different data access levels and are designed for specific use cases.

#### Granular data control
Classify, manage, and report on your data using a variety of storage management features. Log activities, define alerts, and automate workflows without managing additional infrastructure.

5. S3 service is regional service
6. Give the unique name that apply to a Globally 
7. ACL -> Access Control List
8. Block the public access , no one can access the s3 bucket with bucket url
9. Create a Tag
10. Default encryption -> Encrypting the stored object so that no one can access the data.
11. Enable the Bucket Versioning 
12. Unique reference for S3 bucket Destination -> s3://adarshafirstbucket-30sept


# S3 Scalability  & Durablity
13. 99.99999999999(11)% Scalability and Durability
14. AWS store our data in 3 different AZs
Image
15. If anyone AZs goes down data in stored in 3 dfferrent region

# Rules and Policies
16. S3 Names: Globally Unique (Every s3 Bucket should have a unique name)
17. S3 bucket are Regional , Every Bucket you create has to belong to one region
18. S3 Object size , You can upload an object of size upto 5TB

# Access using  CLI
19. Accessing the content inside the S3 using AWS CLI
20. Install the AWS CLI to your local system
21. TO see the aws version
```
aws --version
```
22. Authenticate aws with you cli
```
aws configure
```
Give secrete and access key
23. Check the Connectivity to awscli
```
aws sts get-caller-identity
```
image
24. List S3 bucket
```
aws s3 ls
```
25. How to view the content present in the s3 bucket
```
aws s3 ls s3://adarshafirstbucket-30sept
```
26. Copy the content from the one bucket to the another bucket
```
aws s3 mv s3://adarshafirstbucket-30sept/1.jpg s3://adarshasecondbucket-30sept
```
image
27. View all the child content inside the bucket
```
aws s3 ls s3://adarshafirstbucket-30sept --recursive
```

# S3 Storage Classes
Image

1. S3 Standard
   1. Default
   2. Hight Durable
   3. Ideal for frequent access
   4. Low latency

2. S3 Standard IA (Infrequent Access)
   1. Cost effective
   2. Suitable for Infrequent Access
   3. Supports High Availablity

3. S3 Intelligent-Tiering 
   1. Move data b/w two access tiers
   2. Optimize costs based on usage pattern

4. S3 One Zone-IA
   1. Low Cost
   2. Suitable for infrequent access
   3. Single Availability Zone
   4. Reduced Durability

5. S3 Glacier Instant Retrieval
   1. Low Cost
   2. Suitable for archival data
   3. Retrieval in Milliseconds


6. S3 S3 Galcier Flexible Retrieval
   1. Low Cost for Archival
   2. Flexible retrieval option - mins to  houres

7. S3 Glacier Deep Archive
   1. Lowest Cost Storage
   2. Retrieval within 12 houres

# S3 Storage Calculator
Image

#### See the AWS Price Calulator  https://calculator.aws/#/

# S3 : Requestor Pays
-> Image
With Requester Pays buckets, the requester instead of the bucket owner pays the cost of the request and the data download from the bucket.

28.  How to Enable the Requestor Pay 
GoTo -> Bucket -> Requestor Pay -> Edit. And You have to add some ploicies

# S3: Object Tagging 
29. Creating Object Tagging is helps the moving the object from the one bucket to another bucket.
 
###### GoTo -> S3 Bucket -> Object -> Properties -> Tags
30. You can create upto 10 tags for one object

# S3 Permission Policies (Bucket Policy)
31. Allow other IAM user to access S3
32. Like creating IAM permission policy for IAM users.For access the s3 bucket.
33. Like creating permission for IAM user account for creating , editing, reading the S3 bucket
34. The Permissions are 
    1. Create a Roles and Policies
    2. Go to IAM Policies , Create a Custome Policy
    3. IAM -> Policies -> Create Policy -> ChooseService S3 -> And Chose the required Policy.  (Practice)
    4. To publically access just uncheck the Public Enable policy.

https://awspolicygen.s3.amazonaws.com/policygen.html 

```
    {
  "Id": "Policy1727678270178",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1727678266989",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::adarshafirstbucket-30sept",
      "Principal": "*"
    }
  ]
}
```
This above Policy is attached to the S3 Bucket. To view the bucket Publically.

# 35. Making the S3 Bucket Public

# 36. Presigned URL in S3 Bucket.
Through this url you can access the object with this URL with specified time.

# 37. S3:Securing Bucket
   1. AWS SSE-S3 Encryption
   2. AWS S# SSE-KMS
   3. In transit Encryption
   4. Bucket Versioning
   5. Bucket Replication and batch Job

   #### AWS SSE-S3 Encryption
   Goto -> Bucket -> Properties -> default encryption -> Edit
   Image

   or 

   Create -> Bucket -> Properties -> default ecryption ->  edit

   #### AWS S# SSE-KMS
   Here you create your own encrytion.

   Select bucket -> default key encryption -> edit -> 2nd radio button & same for while creating fresh bucket

   #### In transit Encryption
   IMAGE
   We are disable the https , We are accessing the object through 'http' 
   Goto the bucket and change the bucket policy as shown in image.
   Now access URL with http request

   #### Bucket Versioning
   Enable the bucket versioning
   And Upload the same image with multiple times.

   #### Bucket Replication and batch Job
   GoTo-> Create New Bucket -> Click On S3 Bucket -> Management ->Create Replication rule -> Enable Status -> Apply to all objects in the bucket ->Choose Bucket -> create one -> save -> 

   Now all data is copied.


# S3: Cloud Front Distribution
1. Improved performance: CloudFront is a content delivery network (CDN) that caches content at edge locations around the world. By serving S3 objects with CloudFront, you can improve the performance of your application by reducing latency and improving load times for users located far away from the S3 bucket.

2. Reduces the latency 
3. In second request it goes to the nearest edge location. 
4. 

5. CloudFront -> create CDN -> choose origin domain -> (Bucket) -> name (any) -> OACS -> create new one (Bucket policy needs to be updated in s3 bucket (it will give while creating CDN just copy past in S3 bucket policy))
#### Remaining
