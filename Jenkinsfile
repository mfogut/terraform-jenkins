pipeline {
    agent any
    environment {
  PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('Terraform init and apply -dev') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh 'terraform init'
                sh "terraform apply -var-file=dev.tfvars --auto-approve"
            }        
        }
        stage('Terraform init and apply -prod') {
            steps {
                sh label: '', returnStatus: true, script: 'terraform workspace new prod'
                sh 'terraform apply -var-file=prod.tfvars --auto-approve'
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}