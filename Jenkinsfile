pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Build'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sachinbagla86/jenkins-test']])
                sh 'mvn clean install'

            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh 'docker build -t sachinbagla/jenkin-test:latest .'
                }
            }
        }
        stage('Push Image to Docker Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'docker_pwd', variable: 'docker_hub')]) {
                         sh 'docker login -u sachinbagla -p ${docker_hub}'
                         sh 'docker push sachinbagla/jenkin-test:latest'
                   }

                }
            }
        }
        stage('Deploy to kubernetes Cluster'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment-jenkins-test.yaml', kubeconfigId: 'kubernetes_deploy_config')
                }
            }
        }
    }
}