-- Controle de Transações

-- Início da transação;
BEGIN;

-- Inserindo um novo funcionário
INSERT INTO cap04.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (107, 'Jorge Amado', 'Desenvolvimento', '2024-01-01', 15000.00);

-- Tentativa de inserir um projeto associado ao funcionário
INSERT INTO cap04.projetos (id_projeto, nome_projeto, func_id)
VALUES (777, 'Projeto Alpha', 107);

-- Commit ou Rollback
COMMIT;

-- ROLLBACK; Em caso de erro ou necessidade de desfazer as operações.

