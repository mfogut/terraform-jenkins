## Terraform-jenkins
# Configure Jenkins Box
- 1 - Spin up ec2-instance
- 2 - Install Java 8 --> yum install java-1.8.0-openjdk
- 3 - Downloand and Install Jenkins
    - wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    - rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    - yum install jenkins
- 4 - Install Terraform plugin to Jenkins
    - Manage Jenkins -> Manage Plugins -> Avaiable -> Search Terraform
- 5 - Add Terraform to Global Tool Configuration
    - ![](terraform1.jpg)
- 6 - Add Terraform Env to PATH
    - Pipeline Snytax -> Snippet Generator
    - ![](terraform2.jpg)
    - ![](terraform3.jpg) 