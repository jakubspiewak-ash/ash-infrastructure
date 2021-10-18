FROM gradle:7.2-jdk16 AS TEMP_BUILD_IMAGE
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME

COPY build.gradle settings.gradle $APP_HOME
COPY gradle $APP_HOME/gradle
COPY --chown=gradle:gradle . /home/gradle/src

USER root

RUN chown -R gradle /home/gradle/src

#ARG GITHUB_USERNAME
#ARG GITHUB_TOKEN
#ARG EUREKA_URI

RUN gradle build || return 0
COPY . .
RUN gradle clean build

FROM openjdk:16-alpine
ENV ARTIFACT_NAME=*-0.0.1-SNAPSHOT.jar
ENV APP_HOME=/usr/app/

#ARG EUREKA_URI
#ENV EUREKA_URI=${EUREKA_URI}
#ARG JDBC_URI
#ENV JDBC_URI=${JDBC_URI}

WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .

ENTRYPOINT exec java -jar ${ARTIFACT_NAME}
