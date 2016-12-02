FROM nginx:1.11.6-alpine

ENV VHOST="example.com"
COPY nginx.conf /etc/nginx/nginx.conf
RUN sed -i 's/VHOST/'$VHOST'/' /etc/nginx/nginx.conf
