pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_IN_AUTOMATION      = '1'
    }

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
