-- Criar o esquema "livraria"
CREATE SCHEMA livraria;

-- Criar a tabela "editora"
CREATE TABLE livraria.editora(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Inserir dados na tabela "editora"
INSERT INTO livraria.editora (nome) VALUES ('Penguin Random House'); --1
INSERT INTO livraria.editora (nome) VALUES ('Giunti Editore'); --2
INSERT INTO livraria.editora (nome) VALUES ('Kodansha'); --3
INSERT INTO livraria.editora (nome) VALUES ('Editorial Planeta'); --4
INSERT INTO livraria.editora (nome) VALUES ('Random House Korea'); --5
INSERT INTO livraria.editora (nome) VALUES ('Amsterdam University Press'); --6

-- Visualizar os dados da tabela "editora"
SELECT * FROM livraria.editora;

-- Criar a tabela "livro"
CREATE TABLE livraria.livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    id_editora INTEGER,
    ano_publicacao INTEGER,
    FOREIGN KEY(id_editora) REFERENCES livraria.editora(id)
);

-- Inserir dados na tabela "livro"
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('A Culpa é das Estrelas', 'John Green', 1, 2012); --1
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('La Ragazza di Fuoco', 'Suzanne Collins', 2, 2009); --2
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('One Piece Vol. 1', 'Eiichiro Oda', 3, 1997); --3
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 4, 1997); --4
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('Kim Jiyoung, Born 1982', 'Cho Nam-joo', 5, 2016); --5
INSERT INTO livraria.livro (titulo, autor, id_editora, ano_publicacao) VALUES ('O Diário de Anne Frank', 'Anne Frank', 6, 1947); --6

-- Visualizar os dados da tabela "livro"
SELECT * FROM livraria.livro;

-- Criar a tabela "preco"
CREATE TABLE livraria.preco(
    id SERIAL PRIMARY KEY,
    id_livro INTEGER,
    preco DECIMAL(10, 2),
    FOREIGN KEY(id_livro) REFERENCES livraria.livro(id)
);

-- Inserir dados na tabela "preco"
INSERT INTO livraria.preco (id_livro, preco) VALUES (1, 25.99); --1
INSERT INTO livraria.preco (id_livro, preco) VALUES (2, 19.99); --2
INSERT INTO livraria.preco (id_livro, preco) VALUES (3, 10.99); --3
INSERT INTO livraria.preco (id_livro, preco) VALUES (4, 22.50); --4
INSERT INTO livraria.preco (id_livro, preco) VALUES (5, 15.75); --5
INSERT INTO livraria.preco (id_livro, preco) VALUES (6, 18.25); --6

-- Visualizar os dados da tabela "preco"
SELECT * FROM livraria.preco;

-- Criar a tabela "ISBN"
CREATE TABLE livraria.isbn(
    id SERIAL PRIMARY KEY,
    id_livro INTEGER,
    codigo VARCHAR(20),
    FOREIGN KEY(id_livro) REFERENCES livraria.livro(id)
);

-- Inserir dados na tabela "ISBN"
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (1, '978-0525478812'); --1
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (2, '978-8868361423'); --2
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (3, '978-1569319017'); --3
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (4, '978-9722062151'); --4
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (5, '978-8998274488'); --5
INSERT INTO livraria.isbn (id_livro, codigo) VALUES (6, '978-9089645600'); --6

-- Visualizar os dados da tabela "ISBN"
SELECT * FROM livraria.isbn;

-- Visualizar os dados da tabela "livro" com nome da editora, preço e ISBN
SELECT livraria.livro.titulo, 
       livraria.livro.autor, 
       livraria.editora.nome AS editora, 
       livraria.preco.preco,
       livraria.isbn.codigo
FROM livraria.livro 
JOIN livraria.editora ON livraria.livro.id_editora = livraria.editora.id
JOIN livraria.preco ON livraria.livro.id = livraria.preco.id_livro
JOIN livraria.isbn ON livraria.livro.id = livraria.isbn.id_livro;

