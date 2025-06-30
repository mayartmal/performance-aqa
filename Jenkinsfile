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
                script {
                    docker.build(IMAGE_NAME)
                }
            }
        }
    }
}