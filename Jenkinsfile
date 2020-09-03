pipeline {
    agent any


    stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ayman1231/Booster_CI_CD_Project/find/master'
            }
         stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/Ayman1231/Booster_CI_CD_Project/find/master'
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}
