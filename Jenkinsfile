pipeline {
    agent any

    environment {
        IMAGE_NAME = "trading-ui"
        CONTAINER_NAME = "trading-ui"
        PORT = "3000"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying container..."

                    // Stop and remove old container if exists
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                    """

                    // Run new container
                    sh """
                        docker run -d \
                            --name ${CONTAINER_NAME} \
                            -p ${PORT}:3000 \
                            --restart unless-stopped \
                            ${IMAGE_NAME}:latest
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful! App running on port ${PORT}"
        }
        failure {
            echo "❌ Build or Deployment failed"
        }
    }
}
