FROM	debian:buster

RUN		apt-get update -y && \
		apt-get upgrade -y && \
		apt-get -y install \
		mariadb-server \
		mariadb-client \
		procps

COPY	./tools/mariadb_setup.sh /tmp/mariadb_setup.sh
COPY	./tools/healthcheck.sh /tmp/healthcheck.sh
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT ["sh", "/tmp/mariadb_setup.sh"]

HEALTHCHECK --interval=5s --timeout=5s --start-period=1s --retries=5 \
CMD [ "sh", "/tmp/healthcheck.sh" ]
# expose 필요없다 로컬이랑 연결하는 포트다. 다만, 사용자에게 정보를 알려주는 용도로도 남겨놓기도함.
EXPOSE 3306 