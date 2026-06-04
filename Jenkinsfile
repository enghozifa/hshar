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
                azureuser@20.81.11.55 << 'EOF'

                set -e

                echo "Starting deployment..."

                # Get project
                if [ ! -d website ]; then
                    git clone https://github.com/enghozifa/hshar.git website
                fi

                cd website

                git pull origin master

                echo "Stopping old container..."
                docker stop capstone || true
                docker rm capstone || true

                echo "Building new image..."
                docker build -t capstone:${BUILD_NUMBER} .

                echo "Running new container..."
                docker run -d -p 80:80 --name capstone capstone:${BUILD_NUMBER}

                echo "Deployment completed successfully"

EOF
                '''
            }
        }
    }
}
