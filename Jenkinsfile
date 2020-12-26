pipeline {
    agent any
    environment {
  PATH = "${PATH}:${getTerraformPath()}:${getAnsiblePath()}"
}
    stages {
        stage('S3 Create Bucket') {
            steps {
                sh "ansible-playbook s3-bucket.yml"
            }
        }
        stage('Create S3 Bucket if not exist') {
            steps {
                script{
                    createS3Bucket('fatih-terraform-backup1')
                }
            }
        }
        stage('Terraform init and apply -dev') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh 'terraform init'
                sh "terraform workspace select dev"
                sh "terraform apply -var-file=dev.tfvars --auto-approve"
            }        
        }
        stage('Terraform init and apply -prod') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new prod'
                sh 'terraform init'
                sh "terraform workspace select prod"
                sh 'terraform apply -var-file=prod.tfvars --auto-approve'
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}

def getAnsiblePath() {
    def ansHome = tool name: 'ansible', type: 'org.jenkinsci.plugins.ansible.AnsibleInstallation'
    return ansHome
}

def createS3Bucket(bucketName) {
    sh returnStatus: true, script: "aws s3 mb s3://${bucketName}"
}