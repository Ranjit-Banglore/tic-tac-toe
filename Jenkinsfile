node {

    stage('Git clone'){
        git  url : 'https://github.com/Ranjit-Banglore/tic-tac-toe.git'
    }

    stage('Gradle Build'){
        sh './gradlew build'
    }

    stage('Docker Build'){
        sh 'docker version'
        sh 'docker build -t tic-tac-toe.jar .'
        sh 'docker image ls'
        sh 'docker tag tic-tac-toe.jar ranjitkumarkiit/tic-tac-toe.jar'
    }

    withCredentials([string(credentialsId:  'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]){
        sh 'docker login -u ranjitkumarkiit -p $PASSWORD'
    }

    stage('Push image to Docker hub'){
        sh 'docker push ranjitkumarkiit/tic-tac-toe.jar'
    }

    stage('kubernetes deployment'){
        sh 'kubectl apply -f k8s-deployment.yml'
    }

}