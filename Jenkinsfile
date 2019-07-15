podTemplate(label: 'demo-deployer', containers: [
    containerTemplate(name: 'jnlp', image: 'bondblaze/jnlp-slave:2', args: '${computer.jnlpmac} ${computer.name}'),
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('demo-deployer') {
        def app
        checkout scm
        stage('SonarQube analysis') {
           sh 'ls -la'
        }
        stage('Install dependencies') {
            sh 'npm install'
        }
        stage('Build package') {
            sh 'npm run build'
        }
        stage('Build docker image') {
            container('docker') {
                app = docker.build "bondblaze/react-app-demo:latest"
            }
        }
        stage('Push image to registry') {
            container('docker') {
                docker.withRegistry( '', 'registryCredential' ) {
                    app.push()
                }
            }
        }
        stage('Deploy to kubernetes cluster') {
            container('kubectl') {
                sh 'kubectl apply -f react_app.yaml'
            }
        }
    }
  }