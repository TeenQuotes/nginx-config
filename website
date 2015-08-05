server {
    server_name teen-quotes.com;
    listen 80;
    listen 443 ssl;
    
    # HTTPs to HTTP
    if ($scheme = https) {
       return 301 http://$server_name$request_uri;
    }

    # Don't cache avatars
    location ^~ /var/www/website/public/uploads/avatar/ {
        root /var/www/website/public/uploads/avatar;
        expires epoch;
    }

    include sites-available/includes/laravel;

    include sites-available/includes/php-config;

    access_log /var/www/website/app/storage/logs/website.access.log;
    error_log /var/www/website/app/storage/logs/website.error.log;
}
