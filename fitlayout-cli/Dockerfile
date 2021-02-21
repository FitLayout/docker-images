FROM fitlayout/fitlayout-core
LABEL maintainer="Radek Burget, burgetr@fit.vutbr.cz" description="FitLayout Command-line interface (CLI) image."

# A folder for sharing the output
ENV OUT /out
RUN mkdir -p ${OUT}

COPY ./cli-entrypoint.sh /

# Entry point
ENTRYPOINT ["/cli-entrypoint.sh"]
WORKDIR ${CLI_DIR}
