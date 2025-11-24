FROM prom/prometheus:latest

RUN echo '  - job_name: "minifi"' >> /etc/prometheus/prometheus.yml && \
    echo '    static_configs:' >> /etc/prometheus/prometheus.yml && \
    echo '      - targets: ["cpp-agent:9936"]' >> /etc/prometheus/prometheus.yml && \
    echo '        labels:' >> /etc/prometheus/prometheus.yml && \
    echo '          app: "minifi"' >> /etc/prometheus/prometheus.yml

RUN echo '  - job_name: "minifi-fast"' >> /etc/prometheus/prometheus.yml && \
    echo '    static_configs:' >> /etc/prometheus/prometheus.yml && \
    echo '      - targets: ["cpp-agent-fast-compact:9936"]' >> /etc/prometheus/prometheus.yml && \
    echo '        labels:' >> /etc/prometheus/prometheus.yml && \
    echo '          app: "minifi"' >> /etc/prometheus/prometheus.yml \
