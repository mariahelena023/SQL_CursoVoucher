create database titanic;
use titanic;

create table passageiros(
id_passenger int primary key,
survived int,
pclass int,
pname varchar(80),
sex enum('female', 'male'),
age varchar(10),
sibsp int,
parch int,
ticket varchar(20) not null,
fare float,
cabin varchar(20),
embarked char(2)
);
select * from passageiros;
describe passageiros;

-- Querys

-- qual é o número do bilhete e o nome do passageiro de id 144?
select ticket, pname from passageiros
where id_passenger = 144;

-- quantas pessoas menores de 18 haviam no navio?
select count(*) as menos_18 from passageiros
where age is not null and age < 18;

-- quantos sobreviveram no navio?
select count(*) as sobreviventes from passageiros
where survived is not null and survived = 1;

-- quantas pessoas morreram no navio?
select count(*) as morreram from passageiros
where survived is not null and survived = 0;

-- o passageiro de id 395 sobreviveu? e o sr. thomas o'brien?
select survived from passageiros
where id_passenger = 395;

select survived from passageiros
where pname = "Thomas O'Brien";

