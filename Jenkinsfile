pipeline {
    agent any
    environment {
  PATH = "${PATH}:${getTerraformPath()}"
}


    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }        
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply'
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}