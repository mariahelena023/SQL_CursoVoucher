create database rs;
use rs;

create table categoria(
id_categoria int primary key auto_increment,
descricao varchar(100) not null
);
create table usuario(
id_usuario int primary key auto_increment,
nome varchar(70) not null,
email varchar(100) not null unique,
senha varchar(45) not null,
avatar varchar(45) not null unique,
genero enum("M", "F") not null
);
create table post(
id_post int primary key auto_increment,
data_post datetime,
texto varchar(100) not null,
midia varchar(100),
id_categoria int not null,
id_usuario int not null,
foreign key (id_categoria) references categoria(id_categoria),
foreign key (id_usuario) references usuario(id_usuario)
);
create table comentario(
id_comentario int primary key auto_increment,
data_comentario datetime,
texto varchar(100) not null,
nome_usuario varchar(45) not null,
id_usuario int not null,
id_post int not null,
foreign key (id_usuario) references usuario(id_usuario),
foreign key (id_post) references post(id_post)
);

insert into usuario value (default, "Ana Clara", "anaclara@example.com", "321", "anaclara_123", "F");
insert into usuario value (default, "João Pedro", "joaopedro@example.com", "321", "joaopedro_123", "M");
insert into usuario value (default, "Maria Eduarda", "mariaeduarda@example.com", "321", "mariaeduarda_123", "F");
insert into usuario value (default, "Pedro Henrique", "pedrohenrique@example.com", "321", "pedrohenrique_123", "M");
insert into usuario value (default, "Laura Beatriz", "laurabeatriz@example.com", "321", "laurabeatriz_123", "F");
insert into usuario value (default, "Miguel Ângelo", "migeulangelo@example.com", "321", "miguelangelo_123", "M");
insert into usuario value (default, "Sofia Helena", "sofiahelena@example.com", "321", "sofiahelena_123", "F");
insert into usuario value (default, "Lucas Gabriel", "lucasgabriel@example.com", "321", "lucasgabriel_123", "M");
insert into usuario value (default, "Helena Vitória", "helenavitoria@example.com", "321", "helenavitoria_123", "F");
insert into usuario value (default, "Rafael Augusto", "rafaelaugusto@example.com", "321", "rafaelaugusto_123", "M");
select * from usuario;

insert into categoria value (default, "Esporte");
insert into categoria value (default, "Cultura");
insert into categoria value (default, "Culinária");
insert into categoria value (default, "Moda");
insert into categoria value (default, "Jogos");
insert into categoria value (default, "Viagem");
insert into categoria value (default, "Maquiagem");
insert into categoria value (default, "Noticia");
insert into categoria value (default, "Outros");
select * from categoria;

insert into post value (default, "2024-10-28 10:30:00", "Viagem para Suiça, inesquecível!", "Foto de uma praça na Suiça", 6, 3);
insert into post value (default, "2024-10-20 09:00:00", "Almoço muito bom", "Foto do prato de comida", 3, 5);
insert into post value (default, "2024-10-18 18:45:00", "Cansada da escola!!!", "Foto na sala de aula",9, 9);
insert into post value (default, "2024-10-12 23:00:00", "Sempre lindo", "Foto no espelho",9, 7);
insert into post value (default, "2024-10-12 00:00:00", "Booyah, peguei mestre np free fire", "Print da tela",5, 6);
select * from post;

insert into comentario value (default, "2024-10-12 08:20:00", "Usando hack até eu consigo", "pedrohenrique_123", 4, 5);
insert into comentario value (default, "2024-10-28 11:20:00", "Muito bonita a praça, amiga", "mariaeduarda_123", 3, 1);
insert into comentario value (default, "2024-10-12 23:20:00", "Cê tá maluco, muito feio!", "miguelangelo_123", 6, 4);
select * from comentario;

-- relação dos usuários que postaram com os que comentaram nos respectivos posts
select post.id_post, post.id_usuario, comentario.id_usuario
from post join comentario
on post.id_post = comentario.id_post;

-- listar todos os usuários que postaram
select usuario.nome, usuario.avatar, post.id_usuario, post.texto, post.midia, post.data_post
from post inner join usuario 
on post.id_usuario = usuario.id_usuario;

-- lista de todos os usuários que comentaram
select usuario.nome, usuario.avatar, comentario.texto, comentario.data_comentario
from comentario join usuario
on comentario.id_usuario = usuario.id_usuario;

-- listar o nome do usuário que fez um post, o texto do seu post, os usuários que comentaram e seus comentários no referido post
select usuario.nome, usuario.avatar, post.texto, post.midia, comentario.nome_usuario, comentario.texto
from usuario join post
on usuario.id_usuario = post.id_usuario
join comentario
on comentario.id_post = post.id_post;


