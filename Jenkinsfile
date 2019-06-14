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
                        sh "git checkout ${env.BRANCH_NAME}"
                        sh 'bundle exec fastlane ios test'
                        def result = readFile('fastlane/testResultCode').trim()
                        echo "ResultCode = ${result}"
                        if (result == '0') {
                            githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests succeeded', status: 'SUCCESS'  
                        }
                        if (result == '1') {
                            githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests broken', status: 'FAILURE'
                        }
                        if (result == '2') {
                            githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Low code coverage', status: 'FAILURE'
                        } 
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
