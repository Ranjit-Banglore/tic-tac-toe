node {

    stage('Git clone'){
        git credentialsId: 'GIT_HUB_CREDENTIAL' , url : 'https://github.com/Ranjit-Banglore/tic-tac-toe.git'
    }

    stage('Gradle Build'){
        sh './gradlew build'
    }

    stage('Docker Build'){
        sh 'docker version'
        sh 'docker build -t tic-tac-toe .'
        sh 'docker image list'
        sh 'docker tag tic-tac-toe ranjitkumarkiit/tic-tac-toe:latest'
    }

    withCredentials([string(credentialsId:  'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]){
        sh 'docker login -u ranjitkumarkiit -p $PASSWORD'
    }

    stage('Push image to Docker hub'){
        sh 'docker push ranjitkumarkiit/tic-tac-toe:tic-tac-toe'
    }

    stage('kubernetes deployment'){
        sh 'kubectl apply -f k8s-deployment.yml'
    }

}