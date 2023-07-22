-- criando banco de dados para Desafio de Projeto 1 - Bootcamp DIO

-- drop database ecommerce;

create database ecommerce;

use ecommerce;

-- criando a tabela de cliente

CREATE TABLE Cliente(
    IDCliente INT PRIMARY KEY AUTO_INCREMENT,
    Tipo ENUM('PF', 'PJ') NOT NULL,
    PrimeiroNome VARCHAR(20),
    NomeDoMeio VARCHAR(3),
    Sobrenome VARCHAR(20),
    CPF CHAR(11) UNIQUE,
    Endereco VARCHAR(255),
    DataNascimento DATE,
    RazaoSocial VARCHAR(100),
    CNPJ VARCHAR(45) UNIQUE
);


-- criando a tabela de forma de pagamento

CREATE TABLE Pagamento (
	IDPagamento INT PRIMARY KEY AUTO_INCREMENT,
	Pagamento_IDCliente INT,
    FormaDePagamento ENUM('Dinheiro', 'Boleto', 'Cartão de Débito', 'Cartão de Crédito', 'PIX') NOT NULL,
	CodigoBoleto VARCHAR(100),
	NumeroCartaoDeCredito VARCHAR(16),
	ValidadeCartaoDeCredito VARCHAR(7),
	NumeroCartaoDeDebito VARCHAR(16),
	ValidadeCartaoDeDebito VARCHAR(7),
	CVV CHAR(3),
	ChavePIX VARCHAR(200),
	CONSTRAINT fk_Pagamento_Cliente FOREIGN KEY (Pagamento_IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE CASCADE
);

-- criando a tabela de produto

CREATE TABLE Produto (
	IDProduto INT PRIMARY KEY AUTO_INCREMENT,
	Categoria ENUM('Eletronico', 'Brinquedo', 'Vestuário', 'Alimentos', 'Moveis') NOT NULL,
	Avaliacao FLOAT DEFAULT 0,
	Descricao VARCHAR(45),
	Valor VARCHAR(45) NOT NULL
);

-- criando a tabela de pedido

CREATE TABLE Pedido (
	IDPedido INT PRIMARY KEY AUTO_INCREMENT,
	Pedido_IDCliente INT,
	StatusDoPedido ENUM('Em andamento', 'Processando', 'Enviado', 'Entregue') DEFAULT ('Em Processamento'),
	Descricao VARCHAR(45),
	Frete FLOAT,
	CodigoRastreio VARCHAR(45),
	CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (Pedido_IDCliente) REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE CASCADE
);

 --  criando a tabela de estoque
 
CREATE TABLE Estoque (
	IDEstoque INT PRIMARY KEY AUTO_INCREMENT,
	Localizacao VARCHAR(45) NOT NULL,
	Quantidade INT NOT NULL
);

-- criando a tabela de fornecedor

CREATE TABLE Fornecedor (
	IDFornecedor INT PRIMARY KEY AUTO_INCREMENT,
	RazaoSocial VARCHAR(45) NOT NULL,
	CNPJ VARCHAR(45) UNIQUE NOT NULL,
	NomeFantasia VARCHAR(45) NOT NULL,
	Contato VARCHAR(15) NOT NULL
);

-- criando a tabela de Vendedor terceirizado

CREATE TABLE TerceiroVendedor (
	IDTerceiroVendedor INT PRIMARY KEY AUTO_INCREMENT,
	RazaoSocial VARCHAR(45) UNIQUE NOT NULL,
	CNPJ VARCHAR(45) UNIQUE,
	CPF VARCHAR(45) UNIQUE,
	Localizacao VARCHAR(45),
	NomeFantasia VARCHAR(45)
);

-- criando tabela de relacionamento entre TerceiroVendedor e Produto

CREATE TABLE RelacaoTerceiroVendedorProduto (
	Relacao_IDTerceiroVendedor INT,
	Relacao_IDProduto INT,
	Quantidade INT DEFAULT 1,
	PRIMARY KEY (Relacao_IDTerceiroVendedor, Relacao_IDProduto),
	CONSTRAINT fk_Relacao_IDTerceiroVendedor 
	FOREIGN KEY (Relacao_IDTerceiroVendedor) 
	REFERENCES TerceiroVendedor(IDTerceiroVendedor) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_IDProduto 
	FOREIGN KEY (Relacao_IDProduto) 
	REFERENCES Produto(IDProduto) ON UPDATE CASCADE ON DELETE CASCADE
);

-- criando tabela de relacionamento entre Produto e Pedido

CREATE TABLE RelacaoProdutoPedido (
	Relacao_Pedido_IDProduto INT,
	Relacao_Produto_IDPedido INT,
	Quantidade INT DEFAULT 1,
	Status ENUM('Disponivel', 'Sem estoque') DEFAULT 'Disponivel',
	PRIMARY KEY (Relacao_Pedido_IDProduto, Relacao_Produto_IDPedido),
	CONSTRAINT fk_Relacao_Pedido_IDProduto 
	FOREIGN KEY (Relacao_Pedido_IDProduto) 
	REFERENCES Produto(IDProduto) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_Produto_IDPedido 
	FOREIGN KEY (Relacao_Produto_IDPedido) 
	REFERENCES Pedido(IDPedido) ON UPDATE CASCADE ON DELETE CASCADE
);

-- criando tabela de relacionamento entre Produto e Estoque

CREATE TABLE RelacaoProdutoEstoque (
	Relacao_Estoque_IDProduto INT,
	Relacao_Produto_IDEstoque INT,
	Localizacao VARCHAR(255) NOT NULL,
	PRIMARY KEY (Relacao_Estoque_IDProduto, Relacao_Produto_IDEstoque),
	CONSTRAINT fk_Relacao_Estoque_IDProduto 
	FOREIGN KEY (Relacao_Estoque_IDProduto) 
	REFERENCES Produto(IDProduto) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_Produto_IDEstoque 
	FOREIGN KEY (Relacao_Produto_IDEstoque) 
	REFERENCES Estoque(IDEstoque) ON UPDATE CASCADE ON DELETE CASCADE
);

-- criando a tabela de relacionamento entre Produto e Fornecedor

CREATE TABLE RelacaoProdutoFornecedor (
	Relacao_Fornecedor_IDProduto INT,
	Relacao_Produto_IDFornecedor INT,
	PRIMARY KEY (Relacao_Fornecedor_IDProduto, Relacao_Produto_IDFornecedor),
	CONSTRAINT fk_Relacao_Fornecedor_IDProduto 
	FOREIGN KEY (Relacao_Fornecedor_IDProduto) 
	REFERENCES Produto(IDProduto) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_Produto_IDFornecedor 
	FOREIGN KEY (Relacao_Produto_IDFornecedor) 
	REFERENCES Fornecedor(IDFornecedor) ON UPDATE CASCADE ON DELETE CASCADE
);

-- criando a tabela de relacionamento entre Cliente, Pagamento e Pedido

CREATE TABLE RelacaoClientePagamentoPedido (
	Relacao_Pedido_IDCliente INT,
	Relacao_Cliente_IDPagamento INT,
	Relacao_Cliente_IDPedido INT,
	PRIMARY KEY (Relacao_Pedido_IDCliente, Relacao_Cliente_IDPagamento, Relacao_Cliente_IDPedido),
	CONSTRAINT fk_Relacao_Pedido_IDCliente 
	FOREIGN KEY (Relacao_Pedido_IDCliente) 
	REFERENCES Cliente(IDCliente) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_Cliente_IDPagamento 
	FOREIGN KEY (Relacao_Cliente_IDPagamento) 
	REFERENCES Pagamento(IDPagamento) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_Relacao_Cliente_IDPedido 
	FOREIGN KEY (Relacao_Cliente_IDPedido) 
	REFERENCES Pedido(IDPedido) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Ação necessária para que o auto incremento funcione corretamente

alter table Cliente auto_increment=1;
alter table Pagamento auto_increment=1;
alter table Produto auto_increment=1;
alter table Pedido auto_increment=1;
alter table Estoque auto_increment=1;
alter table Fornecedor auto_increment=1;
alter table TerceiroVendedor auto_increment=1;











