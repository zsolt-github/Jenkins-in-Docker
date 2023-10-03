def dockerImage;

node('docker'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/zsolt-github/Jenkins-in-Docker.git']]]);
	}
	stage('build'){
		dockerImage = docker.build('zsoltdockerhub/agent-dnc:v' + env.BUILD_NUMBER, './dotnetcore');
	}
	stage('push'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials'){
			dockerImage.push();
		}
	}
}