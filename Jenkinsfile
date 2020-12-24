pipeline {
    agent any

    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }        
        }
        stage('Terraform Apply') {
            sh 'terraform apply -auto-approve'
        }
    }
}
