FROM tomcat:8.5.47-jdk8-openjdk
WORKDIR /usr/local/tomcat/webapps/
ARG file_name
RUN echo ${file_name}
COPY ./${file_name}*.war .
