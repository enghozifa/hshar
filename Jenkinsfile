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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        echo "Deploying to PRODUCTION"
                    } else {
                        echo "Skipping deploy (not master)"
=======
    when {
        branch 'master'
    }
    steps {
        sh '''
        echo "Deploying to VM2..."

        ssh azureuser@20.81.11.55 "
        docker stop capstone || true &&
        docker rm capstone || true &&
        docker run -d -p 80:80 --name capstone capstone:${BUILD_NUMBER}
        "
        '''
    }
}
>>>>>>> master
                    }
                }
=======
            when {
                branch 'master'
            }
            steps {
                sh '''
                echo "Deploying to VM2..."

=======
            when {
                branch 'master'
            }
            steps {
                sh '''
                echo "Deploying to VM2..."

>>>>>>> master
                ssh azureuser@20.81.11.55 "
                docker stop capstone || true &&
                docker rm capstone || true &&
                docker run -d -p 80:80 --name capstone capstone:${BUILD_NUMBER}
                "
                '''
<<<<<<< HEAD
>>>>>>> master
=======
>>>>>>> master
            }
        }
    }
}
