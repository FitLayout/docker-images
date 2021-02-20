FROM fitlayout/fitlayout-core

# A folder for sharing the output
ENV OUT /out
RUN mkdir -p ${OUT}

COPY ./cli-entrypoint.sh /

# Entry point
ENTRYPOINT ["/cli-entrypoint.sh"]
WORKDIR ${CLI_DIR}
