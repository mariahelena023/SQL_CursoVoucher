-- crie a procedure e insira 10 pessoas

-- depois crie uma procedure para deletar uma pessoa de acordo com o paremetro recebido

create database db_procedure;
use db_procedure;

create table pessoa(
id_pessoa int primary key auto_increment,
nome varchar(60) not null,
idade int
);

delimiter $$
create procedure sp_cadastra_pessoa(nome varchar(60), idade int)
begin

insert into pessoa values (default, nome, idade);
select * from pessoa where id_pessoa = last_insert_id();

end $$
delimiter ;

call sp_cadastra_pessoa("Anna Anunciada", 16);
call sp_cadastra_pessoa("Maria Helena", 16);
call sp_cadastra_pessoa("João Gabriel", 15);
call sp_cadastra_pessoa("Maria Julya", 13);
call sp_cadastra_pessoa("Patricia", 38);
call sp_cadastra_pessoa("Renato", 38);
call sp_cadastra_pessoa("Julie Martins", 17);
call sp_cadastra_pessoa("Isabella Miho", 18);
call sp_cadastra_pessoa("Bruno", 36);
call sp_cadastra_pessoa("Gabrielli", 16);

select * from pessoa;


delimiter $$
create procedure sp_deletar_pessoa(p_id_pessoa int)
begin

delete from pessoa 
where id_pessoa = p_id_pessoa;
select * from pessoa;

end $$
delimiter ;

call sp_deletar_pessoa(2);
