# Demo Microservicios
## Demo de .NET Core - API Gateway de Microservicios - API + Cliente Web

# Instrucciones

Para correr el proyecto puede realizarlo utilizando docker a través de docker-compose. Ejecute el siguiente comando:

    docker-compose up --build

# Arquitectura

![image info](./img/arquitectura.png)

# Contenedores

Se desplegarán en contenedores cada componente de la arquitectura, los cuales son:

    http://localhost:80 <- Frontend (Angular 8)
    http://localhost:9000/api <- API Gateway (.NET Core 3.0)
    http://localhost:8500 <- Consul (Service Discovery)
    http://localhost:5001/api <- CatalogsAPI (.NET Core 3.0)
    http://localhost:5002/api <- EmployeesAPI (.NET Core 3.0)
    -host: localhost -port: 1433 <- Base de Datos (SQL Server)

# Tarea

El microservicio EmployeesApi realiza operaciones CRUD y está completo. Sin embargo, se debe completar el microservicio CatalogsApi, se incluye únicamente la funcionalidad para:

    Countries
    Departaments

Se debe completar la funcionalidad para obtener:

    Regions
    Locations
    Dependents
    Jobs