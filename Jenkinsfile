node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Update dep') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        sh 'cat deployment.yaml'
                        sh    "sed -i 's/wapp.*/wapp:1.1.${DOCKERTAG}/g' deployment.yaml"   
                        sh 'cat deployment.yaml'
                        sh "git add ."
                        sh "git commit -m 'X ${env.BUILD_NUMBER}'"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/arg2.git HEAD:main"
      }
    }
  }
}
}
