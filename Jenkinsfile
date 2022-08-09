pipeline {
    agent any
        environment {
        registry = "ecarmona1992/interview"
        registrycredential = 'docker-hub-login'
        // EKS_CLUSTER_NAME = "demo-cluster"
    }
    stages {
        stage('build') {
            agent {
                docker { image 'openjdk:11-jdk' }
            }
            steps {
                sh 'chmod +x gradlew && ./gradlew build jacocoTestReport'
            }
        }
        // stage('sonarqube') {
        // agent {
        //     docker { image '<some sonarcli image>' } }
        //     steps {
        //         sh 'echo scanning!'
        //     }
        // }
        stage('docker build') {
            steps {
                script {
                // reference: https://www.jenkins.io/doc/book/pipeline/jenkinsfile/
                img = registry + ":${env.BUILD_ID}"
                // reference: https://docs.cloudbees.com/docs/admin-resources/latest/plugins/docker-workflow
                dockerImage = docker.build("${img}")
                }
            }
        }
        stage('docker push') {
            steps {
                sh 'echo docker push!'
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com ', registryCredential ) {
                        // push image to registry
                        dockerImage.push()
                    } 
                }
            }

    }
        stage('Deploy App') {
            steps {
                sh 'echo deploy to kubernetes'               
            }
    }
}
}