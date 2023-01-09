#!/bin/sh
echo "Using runner: craftboard/runner-alpaquita-liberica-17"
cd "/opt/server"
umask 0000
if [ $USE_SHELL -eq true ]
then
	    echo "Detected USE_SHELL=true, running run.sh"
    	    sh run.sh
else
	java -Xmx$RAM_ALLOCATED -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 --add-modules=jdk.incubator.vector -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar
fi
