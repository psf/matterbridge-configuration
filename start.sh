#!/bin/bash

########################################################################
# Write Config variables in envrionment to the configuration JSON file #
########################################################################
lib/envsubst < config/config-heroku-template.toml > config/config-heroku.toml

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
./matterbridge -conf config/config-heroku.toml &

PID=$!

#####################################
# Wait for this process to complete #
#####################################
wait "$PID"
