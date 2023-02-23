pipeline{
	agent {
		label 'client1'
	}
	environment {
		DOCKERHUB_CREDENTIALS = credentials('DockerHub')
	        GIT_COMMIT = sh(returnStdout: true, script: 'git rev-parse --short HEAD')
	        PORT_app= 9192
	        fname= "demo"
	        USER_DOCKER= 8485012281
                PASS_DOCKER= "Aditya@123"
                IMG_NAME= 'db-application'
	        DB_IMG= 'mysql'
	        MYSQL_PASS= 'root'
	        MYSQL_PORT= 5000
// 	        docker= sh(script: 'sshpass -p s1 ssh vboxuser@192.168.56.102 docker --version',returnStdout: true)
// 	        file_path=""
	}
 
  
  stages{
    stage('docker build'){
      steps{
        sh'docker build --build-arg file-name="${fname}" -t $USER_DOCKER/$IMG_NAME:$GIT_COMMIT .'
      }
    }
  }
}
