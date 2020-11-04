pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/zljupiter/pokedex-go.git']]])
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t app .'
      }
    }
    stage('Test') {
        steps {
            sh 'docker exec -ti app npm test'
        }
    }
    stage('Run') {
      steps {
        sh 'docker run -d --rm -p 5555:5555 --name mypokedex pokedex-go:latest'
      }
    }
  }
}