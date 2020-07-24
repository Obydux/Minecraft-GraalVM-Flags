# Startup script's requirements and information:


  openj9-java13+.sh - [OpenJ9](https://www.eclipse.org/openj9/) with Java 13+  (Uses ZGC)

  java-13+.sh - Java 13+ (Uses ZGC)

  openj9.sh - [OpenJ9](https://www.eclipse.org/openj9/) with Java 8+ (Uses G1GC)

  java8+.sh - Java 8+ (Uses G1GC)


If you're using a VPS and have OpenJ9 on your machine, add -Xtune:virtualized flag before -jar.

