pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Building..'
                sh 'terraform init'
            }
        }
        stage('Test') {
            steps {
                sh 'cd connect_infrastructure'
                echo 'Testing..'
                sh 'terraform plan'
                sh 'terraform validate'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cd connect_infrastructure'
                echo 'Deploying....'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
