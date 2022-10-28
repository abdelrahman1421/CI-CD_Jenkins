pipeline {
    agent {label 'agent'}

    stages {
        stage('Git') {
            steps {
                git 'https://github.com/abdelrahman1421/CI-CD_Jenkins.git'
            }
        }
        
        stage('Biuld') {
            steps {
                sh 'docker build -f Dockerfile . -t engboda/lap2:$BUILD_NUMBER'
            }
        }
        
        stage('Push on Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
                sh 'docker push engboda/lap2:$BUILD_NUMBER'
            }
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 4000:4000 engboda/lap2:$BUILD_NUMBER'
            }
        }

    }
post {
    success {
        slackSend "Build deployed successfully  $BUILD_NUMBER"
    }

}




