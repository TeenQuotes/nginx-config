server {
  server_name teen-quotes.com www.teen-quotes.com;
  listen 80;
  listen 443 ssl;

  ssl_certificate /etc/nginx/ssl/teen-quotes.com.crt;
  ssl_certificate_key /etc/nginx/ssl/teen-quotes.com.key;

  include sites-available/includes/laravel;
  include sites-available/includes/php-config;

  access_log /var/www/website/app/storage/logs/website.access.log;
  error_log /var/www/website/app/storage/logs/website.error.log;
}
