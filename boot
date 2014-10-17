#!/bin/bash

sudo -i -u postgres /usr/lib/postgresql/9.3/bin/postgres \
                    -c config-file=/etc/postgresql/9.3/main/postgresql.conf \
                    -c listen-addresses=* &

# wait for the service to become available
sleep 1 && while [[ -z $(netstat -lnt | awk "\$6 == \"LISTEN\" && \$4 ~ \".5432\" && \$1 ~ \"tcp.?\"") ]] ; do sleep 1; done

sudo -i -u postgres psql postgres <<EOF
UPDATE pg_database SET datistemplate=FALSE WHERE datname='template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH owner=postgres template=template0 encoding='UTF8';
UPDATE pg_database SET datistemplate=TRUE WHERE datname='template1';
EOF

wait
