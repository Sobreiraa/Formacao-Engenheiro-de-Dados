 -- VIEW
 -- Funcionários com salário acima do salário médio dos departamentos
 CREATE OR REPLACE VIEW cap04.vw_detalhes_funcionarios AS(
 WITH salario_departamento AS (
	SELECT departamento, ROUND(AVG(salario), 2) AS salario_medio
	FROM cap03.funcionarios
	GROUP BY departamento
 )
 SELECT 
 	f.id_funcionario,
	f.nome,
	f.departamento,
	f.data_contratacao,
	f.salario
FROM 
	cap04.funcionarios f
INNER JOIN
	salario_departamento sd ON f.departamento = sd.departamento
WHERE f.salario > sd.salario_medio
)


-- Visualização dos dados pela VIEW
SELECT * FROM cap04.vw_detalhes_funcionarios;


-- View para retornar funcionários alocados em projetos
CREATE VIEW cap04.vw_funcionarios_projetos AS 
WITH funcionarios_projetos AS (
	SELECT 
		f.id_funcionario,
		f.nome AS nome_funcionario,
		f.departamento,
		f.salario,
		COALESCE(p.id_projeto, 0) AS id_projeto,
		COALESCE(p.nome_projeto, 'NA') AS nome_projeto
	FROM 
		cap04.funcionarios f
	LEFT JOIN
		cap04.projetos p ON f.id_funcionario = p.func_id
)
SELECT * FROM funcionarios_projetos;


-- Visualizando os dados da VIEW
SELECT * FROM cap04.vw_funcionarios_projetos;


-- MATERIALIZED VIEW
-- View para retornar funcionários alocados em projetos
CREATE MATERIALIZED VIEW cap04.mv_funcionarios_projetos AS 
WITH funcionarios_projetos AS (
	SELECT 
		f.id_funcionario,
		f.nome AS nome_funcionario,
		f.departamento,
		f.salario,
		COALESCE(p.id_projeto, 0) AS id_projeto,
		COALESCE(p.nome_projeto, 'NA') AS nome_projeto
	FROM 
		cap04.funcionarios f
	LEFT JOIN
		cap04.projetos p ON f.id_funcionario = p.func_id
)
SELECT * FROM funcionarios_projetos;


-- Visualizando os dados da view materializada
SELECT * FROM cap04.mv_funcionarios_projetos;


-- Diferença entre a VIEW para VIEW MATERIALIZED
EXPLAIN SELECT * FROM cap04.vw_funcionarios_projetos; -- VIEW
EXPLAIN SELECT * FROM cap04.mv_funcionarios_projetos; -- MATERIALIZED VIEW


-- Atualizando a MATERIALIZED VIEW
-- REFRESH
REFRESH MATERIALIZED VIEW cap04.mv_funcionarios_projetos;










