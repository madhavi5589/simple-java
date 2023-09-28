pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    stages {
        stage('SourceCode') {
            steps {
                git branch: 'main', url: 'https://github.com/madhavi5589/simple-java.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
				//buildName: "${JOB_NAME}",
                //buildNumber: "${BUILD_ID}"
            }
        }
        stage('Archive and Test Results') {
            steps {
               junit '**/surefire-reports/*.xml'
               archiveArtifacts artifacts: '**/*.jar', followSymlinks: false


            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Define the Docker image name and tag
                    def imageName = "springboot"
                    def imageTag = "v4"
                    
                    // Build the Docker image
                    sh "docker build -t ${imageName}:${imageTag} ."
                }
            }
        }
        
        stage('Publish Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker_Hub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    script {
                        // Login to Docker Hub and push the Docker image
                        sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
                        sh "docker tag springboot:v3 nagendra123456/demo:v4"
                        sh "docker push nagendra123456/demo:v4"
                    }
                }
            }
        }
    }  
}
