ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}
ARG TARGETARCH

COPY src/install.sh install.sh
RUN sh install.sh && rm install.sh

ENV POSTGRES_DATABASE ''
ENV POSTGRES_HOST ''
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER ''
ENV POSTGRES_PASSWORD ''
ENV PGDUMP_EXTRA_OPTS ''
ENV S3_ACCESS_KEY_ID ''
ENV S3_SECRET_ACCESS_KEY ''
ENV S3_BUCKET ''
ENV S3_REGION 'us-west-1'
ENV S3_PATH 'backup'
ENV S3_ENDPOINT ''
ENV S3_S3V4 'no'
ENV SCHEDULE ''
ENV PASSPHRASE ''
ENV BACKUP_KEEP_DAYS ''

COPY src/env.sh /usr/local/bin/env.sh
COPY src/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
COPY src/backup.sh /usr/local/bin/backup.sh
RUN chmod +x /usr/local/bin/backup.sh
COPY src/restore.sh /usr/local/bin/restore.sh
RUN chmod +x /usr/local/bin/restore.sh

CMD ["run.sh"]