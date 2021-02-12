#!/bin/bash

# Work around https://github.com/OpenModularTurretsTeam/OpenModularPassiveDefense/issues/14
[[ -d config/recipes ]] && rm -rf config/recipes/

#Settings
[[ -f config.sh ]] && . config.sh
SERVICE="${FORGE:-server.jar}"
OPTIONS='nogui'
MCPATH="${SERVER_DIR}"
INVOCATION="java -server  \
	-Xms${START_MEMORY}M -Xmx${MAX_MEMORY}M  \
	-XX:+UseLargePagesInMetaspace  \
	-XX:ParallelGCThreads=4
	-XX:ConcGCThreads=2
	-Djava.net.useSystemProxies=true \
	-Djline.terminal=unix -Djava.util.prefs.userRoot=${SERVER_DIR}  \
	-Djava.net.preferIPv4Stack=true  \
	-XX:+AlwaysPreTouch  \
	-XX:+UseG1GC  \
	-XX:+UnlockExperimentalVMOptions  \
	-XX:MaxGCPauseMillis=100  \
	-XX:+DisableExplicitGC  \
	-XX:TargetSurvivorRatio=90  \
	-XX:G1NewSizePercent=50  \
	-XX:G1MaxNewSizePercent=80 \
	-XX:InitiatingHeapOccupancyPercent=10  \
	-XX:G1MixedGCLiveThresholdPercent=50  \
	-XX:-UseAdaptiveSizePolicy \
	-jar $SERVICE $OPTIONS"
#	-XX:+UseLargePages  \
#	-Dfml.doNotBackup=true -Dfml.queryResult=confirm  \

${INVOCATION}
