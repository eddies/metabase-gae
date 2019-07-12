# Dockerfile for Metabase on Google App Engine
#   https://github.com/metabase/metabase/issues/3983
#

FROM gcr.io/google-appengine/openjdk:8

# Set locale to UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Add Metabase jar
ADD http://downloads.metabase.com/v0.28.1/metabase.jar ./metabase.jar


# Google Cloud SQL support
ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 ./cloud_sql_proxy
RUN chmod +x ./cloud_sql_proxy

# Expose our default runtime port
EXPOSE 8080

# run it (Calling cloud_sql_proxy allows metabase to connect to our DB instances)
CMD ./cloud_sql_proxy -instances=${CLOUD_SQL_INSTANCE}=tcp:${MB_DB_PORT} & ./cloud_sql_proxy -instances=${CLOUD_SQL_REPLICA_INSTANCE}=tcp:${REPLICA_PORT} & (java -jar metabase.jar migrate release-locks && java -jar ./metabase.jar)

