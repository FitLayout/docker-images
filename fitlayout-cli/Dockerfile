FROM fitlayout/fitlayout-core
LABEL maintainer="Radek Burget, burgetr@fit.vutbr.cz" description="FitLayout Command-line interface (CLI) image."

# A folder for sharing the output
ENV OUT /out
RUN mkdir -p ${OUT}

# FitLayout config used for CLI
COPY ./config.properties ${CLI_DIR}

# Entry point
COPY ./cli-entrypoint.sh /
ENTRYPOINT ["/cli-entrypoint.sh"]
WORKDIR ${CLI_DIR}
