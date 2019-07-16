podTemplate(label: 'demo-deployer', containers: [
    containerTemplate(name: 'jnlp', image: 'bondblaze/jnlp-slave:2', args: '${computer.jnlpmac} ${computer.name}'),
    containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.13.0', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'sonar', image: 'newtmitch/sonar-scanner:latest', command: 'cat', ttyEnabled: true)
  ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('demo-deployer') {
        def app
        checkout scm
        stage('Deploy to kubernetes cluster') {
            container('kubectl') {
                sh 'kubectl apply -f react_app.yaml'
            }
        }
    }
  }
