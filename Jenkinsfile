node {
    stage('SCM') {
        git 'https://github.com/a1219547369/cbs.git'
    }
    stage('QA') {
        sh '/home/cbs/sonar-scanner-2.8/bin/sonar-scanner'
    }
    stage('build') {
        
     def mvnHome = tool 'M3'
    sh "${mvnHome}/bin/mvn -B clean package"
    }
    stage('deploy') {
        sh "docker stop my || true"
        sh "docker rm my || true"
        sh "docker run --name my -p 11111:8080 -d tomcat:jre8-alpine"
        sh "docker cp target/RMS.war my:/usr/local/tomcat/webapps"
    }
    stage('results') {
        archiveArtifacts artifacts: '**/target/*.war', fingerprint: true
    }
}
