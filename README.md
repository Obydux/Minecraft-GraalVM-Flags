# The flags

java -Xms4G -Xmx4G -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+UseGCOverheadLimit -XX:+ParallelRefProcEnabled -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+UseCompressedOops -XX:ShenandoahAllocSpikeFactor=5 -XX:ShenandoahControlIntervalAdjustPeriod=1000 -XX:ShenandoahControlIntervalMax=10 -XX:ShenandoahControlIntervalMin=1 -XX:ShenandoahInitFreeThreshold=70 -XX:ShenandoahGarbageThreshold=60 -XX:ShenandoahGuaranteedGCInterval=300000 -XX:ShenandoahMinFreeThreshold=10 -XX:-ShenandoahRegionSampling -XX:ShenandoahRegionSamplingRate=40 -XX:+AlwaysPreTouch -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+DisableExplicitGC -XX:+UseShenandoahGC -XX:+UseFastUnorderedTimeStamps -jar paperclip.jar

# Startup flags requirement

  These flags require you to have Java 13 or higher.
