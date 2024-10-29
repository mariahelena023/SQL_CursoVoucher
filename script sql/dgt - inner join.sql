use dgt;

select * from cargo;
select * from funcionario;
select * from departamento;

-- departamento com cargo
select departamento.nome,cargo.nome
from cargo inner join departamento
on cargo.id_departamento = departamento.id_departamento;

-- cargo com funcionário
-- NÃO RELACIONEI FUNCIONÁRIO COM CARGOS

-- funcionário com departamento
-- NÃO RELACIONEI FUNCIONÁRIO COM DEPARTAMENTO

-- funcionario com cargo e com departamento
select departamento.nome,cargo.nome
from cargo inner join departamento
on cargo.id_departamento = departamento.id_departamento;
-- SÓ DEU PARA FAZER A PRIMEIRA PARTE, POIS NÃO RELACIONEI DEPARTAMENTO COM FUNCIONÁRIO NEM COM CARGO