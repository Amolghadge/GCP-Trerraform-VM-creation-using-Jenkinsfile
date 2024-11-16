pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('$gcp-sa-key')
        GOOGLE_PROJECT                = 'charged-state-441016-j3'
        GOOGLE_REGION                 = 'us-central1'
        GIT_TOKEN                     = credentials('$GitHub')
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your repository
                git branch: 'main', credentialsId: 'GitHub', url: 'https://github.com/Amolghadge/GCP-Trerraform-VM-creation-using-Jenkinsfile.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Generate and review the Terraform execution plan
                    sh 'terraform plan -var="project_id=${GOOGLE_PROJECT}" -var="region=${GOOGLE_REGION}"'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform plan
                    sh 'terraform apply -auto-approve -var="project_id=${GOOGLE_PROJECT}" -var="region=${GOOGLE_REGION}"'
                }
            }
        }

        stage('Post Apply') {
            steps {
                script {
                    // Optionally capture output values (e.g., VM IP)
                    def vm_ip = sh(script: 'terraform output -raw instance_ip', returnStdout: true).trim()
                    echo 'VM Created with IP: ${vm_ip}'
                }
            }
        }
    }

    post {
        success {
            echo 'VM successfully created!'
        }

        failure {
            echo 'VM creation failed.'
        }

        always {
            // Clean up if needed (e.g., Terraform destroy)
            sh 'terraform destroy -auto-approve'
        }
    }
}
