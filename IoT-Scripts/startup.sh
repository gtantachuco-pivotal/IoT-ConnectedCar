#!/bin/bash

# source /etc/profile.d/pivotal.sh

# Setup the gemfire installation 
export GEMFIRE_IOT_CONF_DIR=$IOT_HOME/IoT-Scripts/conf

# Start gemfire

export JAVA_OPTS="-Dgemfire.jmx-manager-start=true -Dgemfire.jmx-manager=true -Dgemfire.jmx-manager-http-port=0"
#echo "Gemfire HAS BEEN DISABLED FOR TESTING PURPOSES"
 gemfire-server $GEMFIRE_IOT_CONF_DIR/iot-demo.xml &
 sleep 40;

# Load the journeys into GemFire
 java -jar $IOT_HOME/IoT-GemFireLoader/build/libs/IoT-GemFireLoader.jar /home/azureuser/IoT-ConnectedCar/data/model/clusters.json

# Start XD Singlenode
sudo $XD_HOME/bin/xd-singlenode

set retcode = $?
read -p "Done. Press [Enter] to close."
exit $retcode

