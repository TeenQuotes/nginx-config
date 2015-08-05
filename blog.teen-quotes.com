server {
    listen 80;
    listen [::]:80 ipv6only=on;
    listen 443 ssl;

    server_name blog.teen-quotes.com;
    root /var/www/blog;
        
    index index.php;
    try_files $uri $uri/ /index.php;

    ssl_certificate /etc/nginx/ssl/blog.teen-quotes.com.crt;
    ssl_certificate_key /etc/nginx/ssl/blog.teen-quotes.com.key;

    if ($scheme = http) {
       return 301 https://$server_name$request_uri;
    }
            
    include sites-available/includes/php-config;
}
