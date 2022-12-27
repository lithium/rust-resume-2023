from ch20httpd:latest

ENV PORT=80
ENV WWWROOT=/app/wwwroot

ADD ./localhost\:8000/ /app/wwwroot/

