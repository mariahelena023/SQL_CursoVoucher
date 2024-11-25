use hubstore;
select * from vendas_data;

create view pedidos_losAngeles as
select id_pedido, data_pedido, categoria, subcategoria, segmento, pais
from vendas_data
where cidade = 'Los Angeles';

select * from pedidos_losAngeles;
drop view pedidos_losAngeles;

use biblioteca;

select aluno.id_aluno, aluno.nome as nome_aluno , aluno.curso,
timestampdiff(day, emprestimo.data_emprestimo, emprestimo.data_devolucao) as dias,
livro.titulo, livro.ano_edicao, autor.nome as nome_autor
from aluno inner join emprestimo
on aluno.id_aluno = emprestimo.id_aluno
inner join livro on livro.id_livro = emprestimo.id_livro
inner join autor on livro.id_autor = autor.id_autor
order by dias desc;

create view vw_relatorio as
select aluno.id_aluno, aluno.nome as nome_aluno , aluno.curso,
timestampdiff(day, emprestimo.data_emprestimo, emprestimo.data_devolucao) as dias,
livro.titulo, livro.ano_edicao, autor.nome as nome_autor
from aluno inner join emprestimo
on aluno.id_aluno = emprestimo.id_aluno
inner join livro on livro.id_livro = emprestimo.id_livro
inner join autor on livro.id_autor = autor.id_autor
order by dias desc;

select * from vw_relatorio;

-- view não pode ter nome que pareçam ser de tabelas verdadeiras, todas devem ter um 'vw' na frente do nome da view