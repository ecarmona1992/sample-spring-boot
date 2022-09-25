pipeline{
    agent any

    tools {
    maven 'maven-3.8.6'
    }

    stages{
        stage("Build & JUnit test"){
            steps{
                echo "starting the build/test step"
                sh 'mvn clean install'
            }
        }

        stage("Sonarcloud test"){
            steps{
                echo "Starting tests"
                sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=baltimore-test'
            }
        }

        stage("Deploy to K8s"){
            steps{
                echo "Starting the deploy"
            }
        }
    }
}