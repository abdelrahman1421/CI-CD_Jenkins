pipeline {
    agent any

    stages {
        stage('Git') {
            steps {
                git 'https://github.com/mahmoud254/jenkins_nodejs_example.git'
            }
        }
        
        stage('Biuld') {
            steps {
                sh 'docker build -f dockerfile . -t engboda/lap2:$BUILD_NUMBER'
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
                sh 'docker run -d -p 3000:3000 engboda/lap2:$BUILD_NUMBER'
            }
        }

    }

}




