pipeline {
    agent {
        docker {
            image 'jenkins/agent:alpine-jdk21'
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
