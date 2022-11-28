pipeline{
    agent any
    tools{
        maven 'MAVEN_HOME'
    }
    stages{
        stage('Git clone')
        {
            steps{
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mrharishkumar/docker-project']]])           
            }
        }
        stage('build project') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Build') {
			steps {
				sh 'docker build -t mrharishkumar/java_server_admin:latest .'
			}
		}
		stage('Push') {
		    steps {
		        script {
		            withCredentials([string(credentialsId: 'docker-cred', variable: 'docker-cred')]) {
		                sh "docker login -u mrharishkumar -p ${docker-cred}"
                    }
                    sh "docker push mrharishkumar/java_server_admin"
		        }
		    }
		}
		
    }
}
