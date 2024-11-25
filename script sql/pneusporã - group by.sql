create database pneuspora;
use pneuspora;

create table vendedor(
	id_vendedor int not null auto_increment,
	nome varchar(100) not null,
	matricula char(4) not null,
	email varchar(100) not null,
	comissao decimal (10,2) not null, 
	primary key(id_vendedor)
);


INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Ana García', '1010', 'ana.garcia@example.com', 0.05);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Bruno Fernández', '1102', 'bruno.fernandez@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Carla Rodríguez', '5030', 'carla.rodriguez@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Diego López', '2008', 'diego.lopez@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Eliana Pérez', '1999', 'eliana.perez@example.com', 0.09);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Felipe Gómez', '1616', 'felipe.gomez@example.com', 0.10);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Gabriela Ramírez', '7777', 'gabriela.ramirez@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Enrique Martínez', '8008', 'enrique.martinez@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Isabela Torres', '9000', 'isabela.torres@example.com', 0.05);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Juan Pérez', '0010', 'juan.perez@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Karina Sánchez', '1212', 'karina.sanchez@example.com', 0.09);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Lucas González', '0151', 'lucas.gonzalez@example.com', 0.10);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Mariana Díaz', '1515', 'mariana.diaz@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Nicolás Jiménez', '2122', 'nicolas.jimenez@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Olivia Herrera', '2323', 'olivia.herrera@example.com', 0.05);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Pablo Gómez', '4500', 'pablo.gomez@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Quésia Vargas', '2829', 'quesia.vargas@example.com', 0.09);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Rafael Castillo', '1111', 'rafael.castillo@example.com', 0.10);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Sofía Romero', '2222', 'sofia.romero@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Tomás Silva', '7474', 'tomas.silva@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Alina Fernández', '0145', 'alina.fernandez@example.com', 0.05);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Alejandro Méndez', '0123', 'alejandro.mendez@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Camila Ruiz', '0198', 'camila.ruiz@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Daniela Ortiz', '0084', 'daniela.ortiz@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Fernanda Ramírez', '0211', 'fernanda.ramirez@example.com', 0.10);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Helena Navarro', '0134', 'helena.navarro@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Juliana Morales', '0203', 'juliana.morales@example.com', 0.09);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Carlos Santos', '0090', 'carlos.santos@example.com', 0.10);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Luciana Mendoza', '0112', 'luciana.mendoza@example.com', 0.05);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Natalia Vargas', '0189', 'natalia.vargas@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Octavio Ramos', '0065', 'octavio.ramos@example.com', 0.08);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Patricia Martínez', '0078', 'patricia.martinez@example.com', 0.09);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Samuel Moreno', '0020', 'samuel.moreno@example.com', 0.06);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Tatiana Castro', '0017', 'tatiana.castro@example.com', 0.07);
INSERT INTO vendedor (nome, matricula, email, comissao) VALUES ('Vicente Morales', '0104', 'vicente.morales@example.com', 0.08);


create table vendas( 
	id_venda int not null auto_increment,
	mes varchar(50) not null,
	total_vendas decimal(10,2) not null,
	unidade varchar(50) not null,
	id_vendedor int not null,
	primary key (id_venda),
	foreign key (id_vendedor) references vendedor(id_vendedor)
);



INSERT INTO vendas (mes, total_vendas, unidade, id_vendedor) VALUES
('Enero', 75000.00, 'Ciudad del Este', 1),
('Enero', 120000.00, 'Asunción', 2),
('Enero', 98000.00, 'Pedro Juan Caballero', 3),
('Febrero', 60000.00, 'Ciudad del Este', 4),
('Febrero', 150000.00, 'Asunción', 1),
('Febrero', 110000.00, 'Pedro Juan Caballero', 5),
('Marzo', 85000.00, 'Ciudad del Este', 6),
('Marzo', 67000.00, 'Asunción', 2),
('Marzo', 93000.00, 'Pedro Juan Caballero', 3),
('Abril', 130000.00, 'Ciudad del Este', 4),
('Abril', 55000.00, 'Asunción', 7),
('Abril', 145000.00, 'Pedro Juan Caballero', 5),
('Mayo', 92000.00, 'Ciudad del Este', 8),
('Mayo', 78000.00, 'Asunción', 6),
('Mayo', 102000.00, 'Pedro Juan Caballero', 9),
('Junio', 62000.00, 'Ciudad del Este', 10),
('Junio', 85000.00, 'Asunción', 11),
('Junio', 130000.00, 'Pedro Juan Caballero', 12),
('Julio', 47000.00, 'Ciudad del Este', 20),
('Julio', 90000.00, 'Asunción', 13),
('Julio', 119000.00, 'Pedro Juan Caballero', 14),
('Agosto', 150000.00, 'Ciudad del Este', 5),
('Agosto', 82000.00, 'Asunción', 15),
('Agosto', 67000.00, 'Pedro Juan Caballero', 2),
('Septiembre', 80000.00, 'Ciudad del Este', 3),
('Septiembre', 115000.00, 'Asunción', 4),
('Septiembre', 70000.00, 'Pedro Juan Caballero', 6),
('Octubre', 99000.00, 'Ciudad del Este', 20),
('Octubre', 52000.00, 'Asunción', 7),
('Octubre', 124000.00, 'Pedro Juan Caballero', 5),
('Noviembre', 113000.00, 'Ciudad del Este', 8),
('Noviembre', 65000.00, 'Asunción', 2),
('Noviembre', 84000.00, 'Pedro Juan Caballero', 9),	
('Diciembre', 56000.00, 'Ciudad del Este', 20),
('Diciembre', 130000.00, 'Asunción', 3),
('Diciembre', 97000.00, 'Pedro Juan Caballero', 4);

select * from vendedor;

-- total de vendas por unidade
select unidade, sum(total_vendas)
from vendas
group by unidade
order by sum(total_vendas) desc;

-- total de vendas por mês
select mes, sum(total_vendas)
from vendas
group by mes;

-- faturalmento anual na loja de pneus
select sum(total_vendas)
from vendas;

-- total de vendas por mês, escolher um mês, por exemplo, janeiro
select mes, SUM(total_vendas)
from vendas
where mes = 'Octubre'
group by mes;

-- id, nome, total de vendas e mês em que todos os vendedores fizeram uma venda
select vendedor.id_vendedor, vendedor.nome, vendedor.matricula, vendas.total_vendas, vendas.mes
from vendedor join vendas
on vendas.id_vendedor = vendedor.id_vendedor;

-- id e nome de todos os vendedores que não fizeram uma venda
select vendedor.id_vendedor, vendedor.nome
from vendedor left join vendas 
on vendedor.id_vendedor = vendas.id_vendedor
where vendas.id_venda is null;

-- id, nome, vendas totais, porcentagem e salário dos vendedores e liste os 5 maiores salários
select vendedor.nome, vendas.mes, vendas.total_vendas,concat(round(vendedor.comissao*100), '%') as '%',
round(vendas.total_vendas * vendedor.comissao, 2) as salario
from vendedor inner join vendas
on vendedor.id_vendedor = vendas.id_vendedor
order by salario desc
limit 5;

-- id, nome e o total de vendas dos vendedores que venderam mais de 350.000 reias
select vendedor.id_vendedor, vendedor.nome, sum(vendas.total_vendas)
from vendedor join vendas
on vendedor.id_vendedor = vendas.id_vendedor
group by vendedor.id_vendedor, vendedor.nome
having sum(vendas.total_vendas) > 350000;