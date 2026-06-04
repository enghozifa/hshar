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
                sh 'echo Building...'
            }
        }

        stage('Test') {
            steps {
                sh 'echo Testing...'
            }
        }

        stage('Deploy') {
    steps {
        script {
            if (env.BRANCH_NAME == 'master') {
                sh 'echo Deploying to PRODUCTION'
            } else {
                sh 'echo Skipping deploy for non-master branch'
            }
        }
    }
}
    }
}
