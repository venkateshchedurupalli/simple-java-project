def buildnumber=BUILD_NUMBER
def scannerHome = tool 'sonar-4.8.0';
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
   
    stage('SonarQube analysis') {
        steps{
        withSonarQubeEnv('sonarQube-Server') { 
        // If you have configured more than one global server connection, you can specify its name
//      sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
                         }
		timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
              }
          }
    }
 

   
   
   
   
   
   }
}
