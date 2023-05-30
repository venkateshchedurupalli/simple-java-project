def buildnumber=BUILD_NUMBER
def scannerHome = tool 'SonarScanner 4.8.0';
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
        withSonarQubeEnv('sonarqube-9.9') { 
        // If you have configured more than one global server connection, you can specify its name
//      sh "${scannerHome}/bin/sonar-scanner"
        sh "mvn sonar:sonar"
                         }
                   }
            }
 

    stage("Quality Gate"){
	    steps{
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
      }
    }
   
   
   
   
   }
}
