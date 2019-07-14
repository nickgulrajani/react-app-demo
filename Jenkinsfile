podTemplate(label: 'jenkins-jenkins-slave ', containers: [
    containerTemplate(name: 'docker', image: 'docker:1.12.3-dind', ttyEnabled: true, command: 'cat', privileged: true, instanceCap: 1),
],
volumes: [
    hostPathVolume(mountPath: "/var/run/docker.sock", hostPath: "/var/run/docker.sock")
])
node() {
    checkout scm
    stage('SonarQube analysis') {
        echo "Here analysis"
    }
    stage('Install dependencies') {
        sh 'npm install'
    }
    stage('Build') {
        sh 'npm run build'
    }
    stage('Build docker image') {
        docker.build "bondblaze/react-app-demo:test"
    }
}