-- DDL (Data Definition Language)
-- CREATE, ALTER, DROP


-- Criando o SCHEMA
CREATE SCHEMA cap03 AUTHORIZATION dsa;


-- Criação de tabelas
CREATE TABLE cap03.funcionarios (
	id_funcionarios SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	departamento VARCHAR(50),
	salario DECIMAL(10, 2)
);



