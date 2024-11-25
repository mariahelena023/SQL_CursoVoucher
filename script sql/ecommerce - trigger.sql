create database ecommerce;
use ecommerce;

create table endereco(
id_endereco int primary key auto_increment,
logradouro varchar(100),
complemento varchar(100),
cep char(10),
cidade varchar(50),
estado varchar(50)
);
create table usuario(
id_usuario int primary key auto_increment,
nome_usuario varchar(100),
email varchar(80),
senha varchar(32),
status_usuario tinyint
);
create table categoria(
id_categoria int primary key auto_increment,
descricao_categoria varchar(45)
);
create table fabricantes(
id_fabricantes int primary key auto_increment,
descricao_fabricantes varchar(45)
);
create table produtos(
id_produto int primary key auto_increment,
nome_produto varchar(100),
descricao_produto text,
modelo varchar(50),
estoque int,
id_categoria int not null,
id_fabricantes int not null,
constraint foreign key(id_categoria) references categoria(id_categoria),
constraint foreign key(id_fabricantes) references fabricantes(id_fabricantes)
);
create table cliente(
id_cliente int primary key auto_increment,
nome_cliente varchar(100),
cpf_cliente char(11),
telefone varchar(50),
sexo_cliente enum('F','M'),
cadastro_cliente datetime,
id_endereco int not null,
constraint foreign key(id_endereco) references endereco(id_endereco)
);
create table pedidos(
id_pedido int primary key auto_increment,
data_pedido date,
status_pedido varchar(50),
id_cliente int not null,
constraint foreign key(id_cliente) references cliente(id_cliente)
);
create table pedido_item(
id_pedidoItem int primary key auto_increment,
quantidade_pedidoItem int,
valor_unidadePedidoItem decimal(10,2),
total_pedidoItem decimal(10,2),
id_produto int not null,
id_pedido int null,
constraint foreign key(id_produto) references produtos(id_produto),
constraint foreign key(id_pedido) references pedidos(id_pedido)
);
create table pagamentos(
id_pagamentos int primary key auto_increment,
tipo_pagamento varchar(45),
valor_pago decimal(7,2),
data_pagamento date,
id_pedido int not null,
constraint foreign key(id_pedido) references pedidos(id_pedido)
);

insert into endereco (logradouro, complemento, cep, cidade, estado) values
('Rua das Flores', 'Apto 101', '12345-678', 'São Paulo', 'SP'),
('Avenida Brasil', 'Bloco B', '23456-789', 'Rio de Janeiro', 'RJ'),
('Rua Amazonas', 'Casa 12', '34567-890', 'Belo Horizonte', 'MG'),
('Rua Bahia', NULL, '45678-901', 'Salvador', 'BA'),
('Rua Goiás', 'Sala 202', '56789-012', 'Goiânia', 'GO');
select * from endereco;

insert into usuario (nome_usuario, email, senha, status_usuario) values
('João Silva', 'joao.silva@email.com', 'senha123', 1),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', 1),
('Carlos Santos', 'carlos.santos@email.com', 'senha789', 0),
('Ana Costa', 'ana.costa@email.com', 'minhasenha', 1),
('Fernanda Lima', 'fernanda.lima@email.com', 'fernandinha', 1);
select * from usuario;

insert into categoria (descricao_categoria) values
('Eletrônicos'),
('Roupas'),
('Livros'),
('Móveis'),
('Alimentos');
select * from categoria;

insert into fabricantes (descricao_fabricantes) values
('Samsung'),
('Apple'),
('Sony'),
('LG'),
('Philips');
select * from fabricantes;

insert into produtos (nome_produto, descricao_produto, modelo, estoque, id_categoria, id_fabricantes) values
('Smartphone Galaxy S21', 'Smartphone Samsung com 128GB', 'S21', 50, 1, 1),
('iPhone 13', 'Smartphone Apple com 128GB', '13', 30, 1, 2),
('TV 4K 55"', 'TV Sony com resolução 4K', 'XBR55', 20, 1, 3),
('Refrigerador', 'Geladeira LG 500L', 'GL500', 15, 4, 4),
('Livro de Ficção', 'Livro emocionante de aventura', '1ª Edição', 100, 3, 5);
select * from produtos;

insert into cliente (nome_cliente, cpf_cliente, telefone, sexo_cliente, cadastro_cliente, id_endereco) values
('João Silva', '12345678901', '11987654321', 'M', NOW(), 1),
('Maria Oliveira', '98765432100', '21987654321', 'F', NOW(), 2),
('Carlos Santos', '56789012345', '31987654321', 'M', NOW(), 3),
('Ana Costa', '45678901234', '71987654321', 'F', NOW(), 4),
('Fernanda Lima', '34567890123', '62987654321', 'F', NOW(), 5);
select * from cliente;

insert into pedidos (data_pedido, status_pedido, id_cliente) values
(CURDATE(), 'PENDENTE', 1),
(CURDATE(), 'PENDENTE', 2),
(CURDATE(), 'PENDENTE', 3),
(CURDATE(), 'FINALIZADO', 4),
(CURDATE(), 'PENDENTE', 5);
select * from pedidos;

insert into pedido_item (quantidade_pedidoItem, valor_unidadePedidoItem, total_pedidoItem, id_produto, id_pedido) values
(1, 5000.00, 5000.00, 1, 1),
(2, 4500.00, 9000.00, 2, 1),
(1, 2000.00, 2000.00, 3, 2),
(1, 3000.00, 3000.00, 4, 3),
(1, 50.00, 50.00, 5, 4);
select * from pedido_item;

insert into pagamentos (tipo_pagamento, valor_pago, data_pagamento, id_pedido) values
('Cartão de Crédito', 5000.00, CURDATE(), 1),
('Cartão de Crédito', 9000.00, CURDATE(), 1),
('Pix', 2000.00, CURDATE(), 2),
('Boleto', 3000.00, CURDATE(), 3),
('Dinheiro', 50.00, CURDATE(), 4);
select * from pagamentos;

delimiter $$
create trigger atualiza_status_pedido
after insert on pagamentos for each row
begin
    update pedidos set status_pedido = 'FINALIZADO'
    where id_pedido = new.id_pedido;
end$$
delimiter ;

delimiter $$
create trigger atualiza_estoque_produto
after insert on pedido_item for each row
begin
    update produtos set estoque = estoque - new.quantidade_pedidoItem
    where id_produto = new.id_produto;
end$$
delimiter ;

