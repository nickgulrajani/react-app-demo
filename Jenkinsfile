podTemplate(containers: [
    containerTemplate(name: 'jnlp', image: 'bondblaze/jnlp-slave:2', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'docker', image: 'docker:1.12.3-dind', ttyEnabled: true, command: 'cat')
]) {
  node('jenkins-jenkins-slave ') {
    stage('test docker') {
      container('docker') {
        sh 'docker -v'
      }
    }
  }
}