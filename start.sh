# Your server jar name
JAR_NAME = paperclip.jar
# How much RAM do you want to allocate (in MB)
HEAP=5120
# Okay you're done


NURSERY_MIN=$(($HEAP / 2))
NURSERY_MAX=$(($HEAP * 4 / 5))
java -Xms${HEAP}M -Xmx${HEAP}M -Xmns${NURSERY_MIN}M -Xmnx${NURSERY_MAX}M -Xgc:concurrentScavenge -Xgc:dnssExpectedTimeRatioMaximum=3 -Xgc:scvNoAdaptiveTenure -Xdisableexplicitgc -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:-UseParallelOldGC -XX:-UseG1GC -XX:+UseZGC -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+UseGCOverheadLimit -XX:+ParallelRefProcEnabled -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+UseCompressedOops -XX:+AlwaysPreTouch -XX:+UseAdaptiveGCBoundary -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+UseTransparentHugePages -XX:+UseLargePagesInMetaspace -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:-ZUncommit -XX:ZUncommitDelay=5 -XX:+ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ${JAR_NAME}
