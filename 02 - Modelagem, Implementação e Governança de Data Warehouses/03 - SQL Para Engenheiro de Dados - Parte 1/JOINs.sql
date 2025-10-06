-- JOINs


-- INNER JOIN 
-- Nome e salário dos funcionários alocados em projetos
SELECT f.nome, f.salario, p.nome_projeto
FROM cap03.funcionarios f
INNER JOIN cap03.projetos p
ON f.id_funcionario = p.func_id;


-- LEFT JOIN
-- Nome e salário de todos os funcionários independente de estarem alocados em projetos
SELECT f.nome, f.salario, COALESCE(p.nome_projeto, 'Não Alocado em Projeto')
FROM cap03.funcionarios f 
LEFT JOIN cap03.projetos p 
ON f.id_funcionario = p.func_id;


-- RIGHT JOIN 
-- Nome e salário de todos os funcionários alocados em projetos e os projetos sem funcionários alocados
SELECT COALESCE(f.nome, 'Sem Responsável'),  p.nome_projeto
FROM cap03.funcionarios f
RIGHT JOIN cap03.projetos p
ON p.func_id = f.id_funcionario;


-- FULL JOIN
-- Nome e salário de todos os funcionários alocados ou não em projetos e todos os projetos com ou sem funcionários
SELECT COALESCE(f.nome, 'Sem Responsável'), 
	   COALESCE(p.nome_projeto, 'Sem projeto')
FROM cap03.funcionarios f
FULL JOIN cap03.projetos p
ON p.func_id = f.id_funcionario;


-- Média de salário dos departamentos com funcionários alocados em projetos
SELECT f.departamento, ROUND(AVG(f.salario), 2) 
FROM cap03.funcionarios f
INNER JOIN cap03.projetos p 
ON p.func_id = f.id_funcionario
GROUP BY f.departamento;


-- Média de salário dos departamentos com funcionários alocados em projeto cuja data do funcionário tenha sido no dia 10 de qualquer mês ou ano
SELECT f.departamento, ROUND(AVG(f.salario), 2) 
FROM cap03.funcionarios f
INNER JOIN cap03.projetos p 
ON p.func_id = f.id_funcionario
WHERE EXTRACT(DAY FROM data_contratacao) = 10
GROUP BY f.departamento;





