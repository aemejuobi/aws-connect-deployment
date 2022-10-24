pipeline {
    agent any

    stages {
        stage('init') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Building..'
                sh 'terraform init'
            }
        }
        stage('plan/validate') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Testing..'
                sh 'terraform plan'
                sh 'terraform validate'
            }
        }
        stage('apply') {
            steps {
                sh 'cd connect_infrastructure && ls && pwd'
                echo 'Deploying....'
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
