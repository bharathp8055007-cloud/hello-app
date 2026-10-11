cd ~/hello-app
cat > Jenkinsfile <<'EOF'
pipeline {
    agent any
    environment {
        DHUSER = 'bharathp8055'
        IMAGE  = "${DHUSER}/hello-app:${BUILD_NUMBER}"
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                                  usernameVariable: 'DH_USER',
                                                  passwordVariable: 'DH_PASS')]) {
                    sh 'echo "$DH_PASS" | docker login -u "$DH_USER" --password-stdin'
                    sh 'docker push $IMAGE'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl set image deployment/hello-app "*=$IMAGE"'
                sh 'kubectl rollout status deployment/hello-app --timeout=60s'
            }
        }
    }
}
EOF
