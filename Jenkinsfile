pipeline {
    agent any
    environment {
  PATH = "${PATH}:${getTerraformPath()}"
}
    stages {
        stage('Terraform init and apply -dev') {
            steps {
                sh 'terraform init'
                sh 'terraform workspace new dev'
                sh 'terraform init'
            }        
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-14', type: 'terraform'
    return tfHome
}