#!/bin/sh

#get the number of executors, default 2
RUN_JENKINS_NUM_EXECUTORS={$RUN_JENKINS_NUM_EXECUTORS:-2}

#set the log level default to FINEST
RUN_JENKINS_LOG_LEVEL={$RUN_JENKINS_LOG_LEVEL:-FINEST}

cat >/usr/share/jenkins/ref/init.groovy.d/executors.groovy <<EOF
import jenkins.model.*
Jenkins.instance.setNumExecutors($RUN_JENKINS_NUM_EXECUTORS)
EOF

#setup logging - default ot FINEST
mkdir -p data
cat > data/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=$RUN_JENKINS_NUM_EXECUTORS
java.util.logging.ConsoleHandler.level=$RUN_JENKINS_NUM_EXECUTORS
EOF

