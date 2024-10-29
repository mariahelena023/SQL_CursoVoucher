create database netflix;
use netflix;

create table usuario(
id_usuario int primary key auto_increment,
cpf char(11) not null unique,
nome_usuario varchar(100) not null,
email varchar (100) not null unique,
senha varchar(50) not null
);

create table serie(
id_serie int primary key auto_increment,
nome_serie varchar(100) not null,
sinopse varchar(100) not null,
temporadas smallint
);

create table play(
id_play int primary key auto_increment,
data_play date,
id_usuario int not null,
id_serie int not null,
constraint foreign key(id_usuario) references usuario(id_usuario),
constraint foreign key(id_serie) references serie(id_serie)
);

insert into usuario value (default, "00000000001", "Ana Clara", "ana.clara@example.com", "123");
insert into usuario value (default, "00000000002", "João Pedro", "joao.pedro@example.com", "123");
insert into usuario value (default, "00000000003", "Maria Eduarda", "maria.eduarda@example.com", "123");
insert into usuario value (default, "00000000004", "Pedro Henrique", "pedro.henrique@example.com", "123");
insert into usuario value (default, "00000000005", "Laura Beatriz", "laura.beatri@example.com", "123");
insert into usuario value (default, "00000000006", "Carlos Eduardo", "carlos.eduardo@example.com", "123");
insert into usuario value (default, "00000000007", "Sofia Helena", "sofia.helena@example.com", "123");
insert into usuario value (default, "00000000008", "Luiz Felipe", "luiz.felipe@example.com", "123");
insert into usuario value (default, "00000000009", "Júlia Gabriela", "julia.gabriela@example.com", "123");
insert into usuario value (default, "00000000010", "Miguel Ângelo", "miguel.angelo@example.com", "123");
insert into usuario value (default, "00000000011", "Maria Luísa", "maria.luisa@example.com", "123");
insert into usuario value (default, "00000000012", "Jóse Antônio", "jose.antonio@example.com", "123");
insert into usuario value (default, "00000000013", "Ana Júlia", "ana.julia@example.com", "123");
insert into usuario value (default, "00000000014", "João Vitor", "joao.vitor@example.com", "123");
insert into usuario value (default, "00000000015", "Maria Clara", "maria.clara@example.com", "123");
insert into usuario value (default, "00000000016", "Lucas Gabriel", "lucas.gabriel@example.com", "123");
insert into usuario value (default, "00000000017", "Ana Beatriz", "ana.beatriz@example.com", "123");
insert into usuario value (default, "00000000018", "Pedro Lucas", "pedro.lucas@example.com", "123");
insert into usuario value (default, "00000000019", "Maria Fernanda", "maria.fernanda@example.com", "123");
insert into usuario value (default, "00000000020", "Rafael Augusto", "rafael.augusto@example.com", "123");
insert into usuario value (default, "00000000021", "Ana Carolina", "ana.carolina@example.com", "123");
insert into usuario value (default, "00000000022", "João Gabriel", "joao.gabriel@example.com", "123");
insert into usuario value (default, "00000000023", "Maria Cecília", "maria.cecelia@example.com", "123");
insert into usuario value (default, "00000000024", "Henrique Miguel", "henrique.miguel@example.com", "123");
insert into usuario value (default, "00000000025", "Ana Luísa", "ana.luisa@example.com", "123");
select * from usuario;

insert into serie value (default, "Strange Things", "Crianças enfrentam eventos sobrenaturais e conspirações em uma pequena cidade.", 4);
insert into serie value (default, "The Witcher", "Geralt, um caçador de monstros, busca seu lugar em um mundo cheio de perigos.", 3);
insert into serie value (default, "Bridgerton", " Alta sociedade londrina durante a Regência, cheia de amor e escândalos.", 2);
insert into serie value (default, "La Casa de Papel", "Criminosos realizam assaltos meticulosamente planejados na Espanha.", 5);
insert into serie value (default, "The Crow", "Vida da Rainha Elizabeth II e eventos que moldaram seu reinado.", 6);
insert into serie value (default, "Ozark", "Família lava dinheiro para um cartel de drogas nos Ozarks.", 4);
insert into serie value (default, "Black Mirror", "Futuro distópico onde a tecnologia revela os instintos sombrios da humanidade.", 5);
insert into serie value (default, "Narcos", "Ascensão e queda do narcotraficante Pablo Escobar e o cartel de Medellín.", 4);
insert into serie value (default, "The Umbrella Academy", "Super-heróis disfuncionais tentam prevenir um apocalipse.", 4);
insert into serie value (default, "Lucifer", "O Diabo vive em Los Angeles e se torna consultor da polícia.", 6);
select * from serie;

insert into play value (default, "2024-10-25", 1, 10);
insert into play value (default, "2024-10-25", 2, 9);
insert into play value (default, "2024-10-25", 3, 8);
insert into play value (default, "2024-10-25", 4, 7);
insert into play value (default, "2024-10-25", 5, 6);
insert into play value (default, "2024-10-25", 6, 5);
insert into play value (default, "2024-10-25", 7, 4);
insert into play value (default, "2024-10-25", 8, 3);
insert into play value (default, "2024-10-25", 9, 2);
insert into play value (default, "2024-10-25", 10, 1);
insert into play value (default, "2024-10-25", 11, 7);
insert into play value (default, "2024-10-25", 12, 8);
insert into play value (default, "2024-10-25", 13, 2);
insert into play value (default, "2024-10-25", 14, 2);
insert into play value (default, "2024-10-25", 15, 3);
select * from play;

-- selecionar todos usuário que deram play em alguma série
select usuario.nome_usuario, serie.nome_serie, play.data_play
from serie inner join play
on serie.id_serie = play.id_serie
inner join usuario
 on play.id_usuario = usuario.id_usuario;

-- selecionar todas as séries que foram assistidas
select serie.nome_serie, play.data_play
from serie inner join play
on play.id_serie = serie.id_serie;

-- selecionar nome dos usuários e as séries que eles assitiram
select usuario.nome_usuario, serie.nome_serie
from play join usuario 
on play.id_usuario = usuario.id_usuario
join serie 
on play.id_serie = serie.id_serie;
