pipeline {
    agent any
    stages {
        stage("Test Build") {
            steps {
                sh """
                    echo Build Start
                    sleep 10
                    echo "Build End & Deployment Trigger"
                """
                build job: 'Job-1', parameters: [booleanParam(name: 'startDeployment', value: true)]
            }
        }
    }
}
