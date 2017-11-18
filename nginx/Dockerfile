FROM tutum/nginx
#RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/nginx.conf
ADD sites-available/nginx.conf /etc/nginx/
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80