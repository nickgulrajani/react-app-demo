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
                    container('jnlp') {
                        sh 'npm install'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    container('jnlp') {
                        sh 'npm run build'
                    }
                    
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