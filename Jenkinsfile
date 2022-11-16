pipeline {
    agent any
    tools {
        terraform 'Terraform'
    }
    stages {
        
        stage('Init') {
            steps {
                dir("connect_infrastructure"){
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){

                        withEnv(['KEY_ID=${key_id}', 'ACCESS_KEY=${access_key}']){
                            echo 'Building..'
                            sh '$KEY_ID'
                            sh 'terraform init'
                        }
                    }
                }  
            }
        }
        
        stage('Plan/Validate') {
            steps {
                dir("connect_infrastructure") {
                    withCredentials([
                        string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                        string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                        
                        withEnv(['KEY_ID=aws-jenkins-secret-key-id', 'ACCESS_KEY=${access_key}']){
                            sh '$KEY_ID'
                            sh 'ls -alh'
                            sh 'pwd'
                            echo 'Testing..'
                            sh 'terraform plan'
                            sh 'terraform validate'
                        }
                    }
                }
            }
        }
        
        stage('Apply') {
            steps {
                dir("connect_infrastructure"){
                    withCredentials([
                    string(credentialsId: 'aws-jenkins-secret-key-id', variable: 'key_id'),
                    string(credentialsId: 'aws-jenkins-secret-access-key', variable: 'access_key')]){
                    
                        withEnv(['KEY_ID=aws-jenkins-secret-key-id', 'ACCESS_KEY=${access_key}']){
                            sh '$KEY_ID'
                            echo 'Deploying....'
                            sh 'terraform apply -auto-approve'
                        }
                    }
                }
            }
        }
    }
}
