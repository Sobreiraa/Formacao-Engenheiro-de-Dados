-- Exercícios


-- 01. Crie uma view que mostre o nome do funcionário, o nome do projeto e o departamento
CREATE OR REPLACE VIEW cap04.vw_detalhes_funcionarios AS 
	SELECT 
		f.nome,
		p.nome_projeto,
		f.departamento
	FROM 
		cap04.funcionarios f
	INNER JOIN
		cap04.projetos p
	ON f.id_funcionario = p.func_id;

SELECT * FROM cap04.vw_detalhes_funcionarios;


-- 2. Crie outra view que mostre apenas funcionários com salário acima de 5000.
CREATE OR REPLACE VIEW cap04.vw_funcionarios_salario AS
	SELECT 
		nome,
		salario
	FROM 
		cap04.funcionarios
	WHERE 
		salario > 5000;

SELECT * FROM cap04.vw_funcionarios_salario;

-- 3. Crie uma view materializada que mostre o total de projetos por departamento.
CREATE MATERIALIZED VIEW cap04.vm_total_projetos_departamento AS
	SELECT 
		f.departamento, 
		COUNT(id_projeto)
	FROM 
		cap04.funcionarios f
	INNER JOIN 
		cap04.projetos p
	ON 
		f.id_funcionario = p.func_id
	GROUP BY 
		f.departamento;


SELECT * FROM cap04.vm_total_projetos_departamento;


-- 4. Faça um teste de REFRESH MATERIALIZED VIEW após inserir um novo projeto.
INSERT INTO cap04.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario) 
VALUES (1, 'Sobreira', 'Desenvolvimento', '2025-01-05', 12000.00);

INSERT INTO cap04.projetos (id_projeto, nome_projeto, func_id)
VALUES (12, 'Teste', 1);


-- MATERIALIZED VIEW sem o refresh;
SELECT * FROM cap04.vm_total_projetos_departamento;


-- REFRESH
REFRESH MATERIALIZED VIEW cap04.vm_total_projetos_departamento;


-- MATERIALIZED VIEW com refresh;
SELECT * FROM cap04.vm_total_projetos_departamento;


-- 5. Crie uma stored procedure que receba o nome do funcionário e um percentual de aumento, e atualize o salário dele.
CREATE OR REPLACE PROCEDURE cap04.aumenta_salario(
	p_nome TEXT,
	p_percentual_aumento NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
	salario_com_aumento NUMERIC;
BEGIN
	-- Pega o salário atual
	SELECT salario INTO salario_com_aumento 
	FROM cap04.funcionarios 
	WHERE nome = p_nome;

	-- Cálcula o aumento
	salario_com_aumento := (salario_com_aumento * p_percentual_aumento / 100) + salario_com_aumento;

	-- Atualiza o novo salário
	UPDATE cap04.funcionarios
	SET salario = salario_com_aumento
	WHERE nome = p_nome;
END;
$$;


CALL cap04.aumenta_salario('Sobreira', 10::NUMERIC);


-- 6. Inclua dentro da PROCEDURE um COMMIT e ROLLBACK (ex: rollback se o funcionário não existir).
CREATE OR REPLACE PROCEDURE cap04.aumenta_salario(
	p_nome TEXT,
	p_percentual_aumento NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
	salario_com_aumento NUMERIC;
BEGIN
	-- Pega o salário atual
	SELECT salario INTO salario_com_aumento 
	FROM cap04.funcionarios 
	WHERE nome = p_nome;
		
	-- Se não encontrar o funcionário, faça o Rollback
	IF salario_com_aumento IS NULL THEN
		RAISE NOTICE 'Funcionário % não encontrado', p_nome;
		ROLLBACK;
		RETURN;
	END IF;
	
	-- Cálcula o aumento
	salario_com_aumento := (salario_com_aumento * p_percentual_aumento / 100) + salario_com_aumento;
	
	-- Atualiza o novo salário
	UPDATE cap04.funcionarios
	SET salario = salario_com_aumento
	WHERE nome = p_nome;

	-- Commit
	COMMIT;
	RAISE NOTICE 'Salário de % atualizado para %', p_nome, salario_com_aumento;
END;
$$;


CALL cap04.aumenta_salario('Sobreira', 15::NUMERIC); -- Funcionário existe;
CALL cap04.aumenta_salario('Teste', 15::NUMERIC); -- Funcionário não existe;



	



	