sleep 20

chown -R www:www /var/lib/nginx

if [ ! -f /www/wordpress/wp-config.php ];
then
	wp core download --allow-root --path=/var/www/wordpress
	
	cp wp-config.php	/var/www/wordpress/wp-config.php
	envsubst '${WORDPRESS_DB_NAME} ${WORDPRESS_DB_HOST} ${WORDPRESS_DB_USER} ${WORDPRESS_DB_PASSWORD}' < wp-config.php > /var/www/wordpress/wp-config.php
	
	wp core install --allow-root\
		--path=/var/www/wordpress\
		--url=http://192.168.99.100:5050\
		--title=ft_services\
		--admin_user=admin\
		--admin_password=admin\
		--admin_email=admin@admin.com

	wp user create biba biba@example.com --role=author --user_pass=biba --path=/var/www/wordpress --allow-root
	wp user create boba boba@example.com --role=author --user_pass=boba --path=/var/www/wordpress --allow-root

	chown -R www:www /var/www/wordpress

fi

supervisord -c /etc/supervisord.conf
