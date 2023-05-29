pipeline{
 agent any

tools{
   maven 'M2_HOME'
   jdk 'JAVA_HOME'
  }
	def buildnumber=BUILD_NUMBER()
  
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
                sh "docker build -t venkatesh55/java-App .:${buildnumber}"    
            }
        }
	  
	  
	stage("java version") { 
	  steps { sh 'java -version' }
	}
   }
}
