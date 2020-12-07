# localhost:6111


# http
server {
	server_name live.james-solutions.ch;
	listen 80;
	return 301 https://$host$request_uri;
}

# https
server {
	server_name live.james-solutions.ch;
	listen 443 ssl;
	ssl_certificate 
		/etc/letsencrypt/live/live.james-solutions.ch/fullchain.pem;
	ssl_certificate_key 
		/etc/letsencrypt/live/live.james-solutions.ch/privkey.pem;

	location / {
		proxy_pass http://localhost:6111;
		proxy_set_header Host $http_host;
	}
}
