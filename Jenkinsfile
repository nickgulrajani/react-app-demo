node('jenkins-jenkins-slave ') {
    stage('test docker') {
      container('docker') {
        sh 'docker -v'
      }
    }
}