FROM maven:3.8.2-jdk-11-slim AS build-stage
WORKDIR /app
COPY app/ .
RUN mvn clean package -DskipTests

# Using older payara/micro version due to a bug.
# https://github.com/payara/Payara/issues/5363
FROM payara/micro:5.2021.4-jdk11 AS production-stage
COPY --from=build-stage /app/target/jwt-auth.war $DEPLOY_DIR
CMD ["--deploymentDir", "/opt/payara/deployments", "--contextroot", "ROOT"]

# Ensure our webapp running on payara/micro,
# has access to the /opt/storage directory.
USER root
RUN mkdir /opt/storage
RUN chown payara:payara /opt/storage
