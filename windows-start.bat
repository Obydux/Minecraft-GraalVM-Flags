@echo off 

::
:: This startup script was put together by Ovydux.
:: To use this startup script you need have OpenJ9 JVM installed.
:: You can get the OpenJ9 JVM from https://www.eclipse.org/openj9.
::
:: Licensed under the MIT license.
::

:: This is how much RAM in MB you plan to allocate to your server.
set /A RAM=5120

:: This is your server's jar name.
set JAR_NAME=paperclip.jar

:: Set this to true if you're using a VPS.
set VPS=false


:: DON'T TOUCH ANYTHING BELOW THIS LINE(!!!)

set /A NURSERY_MIN=%RAM% / 2
set /A NURSERY_MAX=%RAM% * 5 / 6

IF %VPS%==true set CMD=java -Xms%RAM%M -Xmx%RAM%M -Xmns%NURSERY_MIN%M -Xmnx%NURSERY_MAX%M -Xgc:concurrentScavenge -Xgc:dnssExpectedTimeRatioMaximum=3 -Xgc:scvNoAdaptiveTenure -Xdisableexplicitgc -Xtune:virtualized -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %JAR_NAME% nogui
IF %VPS%==false set CMD=java -Xms%RAM%M -Xmx%RAM%M -Xmns%NURSERY_MIN%M -Xmnx%NURSERY_MAX%M -Xgc:concurrentScavenge -Xgc:dnssExpectedTimeRatioMaximum=3 -Xgc:scvNoAdaptiveTenure -Xdisableexplicitgc -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %JAR_NAME% nogui
ECHO Allocating %RAM%MB of RAM...
ECHO Starting the server using Ovydux's startup script...
%CMD%
PAUSE
