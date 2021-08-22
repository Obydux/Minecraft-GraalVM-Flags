These are some ZGC flags I put together with the help of [this](https://krusic22.com/2020/03/25/higher-performance-crafting-using-jdk11-and-zgc/) blogpost<br/>
Note that these flags require you to have Java 14+ if you're on Windows or MacOS and Java 13+ if you're on Linux though I would always suggest you to use the last Java version available

# Stable flags

-Xms4G -Xmx4G -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:-UseParallelOldGC -XX:+PerfDisableSharedMem -XX:+UseZGC -XX:-ZUncommit -XX:ZUncommitDelay=300 -XX:ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -XX:+AlwaysPreTouch -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+ParallelRefProcEnabled

# Experimental flags

-Xms4G -Xmx4G -XX:+IgnoreUnrecognizedVMOptions -XX:+UnlockExperimentalVMOptions -XX:+UnlockDiagnosticVMOptions -XX:-OmitStackTraceInFastThrow -XX:+ShowCodeDetailsInExceptionMessages -XX:+DisableExplicitGC -XX:-UseParallelGC -XX:-UseParallelOldGC -XX:+PerfDisableSharedMem -XX:+UseZGC -XX:-ZUncommit -XX:ZUncommitDelay=300 -XX:ZCollectionInterval=5 -XX:ZAllocationSpikeTolerance=2.0 -XX:+ExitOnOutOfMemoryError -XX:+AlwaysPreTouch -XX:-DontCompileHugeMethods -XX:+TrustFinalNonStaticFields -XX:+UseFastUnorderedTimeStamps -XX:+UseTransparentHugePages -XX:LargePageSizeInBytes=2M -XX:+UseLargePages -XX:+UseCMoveUnconditionally -XX:+UseNewLongLShift -XX:+UseVectorCmov -XX:+UseXmmI2D -XX:+UseXmmI2F -XX:+ParallelRefProcEnabled

# Explaining some of these flags 

-Xms matching -Xmx – You should never run your server with the case that -Xmx can run the system completely out of memory. Your server should always be expected to use the entire -Xmx,
+UnlockExperimentalVMOptions – Unlocks experimental flags/options,
+DisableExplicitGC – Disables System.gc() calls from code, you really don’t want people playing around with your GC,
-UseParallelGC – Disables Parallel GC, this should already be disabled, but we set this just to be sure,
-UseParallelOldGC – ^ but disables ParalledOld GC,
-UseG1GC – ^ but disables G1GC,
+UseZGC – Enables ZGC,
+AlwaysPreTouch – AlwaysPreTouch gets the memory setup and reserved at process start ensuring it is contiguous, improving the efficiency of it more. This improves the operating systems memory access speed. Mandatory to use Transparent Huge Pages,
+ParallelRefProcEnabled – Optimizes the GC process to use multiple threads for weak reference checking,
+PerfDisableSharedMem – Causes GC to write to file system which can cause major latency if disk IO is high.


