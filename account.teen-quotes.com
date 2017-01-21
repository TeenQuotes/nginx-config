server {
  server_name account.teen-quotes.com;
  listen 80;
  listen 443 ssl;

  ssl_certificate /etc/nginx/ssl/account.teen-quotes.com.crt;
  ssl_certificate_key /etc/nginx/ssl/account.teen-quotes.com.key;

  return 301 https://teen-quotes.com$request_uri;
}
