pipeline{
	agent {
		label 'client1'
	}
  
  stages{
    stage('docker build'){
      steps{
        sh'docker build --build-arg file-name="${fname}" -t $USER_DOCKER/$IMG_NAME:$GIT_COMMIT .'
      }
    }
  }
}
