#!/bin/bash

###################################################################
# Write Config variables in envrionment to the configuration file #
###################################################################
envsubst < /matterbridge/config-template.toml > /matterbridge/config.toml

####################
# Start Matterbridge #
####################
/bin/matterbridge -conf /matterbridge/config.toml
