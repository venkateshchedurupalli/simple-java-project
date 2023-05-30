def buildnumber=BUILD_NUMBER
pipeline{
	
 agent any

tools{
   maven 'M2_HOME'
   jdk 'JAVA_HOME'
  }
	
  
  stages{
   stage('First Stage'){
     steps{
	       checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'GitHub_Cred', url: 'https://github.com/venkateshchedurupalli/simple-java-project.git']])
         }	 
   }
   
    stage("Build"){
	    steps{
	     sh 'mvn clean package -Dmaven.test.skip=true'}
    }
    stage("Bulding Image"){
          steps{
                sh "docker build -t venkatesh55/java-app:${buildnumber} ."    
            }
        }
	  
	  stage("pushing to docker hub"){
           steps{
               withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'dockerhubpasswd')]) {
                        sh"docker login -u venkatesh55 -p ${dockerhubpasswd} "
               
           }
              
               sh "docker push venkatesh55/java-app:${buildnumber}"
           }
       }
	  
	  
	   stage("deploy into docker container"){
           steps{
               sshagent(['Docker-VM-SSH-LOGIN']) {
             sh "ssh -o StrictHostKeyChecking=no azureuser@172.16.10.4 docker rm -f javaappcontainer || true"
             sh "ssh -o StrictHostKeyChecking=no azureuser@172.16.10.4 docker run -d --name javaappcontainer -p 8080:80 venkatesh55/java-app:${buildnumber} "

           }
       }
     }
	  

   }
}
