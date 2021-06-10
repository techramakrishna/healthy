FROM ubuntu:21.04
ENV JAVA_HOME=/u01/middleware/jdk-11
ENV PATH=${PATH}:${JAVA_HOME}/bin
RUN mkdir -p /u01/middleware
RUN mkdir -p /u01/app

WORKDIR /u01/middleware
ADD https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz .
RUN gunzip openjdk-11+28_linux-x64_bin.tar.gz
RUN tar -xvf openjdk-11+28_linux-x64_bin.tar
RUN rm -rf openjdk-11+28_linux-x64_bin.tar

WORKDIR /u01/app
COPY target/covido-1.0.jar .
CMD [ "java", "-jar", "/u01/app/covido-1.0.jar"]