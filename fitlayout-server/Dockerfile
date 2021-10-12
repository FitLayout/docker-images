FROM fitlayout/fitlayout-core
LABEL maintainer="Radek Burget, burgetr@fit.vutbr.cz" description="FitLayout server image with a REST API."

ENV PORT 8400

# Server config
COPY ./config.properties ${DEPLOYMENT_DIR}

# Entry point
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
WORKDIR ${DEPLOYMENT_DIR}
EXPOSE ${PORT}
HEALTHCHECK --interval=1m CMD curl --fail http://localhost:8400/api/repository/status || exit 1
