#!/bin/bash
#
# $1 = server directory to archive

if [[ "x$#" != "x1" ]]; then
	echo "Usage: ${0} <server directory>"  &&
	exit 1
fi &&

# Include these files/folders
archiveList="asm/ \
	config.sh \
	config/ \
	defaultconfigs/ \
	forge*.jar \
	libraries/ \
	minecraft_server*.jar \
	modpack/ \
	mods/ \
	server.properties.template \
	start.sh"

# Exclude these files/folders
excludeList="config/purpleirc/bots/* \
			 config/eirairc/servers.json \
			 mods/ImmersiveEngineering*-core.jar \
			 libraries/org/minimallycorrect/mixin/Mixin*/Mixin*.jar \
			 libraries/org/minimallycorrect/modpatcher/ModPatcher*/ModPatcher*.jar"

cd "${1}" &&
zip -r ../"${1///}".zip ${archiveList} --exclude ${excludeList} &&
cd -
