-- STORED PROCEDURE


-- SP que retorna o salário de cada funcionário com aumento de 5%
CREATE OR REPLACE PROCEDURE cap04.aumenta_salario()
LANGUAGE plpgsql
AS $$
DECLARE
	cur CURSOR FOR SELECT id_funcionario, nome, salario, salario * 1.05 AS novo_salario FROM cap04.funcionarios;
BEGIN
	FOR record IN cur LOOP
		RAISE NOTICE 'Funcionario: %, Salario Atual: %, Novo Salario: %',
					  record.nome, record.salario, record.novo_salario;
	END LOOP;
END;
$$;


-- Executando a Stored Procedure
CALL cap04.aumenta_salario()
