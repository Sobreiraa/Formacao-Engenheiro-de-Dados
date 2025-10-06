-- Função de Agregação
-- Mínimo, Máximo, Média, Soma e Contagem
SELECT MIN(salario), MAX(salario), ROUND(AVG(salario), 2), SUM(salario), COUNT(salario)
FROM cap03.funcionarios;

-- Média salarial geral
SELECT ROUND(AVG(salario), 2) AS media_salario
FROM cap03.funcionarios;


-- Salário por departamento
SELECT departamento, ROUND(AVG(salario), 2) AS media_salario
FROM cap03.funcionarios
GROUP BY departamento;


-- Soma de salário por departamento
SELECT departamento, SUM(salario) AS soma_salario
FROM cap03.funcionarios
GROUP BY departamento
ORDER BY departamento;


-- Média salarial por departamento somente se a média for maior do que 2000, ordenado por departamento
SELECT departamento, ROUND(AVG(salario), 2) AS media_salario
FROM cap03.funcionarios
GROUP BY departamento
HAVING ROUND(AVG(salario), 2 ) > 20000
ORDER BY departamento;


-- Média salarial por departamento somente se a média for maior do que 20000 e somente se o nome do departamento tiver a palavra 'Engenharia'
SELECT departamento, ROUND(AVG(salario), 2) AS media_salario
FROM cap03.funcionarios
WHERE departamento ILIKE '%Engenharia%'
GROUP BY departamento
HAVING ROUND(AVG(salario), 2 ) > 20000
ORDER BY departamento;





























