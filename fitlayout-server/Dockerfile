FROM fitlayout/fitlayout-core
LABEL maintainer="Radek Burget, burgetr@fit.vutbr.cz" description="FitLayout server image with a REST API."

ENV PORT 8400

# Server config
COPY ./config.properties ${DEPLOYMENT_DIR}

# Entry point
ENTRYPOINT java -jar ${BUNDLE} --port ${PORT} --systemproperties ${DEPLOYMENT_DIR}/config.properties
WORKDIR ${DEPLOYMENT_DIR}
EXPOSE ${PORT}
HEALTHCHECK --interval=1m CMD curl --fail http://localhost:8400/api/repository/status || exit 1
