FROM mysql/mysql-server:8.0

ENV MYSQL_DATABASE=Django_Test \
	MYSQL_USER=root \
	MYSQL_PASSWORD=user_pass \
	MYSQL_ROOT_PASSWORD=root \
	TZ=Asia/Tokyo

COPY ./infra/mysql/my.cnf /etc/my.cnf
RUN chmod 644 /etc/my.cnf
