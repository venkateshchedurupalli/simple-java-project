pipeline{
 agent any

tools{
   maven "M2_HOME"
   JDK "JAVA_HOME"
  }
  
  stages{
   stage('First Stage'){
     steps{
	       git credentialsId: 'GitHub_Cred', url: 'https://github.com/venkateshchedurupalli/simple-java-project.git'}	 
	 }
   
    stage("Build"){
	     sh 'mvn clean package -Dmaven.test.skip=true'}
	
	stage('Java_Version') {
	sh 'java -version' }
  
   }
}
