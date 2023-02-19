FROM mysql/mysql-server:latest

ENV MYSQL_DATABASE=DjangoTest \
	MYSQL_USER=testuser \
	MYSQL_PASSWORD=user_pass \
	MYSQL_ROOT_PASSWORD=root_pass \
	TZ=Asia/Tokyo

COPY ./infra/mysql/my.cnf /etc/my.cnf
RUN chmod 644 /etc/my.cnf