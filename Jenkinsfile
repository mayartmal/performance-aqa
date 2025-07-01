pipeline {
    agent any

    environment {
        RESULTS_DIR = "results"
    }

    stages {
        stage('Checkout') {
            steps {
                cleanWs()
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
        
        stage('Archive Results') {
            steps {
                echo "Archiving test results"
                sh '''
                    echo "Listing results folder:"
                    ls -l results
                    echo "Workspace:"
                    pwd
                '''
                archiveArtifacts artifacts: "${RESULTS_DIR}/*", allowEmptyArchive: true
            }
        }

    }
}