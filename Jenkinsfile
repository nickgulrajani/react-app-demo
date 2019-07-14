pipeline {
    agent any

    stages {
        stage('SonarQube analysis') {
            steps {
                script {
                    echo "Here analysis"
                }
            }
        }
        stage('Install dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'npm run build'
                }
            }
        }

        stage ('Build docker image') {
            steps {
                script {
                    docker.build "bondblaze/react-app-demo:${env.version}"
                }
            }
        }
    }
}