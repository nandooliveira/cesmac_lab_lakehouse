FROM eclipse-temurin:21-jre-jammy

# You can override these at build time with --build-arg
ARG METABASE_VERSION=0.58.9
ARG METABASE_DUCKDB_DRIVER_VERSION=1.5.2.0

ENV MB_PLUGINS_DIR=/home/metabase/plugins

RUN groupadd -r metabase && useradd -r -g metabase metabase

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# /home/metabase/data is a convenient mount point for .duckdb/.parquet files
RUN mkdir -p /home/metabase/plugins /home/metabase/data && \
    chown -R metabase:metabase /home/metabase

WORKDIR /home/metabase

RUN curl -fsSL "https://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar" -o /home/metabase/metabase.jar && \
    curl -fsSL "https://github.com/MotherDuck-Open-Source/metabase_duckdb_driver/releases/download/${METABASE_DUCKDB_DRIVER_VERSION}/duckdb.metabase-driver.jar" -o /home/metabase/plugins/duckdb.metabase-driver.jar && \
    chown metabase:metabase /home/metabase/metabase.jar /home/metabase/plugins/duckdb.metabase-driver.jar && \
    chmod 755 /home/metabase/metabase.jar /home/metabase/plugins/duckdb.metabase-driver.jar

EXPOSE 3000

USER metabase

CMD ["java", "-jar", "/home/metabase/metabase.jar"]
