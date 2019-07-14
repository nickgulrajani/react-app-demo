pipeline {
    agent {
        kubernetes {
            defaultContainer 'jnlp',
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: docker
  containers:
  - name: docker
    image: docker:1.12.3-dind
    command:
    - cat
    tty: true
            """
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
                    container('docker') {
                        docker.build "bondblaze/react-app-demo:1"
                    }
                    
                }
            }
        }
    }
}