pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-jmeter-container"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "cloning repo"
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "building image"
                sh 'docker build -t my-performance-test-image .'
            }
        }

        stage('Run Test') {
            steps {
                echo "running the test"
                sh '''
                    docker run --rm -v $(pwd)/results:/results my-performance-test-image
                '''
            }
        }
    }
}