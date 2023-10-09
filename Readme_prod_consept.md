# Production Context & Diagram

In a production context, several things would be handled differently:

## Networking
- There should be implemented control VPCs, subnets, and routing.
- Implementing private and public subnets, NAT gateways, and Transit Gateways for inter-VPC communication.

## Security
- More strict security group rules and IAM roles with least privilege.
- Use AWS Secrets Manager as secrets storage.

## Load Balancer
- Setting up a Route 53 for DNS.
- Enabling and enrolling WAF (Web Application Firewall) rules.
- Use AWS Shield for DDoS protection.

## Scaling
- Implement additional scaling policies for horizontal and vertical scaling based on CPU/memory usage.
- Autoscaling groups can be set up based on alert metrics in CloudWatch.
- Consider cluster auto-scaler and horizontal pod auto-scaling.

## Monitoring & Logging
- AWS CloudWatch.
- Fluentd.
- Implementation of Prometheus and Grafana for metric and graphic report.

## Backup & DR
- AWS Backup.

## CI/CD
- Implement a CI/CD pipeline for deployments using GitLab CI or AWS CodePipeline.

## Diagram
[View Diagram](https://drive.google.com/file/d/1qBW27L2rBX_Sv56n9d6lkZ9rkuKAtIUB/view?usp=sharing)
