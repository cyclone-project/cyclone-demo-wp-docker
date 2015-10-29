#currently not used, since the env variables of the official mysql image are sufficient to configure wp-mysql connection
FROM mysql

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
