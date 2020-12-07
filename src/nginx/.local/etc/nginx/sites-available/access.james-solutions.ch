# http
server {
	server_name access.james-solutions.ch;
	listen 80;
	location / {
		#roxy_pass http://localhost:2320;
		return 301 https://$host$request_uri;
	}
	#location /.well-known/acme-challenge {
	#	proxy_pass http://localhost:2320;
	#	#proxy_pass http://lego-ssl.bananalias.xyz;
	#	proxy_set_header Host $http_host;
	#}
}

# https
server {
	server_name access.james-solutions.ch;

	listen 443 ssl;
	ssl_certificate 
		/etc/letsencrypt/live/access.james-solutions.ch/fullchain.pem;
	ssl_certificate_key 
		/etc/letsencrypt/live/access.james-solutions.ch/privkey.pem;

	location / {
		proxy_pass http://localhost:6888;
	}

	location /sock {
		# prod
		proxy_pass http://[fc77::aff1]:6889;
		#proxy_pass http://localhost:6889;
		proxy_http_version 1.1;
		proxy_set_header Host $http_host;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection "upgrade";
		proxy_redirect off;
	}
}

### localhost:6200
##
##
### http
##server {
##	server_name access.james-solutions.ch;
##	listen 80;
##	return 301 https://$host$request_uri;
##}
##
### https
##server {
##	server_name access.james-solutions.ch;
##	listen 443 ssl;
##	ssl_certificate 
##		/etc/letsencrypt/live/access.james-solutions.ch/fullchain.pem;
##	ssl_certificate_key 
##		/etc/letsencrypt/live/access.james-solutions.ch/privkey.pem;
##
##	location /io/rest/houseA/infra {
##		return 200 '{"houseA":{"infra":{"addr":"10.0.1.10:502","air":{"label":"Lüftung","offset":0,"status":"ok"},"email":"arh@mails.ch","label":"Infrastruktur","phone":"","water":{"label":"Schmutzwasserpumpe","offset":2,"status":"ok"}}}}';
##	}
##	location /io/rest/houseB/infra {
##		return 200 '{"houseB":{"infra":{"addr":"10.0.1.20:502","air":{"label":"Lüftung","offset":0,"status":"ok"},"email":"arh@mails.ch","label":"Infrastruktur","phone":"","water":{"label":"Schmutzwasserpumpe","offset":2,"status":"ok"}}}}';
##	}
##	location /io/rest/houseC/infra {
##		return 200 '{"houseC":{"infra":{"addr":"10.0.1.30:502","air":{"label":"Lüftung","offset":0,"status":"ok"},"air-garage":{"label":"Lüftung Garage","offset":3,"status":"ok"},"email":"arh@mails.ch","label":"Infrastruktur","phone":"","water":{"label":"Schmutzwasserpumpe","offset":2,"status":"ok"}}}}';
##	}
##	location /io/rest/houseD/infra {
##		return 200 '{"houseD":{"infra":{"addr":"10.0.1.40:502","air":{"label":"Lüftung","offset":0,"status":"ok"},"email":"arh@mails.ch","label":"Infrastruktur","phone":"079 354 90 52","water":{"label":"Schmutzwasserpumpe","offset":2,"status":"ok"},"water-garage":{"label":"Schmutzwasserpumpe Garage","offset":3,"status":"ok"}}}}';
##	}
##
##	location / {
##		proxy_pass http://localhost:6200;
##		proxy_set_header Host $http_host;
##	}
##
##	location /io/ {
##		# prod
##		proxy_pass http://[fc77::aff1]:6010/;
##		proxy_http_version 1.1;
##		proxy_set_header Host $http_host;
##		proxy_set_header X-Real-IP $remote_addr;
##		proxy_set_header Upgrade $http_upgrade;
##		proxy_set_header Connection "upgrade";
##		proxy_redirect off;
##	}
##}
