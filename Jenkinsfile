pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Building..'
                sh 'terraform init'
            }
        }
        stage('Plan/Validate') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Testing..'
                sh 'terraform plan'
                sh 'terraform validate'
            }
        }
        stage('Apply') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Deploying....'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
