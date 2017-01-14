server {
  server_name blog.teen-quotes.com;
  listen 80;
  listen 443 ssl;

  if ($scheme = http) {
    return 301 https://$server_name$request_uri;
  }

  ssl_certificate /etc/nginx/ssl/blog.teen-quotes.com.crt;
  ssl_certificate_key /etc/nginx/ssl/blog.teen-quotes.com.key;

  root /var/www/blog;
  index index.php;
  try_files $uri $uri/ /index.php;

  include sites-available/includes/php-config;
}
