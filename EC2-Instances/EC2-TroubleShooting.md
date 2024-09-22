
# Troubleshooting EC2 Instances

### 1. **Connectivity Issues (Can't SSH or RDP into the Instance)**

- **Check Security Groups**:
  - Ensure the security group attached to the instance allows inbound traffic on port `22` (SSH) for Linux or port `3389` (RDP) for Windows.
  - **Solution**: Modify security group rules to allow traffic from your IP or the correct CIDR block.

- **Check Network ACLs**:
  - Ensure Network ACLs allow both inbound and outbound traffic for the relevant ports.
  - **Solution**: Verify that both **inbound** and **outbound rules** permit SSH or RDP traffic.

- **Elastic IP and Public DNS**:
  - Ensure the instance has a public IP or Elastic IP assigned and that you're using the correct DNS.
  - **Solution**: Allocate and associate an **Elastic IP** if needed.

- **EC2 Key Pair**:
  - Verify you're using the correct key pair for SSH.
  - **Solution**: If the key is lost, you can stop the instance, detach its root volume, attach it to another instance, and update the SSH configuration or key pair.

- **VPC/Subnet Configuration**:
  - Ensure the instance is in a subnet with internet access, such as through an **Internet Gateway** or **NAT Gateway**.
  - **Solution**: Check the VPC routing table and ensure there’s a route to the **Internet Gateway** for outbound traffic.

### 2. **Instance Not Starting or Failing**

- **Check System Status and Instance Status Checks**:
  - In the EC2 console, check **System Status Checks** and **Instance Status Checks**. If any checks fail, the instance may have hardware or configuration issues.
  - **Solution**: 
    - If **System Status** fails, AWS will try to recover the instance automatically.
    - If **Instance Status** fails, stop and restart the instance or check logs for configuration errors.

- **Insufficient Resources (Memory/CPU)**:
  - High memory or CPU usage might cause the instance to become unresponsive.
  - **Solution**: 
    - Check **CloudWatch** metrics for CPU utilization or memory pressure.
    - Scale the instance vertically (increase the instance size) or horizontally (add more instances with an **Auto Scaling Group**).

- **EC2 Instance Limit**:
  - You may have reached your **EC2 instance limit** for a specific instance type in a region.
  - **Solution**: Request an increase in your instance limit through the **AWS Service Quotas** console.

### 3. **SSH Timeout**

- **Key Misconfiguration**:
  - Ensure the SSH key permissions are correct. The key should have `chmod 400` permissions on Linux.
  - **Solution**: Correct the key file permissions if they're too open.

- **Corrupted EC2 Instance OS**:
  - If the instance OS is corrupted, it may not start SSH services.
  - **Solution**: 
    - Stop the instance, detach the root volume, attach it to another instance, and manually fix the OS configuration or log in to troubleshoot.
    - Alternatively, launch a new instance and restore from a backup or AMI.

### 4. **Performance Issues**

- **Check CloudWatch Metrics**:
  - Review **CloudWatch metrics** for CPU, memory, network, and disk utilization to identify bottlenecks.
  - **Solution**:
    - Scale up or down the instance based on the resource metrics.
    - Optimize disk performance by using faster EBS volumes or attaching additional volumes.

- **Check Disk I/O**:
  - High disk I/O can slow down an instance, especially if you're using general-purpose or magnetic EBS volumes.
  - **Solution**: Upgrade to **provisioned IOPS (io1/io2)** or **gp3** volumes for higher throughput.

- **Networking Bottlenecks**:
  - Review network traffic and latency metrics. Instances may experience high packet loss or delays under heavy traffic.
  - **Solution**: Consider using **Elastic Load Balancing** (ELB) and **Auto Scaling** to distribute load or upgrading the instance type for better network performance.

### 5. **Instance Termination**

- **Spot Instance Termination**:
  - Spot Instances may be terminated if the spot price exceeds your bid or capacity is not available.
  - **Solution**: Check for **Spot Instance termination notifications** and consider using **On-Demand Instances** for critical tasks.

- **Auto Scaling Group Termination**:
  - If your instance is part of an **Auto Scaling Group**, it may be terminated as part of scaling policies.
  - **Solution**: Check **Auto Scaling policies** and adjust them if needed.

- **Instance Retirement**:
  - AWS may retire your instance due to hardware issues.
  - **Solution**: AWS typically provides advance notice. You can stop and restart the instance to move it to new hardware.

### 6. **Root Volume Full**

- **Disk Space**:
  - If the instance root volume is full, it may cause the instance to behave unexpectedly or fail to start.
  - **Solution**: 
    - Stop the instance and **increase the EBS volume size** using the console.
    - Log into the instance and clean up unused files or extend the file system to use the new space.

### 7. **Logs and Debugging**

- **View EC2 Logs**:
  - Check logs like `/var/log/messages`, `/var/log/syslog`, or Windows Event Viewer to understand what went wrong.
  - **Solution**: Review the system logs to identify specific errors or crashes, and take appropriate action like restarting services or troubleshooting OS issues.

- **CloudWatch Logs**:
  - If you have **CloudWatch Logs** enabled, check for any application-level or system-level logs sent to CloudWatch for detailed analysis.
  
### 8. **Unhealthy Application**

- **Application-Level Issues**:
  - The instance may be running, but the application could be misconfigured or overloaded.
  - **Solution**: 
    - Restart the application or web server.
    - Review application logs to identify the root cause of the failure.

### 9. **Check Billing and Instance Limits**

- **Billing Issues**:
  - Instances can be terminated if your AWS account runs out of credits or exceeds a budget limit.
  - **Solution**: Ensure your account is in good standing and set up **CloudWatch billing alerts** to monitor expenses.

By following these steps, you can identify the root cause of most EC2 instance issues and resolve them efficiently.

