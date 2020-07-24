  [![Discord Chat](https://img.shields.io/discord/308323056592486420.svg)](https://discord.gg/98zrwn8)

  # The startup script
  
  JAR_NAME = paperclip.jar
    
    
  HEAP=5120
  

  NURSERY_MIN=$(($HEAP / 2))
  NURSERY_MAX=$(($HEAP * 4 / 5))
  java -Xms${HEAP}M -Xmx${HEAP}M -Xmns${NURSERY_MIN}M -Xmnx${NURSERY_MAX}M -Xgc:concurrentScavenge -Xgc:dnssExpectedTimeRatioMaximum=3 -Xgc:scvNoAdaptiveTenure -Xdisableexplicitgc -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:-UseParallelOldGC -XX:-UseG1GC -XX:+UseZGC -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+UseGCOverheadLimit -XX:+ParallelRefProcEnabled -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+UseCompressedOops -XX:+AlwaysPreTouch -XX:+UseAdaptiveGCBoundary -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+UseTransparentHugePages -XX:+UseLargePagesInMetaspace -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:-ZUncomit -XX:ZUncommitDelay=5 -XX:+ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar ${JAR_NAME}


  # Startup flags's requirements and information:

  These flags require you to have OpenJ9 and Java 13 or higher.

  The reason these flags are better than [Aikar's flags](https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/) is because they use the ZGC (Z Garbage Collector) instead of G1GC (G1 Garbage Collector) that only works on Java 11+, but it require Java 13+ because it uses some Java 13+ flags and ZGC is faster on Java 13+. If you wanna read more about ZGC on Minecraft read [this blog](https://krusic22.com/2020/03/25/higher-performance-crafting-using-jdk11-and-zgc/). It also requires OpenJ9 because it uses OpenJ9 only flags. I've added '-Dusing.aikars.flags=https://mcflags.emc.gs' and '-Daikars.new.flags=true' flags so Aikar's timings site says you're using Aikar's flags.



  If you're using a VPS add "-Xtune:virtualized" flag before "-jar jar_name.jar"

