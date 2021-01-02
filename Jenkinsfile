pipeline {
    agent any
    environment {
        PATH = "${PATH}:${getTerraformPath()}:${getAnsiblePath()}"
    }
    stages{
        stage('Create S3 Bucket and Dynamodb Table') {
            steps {
                sh "ansible-playbook s3-bucket.yml"
            }
        }
        stage('First initalize') {
            steps{
                sh 'terraform init'
            }
        }
        stage('Terraform init and apply -dev') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh 'terraform init'
                sh 'terraform workspace select dev'
                sh "ansible-playbook ansterraform.yml"
                sh 'terraform init'
            }        
        }
        stage('Terraform init and apply -prod') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new prod'
                sh 'terraform init'
                sh 'terraform workspace select prod'
                sh "ansible-playbook ansterraform.yml --extra-vars app_env=prod"
                sh 'terraform init'
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