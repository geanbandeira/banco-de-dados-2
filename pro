Vou ajustar o exercício para remover o AUTO_INCREMENT e garantir que os comandos SELECT estejam corretos. O identificador único será inserido manualmente.


---

Prova de SQL - Banco de Dados de Loja de Música Online (Revisada)

Objetivo: Avaliar habilidades em criação de tabelas, manipulação de dados, uso de consultas com JOINs e análise de queries.


---

Contexto

Você precisa gerenciar informações de uma loja de música online com três entidades principais: Clientes, Músicas, e Compras.


---

Parte 1: Criação das Tabelas

1. Crie as tabelas Clientes, Músicas, e Compras com as colunas e restrições abaixo, sem AUTO_INCREMENT.

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Musicas (
    musica_id INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(50) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL
);

CREATE TABLE Compras (
    compra_id INT PRIMARY KEY,
    cliente_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_compra DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (musica_id) REFERENCES Musicas(musica_id)
);


2. Use o comando ALTER para adicionar uma coluna pais na tabela Clientes para armazenar o país de cada cliente.

ALTER TABLE Clientes ADD COLUMN pais VARCHAR(50);




---

Parte 2: Inserção de Dados

1. Insira dados fictícios nas tabelas criadas usando o comando INSERT. Como não há AUTO_INCREMENT, defina manualmente os valores dos identificadores (cliente_id, musica_id, e compra_id).

-- Inserindo clientes
INSERT INTO Clientes (cliente_id, nome, email, pais) VALUES 
    (1, 'Carlos Silva', 'carlos@gmail.com', 'Brasil'),
    (2, 'Ana Souza', 'ana@gmail.com', 'Portugal'),
    (3, 'Marcos Almeida', 'marcos@gmail.com', 'Espanha');

-- Inserindo músicas
INSERT INTO Musicas (musica_id, titulo, artista, preco) VALUES 
    (1, 'Samba da Amizade', 'João Brasil', 1.99),
    (2, 'Fado da Alma', 'Ana Portugal', 2.49),
    (3, 'Flamenco Vibe', 'Maria Espanha', 2.99);

-- Inserindo compras
INSERT INTO Compras (compra_id, cliente_id, musica_id, data_compra) VALUES 
    (1, 1, 1, '2024-10-01'),
    (2, 2, 2, '2024-10-05'),
    (3, 3, 3, '2024-10-10');




---

Parte 3: Consultas SQL

Para cada uma das perguntas abaixo, escreva uma consulta SQL:

1. Seleção de Compras
Exiba o nome do cliente, o título da música e a data de compra para todas as compras realizadas.

SELECT c.nome, m.titulo, cp.data_compra
FROM Compras cp
JOIN Clientes c ON cp.cliente_id = c.cliente_id
JOIN Musicas m ON cp.musica_id = m.musica_id;


2. Clientes e País
Liste todos os clientes e seu país de origem, ordenados por pais em ordem alfabética.

SELECT nome, pais
FROM Clientes
ORDER BY pais;


3. Total Gasto por Cliente
Exiba o nome do cliente e o total_gasto, que representa a soma do valor de todas as músicas compradas por cada cliente.

SELECT c.nome, SUM(m.preco) AS total_gasto
FROM Compras cp
JOIN Clientes c ON cp.cliente_id = c.cliente_id
JOIN Musicas m ON cp.musica_id = m.musica_id
GROUP BY c.nome;


4. Músicas não compradas
Exiba uma lista de todas as músicas que não foram compradas por nenhum cliente.

SELECT titulo
FROM Musicas m
LEFT JOIN Compras cp ON m.musica_id = cp.musica_id
WHERE cp.musica_id IS NULL;


5. Compras Recentes
Liste as três compras mais recentes realizadas na loja, incluindo o nome do cliente, o título da música e a data da compra.

SELECT c.nome, m.titulo, cp.data_compra
FROM Compras cp
JOIN Clientes c ON cp.cliente_id = c.cliente_id
JOIN Musicas m ON cp.musica_id = m.musica_id
ORDER BY cp.data_compra DESC
LIMIT 3;




---

Parte 4: Análise de Query

Analise a query abaixo e descreva o que ela retorna.

SELECT c.nome, m.titulo, m.preco
FROM Clientes c
JOIN Compras cp ON c.cliente_id = cp.cliente_id
JOIN Musicas m ON cp.musica_id = m.musica_id
WHERE m.preco > 2.00
ORDER BY m.preco DESC;

Explicação Esperada:
A query exibe o nome do cliente, o título da música e o preço da música, apenas para as músicas com preço maior que 2.00. A saída está ordenada pelo preço em ordem decrescente, mostrando as músicas mais caras primeiro.


---

Respostas Esperadas

Após executar cada consulta, os dados de saída esperados são semelhantes ao seguinte:

1. Seleção de Compras: | nome          | titulo          | data_compra | |---------------|-----------------|-------------| | Carlos Silva  | Samba da Amizade | 2024-10-01  | | Ana Souza     | Fado da Alma     | 2024-10-05  | | Marcos Almeida| Flamenco Vibe    | 2024-10-10  |


2. Clientes e País: | nome          | pais     | |---------------|----------| | Carlos Silva  | Brasil   | | Marcos Almeida| Espanha  | | Ana Souza     | Portugal |


3. Total Gasto por Cliente: | nome          | total_gasto | |---------------|-------------| | Carlos Silva  | 1.99        | | Ana Souza     | 2.49        | | Marcos Almeida| 2.99        |


4. Músicas não compradas: (Se houver músicas que ainda não foram compradas, elas serão listadas aqui.)


5. Compras Recentes: | nome          | titulo          | data_compra | |---------------|-----------------|-------------| | Marcos Almeida| Flamenco Vibe    | 2024-10-10  | | Ana Souza     | Fado da Alma     | 2024-10-05  | | Carlos Silva  | Samba da Amizade | 2024-10-01  |



Essas questões e consultas cobrem criação, manipulação e consulta de dados em SQL, além de análise de saídas e funcionamento de JOINs.

