pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Application') {
            steps {
                sh '''
                    pkill node || true
                    nohup npm start > app.log 2>&1 &
                '''
            }
        }
    }
}
