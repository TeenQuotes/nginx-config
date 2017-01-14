server {
  server_name admin.teen-quotes.com;
  listen 80;
  listen 443 ssl;

  ssl_certificate /etc/nginx/ssl/admin.teen-quotes.com.crt;
  ssl_certificate_key /etc/nginx/ssl/admin.teen-quotes.com.key;

  include sites-available/includes/laravel;
  include sites-available/includes/php-config;

  access_log /var/www/website/app/storage/logs/admin.access.log;
  error_log /var/www/website/app/storage/logs/admin.error.log;
}
