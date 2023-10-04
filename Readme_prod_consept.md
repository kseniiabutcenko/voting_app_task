Production Context & Diagram:
In a production context, several things would be handled differently:

Networking: There should be implemented control  VPCs, subnets, and routing. Implementing private and public subnets, NAT gateways, and Transit Gateways for inter-VPC communication.

Security: More strict security group rules and  IAM roles with least privilege, + AWS secrets Manager as secrets storage

Load Balancer: setting up a Route 53 for DNS, Enabling and enrolling WAF (Web Application Firewall) rules, +  AWS Shield for DDoS protection

Scaling: There can be implemented additional scaling policies for  horizonatal and vertical scaling based on CPU/memory usage. Autoscaling groups can be setup based on alert metrics in cloudwatch as well. Also, considering cluster auto-scaler and horizontal pod auto-scaling.

Monitoring & Logging: AWS CloudWatch,  Fluentd and implementation of Prometheus and Grafana for metric and graffic report.

Backup & DR: AWS Backup.

CI/CD: Implementing a CI/CD pipeline for deployments GitLab CI, or AWS CodePipeline.

Diagram : https://drive.google.com/file/d/1qBW27L2rBX_Sv56n9d6lkZ9rkuKAtIUB/view?usp=sharing