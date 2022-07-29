FROM maven:3.8.2-jdk-11-slim AS build-stage
WORKDIR /app
COPY app/ .
RUN mvn clean package -DskipTests

FROM payara/micro:5.2022.2-jdk11 AS production-stage
COPY --from=build-stage /app/target/jwt-auth.war $DEPLOY_DIR
CMD [ \
    "--deploymentDir", "/opt/payara/deployments", \
    "--systemproperties", "/opt/config/microprofile-config.properties" \
]

# Ensure our webapp running on payara/micro,
# has access to the /opt/storage directory.
USER root
RUN mkdir /opt/storage
RUN chown payara:payara /opt/storage

RUN apk add --update openssl
COPY ./entrypoint.sh /opt/payara/
