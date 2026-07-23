pipeline {
    agent any

    stages {

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t demo-app .'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                    kind load docker-image demo-app --name demo-cluster

                    kubectl rollout restart deployment demo-app

                    kubectl rollout status deployment demo-app
                '''
            }
        }
    }
}
