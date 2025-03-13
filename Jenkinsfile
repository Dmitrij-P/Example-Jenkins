pipeline {
    //agent { label 'docker-agent-alpine' }
    //agent {
    //    docker 'jenkins/agent:alpine-jdk21'
    //}
    agent {
        docker {
            image 'jenkins/agent:alpine-jdk21'
            // Optionally, add any docker run arguments:
            // args '-v /tmp:/tmp'
        }
    }
    
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
}
