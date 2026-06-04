pipeline {
    agent any

    environment {
        SSH_KEY = "/var/jenkins_home/.ssh/id_rsa"
        REMOTE_USER = "azureuser"
        REMOTE_HOST = "20.81.11.55"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Skipping local build (building on VM2)"'
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
                echo "Deploying on VM2..."

                ssh -o StrictHostKeyChecking=no \
                -i $SSH_KEY \
                $REMOTE_USER@$REMOTE_HOST "
                
                cd website || git clone https://github.com/enghozifa/hshar.git website &&
                cd website &&
                git pull origin master &&
                
                docker build -t capstone:${BUILD_NUMBER} . &&
                docker stop capstone || true &&
                docker rm capstone || true &&
                docker run -d -p 80:80 --name capstone capstone:${BUILD_NUMBER}
                "
                '''
            }
        }
    }
}
