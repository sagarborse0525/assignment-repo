# Production Build Challenge

## Overview
In this project, I have built a production-ready AWS infrastructure using Terraform that is highly available, secure, automated, and scalable.
  
![alt text](diagram.png)


## Architecture Overview
  
- **Terraform:** Used to provision AWS infrastructure.

- **VPC**: Contains public and private subnets.

- **Public Subnets:** NAT Gateway.

- **Private Subnets:** EC2 instances.

- **Load Balancer:** ALB to distribute traffic.

- **Auto Scaling:**  Auto Scaling EC2 instances

