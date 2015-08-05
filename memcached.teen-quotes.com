server {
    server_name memcached.teen-quotes.com;
    root /var/www/memcached;
    index index.php;
    
    include sites-available/includes/php-config;

    include sites-available/includes/localhost-only;
}