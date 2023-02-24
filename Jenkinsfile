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
	        FILE_PATH= "/home/vboxuser/code"

// 	        docker= sh(script: 'sshpass -p s1 ssh vboxuser@192.168.56.102 docker --version',returnStdout: true)
// 	        file_path=""
	}
 
  
  stages{
	  
//     stage('docker check on remote ') {
// 	       when { environment name: 'docker', value: '' }
// 	       steps {
// 		       echo "${docker}"
// 		       sh 'ansible-playbook docker-playbook.yml'
// 	       }
//     } 
	  
    	   
    stage('docker login on remote machine'){
	    steps{
// 		    sh 'ansible-playbook login.yml --extra-vars "uname=$USER_DOCKER passwd=$PASS_DOCKER"'
		    sh 'docker login -u $USER_DOCKER -p $PASS_DOCKER'
	    }
    }
	  
//     stage('mysql run on remote') {
// 	    steps {
// 		    sh 'docker run -d -p $MYSQL_PORT:3306 --name mysql-$GIT_COMMIT -e MYSQL_ROOT_PASSWORD=root mysql'  
// 		    sh 'sleep 30'
// // 		    sh 'ansible-playbook container-playbook.yml --extra-vars "image_name=$DB_IMG port=$MYSQL_PORT passwd=$MYSQL_PASS"'
// 	    }
//     } 
	  
    stage('maven location') {
	    steps {
		    sh'''
		      pwd
		      ls
		      mvn clean -f $FILE_PATH 
		      mvn install -f $FILE_PATH 
		      cp $FILE_PATH/target/"${fname}"*.war .
		      '''
	    }
    }	  
	  
	  
    stage('docker build'){
      steps{
        sh'docker build --build-arg file-name="${fname}" -t $USER_DOCKER/$IMG_NAME:$GIT_COMMIT .'
      }
    }
	  
    stage('docker push'){
	    steps{
		    sh 'docker push $USER_DOCKER/$IMG_NAME:$GIT_COMMIT'
	    }
    }
	  
    stage('docker run on remote'){
	    steps{
// 		    sh 'ansible-playbook application.yml --extra-vars "image_name=$USER_DOCKER/$IMG_NAME:$GIT_COMMIT port=$PORT_app"' 
		    sh 'docker run -d -p $PORT_app:8080 --name $IMG_NAME-$GIT_COMMIT $USER_DOCKER/$IMG_NAME:$GIT_COMMIT'
		    sh 'sleep 30'
		    sh 'docker ps'
	    }
    }	  
	  
  }
}
