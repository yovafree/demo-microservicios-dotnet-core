# Demo Microservicios
## Dockerizando .NET Core API Rest

## **Requisitos**  
Contenedor de la Base de Datos "hr-database:20.0" proporcionado por [Carlos Robles](https://github.com/dbamaster)
    
    docker run --name hr_sql_dev --network=default --hostname hr_sql_dev --publish 1433:1433 --detach crobles10/hr-database:20.0

Correr el siguiente comando con docker para crear el contenedor del servicio:

	docker build demo02:latest .

	docker run -d -p 5000:80 --name demo02 demo02:latest

## Revisión

Ingresar en el navegador web a la ruta:

	http://localhost:5000/api/countries

## Librerías instaladas en el proyecto.

	dotnet add package Microsoft.EntityFrameworkCore.SqlServer
	dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design
	dotnet add package Microsoft.EntityFrameworkCore.Design
	dotnet tool install --global dotnet-aspnet-codegenerator

## Comandos de asp codegenerator para crear controladores basados en modelos para APIs.
	
	dotnet aspnet-codegenerator controller -name RegionesController -actions -api -m Region -dc Contexto -outDir Controllers
