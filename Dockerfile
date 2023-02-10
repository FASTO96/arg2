node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Update GIT') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                         
                        sh    "sed -i 's/wapp.*/wapp:1.1.${DOCKERTAG}/g' deployment.yaml"                        
                        sh "git add ."
                        sh "git commit -m 'X ${env.BUILD_NUMBER}'"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/arg2.git HEAD:main"
      }
    }
  }
}
}
