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
        //             steps {
        //                 script {
        //                     try {
        //                         sh 'bundle exec fastlane tests'
        //                         sh 'bundle exec fastlane coverage'                    
        //                     }
        //                     catch (exc) {
        //                         githubNotify context: 'Jenkins', credentialsId: 'jenkins_pipeline', description: 'Tests failed', status: 'FAILURE'
        //                     }
        //                 }                        
        //             }                    
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
