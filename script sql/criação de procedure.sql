use biblioteca;
show tables;

create table usuario(
id int primary key auto_increment,
nome varchar(100) not null,
login varchar(100) not null
);
select * from usuario;

delimiter $$
create procedure sp_cadastra_user(pnome varchar(100), plogin varchar(100))
begin

insert into usuario values (default, pnome, plogin);
select * from usuario where id = last_insert_id();

end $$
delimiter ;

call sp_cadastra_user("Anna Anunciada", "exemplo123@gmail.com");