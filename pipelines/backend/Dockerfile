#FROM eyctpeu-eycomply-docker-dev-eu.jfrog.io/baseimage:alpine-azul-11.0.17-11.60.19-jre
FROM {{DOCKER_BASE_IMAGE}}

WORKDIR '/app'

# Prepare environment
ENV CLIENT {{ENV}}
ENV AUDIT_CLIENT_OBJECT_TYPE {{MICROSVC}}
#ENV JAVA_HOME {{JAVA_HOME_DOCKER}}
ENV CATALINA_HOME {{CATALINA_HOME}}

WORKDIR '/opt/tomcat'

COPY {{BUILD_FILE_NAME}} .

RUN chown -R tomcat:tomcat /opt/tomcat

RUN chmod 777 -R {{BUILD_FILE_NAME}}

EXPOSE {{DOCKER_PORT}}

USER tomcat

ADD environment.var /opt/tomcat

CMD ["java", "-XX:MinHeapFreeRatio=20", "-XX:MaxHeapFreeRatio=70", "-Xmx2G", "-jar","{{BUILD_FILE_NAME}}"]
