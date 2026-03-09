-- Criação da DB
CREATE DATABASE saveYogurt;
USE saveYogurt;

-- Criação da tabela para armazenamento das medições de temperatura
CREATE TABLE medTemperatura (
	id_medTemp INT PRIMARY KEY AUTO_INCREMENT,
	temperatura DECIMAL(5,2) NOT NULL,
	dt_medicao DATETIME DEFAULT CURRENT_TIMESTAMP()
);

-- Criação da tabela para armazenamento dos usuarios/clientes
CREATE TABLE usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(100) UNIQUE NOT NULL,
	senha VARCHAR(30) NOT NULL,
	telefone VARCHAR(20),
    empresa VARCHAR(50),
    dt_pedido DATETIME DEFAULT current_timestamp(),
    CNPJ CHAR(14) UNIQUE NOT NULL,
    representante VARCHAR(40)
);

-- Criação da tabela para armazenamento dos dados do lote/transportadora
CREATE TABLE transportadora (
	id_unidade_transportadora INT PRIMARY KEY AUTO_INCREMENT,
    empresa_responsavel VARCHAR(40) NOT NULL,
    modelo_caminhao VARCHAR(25),
	lote INT,
    local_saida VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    dt_saida DATE,
    placa VARCHAR(7) NOT NULL
);

-- INSERT de dados nas tabelas
INSERT INTO usuario (email, senha, telefone, empresa, CNPJ) VALUES
('maicoantonio@gmail.com','senhaMaicom','(11)98567-2354','Iogurtantonio', '12345678000101'),
('melhoriogurte@yahoo.com','melhoriogurtedomundo','(11)90864-3123','Melhoriogurte', '98765432000102'),
('carlos.silva@hotmail.com','senhaSegura123','(11)97765-4321','CarlosSilva99', '11222333000103'),
('ana.paula@outlook.com','anaP_2026','(11)96543-8765','AnaPaulaTech', '44555666000104'),
('contato.loja@gmail.com','loja@123','(11)91234-5678','LojaOficial', '77888999000105');

INSERT INTO medTemperatura (temperatura, dt_medicao) VALUES
(22.5, '2026-02-20 08:30:00'),
(15.0, '2026-02-21 09:15:00'),
(5.9,  '2026-02-22 10:45:00'),
(12.3, '2026-02-23 11:30:00'),
(9.9,  '2026-02-24 13:00:00'),
(3.4,  '2026-02-25 14:20:00'),
(7.5,  '2026-02-26 15:10:00'),
(10.0, '2026-02-27 16:40:00'),
(5.2,  '2026-02-28 18:00:00');

INSERT INTO transportadora (empresa_responsavel, lote, local_saida, destino, dt_saida, placa) VALUES
('TransLogística Rápida', 1, 'São Paulo - SP', 'Rio de Janeiro - RJ', '2024-12-01', 'ABC1234'),
('Cargas de Minas', 2, 'Belo Horizonte - MG', 'Curitiba - PR', '2024-12-05', 'XYZ9876'),
('Expresso Nordeste', 3, 'Salvador - BA', 'Recife - PE', '2024-12-10', 'DEF5678'),
('Sul Transportes', 4, 'Porto Alegre - RS', 'Florianópolis - SC', '2024-12-15', 'JKL3456'),
('Centro-Oeste Cargas', 5, 'Brasília - DF', 'Goiânia - GO', '2024-12-20', 'MNO7890');

-- SELECT
SELECT * FROM usuario;
SELECT * FROM transportadora;
SELECT * FROM medTemperatura;

SELECT * FROM usuario WHERE email LIKE '%@gmail.com';

SELECT * FROM medTemperatura WHERE temperatura < 7.6;
SELECT * FROM transportadora WHERE lote > 2;

SELECT CONCAT(empresa, ' (CNPJ: ', CNPJ, ')') AS dados_empresa, email, CONCAT('Tel: ', telefone) AS contato FROM usuario;

SELECT 
    empresa_responsavel, 
    CONCAT(local_saida, ' ➔ ', destino) AS rota_viagem, 
    DATE_FORMAT(dt_saida, '%d/%m/%Y') AS data_partida, 
    placa 
FROM transportadora;