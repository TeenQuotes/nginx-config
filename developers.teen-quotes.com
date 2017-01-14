server {
  server_name developers.teen-quotes.com;
  listen 80;
  listen 443 ssl;

  if ($scheme = http) {
    return 301 https://$server_name$request_uri;
  }

  ssl_certificate /etc/nginx/ssl/developers.teen-quotes.com.crt;
  ssl_certificate_key /etc/nginx/ssl/developers.teen-quotes.com.key;

  include sites-available/includes/laravel-codex;
  include sites-available/includes/php-config;

  access_log /var/www/codex/app/storage/logs/website.access.log;
  error_log /var/www/codex/app/storage/logs/website.error.log;
}
