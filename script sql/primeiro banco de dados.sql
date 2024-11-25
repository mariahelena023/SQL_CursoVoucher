use primeiro_bd;

create table funcionario(
id int,
nome varchar (100),
fone varchar (20),
ano int default 2023 /*default é usado para preenchimento automático de uma informação caso ela seja nula*/
);
drop table funcionario;

create table pessoa1(
id int not null,
nome varchar (255) not null ,
sobrenome varchar (255) not null,
idade int
);

create table pessoa2(
id int unique,
nome char (20),
idade int
);

create table pessoa4(
id int primary key,
nome char (20),
idade int
);

/*outra forma de definir chave primária
create table pessoa4(
id int,
nome char (20),
idade int,
constaint primary key (id)
);*/
