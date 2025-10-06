-- Subconsultas e CTEs (Common Table Expressions)


-- CTE
-- Funcionários com salário maior do que 21900
WITH funcionarios_salarios_mais_altos AS (
	SELECT nome, salario
	FROM cap03.funcionarios
	WHERE salario > 21900
)
SELECT * FROM funcionarios_salarios_mais_altos;


-- Funcionários com salário maior do que 21900 contratados no dia 10
WITH funcionarios_salarios_mais_altos AS (
	SELECT nome, salario, data_contratacao
	FROM cap03.funcionarios
)
SELECT * FROM funcionarios_salarios_mais_altos 
WHERE EXTRACT(DAY FROM data_contratacao) = 10;


-- Sem CTE
SELECT nome, salario FROM cap03.funcionarios 
WHERE salario > 21900;



-- SUBCONSULTA
-- Considerando os funcionários contratados no mês de fevereiro, retorne nome e departamento de quem tem o maior salário
SELECT nome, departamento, salario
FROM cap03.funcionarios 
WHERE salario = (SELECT MAX(salario) FROM cap03.funcionarios WHERE EXTRACT(MONTH FROM data_contratacao) = 2)


-- Sem subconsulta (resultado muito granular/muito detalhado)
SELECT nome, departamento, MAX(salario)
FROM cap03.funcionarios
WHERE EXTRACT(MONTH FROM data_contratacao) = 2
GROUP BY nome, departamento;




















