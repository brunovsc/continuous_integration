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
                dir('continuous_integration') {
                    script {
                        try {
                            sh 'cat Fastfile'
                            sh 'cat fastlane/Fastfile'
                            sh 'bundle install'
                            sh 'bundle exec fastlane ios unit_test'
                            sh 'bundle exec fastlane ios test_coverage'                 
                            githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests succeeded', status: 'SUCCESS'   
                        }
                        catch (exc) {
                            echo exc
                            githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests failed', status: 'FAILURE'
                        }
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
