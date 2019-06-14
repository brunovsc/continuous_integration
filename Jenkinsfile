pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Running Tests', status: 'PENDING'
            }
        }
        stage('Test') { 
            steps {
                githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Running Tests', status: 'PENDING'
                script {
                    try {
                        sh 'git checkout develop'
                        sh 'bundle exec fastlane ios test > resultFile'
                        def result = readFile('fastfile/testErrorCode').trim()
                        echo "ErrorCode = ${result}"
                        if (result == 1) {
                            echo "AAAAA 1"
                        }
                        if (result == 2) {
                            echo "BBBBB 2"
                        }   
                        githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests succeeded', status: 'SUCCESS'   
                    }
                    catch (exc) {
                        echo exc
                        githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests failed', status: 'FAILURE'
                    }
                }              
            }
        }
        stage('Deploy') { 
            steps {
                sh 'echo test deploy'
            }
        }
    }
}
