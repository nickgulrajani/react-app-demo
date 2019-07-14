podTemplate(label: 'demo-deployer', containers: [
    containerTemplate(name: 'jnlp', image: 'bondblaze/jnlp-slave:2', args: '${computer.jnlpmac} ${computer.name}'),
    containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('demo-deployer') {
        checkout scm
        stage('SonarQube analysis') {
           sh 'ls -la'
        }
        stage('Install dependencies') {
            sh 'npm install'
        }
        stage('Build') {
            sh 'npm run build'
        }
        stage('test') {
            container('docker') {
                // def app = docker.build "bondblaze/react-app-demo:${BUILD_NUMBER}"
                sh 'docker build -t bondblaze/react-app-demo:${BUILD_NUMBER} .'
            }
        }
    }
  }