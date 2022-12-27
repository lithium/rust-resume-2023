from ch20httpd:latest

ENV WWWROOT=/app/wwwroot

ADD ./localhost\:8000/ /app/wwwroot/


