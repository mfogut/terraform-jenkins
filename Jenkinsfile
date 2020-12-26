pipeline {
    agent any
    stage('Terraform init and apply -dev') {
        steps {
            sh 'terraform init'
            sh label: '', returnStatus: true, script: 'terraform workspace new dev'
            sh 'terraform init'
            sh "terraform apply -var-file=dev.tfvars --auto-approve"
        }        
    }
    stage('Terraform init and apply -prod') {
        steps {
            sh label: '', returnStatus: true, script: 'terraform workspace new prod'
            sh 'terraform init'
            sh 'terraform apply -var-file=prod.tfvars --auto-approve'
        }
    }
}