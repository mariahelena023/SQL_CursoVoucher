-- Criação do banco de dados
CREATE DATABASE biblioteca;
USE biblioteca;

-- Tabela Autor
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    sexo CHAR(1)
);

-- Tabela Editora
CREATE TABLE editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2)
);

-- Tabela Livro
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    ano_edicao YEAR NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
);

-- Tabela Aluno
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    curso VARCHAR(50) NOT NULL,
    sexo CHAR(1) NOT NULL,
    idade INT
);

-- Tabela Empréstimo
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT NOT NULL,
    id_aluno INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);


-- Inserção de registros na tabela Autor
INSERT INTO autor (nome, nacionalidade, sexo) VALUES
('J.K. Rowling', 'Britânica', 'F'),
('George Orwell', 'Britânica', 'M'),
('Gabriel García Márquez', 'Colombiana', 'M'),
('J.R.R. Tolkien', 'Britânica', 'M'),
('Machado de Assis', 'Brasileira', 'M'),
('Jane Austen', 'Britânica', 'F'),
('Monteiro Lobato', 'Brasileira', 'M'),
('Friedrich Nietzsche', 'Alemã', 'M'),
('Fiodor Dostoevsky', 'Britânica', 'M'),
('Lev Tolstoy', 'Russa', 'M'),
('Cecília Meireles', 'Brasileira', 'F'),
('Stephen King', 'Americana', 'M'),
('Agatha Christie', 'Britânica', 'F'),
('Isaac Asimov', 'Americana', 'M'),
('Paulo Leminsk', 'Brasileira', 'M'),
('Clarice Lispector', 'Brasileira', 'F'),
('Franz Kafka', 'Alemã', 'M');


-- Inserção de registros na tabela Editora
INSERT INTO editora (nome, cidade, estado) VALUES
('Companhia das Letras', 'São Paulo', 'SP'),
('AltaBooks', 'Rio de Janeiro', 'RJ'),
('Editora Autêntica', 'Belo Horizonte', 'MG'),
('Novatec', 'Curitiba', 'PR'),
('Abril', 'Porto Alegre', 'RS'),
('SBC', 'Porto Alegre', 'RS'),
('Saraiva', 'Brasília', 'DF'),
('Record', 'Florianópolis', 'SC'),
('Objetiva', 'Porto Alegre', 'RS'),
('Planeta', 'São Paulo', 'SP'),
('Editora XYZ', 'Campo Grande', 'MS'),
('Editora FTD', 'João Pessoa', 'PB'),
('Editora Almeida', 'João Pessoa', 'PB'),
('Editora Moderna', 'São Paulo', 'SP'),
('Editora Globo', 'Rio de Janeiro', 'RJ');

-- Inserção de registros na tabela Livro
INSERT INTO livro (titulo, id_autor, id_editora, ano_edicao) VALUES
('Harry Potter e a Pedra Filosofal', 1, 1, 1997),   
('1984', 2, 1, 1949),                               
('Cem Anos de Solidão', 3, 3, 1967),                
('O Senhor dos Anéis', 4, 4, 1954),               
('Dom Casmurro', 5, 4, 1982),   
('O Alienista', 5, 4, 1975),   
('Memórias Póstumas de Brás Cubas', 5, 4, 1975),                     
('Orgulho e Preconceito', 6, 6, 2021),             
('Sítio do Picapau Amarelo', 7, 7, 1999),           
('Assim Falou Zaratustra', 8, 8, 2001),
('Eche Homo', 8, 8, 2001),
('Crime e Castigo', 9, 9, 2020),                    
('Guerra e Paz', 10, 11, 2020),                     
('Romanceiro da Inconfidência', 11, 6, 2021),     
('Melhores Poemas', 11, 6, 2021),  
('It: A Coisa', 12, 6, 1986),                     
('Assassinato no Expresso do Oriente', 13, 13, 1934),
('Fundação', 14, 7, 1951),                        
('Catatau', 15, 13, 1975),       
('Toda Poesia', 15, 13, 1975),                    
('A Hora da Estrela', 16, 1, 1977),                
('A Metamorfose', 17, 1, 1999),
('O Processo', 17, 1, 1999);                    


-- Inserção de registros na tabela Aluno
INSERT INTO aluno (nome, matricula, curso, sexo, idade) VALUES
('Maria Silva', '2023101', 'Engenharia', 'F', 20),
('João Santos', '2023102', 'Medicina', 'M', 22),
('Ana Oliveira', '2023103', 'Arquitetura', 'F', 21),
('Carlos Pereira', '2023104', 'Matemática', 'M', 23),
('Fernanda Costa', '2023105', 'Física', 'F', 19),
('Lucas Almeida', '2023106', 'Química', 'M', 24),
('Juliana Martins', '2023107', 'Direito', 'F', 22),
('Ricardo Lima', '2023108', 'Sistemas de Informação', 'M', 20),
('Patrícia Rocha', '2023109', 'Administração', 'F', 21),
('André Dias', '2023110', 'Psicologia', 'M', 23),
('Fabiana Sousa', '2023111', 'Ciência da Computação', 'F', 19),
('Renato Mendes', '2023112', 'Biologia', 'M', 25),
('Tânia Reis', '2023113', 'Enfermagem', 'F', 22),
('Eduardo Nascimento', '2023114', 'Educação Física', 'M', 20),
('Simone Carvalho', '2023115', 'Design', 'F', 21),
('Gabriel Ribeiro', '2023116', 'Comunicação', 'M', 24),
('Natália Pires', '2023117', 'Teologia', 'F', 23),
('Vitor Hugo', '2023118', 'História', 'M', 22),
('Miriam Freitas', '2023119', 'Geografia', 'F', 20),
('Thiago Rocha', '2023120', 'Sociologia', 'M', 21);

-- Inserção de registros na tabela Empréstimo
INSERT INTO emprestimo (id_livro, id_aluno, data_emprestimo, data_devolucao) VALUES
(2, 3, '2024-09-01', '2024-09-05'),   
(3, 3, '2024-09-03', '2024-09-12'),   
(4, 4, '2024-09-04', '2024-09-11'),  
(5, 5, '2024-09-05', '2024-09-15'),  
(6, 6, '2024-09-06', '2024-09-14'),   
(7, 7, '2024-09-07', '2024-09-19'),  
(8, 8, '2024-09-08', '2024-09-18'),  
(5, 9, '2024-09-09', '2024-09-25'), 
(10, 10, '2024-09-10', '2024-09-21'), 
(5, 11, '2024-09-11', '2024-09-20'), 
(11, 12, '2024-09-12', '2024-09-22'), 
(13, 12, '2024-09-13', '2024-09-27'), 
(14, 12, '2024-09-14', '2024-09-24'), 
(13, 12, '2024-09-15', '2024-09-29'), 
(8, 12, '2024-09-16', '2024-09-30'),
(1, 12, '2024-09-17', '2024-10-01'), 
(1, 12, '2024-09-18', '2024-10-06'),
(1, 12, '2024-09-19', '2024-10-05'), 
(7, 12, '2024-09-20', '2024-10-04'); 

select * from livro;
select * from autor;
select * from aluno;
select * from editora;
select * from emprestimo;

-- DICA DE OURO = tabela.coluna
-- buscar quais livros tem as editoras
select editora.estado,editora.nome,livro.titulo,livro.ano_edicao
from livro inner join editora
on livro.id_editora = editora.id_editora;

-- ver quais livros são de quais autores
select autor.nacionalidade,autor.nome,livro.titulo,livro.ano_edicao
from livro inner join autor
on livro.id_autor = autor.id_autor;

-- buscar empréstimo de um aluno específico
select aluno.nome,aluno.curso,aluno.matricula,emprestimo.data_emprestimo
from aluno inner join emprestimo
on emprestimo.id_aluno = aluno.id_aluno
where aluno.matricula = "2023103";

-- ver quais livros foram emprestados
select livro.titulo,livro.ano_edicao,emprestimo.data_emprestimo,emprestimo.data_devolucao
from emprestimo inner join livro
on livro.id_livro = emprestimo.id_livro;

-- buscando informações de três tabelas
select editora.nome,livro.titulo,autor.nome
from editora 
inner join livro
on editora.id_editora = livro.id_editora
inner join autor
on livro.id_autor = autor.id_autor;

select count(id_autor), sexo, nacionalidade
from autor
group by sexo, nacionalidade;

