server {
    server_name developers.teen-quotes.com;
    listen 80;
    listen [::]:80;
    listen 443 ssl;
    
    include sites-available/includes/laravel-codex;

    include sites-available/includes/php-config;

    ssl_certificate /etc/nginx/ssl/developers.teen-quotes.com.crt;
    ssl_certificate_key /etc/nginx/ssl/developers.teen-quotes.com.key;

    if ($scheme = http) {
       return 301 https://$server_name$request_uri;
    }

    access_log /var/www/codex/app/storage/logs/website.access.log;
    error_log /var/www/codex/app/storage/logs/website.error.log;
}
