CREATE DATABASE IF NOT EXISTS dbdocker;
USE dbdocker;

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    descricao TEXT,
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO categorias (nome, descricao, ativo) VALUES
('Cerveja', 'Cervejas e suas variedades', 1),
('Whisky', 'Whiskies e suas variedades', 1),
('Vinho', 'Vinhos e suas variedades', 1);

INSERT INTO produtos (nome, preco, estoque, id_categoria) VALUES
('Corona lata', 5.00, 50, 1),
('Corona long neck', 7.00, 50, 1),
('Jack Daniel Maca verde', 140.00, 30, 2),
('Jameson Triple Distilled', 110.00, 30, 2),
('Pergola Suave', 25.00, 20, 3),
('Sangue de Boi Suave', 18.00, 20, 3);