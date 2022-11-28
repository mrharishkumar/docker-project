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
				sh 'docker build -t mrharishkumar/docker_project:latest .'
			}
		}
		stage('Push') {
		    steps {
		        script {
				withCredentials([string(credentialsId: 'cred-docker', variable: 'dockerhubpwd')]) {
				sh "docker login -u mrharishkumar -p ${dockerhubpwd}"
                    }
                    sh "docker push mrharishkumar/docker_project"
		        }
		    }
		}
		
    }
}
