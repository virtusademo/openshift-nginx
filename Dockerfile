FROM registry.access.redhat.com/rhel7
  
-ENV NGINX_VERSION 1.13.3-1.el7
+ENV NGINX_VERSION 1.13.4-1.el7
  
LABEL name="nginxinc/nginx" \
        maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>" \
 @@ -32,8 +32,9 @@ RUN REPOLIST=rhel-7-server-rpms,rhel-7-server-optional-rpms,nginx \
  # forward request and error logs to docker log collector
 RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
     ln -sf /dev/stderr /var/log/nginx/error.log && \
 -# change pid file location & port to 8080
 +# Change pid file location & remove nginx user & change port to 8080
      sed -i 's/\/var\/run\/nginx.pid/\/var\/cache\/nginx\/nginx.pid/g' /etc/nginx/nginx.conf && \
 +    sed -i -e '/user/!b' -e '/nginx/!b' -e '/nginx/d' /etc/nginx/nginx.conf && \
      sed -i -e '/listen/!b' -e '/80;/!b' -e 's/80;/8080;/' /etc/nginx/conf.d/default.conf && \
  # modify perms for non-root runtime
      chown -R 998 /var/cache/nginx /etc/nginx && \
