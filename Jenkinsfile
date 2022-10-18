pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'cd connect_infrastructure/'
                echo 'Building..'
                sh 'terraform init'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'terraform plan'
                sh 'terraform validate'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}