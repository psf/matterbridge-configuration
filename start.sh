#!/bin/bash

###################################################################
# Write Config variables in envrionment to the configuration file #
###################################################################
envsubst < /matterbridge/config-template.toml > /matterbridge/config.toml

#####################################
# Pass SIGTERM to Matterbridge proc #
#####################################
function _term {
  echo "Sending SIGTERM to matterbridge"

  kill --TERM "$PID" 2>/dev/null
}

trap _term SIGTERM

####################
# Start Matterbridge #
####################
matterbridge -conf /matterbridge/config.toml &

PID=$!

#####################################
# Wait for this process to complete #
#####################################
wait "$PID"
