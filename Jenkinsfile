pipeline {
    agent any 
    stages {    
//        stage('Clone Repo') {
//            steps {
//                sh 'rm -rf continuous_integration'
//                sh 'git clone https://github.com/brunovsc/continuous_integration.git'
//                dir('continuous_integration') {
//                    sh "git checkout ${params.BRANCH}"
//                }
//                //sh 'ls -la continuous_integration'
//               echo 'Cloned Repository'
//               //sh 'ls -la continuous_integration'
//               echo 'Cloned Repository'
//            }
//        }
        stage('Build') {
            steps {
                sh 'bundle install'
                sh 'which fastlane'
                sh 'echo test build'
            }
        }
        stage('Test') { 
            steps {
                dir('continuous_integration') {
                    sh 'bundle install'
                    sh 'echo before'
                    sh 'bundle exec fastlane tests'
                    sh 'echo after'
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
