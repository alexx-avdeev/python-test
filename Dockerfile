FROM centos/systemd

RUN yum -y -q -e 0 update
RUN yum -y -q -e 0 groupinstall "Development Tools"
RUN yum -y -q -e 0 install openssl-devel bzip2-devel libffi-devel wget

RUN wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz >/dev/null && \
    tar xf Python-3.8.3.tgz && \
    cd Python-3.8* && \
    ./configure --enable-optimizations && \
    make altinstall && \
    yum clean all

COPY server.py /usr/local/bin/server
RUN chmod +x /usr/local/bin/server
RUN pip3.8 install aiohttp

COPY python-test.service /etc/systemd/system/python-test.service
RUN systemctl enable python-test.service

EXPOSE 8080

CMD ["/usr/sbin/init"]
