node {
    def app
    environment {
    registry = "tunnudocker/dockerpipelinebuild"
    registryCredential = 'docker-hub-credentials'
  }

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

   stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("tunnudocker/dockerpipelinebuild")
    }
    
     stage('Testing') {
        /*we're going to test weather git is installed and displaying the version of the git */
       sh 'git --version'   
    }
    
    
    stage('Approve') {
        /* Approving the build befor proceeding further to push the image to doker hub */
        
        input('Do you want to proceed?')
    }
             
    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    
    stage('Deploynment') {
        /*we're going to test weather git is installed and displaying the version of the git */
       sh 'docker container run it -d tunnudocker/dockerpipelinebuild /bin/bash'   
    }
}
