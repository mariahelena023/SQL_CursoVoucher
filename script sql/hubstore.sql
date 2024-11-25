create database hubstore;
use hubstore;

select * from vendas_data;

-- quantos clientes diferentes temos no banco de dados?
select count(distinct ID_Cliente) from vendas_data;

-- selecione quantos pedidos são do cliente 'BH-11710'?
select count(ID_Pedido) from vendas_data
where ID_Cliente = 'BH-11710';

-- some o valor total de vendas para o cliente 'BH-11710'?
select sum(Valor_Venda) from vendas_data 
where ID_Cliente = 'BH-11710';

--  agora agrupe o valor dos produtos comprados pelo cliente 'BH-11710' por categoria de produto
select Categoria, sum(Valor_Venda) from vendas_data
where ID_Cliente = 'BH-11710'
group by Categoria;

-- selecione quantos pedidos são do clietnte 'AA-10315'
select count(ID_Pedido) from vendas_data
where ID_Cliente = 'AA-10315';

-- selecione o valor total que cada cliente comprou
select ID_Cliente, sum(Valor_Venda) from vendas_data
GROUP BY ID_Cliente;

-- selecione o total de pedidos por categoria
select Categoria, count(ID_Pedido) from vendas_data
group by Categoria;

-- selcione o total de pedidos por segmento
select Categoria, count(ID_Pedido) from vendas_data
group by Categoria;

-- selecione o total de pedidos por cidade, as top 5 cidades
select Cidade, count(ID_Pedido) as TotalPedidos from vendas_data
group by Cidade
order by TotalPedidos desc
limit 5;

-- selecione o total de pedidos por estado
select Estado, count(ID_Pedido) from vendas_data
group by Estado;