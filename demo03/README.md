# Demo Microservicios
## Demo de .NET Core - API Rest Monolítica con Cliente Web.

# Instrucciones

Para correr el proyecto puede realizarlo utilizando docker a través de docker-compose. Ejecute los siguientes comandos:

    docker-compose up --build

Los servicios se desplegarán en los siguientes puertos:

    http://localhost:90 <- Frontend (Angular 8)
    http://localhost:5000/api <- Backend (.NET Core 3.0)
    -host: localhost -port: 1433 <- Database (SQL Server)
