server {
    server_name admin.teen-quotes.com;
    listen 80;

    include sites-available/includes/laravel;
    
    include sites-available/includes/php-config;

    include sites-available/includes/localhost-only;
    
    access_log /var/www/website/app/storage/logs/admin.access.log;
    error_log /var/www/website/app/storage/logs/admin.error.log;
}