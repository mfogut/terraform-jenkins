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

# Resolve The Issues
- Issue 1 - Jenkins Output show that we created 2 Subnets(1 for Dev Env and 1 for Prod Env) Succesfully. However when we check from AWS VPC console only Public-Subnet-Prod created.
    - ![](error1.jpg)
    - ![](error2.jpg)
    - ![](error3.jpg)

- Solution 1 - Terraform stay the last env that we create. In this case last env is prod env, because of this terraform skip dev env and only create Subnet for prod env. In order to fix this issue we have change env in our Jenkinsfile. We have to add 
    - "terraform workspace select dev"
    - "terraform workspace select prod"
command.
    - ![](solution1.jpg)
    - ![](solution2.jpg)