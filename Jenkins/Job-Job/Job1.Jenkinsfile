pipeline {
    agent any
    
    parameters {
        booleanParam(defaultValue: false, description: "Start Deployment", name: "startDeployment")
    }
    
    stages {
        stage("Test Deployment") {
            steps {
                echo "Start Deployment - ${params.startDeployment}"
            }
        }
    }
    
}
