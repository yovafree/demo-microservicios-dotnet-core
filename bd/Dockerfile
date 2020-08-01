FROM postgres:10-alpine
LABEL MAINTEINER="Geovani de Leon <erwingeo1021@gmail.com>"
ENV POSTGRES_PASSWORD=12345678
ENV TZ='America/Guatemala'
ENV PGTZ='America/Guatemala'
ADD ./script_inicial.sql ./docker-entrypoint-initdb.d