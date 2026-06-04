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

        echo "Deploying..."

        if [ ! -d website ]; then
            git clone https://github.com/enghozifa/hshar.git website
        fi

        cd website

        git pull origin master --rebase || true

        IMAGE_TAG=$(date +%s)

        docker stop capstone || true
        docker rm capstone || true

        docker build -t capstone:${IMAGE_TAG} .

        docker run -d -p 80:80 --name capstone capstone:${IMAGE_TAG}

EOF
        '''
    }
}
    }
}
