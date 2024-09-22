
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

These notes summarize the essential components and functionality of AWS EC2. For more advanced topics like Spot instances, Auto Scaling, or specific configurations, hands-on labs and documentation are recommended.



