FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

# install common packages
RUN apt-get update && apt-get install -y curl

# install postgresql 9.3 from postgresql.org repository as well as requirements for building wal-e
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -sk https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get install -yq \
                                      curl \
                                      daemontools \
                                      file \
                                      gcc \
                                      git \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      lzop \
                                      postgresql-9.3 \
                                      pv \
                                      python-dev

RUN /etc/init.d/postgresql stop

# install pip
RUN curl -sSL https://raw.githubusercontent.com/pypa/pip/1.5.6/contrib/get-pip.py | python -

ADD postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
ADD pg_hba.conf /etc/postgresql/9.3/main/pg_hba.conf
ADD boot /bin/boot
