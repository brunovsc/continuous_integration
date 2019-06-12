pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                githubNotify credentialsId: 'brunovsc', context: 'Jenkins', description: 'Build Failed',  status: 'ERROR'
            }
        }
        stage('Test') { 
            steps {
                githubNotify credentialsId: 'brunovsc',context: 'Jenkins', description: 'Running Tests',  status: 'PENDING'
                dir('continuous_integration') {
                    steps {
                        script {
                            try {
                                sh 'bundle exec fastlane tests'
                                sh 'bundle exec fastlane coverage'                    
                            }
                            catch (exc) {
                                githubNotify credentialsId: 'brunovsc',context: 'Jenkins', description: 'Tests Failed',  status: 'FAILURE'
                            }
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
