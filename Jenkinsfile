pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building application..."'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
            }
        }

        stage('Deploy') {
    when {
        branch 'master'
    }
    steps {
        sh '''
        echo "Deploying to VM2..."

        ssh -o StrictHostKeyChecking=no \
            -i /var/jenkins_home/.ssh/id_rsa \
            azureuser@20.81.11.55 "
            docker stop capstone || true &&
            docker rm capstone || true &&
            docker run -d -p 80:80 --name capstone capstone:${BUILD_NUMBER}
        "
        '''
    }
}
    }
}
