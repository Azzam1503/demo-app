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

        stage('Deploy') {
            steps {
                sh '''
                    docker stop demo-app || true
                    docker rm demo-app || true

                    docker run -d \
                        --name demo-app \
                        -p 4321:4321 \
                        demo-app
                '''
            }
        }
    }
}
