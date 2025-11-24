FROM apache/nifi-minifi-cpp:latest

RUN echo "nifi.c2.enable=true" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.c2.flow.base.url=http://c2:13405/api/flows" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.c2.rest.url=http://c2:13405/api/heartbeat" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.c2.rest.url.ack=http://c2:13405/api/acknowledge" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.c2.agent.class=my_class_cpp" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.c2.agent.identifier=my_id_cpp_fast_compact" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.database.content.repository.rocksdb.compaction.period=10 sec" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.metrics.publisher.class=PrometheusMetricsPublisher" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.metrics.publisher.PrometheusMetricsPublisher.port=9936" >> /opt/minifi/minifi-current/conf/minifi.properties && \
    echo "nifi.metrics.publisher.metrics=AgentStatus" >> /opt/minifi/minifi-current/conf/minifi.properties \
