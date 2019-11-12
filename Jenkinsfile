pipeline { 
     agent { dockerfile true }
    
    stages {
        stage('Build') { 
            steps { 
                sh "sudo docker build . -t tunnudocker/devops:devopsv1"
            }
        }
        stage('Test'){
            steps {
                sh 'echo "Test Successuful"' 
            }
        }
        stage('push image') {
            steps {
                sh 'sudo docker push 'tunnudocker/devops'
            }
        }
    }
}
