-- Auditoria


-- Criando tabela
CREATE TABLE cap04.historico_salario (
	id_funcionario INT,	
	salario_antigo DECIMAL(10, 2),
	data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Criando a function
CREATE OR REPLACE FUNCTION cap04.salva_salario_antigo()
RETURNS TRIGGER AS $$
BEGIN
	-- Insere o salário antigo na tabela historico_salarios
	IF OLD.salario IS DISTINCT FROM NEW.salario THEN
		INSERT INTO cap04.historico_salario(id_funcionario, salario_antigo)
		VALUES (OLD.id_funcionario, OLD.salario);
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Criando a trigger
CREATE TRIGGER trg_salva_salario_antigo
BEFORE UPDATE ON cap04.funcionarios
FOR EACH ROW EXECUTE FUNCTION cap04.salva_salario_antigo();


-- Atualização de dados
UPDATE cap04.funcionarios
SET salario = 36500.00
WHERE nome = 'Machado de Assis';


-- Testando
SELECT * FROM cap04.historico_salario;
