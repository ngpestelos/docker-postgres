#!/bin/bash

sudo -i -u postgres /usr/lib/postgresql/9.3/bin/postgres \
                    -c config-file=/etc/postgresql/9.3/main/postgresql.conf \
                    -c listen-addresses=* &

wait
