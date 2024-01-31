Information
======

These Java flags are tuned for Minecraft servers ran with the GraalVM Java Runtime which you can download from [here](www.graalvm.org/downloads/). They have been tested against both Java 17 and 21 and **they only work on Linux**.

GraalVM Java Flags
======

```--add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:MaxGCPauseMillis=130 -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=28 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=20 -XX:G1MixedGCCountTarget=3 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=90 -XX:SurvivorRatio=32 -XX:MaxTenuringThreshold=1 -XX:+PerfDisableSharedMem -XX:G1SATBBufferEnqueueingThresholdPercent=30 -XX:G1ConcMarkStepDurationMillis=5 -XX:G1ConcRSHotCardLimit=16 -XX:G1ConcRefinementServiceIntervalMillis=150 -XX:G1RSetUpdatingPauseTimePercent=0 -XX:+UseNUMA -XX:-DontCompileHugeMethods -XX:MaxNodeLimit=240000 -XX:NodeLimitFudgeFactor=8000 -XX:ReservedCodeCacheSize=400M -XX:NonNMethodCodeHeapSize=12M -XX:ProfiledCodeHeapSize=194M -XX:NonProfiledCodeHeapSize=194M -XX:NmethodSweepActivity=1 -XX:+UseFastUnorderedTimeStamps -XX:+UseCriticalJavaThreadPriority -XX:AllocatePrefetchStyle=3 -XX:+AlwaysActAsServerClassMachine -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+EagerJVMCI -Dgraal.TuneInlinerExploration=1 -Dgraal.LoopRotation=true -Dgraal.OptWriteMotion=true -Dgraal.CompilerConfiguration=enterprise```

Flag Explanations
======

- `--add-modules=jdk.incubator.vector` This is only useful for servers running Pufferfish or Purpur on 1.18.2 and above. It enables SIMD operations on your server if they're available and optimizes map rendering.
- `-XX:+UseG1GC -XX:MaxGCPauseMillis=130 -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=28 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=20 -XX:G1MixedGCCountTarget=3 -XX:InitiatingHeapOccupancyPercent=10 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=0 -XX:SurvivorRatio=32 -XX:MaxTenuringThreshold=1 -XX:+PerfDisableSharedMem` Generic G1GC flags. These flags are very close to [Aikar's](https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/).
- `-XX:G1SATBBufferEnqueueingThresholdPercent=30 -XX:G1ConcMarkStepDurationMillis=5 -XX:G1ConcRSHotCardLimit=16 -XX:G1ConcRefinementServiceIntervalMillis=150` Optimizes G1GC's concurrent collection threads, the last 2 flags aren't needed in Java 21 anymore.
- `-XX:G1RSetUpdatingPauseTimePercent=0` Makes all the work to be done in the G1GC concurrent threads, not the pauses.
- `-XX:+UseNUMA` Enables optimizations for multisocket systems, if applicable. Not sure if this applies to MCM CPUs like Ryzen or Epyc, but its auto disabled if not applicable.
- `-XX:-DontCompileHugeMethods` Allows huge methods to be compiled.
- `-XX:MaxNodeLimit=240000 -XX:NodeLimitFudgeFactor=8000` Enable optimization of larger methods.
- `-XX:ReservedCodeCacheSize=400M -XX:NonNMethodCodeHeapSize=12M -XX:ProfiledCodeHeapSize=194M -XX:NonProfiledCodeHeapSize=194M` Reserves more space for compiled code. All sections must "add up" to `ReservedCodeCacheSize`.
- `-XX:NmethodSweepActivity=1` (default 10) Keeps "cold" code in the cache for a longer time. There is no risk of "filling up" the code cache either, as cold code is more aggressively removed as it fills up. 
- `-XX:+UseFastUnorderedTimeStamps` Avoids system calls for getting the time. The impact of this will vary per system, but we aren't really concerned with logging timestamp accuracy. 
- `-XX:+UseCriticalJavaThreadPriority` Nothing should preempt the Minecraft threads. GC and Compiler threads can wait.
- `-XX:AllocatePrefetchStyle=3` Generate one prefetch instruction per cache line. More aggressive prefetching is generally useful on newer CPUs with large caches.
- `-XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages` Enables [Large Pages](https://kstefanj.github.io/2021/05/19/large-pages-and-java.html).
- `-XX:+EagerJVMCI` Eagers the JVMCI Compiler provided by GraalVM.
- `-Dgraal.TuneInlinerExploration=1 -Dgraal.LoopRotation=true -Dgraal.OptWriteMotion=true -Dgraal.CompilerConfiguration=enterprise` Generic GraalVM flags.

Sources
======

- Updated Aikar flags: https://github.com/etil2jz/etil-minecraft-flags
- Red Hat's optimization guide: https://www.redhat.com/en/blog/optimizing-rhel-8-run-java-implementation-minecraft-server
- BruceTheMoose's Java flags benchmarks: https://github.com/brucethemoose/Minecraft-Performance-Flags-Benchmarks
