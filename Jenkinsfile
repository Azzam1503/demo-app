pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t demo-app:latest .'
            }
        }

        stage('Load Image into Kind') {
            steps {
                sh 'kind load docker-image demo-app:latest --name demo-cluster'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                export KUBECONFIG=/var/jenkins_home/.kube/config

                kubectl rollout restart deployment demo-app

                kubectl rollout status deployment demo-app
                '''
            }
        }
    }
}
