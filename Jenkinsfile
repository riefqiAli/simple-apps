pipeline {
    agent {
        label 'devops1-iqfeir'
    }
    
    tools {
        nodejs 'nodejs18'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/riefqiAli/simple-apps.git'
            }
        }
        stage('Build Code') {
            steps {
                sh '''cd apps
                npm install'''
            }
        }
        stage('Testing Code') {
            steps {
                sh '''cd apps
                npm test
                npm run test:coverage'''
            }
        }
        stage('Review Code') {
            steps {
                sh '''cd apps
                sonar-scanner \\ 
                -Dsonar.projectKey=simple-apps \\ 
                -Dsonar.sources=. \\ 
                -Dsonar.host.url=http://172.23.11.14:9000 \\ 
                -Dsonar.login=sqp_e576abe8a6df60bc09a4841cd73fab167af4f6e8'''
            }
        }
        stage('Change File env') {
            steps {
                sh '''cd apps
                sed -i \'s/localhost/db/g\' .env'''
            }
        }
        stage('Deploy Compose') {
            steps {
                sh '''docker compose build
                docker compose up -d '''
            }
        }
    }
}
