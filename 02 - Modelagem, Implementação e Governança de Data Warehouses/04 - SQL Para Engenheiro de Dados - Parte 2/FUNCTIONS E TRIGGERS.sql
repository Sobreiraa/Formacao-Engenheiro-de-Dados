-- FUNCTIONS E TRIGGERS


-- Função que vai verificar se um projeto está sendo cadastrado sem funcionário associado
CREATE OR REPLACE FUNCTION cap04.verifica_funcionario_projeto()
RETURNS TRIGGER AS $$
BEGIN
	-- Verifica se o ID do funcionário associado ao projeto é nulo
	IF NEW.func_id IS NULL THEN
		RAISE EXCEPTION 'Não é permitido inserir um projeto sem um funcionário associado.';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER
CREATE TRIGGER trg_verifica_funcionario_projeto
BEFORE INSERT ON cap04.projetos
FOR EACH ROW EXECUTE FUNCTION cap04.verifica_funcionario_projeto();


-- TESTE
INSERT INTO cap04.projetos (id_projeto, nome_projeto, func_id)
VALUES (6008, 'Pipeline de Integração de Dados', null);