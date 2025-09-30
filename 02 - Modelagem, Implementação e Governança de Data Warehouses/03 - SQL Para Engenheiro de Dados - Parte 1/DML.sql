-- DML (Data Manipulation Language)
-- SELECT, INSERT, UPDATE, DELETE


-- Inserção de dados
INSERT INTO cap03.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (100, 'José de Alencar', 'Engenharia de Dados', '2024-01-10', 25000.00);

INSERT INTO cap03.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (101, 'Machado de Assis', 'Data Science', '2024-02-10', 19000.00);

INSERT INTO cap03.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (102, 'Cecília Meireles', 'Engenharia de Dados', '2024-02-11', 22000.00);

INSERT INTO cap03.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (103, 'Carlos Drummond', 'DataOps', '2024-02-12', 23400.00);

INSERT INTO cap03.funcionarios (id_funcionario, nome, departamento, data_contratacao, salario)
VALUES (104, 'Clarice Lispector', 'DataOps', '2024-02-13', 21800.00);


-- Seleção de dados
SELECT * FROM cap03.funcionarios;


-- Aumentando o salário do Machado de Assis
UPDATE cap03.funcionarios 
SET salario = 26000.00
WHERE nome = 'Machado de Assis';


-- Exclusão de dados
DELETE FROM cap03.funcionarios
WHERE nome = 'Machado de Assis';





















