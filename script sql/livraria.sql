create database livraria;
use livraria;
-- 8 autores, 8 editoras e 20 livros

create table editora(
id_editora int primary key auto_increment,
nome varchar(100) not null,
cnpj varchar(14) not null unique,
estados char(2) not null
);
create table autor(
id_autor int primary key auto_increment,
nome varchar(100) not null,
email varchar(150) not null unique,
telefone char(11) not null unique,
cidade varchar(40) not null
);
create table livro(
id_livro int primary key auto_increment,
titulo varchar(150) not null,
descricao text,
edicao varchar(10),
paginas int not null,
isbn varchar(45) not null unique,
id_autor int not null,
id_editora int not null,
constraint foreign key(id_autor) references autor(id_autor),
constraint foreign key(id_editora) references editora(id_editora)
);

insert into autor values (default, "Alice Oseman", "aliceoseman@gmail.com", "11987654321", "São Paulo");
insert into autor values (default, "J.K. Rowling", "j.krowling@gmail.com", "21912345678", "Rio de Janeiro");
insert into autor values (default, "Neil Gaiman", "neilgaiman@gmail.com", "31998765432", "Belo Horizonte");
insert into autor values (default, "Elayne Baeta", "elaynebaeta@gmail.com", "41987123456", "Curitiba");
insert into autor values (default, "Scott Cawthon", "scottcawthon@gmail.com", "51999876543", "Porto Alegre");
insert into autor values (default, "Raphael Montes", "rafhaelmontes@gmail.com", "61912346789", "Brasília");
insert into autor values (default, "Jason Rekulak", "jasonrekulak@gmail.com", "71998761234", "Salvador");
insert into autor values (default, "Deya Muniz", "deyamuniz@gmail.com", "81987650987", "Recife");
select * from autor;

insert into editora values (default, "Hachette Children's Group", "00000000000100", "SP");
insert into editora values (default, "Bloomsbury Publishing", "00000000000200", "RJ");
insert into editora values (default, "HarperCollins", "00000000000300", "MG");
insert into editora values (default, "Galera Record", "00000000000400", "PR");
insert into editora values (default, "Scholastic", "00000000000500", "RS");
insert into editora values (default, "Companhia das Letras", "00000000000600", "DF");
insert into editora values (default, "Flatiron Books", "00000000000700", "BA");
insert into editora values (default, "Little, Brown Ink", "00000000000800", "PE");
select * from editora;

insert into livro value (default, "Harry Potter e a Pedra Filosofal", "É legal!", "sla", 312, "9781781103685", 2, 5);
insert into livro value (default, "Harry Potter e a Câmara Secreta", "É legal!", "sla", 354, "9781781103692", 2, 5);
insert into livro value (default, "Harry Potter e o Prisioneiro de Azkaban", "È legal!", "sla", 448, "9788532512062", 2, 5);
insert into livro value (default, "Harry Potter e o Cálice de Fogo", "È legal!", "sla", 753, "9781781103715", 2, 5);
insert into livro value (default, "Harry Potter e a Ordem da Fênix", "È legal!", "sla", 987, "9781781104040", 2, 5);
insert into livro value (default, "Harry Potter e o Enigma do Príncipe", "È legal!", "sla", 651, "9788532519474", 2, 5);
insert into livro value (default, "Harry Potter e as Relíquias da Morte", "È legal!", "sla", 754, "9788532522610", 2, 5);
insert into livro value (default, "Coraline", "È legal!", "sla", 224, "8551006754", 3, 6);
insert into livro value (default, "O Livro do Cemitério", "È legal!", "sla", 336, "655532063X", 3, 6);
insert into livro value (default, "Heartstopper", "È legal!", "sla", 228, "9788555341618", 1, 1);
insert into livro value (default, "Heartstopper 2", "È legal!", "sla", 320, "8555341620", 1, 1);
insert into livro value (default, "Heartstopper 3", "È legal!", "sla", 384, "9788555341922", 1, 1);
insert into livro value (default, "Heartstopper 4", "È legal!", "sla", 384, "8555342066", 1, 1);
insert into livro value (default, "Heartstopper 5", "È legal!", "sla", 336, "8555342945", 1, 1);
insert into livro value (default, "O Vilarejo", "È legal!", "sla", 96, "8581053041", 6, 3);
insert into livro value (default, "O Amor Não é Óbvio", "È legal!", "sla", 392, "8501118265", 4, 2);
insert into livro value (default, "Coisas Óbvias Sobre o Amor", "È legal!", "sla", 644, "6559810119", 4, 2);
insert into livro value (default, "Oxe, baby", "È legal!", "sla", 224, "6559810429", 4, 2);
insert into livro value (default, "Desenhos Ocultos", "È legal!", "sla", 384, "655560462X", 7, 8);
select * from livro;

show tables;

-- DICA DE OURO = select nome_tabela.nome_coluna



