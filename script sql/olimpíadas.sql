create database olimpiadas;
use olimpiadas;

CREATE TABLE atletas (
id int not null auto_increment,
nome varchar(40),
modalidade varchar(40),
idade int,
peso decimal(5,2),
altura decimal(3,2),
medalhas int,
nacionalidade char(3),
constraint primary key (id)
); 

insert into atletas values (default, "Marcelo Huertas","Basquete",28,105,1.90,7,"BRA");
insert into atletas values (default, "Takaro Nomura","Katate",31,79,1.80,17,"JPN");
insert into atletas values (default, "Joseph Augustin","Karate",23,72,1.77,8,"FRA");
insert into atletas values (default, "Sophie Dominique","Volei",23,70,1.79,12,"FRA");
insert into atletas values (default, "Juan Carlos Angel","Volei",26,76,1.88,4,"ARG");
insert into atletas values (default, "Manoel Hernandes","Judo",31,83,1.98,2,"ARG");
insert into atletas values (default, "Amara Zuri","Basquete",32,86,1.95,1,"ZAF");
insert into atletas values (default, "Kornelia Ender","Natação",27,69,1.76,9,"DEU");
insert into atletas values (default, "Oscar Schmidt","Basquete",58,58,2.05,12,"BRA");
insert into atletas values (default, "Natasha Hoffmann","Natação",25,69,1.78,10,"DEU");
insert into atletas values (default, "Maria Fernandes","Handebol",26,75,1.79,11,"ESP");
insert into atletas values (default, "Maria Mendonza","Handebol",29,64,1.68,15,"CUB");
insert into atletas values (default, "Maria Carmen","Handebol",19,65,1.69,3,"ESP");
insert into atletas values (default, "Elijah Philips","Remo",22,66,1.67,7,"USA");
insert into atletas values (default, "Noah Oliver","Natação",30,101,1.98,8,"USA");
insert into atletas values (default, "Mike James","Basquete",24,102,1.99,9,"USA");
insert into atletas values (default, "Francesco Rossi","Basquete",34,100,1.90,11,"ITA");
insert into atletas values (default, "Bohdan Beneys","Atletismo",30,89,1.82,10,"SWE");
insert into atletas values (default, "Arnost Bedrich","Atletismo",21,75,1.83,13,"CZE");
insert into atletas values (default, "Jose Rodriguez","Triatlo",23,88,1.84,1,"VEN");

select * from atletas;

-- selecionar o atleta do id 13
select * from atletas
where id = 13;

-- selecionar os atletas que estão entre o id 5 e 10
select * from atletas
where id >= 5 and id <= 10;

-- selecionar os atletas com idade > 30
select * from atletas
where idade > 30;

-- média de altura do atletas
select avg(altura) from atletas;

-- soma das idades do atletas
select sum(idade) from atletas;

-- atletas que o nome começa com M
select * from atletas
where nome like 'M%';

-- atletas que o nome termina com S
select * from atletas
where nome like '%s';

-- idade mínima dos atletas
select min(idade) from atletas;

-- peso máximo dos atletas
select max(peso) from atletas;

-- atletas da modalidade basquete com nomes em ordem decrescente
select * from atletas
where modalidade = 'Basquete'
order by nome desc;

-- peso, altura e imc dos atletas
select nome, peso, altura, round(peso/(altura * altura), 2) as IMC from atletas;
 
-- atletas com o id 5, 6, 9, 12 e 18
select * from atletas
where id in (5,6,9,12,18);

-- mudar nome e idade
update atletas set nome = 'Thiago Almeida'
where id = 16;
update atletas set idade = 38
where id = 16;

-- deletar um atleta
delete from atletas
where id = 19;

-- atletas com nacionalidade USA
select * from atletas
where nacionalidade = 'USA';

-- adicione uma coluna chamada hobbies e coloque "dormir" em todos
alter table atletas
add hobbies varchar(40);
update atletas set hobbies = 'dormir';

-- total de medalhas de todos os atletas
select sum(medalhas) as total_medalhas from atletas;

select * from atletas;

select count(id), nacionalidade
from atletas
group by nacionalidade
having nacionalidade = "USA";