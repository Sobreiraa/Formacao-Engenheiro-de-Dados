WITH funcionarios_projetos AS (
	SELECT
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
SELECT * 
FROM funcionarios_projetos
WHERE salario > 2000;


-- Criando INDEX
CREATE INDEX idx_funcionarios_id ON cap04.funcionarios (id_funcionario);
CREATE INDEX indx_salario ON cap04.funcionarios (salario);


-- Excluindo o INDEX
DROP INDEX cap04.idx_funcionarios_id;




