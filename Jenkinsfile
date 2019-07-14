pipeline {
    agent {
        kubernetes {
            defaultContainer 'jnlp'
            yamlFile 'KubernetesPod.yaml'
        }
    }
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
                    container('docker'){
                        docker.build "bondblaze/react-app-demo:1"
                    }
                    
                }
            }
        }
    }
}