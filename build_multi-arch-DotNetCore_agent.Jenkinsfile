def dockerImage;

node('docker'){
	stage('SCM'){
		checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false,
		extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/zsolt-github/Jenkins-in-Docker.git']]]);
	}
	stage('build'){
		docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials'){
	        sh 'docker buildx create --name buildxspace1'
			sh 'docker buildx use buildxspace1'
			sh 'docker buildx build -t zsoltdockerhub/multi_arch-agent-dnc:jenkinsfile --platform=linux/amd64,linux/arm/v7 - < dotnetcore_and_git.Dockerfile --push'
		}
    }
}