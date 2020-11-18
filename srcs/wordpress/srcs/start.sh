chown -R www:www /var/lib/nginx
chown -R www:www /www

wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
mv ./wordpress/* /www/
rm latest.tar.gz
rm -rf wordpress
mv wp-config.php /www/

supervisord
