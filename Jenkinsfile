pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                githubNotify context: 'Jenkins', description: 'Build Failed',  status: 'ERROR'
            }
        }
        stage('Test') { 
            steps {
                githubNotify context: 'Jenkins', description: 'Running Tests',  status: 'PENDING'
                dir('continuous_integration') {
                    steps {
                        try {
                            sh 'bundle exec fastlane tests'
                            sh 'bundle exec fastlane coverage'                    
                        }
                        catch (exc) {
                            githubNotify context: 'Jenkins', description: 'Tests Failed',  status: 'FAILURE'
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
