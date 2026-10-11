pipeline{
    agent any
    environment {
        DHUSER = 'bharathp8055'
        IMAGE = "${DHUSER}/hello-app:${BUILD_NUMBER}"
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE .'
              }
            }
          }
      }
