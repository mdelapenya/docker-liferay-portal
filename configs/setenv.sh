JVM_TUNING_MEMORY=${JVM_TUNING_MEMORY:-2048m}

CATALINA_OPTS="$CATALINA_OPTS -server -Dfile.encoding=UTF8 -Xms${JVM_TUNING_MEMORY} -Xmx${JVM_TUNING_MEMORY} -XX:MaxPermSize=512m -XX:NewSize=200m -XX:MaxNewSize=200m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:SurvivorRatio=20 -XX:ParallelGCThreads=2 -Djava.net.preferIPv4Stack=true"

if [ ! -z $DEBUG_MODE ] ; then
    DEBUG="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=9000"

    CATALINA_OPTS="${CATALINA_OPTS} ${DEBUG}"
fi
