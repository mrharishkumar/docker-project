pipeline{
    agent any
    tools{
        maven 'MAVEN_HOME'
    }
    stages{
        stage('Git clone')
        {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kushagrakush/spring-admin-server']]])
           
            }
        }
        stage('build project') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t kushh/java_server_admin:latest .'
			}
		}
		stage('Push') {
		    steps {
		        script {
		            withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockercred')]) {
		                sh "docker login -u kushh -p ${dockercred}"
                    }
                    sh "docker push kushh/java_server_admin"
		        }
		    }
		}
		
    }
}
