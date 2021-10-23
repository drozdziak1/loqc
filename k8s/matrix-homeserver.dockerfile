#syntax: docker/dockerfile:v1.2
FROM matrixdotorg/synapse:latest

ARG SYNAPSE_SERVER_NAME=matrix-homeserver
ARG SYNAPSE_REPORT_STATS=no
RUN mkdir /data
RUN python ./start.py generate
