pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                terraform init
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                terraform plan
                terraform validate
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                terraform apply -auto-approve
            }
        }
    }
}