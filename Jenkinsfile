pipeline {
    agent any 
    stages {
        stage('Build') {
            steps {
                githubNotify account: 'brunovsc', credentialsId: 'jenkins-pipeline', context: 'Jenkins', description: 'Build Failed',  status: 'ERROR', gitApiUrl: 'https://api.github.com'
            }
        }
        stage('Test') { 
            steps {
                githubNotify account: 'brunovsc', credentialsId: 'jenkins-pipeline',context: 'Jenkins', description: 'Running Tests',  status: 'PENDING', gitApiUrl: 'https://api.github.com'
                dir('continuous_integration') {
                    steps {
                        script {
                            try {
                                sh 'bundle exec fastlane tests'
                                sh 'bundle exec fastlane coverage'                    
                            }
                            catch (exc) {
                                githubNotify account: 'brunovsc', credentialsId: 'jenkins-pipeline',context: 'Jenkins', description: 'Tests Failed',  status: 'FAILURE', gitApiUrl: 'https://api.github.com'
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
