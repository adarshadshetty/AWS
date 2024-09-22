
# AWS EC2 Instance Notes

## 1. What is EC2?
- **Amazon EC2** provides resizable compute capacity in the cloud. It allows users to rent virtual servers to run applications, without needing to invest in physical hardware.
- EC2 allows scaling both vertically (increase instance size) and horizontally (add more instances) based on your application's requirements.

## 2. EC2 Components:
- **Instances:** Virtual servers that run applications.
- **Amazon Machine Image (AMI):** A pre-configured template for your instance that includes an operating system and required software.
- **Instance Types:** These specify the hardware (CPU, memory, storage) and are designed for different use cases (e.g., compute-optimized, memory-optimized, GPU instances).
- **Key Pairs:** A combination of a private key and a public key that is used for secure SSH connections.
- **Elastic Block Store (EBS):** Persistent storage that you can attach to your instances.

## 3. Types of EC2 Instances:
- **On-Demand:** Pay per second (Linux) or per hour (Windows). Best for short-term, unpredictable workloads.
- **Reserved Instances:** Commit to using instances for a 1 or 3-year term to get discounted rates. Ideal for long-running workloads.
- **Spot Instances:** Purchase unused EC2 capacity at a reduced rate. Suitable for batch jobs and tasks that can handle interruptions.
- **Dedicated Hosts:** Physical servers dedicated to your use, helping with compliance and software licensing requirements.

## 4. Security in EC2:
- **Security Groups:** Act as virtual firewalls that control inbound and outbound traffic for your instances.
- **IAM Roles:** Allow instances to securely access AWS services without hardcoding credentials into your application.

## 5. Elastic IP:
- A static public IPv4 address designed for dynamic cloud computing. Elastic IPs remain associated with your AWS account and can be remapped between instances in case of instance failure.

## 6. Scaling Options:
- **Auto Scaling:** Automatically adds or removes instances based on traffic or resource utilization, ensuring your application meets demand while optimizing costs.
- **Elastic Load Balancing (ELB):** Distributes incoming application traffic across multiple EC2 instances for higher availability and fault tolerance.

## 7. Monitoring & Management:
- **CloudWatch:** A monitoring tool that collects and tracks metrics, sets alarms, and automatically reacts to changes in your AWS resources.
- **EC2 Pricing Models:** You can manage costs by choosing from a mix of on-demand, reserved, and spot instances based on workload needs.

## 8. Storage:
- **Amazon Elastic Block Store (EBS):** Persistent storage volumes that can be attached to EC2 instances. Volumes are replicated within an Availability Zone for high availability and durability.
- **Instance Store:** Temporary block-level storage that is physically attached to the host machine. It provides fast, ephemeral storage and is lost when the instance is stopped or terminated.

## 9. Networking:
- **VPC (Virtual Private Cloud):** A private, isolated section of the AWS cloud where you can launch your EC2 instances within a custom network.
- **Elastic Network Interfaces (ENI):** Virtual network interfaces that can be attached to instances for advanced networking configurations.

## 10. Pricing Considerations:
- **Pay-as-you-go:** Billing is based on the instance type, usage duration, and additional resources (EBS, bandwidth).
- **Free Tier:** AWS provides 750 hours of free EC2 usage per month for the first year using the `t2.micro` instance.

## 11. You need to scale your web application during peak traffic hours. How would you design the architecture using EC2?

To handle peak traffic hours efficiently while maintaining performance and cost-effectiveness, I would design a scalable architecture using AWS EC2 with the following key components:

1. Auto Scaling Group (ASG)
Auto Scaling allows EC2 instances to automatically scale up (add instances) or scale down (terminate instances) based on traffic demand, ensuring your application can handle varying loads.
Scaling Policies:
Dynamic Scaling: Automatically adds or removes instances based on predefined conditions like CPU utilization or network traffic.
Scheduled Scaling: Predetermined scaling based on predictable traffic patterns (e.g., increase instances every day at 6 PM during peak hours).
Cooldown Period: Ensure the system doesn’t launch or terminate instances too frequently.

2. Elastic Load Balancer (ELB)
ELB distributes incoming traffic across multiple EC2 instances to ensure no single instance is overwhelmed.
Types of Load Balancers:
Application Load Balancer (ALB): Best for HTTP/HTTPS traffic, supports path-based and host-based routing.
Network Load Balancer (NLB): Best for high-performance, low-latency TCP traffic.
Classic Load Balancer (CLB): Legacy option, supports both HTTP/HTTPS and TCP traffic.
Load balancing helps in improving fault tolerance and distributing traffic evenly, keeping all instances healthy.

3. Elastic IP & DNS (Route 53)
Elastic IPs ensure the application has a consistent IP address, even if the underlying instance changes.
Amazon Route 53 can be used to route traffic efficiently and manage failover across different regions or availability zones if needed.

4. Multiple Availability Zones (AZs)
Distribute EC2 instances across multiple Availability Zones (AZs) within a region to ensure high availability.
In case of failure in one AZ, the instances in the other AZ can still handle the traffic.
Elastic Load Balancer automatically routes traffic to the healthy instances in other AZs.

5. EC2 Instance Types and Right Sizing
Choose the appropriate EC2 instance type based on the application’s needs (e.g., compute-optimized for high CPU usage, memory-optimized for databases).
Use t3/t4 burstable instances for smaller workloads, which can burst CPU capacity during peak hours.
For more predictable workloads, consider Reserved Instances or Savings Plans to reduce costs.

6. Amazon CloudFront (CDN)
Use CloudFront, AWS’s Content Delivery Network (CDN), to cache static assets (e.g., images, CSS, JavaScript) globally, reducing the load on EC2 instances.
CloudFront improves latency by delivering content from edge locations closer to the end user.

7. Amazon RDS or DynamoDB (Database Tier)
Use Amazon RDS (relational database service) for your database to offload the burden of managing and scaling databases.
DynamoDB can be used if you require a NoSQL solution, as it provides on-demand scaling for high-traffic applications.

8. Amazon S3 for Static Content
Store static assets (e.g., images, videos, backups) in Amazon S3 instead of local EC2 storage.
S3 can handle high availability and massive scale, reducing the dependency on EC2 resources for storage.

9. Monitoring and Alerts
Use Amazon CloudWatch to monitor instance metrics such as CPU, memory, and network usage.
Set up CloudWatch Alarms to trigger actions (like scaling) when certain thresholds are reached.
Use AWS Lambda for automated, event-driven scaling or to process traffic data in real-time.

10. Security
Use Security Groups to control traffic in and out of your EC2 instances.
Implement IAM Roles for secure access to other AWS services without hardcoding credentials.
Consider using AWS WAF (Web Application Firewall) for protection against common web threats.

### Architecture Summary:

Elastic Load Balancer (ELB): Distributes incoming traffic across multiple EC2 instances.
Auto Scaling Group (ASG): Scales EC2 instances automatically based on load.
Multiple Availability Zones: Ensures high availability and fault tolerance.
Amazon CloudFront (CDN): Caches static assets for better performance.
CloudWatch and Alarms: Monitors the health and load on instances.
Elastic IP and Route 53: For DNS management and failover strategies.
This architecture ensures that the web application can handle peak traffic dynamically while maintaining high availability, fault tolerance, and optimized cost-efficiency.



## Your EC2 instance was terminated accidentally. What are the possible reasons and solutions?


If your EC2 instance was terminated accidentally, several factors could be responsible. Below are some possible reasons and solutions:

1. Accidental Manual Termination
Reason: Someone with proper IAM permissions may have accidentally terminated the instance.
Solution:
Implement strict IAM policies to ensure only authorized users have termination rights.
Enable termination protection on your instance. This feature prevents instances from being terminated accidentally via the console or API.
Check the CloudTrail logs to identify which user or process initiated the termination.

2. Auto Scaling Group (ASG) Termination
Reason: If your EC2 instance is part of an Auto Scaling Group, it could have been terminated as part of the scaling policies (e.g., scaling down during low traffic).
Solution:
Review the Auto Scaling policies to ensure they are configured correctly. For example, check the cooldown period or adjust scaling thresholds.
Add a specific instance to the Auto Scaling group termination protection if you don’t want that instance to be automatically terminated.
Consider modifying instance health checks if ASG is terminating instances marked as "unhealthy."

3. Spot Instance Termination
Reason: If you are using Spot Instances, AWS can terminate your instance when the Spot price exceeds your bid or when capacity is unavailable.
Solution:
Consider using On-Demand instances for critical workloads that cannot afford interruption.
Use Spot Instance termination notifications, which provide a two-minute warning before your instance is terminated, allowing you to gracefully shut down or persist data.
Spot Fleets can be configured with allocation strategies that diversify your instance types to reduce the likelihood of termination.

4. Instance Reaches Billing Expiry (Free Tier or Reserved Instances)
Reason: If you're using the AWS Free Tier or Reserved Instances, your EC2 instance could be terminated once the limits of free usage or reservation term expires.
Solution:
Monitor your billing dashboard to track Free Tier usage and ensure you don’t exceed the limits.
Use CloudWatch billing alarms to get notified when your charges exceed a certain threshold.

5. EC2 Instance Retirement
Reason: AWS occasionally retires instances due to hardware issues or maintenance, especially for long-running instances.
Solution:
AWS notifies you in advance about instance retirement via email and the AWS Management Console. Make sure you have proper notification settings.
Stop and restart the instance to move it to different underlying hardware.
Create an AMI (Amazon Machine Image) of your instance to quickly launch a new instance if necessary.

6. Insufficient Funds or AWS Account Issues
Reason: Your EC2 instance might have been terminated if there were issues with your AWS billing account, such as insufficient funds or suspended services.
Solution:
Check your AWS billing dashboard to ensure your account is in good standing.
Set up billing alerts in CloudWatch to avoid unexpected charges or funding issues.

7. Health Check Failures
Reason: If your instance is part of an Auto Scaling Group or behind an Elastic Load Balancer, failing health checks could lead to instance termination.
Solution:
Investigate the health checks and their configurations to ensure that they are correctly set for your use case.
Review the CloudWatch Logs and system logs (e.g., /var/log/messages or /var/log/syslog) for any errors that might have caused the failure.
Use Elastic Load Balancer health checks to distribute traffic to healthy instances.

8. Instance Lifecycle Policy
Reason: You might have configured a lifecycle policy (e.g., in Auto Scaling or Spot Fleets) that automatically terminates instances after a certain time or condition.
Solution:
Review the lifecycle policies associated with your EC2 instances or Auto Scaling Group.
Adjust the policies or update them to better suit your use case.

9. Termination via Script or Automation Tool
Reason: If you have automated tools, like AWS CLI scripts, Terraform, or CloudFormation, they might have accidentally terminated the instance as part of an automated process.
Solution:
Check for any automation or scripts that might have triggered the termination, especially CI/CD pipelines, scheduled tasks, or infrastructure-as-code tools.
Review logs from the automation tools (e.g., AWS CloudFormation or Terraform logs) to identify the source of the termination.

10. Shutdown Behavior Configuration
Reason: The instance’s shutdown behavior may be set to "Terminate" instead of "Stop." This would terminate the instance when the OS initiates a shutdown.
Solution:
Change the instance’s shutdown behavior to "Stop" rather than "Terminate" if you want the instance to stop instead of being deleted when shut down.
Review the instance's properties and adjust this setting if needed.
General Recovery Strategies:
Snapshots & Backups: Regularly create EBS snapshots and AMIs of your instances to quickly restore a terminated instance.
Auto Recovery: For critical instances, enable EC2 Auto Recovery, which automatically recovers the instance if it experiences hardware failure or AWS detects a problem.
Elastic IP: If an Elastic IP is attached to the instance, remap it to a new instance in case of accidental termination.
By implementing these precautions, you can mitigate the risk of accidental termination and ensure faster recovery when issues arise.





