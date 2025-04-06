
pipeline {
    agent any
    environment {
        AZURE_CREDENTIALS_ID = 'azure-service-principal'
        RESOURCE_GROUP = 'rg-jenkins'
        APP_SERVICE_NAME = 'reactjenkins98872'
        TERRAFORM_PATH = '""C:\\Users\\HP\\Desktop\\something\\Capgemini\\Cap-Training\\terraform.exe""'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mahimajain01/react-jenkins-tf.git'
            }
        }
      stage('Terraform Init') {
           steps {
                bat '"%TERRAFORM_PATH%" -chdir=terraform init '
          }
    }
      stage('Terraform Plan & Apply') {
           steps {
               
               bat '"%TERRAFORM_PATH%" -chdir=terraform plan -out=tfplan'
               bat '"%TERRAFORM_PATH%" -chdir=terraform apply -auto-approve tfplan'
           }
     }
        
      stage('Build React App') {
            steps {
                dir('my-react-app') { // Navigate into the my-react-app folder
                    bat 'npm install'
                    bat 'npm run build -- --mode production'
                }
            }
      }
    
        stage('Deploy') {
            steps {
                withCredentials([azureServicePrincipal(credentialsId: AZURE_CREDENTIALS_ID)]) {
                    bat "az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID"
                    bat "powershell Compress-Archive -Path ./publish/* -DestinationPath ./publish.zip -Force"
                    bat "az webapp deploy --resource-group $RESOURCE_GROUP --name $APP_SERVICE_NAME --src-path ./publish.zip --type zip"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}
