pipeline{
    agent any

    tools {
    maven 'maven-3.6.3'
    }

    stages{
        stage("Build"){
            steps{
                echo "starting the build step"
                sh 'mvn clean install'
            }
        }

        stage("Test"){
            steps{
                echo "Starting tests"
            }
        }

        stage("Deploy"){
            steps{
                echo "Starting the deploy"
            }
        }
    }
}