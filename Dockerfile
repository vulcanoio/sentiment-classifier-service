FROM python:3.5

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.12

WORKDIR /application
COPY application /application

COPY docker-start.sh /
RUN chmod +x /docker-start.sh

EXPOSE 5000 9090 9191
USER uwsgi

CMD ["/docker-start.sh"]
