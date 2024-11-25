create database hub_innovation;
use hub_innovation;

create table palestrante(
id_palestrante int primary key auto_increment,
nome_palestrante varchar(55),
bio_palestrante text,
empresa_palestrante varchar(55),
email_palestrante varchar(50)
);
create table palestra(
id_palestra int primary key auto_increment,
titulo_palestra varchar(50),
descricao text,
sala_palestra int,
horario_palestra time,
vagas_palestra int,
id_palestrante int not null,
constraint foreign key(id_palestrante) references palestrante(id_palestrante)
);
create table usuario(
id_usuario int primary key auto_increment,
nome_usuario varchar(55),
email_usuario varchar(55),
telefone_usuario varchar(20),
data_nascimentoUsuario date,
id_palestra int not null,
constraint foreign key(id_palestra) references palestra(id_palestra)
);

insert into palestrante (nome_palestrante, bio_palestrante, empresa_palestrante, email_palestrante) values
('João Silva', 'Especialista em inteligência artificial com 10 anos de experiência.', 'Tech Innovators', 'joao.silva@tech.com'),
('Maria Oliveira', 'Consultora de inovação e palestrante em eventos internacionais.', 'InnoConsult', 'maria.oliveira@inno.com'),
('Carlos Santos', 'Engenheiro de software com foco em sistemas distribuídos.', 'CodeTech', 'carlos.santos@codetech.com'),
('Ana Costa', 'Fundadora de startup de tecnologia educacional.', 'EduTech', 'ana.costa@edutech.com'),
('Fernanda Lima', 'Especialista em marketing digital e estratégias de branding.', 'MarketPlus', 'fernanda.lima@marketplus.com');
select * from palestrante;

insert into palestra (titulo_palestra, descricao, sala_palestra, horario_palestra, vagas_palestra, id_palestrante) values
('Introdução à Inteligência Artificial', 'Uma palestra sobre os conceitos básicos e aplicações de IA.', 101, '10:00:00', 50, 1),
('Inovação nas Empresas', 'Estratégias para implementar a cultura de inovação.', 102, '11:30:00', 40, 2),
('Sistemas Distribuídos na Prática', 'Abordagem técnica sobre sistemas distribuídos modernos.', 103, '14:00:00', 30, 3),
('Educação e Tecnologia', 'Como a tecnologia está transformando o ensino.', 104, '15:30:00', 35, 4),
('Estratégias de Marketing Digital', 'Principais tendências e ferramentas do marketing digital.', 105, '17:00:00', 45, 5);
select * from palestra;

insert into usuario (nome_usuario, email_usuario, telefone_usuario, data_nascimentoUsuario, id_palestra) values
('Lucas Mendes', 'lucas.mendes@gmail.com', '11987654321', '1995-07-15', 1),
('Juliana Alves', 'juliana.alves@gmail.com', '21987654321', '1998-11-22', 1),
('Roberto Nunes', 'roberto.nunes@gmail.com', '31987654321', '1985-05-09', 2),
('Cláudia Ferreira', 'claudia.ferreira@gmail.com', '41987654321', '1990-02-28', 3),
('Fernando Rocha', 'fernando.rocha@gmail.com', '51987654321', '1982-06-14', 4),
('Sofia Lima', 'sofia.lima@gmail.com', '61987654321', '2000-12-05', 5),
('Ricardo Souza', 'ricardo.souza@gmail.com', '71987654321', '1993-04-18', 2),
('Mariana Dias', 'mariana.dias@gmail.com', '81987654321', '1997-09-30', 4),
('Aline Santos', 'aline.santos@gmail.com', '91987654321', '1996-03-11', 3),
('Paulo César', 'paulo.cesar@gmail.com', '11998877665', '1991-08-25', 5);
select * from usuario;

delimiter $$
create trigger subtrai_vagas_palestra
after insert on usuario for each row
begin
    update palestra set vagas_palestra = vagas_palestra - 1
    where id_palestra = new.id_palestra;
end;
$$
delimiter ;

delimiter $$
create trigger trg_devolve_vagas_palestra
after delete on usuario for each row
begin
    update palestra set vagas_palestra = vagas_palestra + 1
    where id_palestra = old.id_palestra;
end;
$$
delimiter ;

select usuario.nome_usuario, usuario.email_usuario, palestra.titulo_palestra, palestrante.nome_palestrante
from usuario inner join palestra
on usuario.id_palestra = palestra.id_palestra
inner join palestrante on palestra.id_palestrante = palestrante.id_palestrante
order by palestra.titulo_palestra, usuario.nome_usuario;


