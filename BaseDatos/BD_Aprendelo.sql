--Verificando la existencia de la Base a crear
if db_id('bd_aprendelo') IS NOT NULL
	BEGIN
		USE master
		DROP DATABASE bd_aprendelo
	END	
GO
--Creando la Base de datos 
CREATE DATABASE bd_aprendelo
USE bd_aprendelo
GO

--///////////////////////////////////////////////////////////////
CREATE TABLE NOA(

);

--///////////////////////////////////////////////////////////////




--///////////////////////////////////////////////////////////////




--///////////////////////////////////////////////////////////////