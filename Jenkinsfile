node {

    stage('Git clone'){
        git  url : 'https://github.com/Ranjit-Banglore/tic-tac-toe.git'
    }

    stage('Gradle Build'){
        sh './gradlew build'
    }

    stage('Docker Build'){
        sh 'docker version'
        sh 'echo $(git rev-parse HEAD)'
        sh 'docker build -t tic-tac-toe:$(git rev-parse HEAD) .'
        sh 'docker image ls'
        sh 'docker tag tic-tac-toe:$(git rev-parse HEAD) ranjitkumarkiit/tic-tac-toe:$(git rev-parse HEAD)'
    }

    withCredentials([string(credentialsId:  'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]){
        sh 'docker login -u ranjitkumarkiit -p $PASSWORD'
    }

    stage('Push image to Docker hub'){
        sh 'echo $(git rev-parse HEAD)'
        sh 'docker push ranjitkumarkiit/tic-tac-toe:$(git rev-parse HEAD)'
    }

    stage('kubernetes deployment'){
        sh 'cat k8s-deployment.yml'
        sh 'echo $(git rev-parse HEAD)'
        sh 'sed -ie "s/COMMIT_HASH/$(git rev-parse HEAD)/" k8s-deployment.yml'
        sh 'cat k8s-deployment.yml'
        sh 'kubectl apply -f k8s-deployment.yml --namespace=tic-tac-toe'
    }

}

