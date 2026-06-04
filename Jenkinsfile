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
                sh 'echo "Build step"'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Test step"'
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no \
                -i /var/jenkins_home/.ssh/id_rsa \
                azureuser@20.81.11.55 "
                cd website || git clone https://github.com/enghozifa/hshar.git website &&
                cd website &&
                git pull origin master || true &&
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
