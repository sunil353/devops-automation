pipeline{
    agent any
    tools{
        maven 'maven_3_9_11'
    }
    stages{
        stage('buil maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sunil353/devops-automation']])
                sh 'mvn clean install'
            }
        }
        stage('build docker images'){
            steps{
                script{
                    sh 'docker build -t skumarmeher/devops-integration .'
                }
            }
        }
        stage('push docker image to docker hub'){
            steps{
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwdd', variable: 'dockerhubpwd')]) {
                        sh '''
                            echo $dockerhubpwd | docker login -u skumarmeher --password-stdin
                            docker push skumarmeher/devops-integration
                        '''
                        }
                        sh 'docker push skumarmeher/devops-integration'
                }
            }
        }
    }
}