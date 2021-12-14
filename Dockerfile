FROM openjdk:11

RUN mkdir apps

ADD build/libs/tic-tac-toe.jar  /apps/tic-tac-toe.jar

ENTRYPOINT ["java","-jar","/app.jar"]