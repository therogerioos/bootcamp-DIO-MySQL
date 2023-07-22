

use ecommerce;

-- inserindo dados na tabela cliente

INSERT INTO Cliente (Tipo, PrimeiroNome, NomeDoMeio, Sobrenome, CPF, Endereco, DataNascimento)
		VALUES	('PF', 'Eduardo', 'B', 'Bento Martins', 18617048441, 'Rua Bertoldo Simão de Oliveira, 809, Boa Vista, Biguaçu - SC', '1959-02-27'),
				('PF', 'Tiago', 'R', 'Carvalho', 78529052692, 'Alameda Cesárina, 433, Condomínio Village do Sol, Ponta Porã - MS', '1955-04-01'),
				('PF', 'Marcelo', 'G', 'da Rocha', 04010954592, 'Rua Novo Oeste, 266, Parque do Lago, Várzea Grande - MT', '2003-05-15'),
				('PF', 'Danilo', 'M', 'Porto', 47503496150, 'Rua Ismael Bastos, 714, Armando Mendes, Manaus - AM', '2003-04-21'),
				('PF', 'Priscila', 'M', 'Ana da Mota', 79538174704, 'Rua Francisco de Assis, 306, Jardim Petrolar, Alagoinhas - BA', '1979-05-24'),
				('PF', 'Elisa', 'F', 'Nascimento', 55982881686, 'Residencial Portal da Alegria II, 848, Portal da Alegria, Teresina - PI', '1946-03-07');
                
-- projetando conteúdo na tela da tabela Cliente

SELECT * FROM Cliente;

-- inserindo dados na tabela Pedido

INSERT INTO Pedido (Pedido_IDCliente, StatusDoPedido, Descricao, Frete, CodigoRastreio)
		VALUES	(6, 'Em andamento', 'Comprado pelo aplicativo', 10.45, 'OL254635896BR'),
				(4, 'Processando', 'Comprado pelo aplicativo', 12.65, 'OL254675797BR'),
                (2, 'Enviado', 'Comprado pelo aplicativo', 22.54, 'OL364775821BR'),
                (5, 'Entregue', 'Comprado pelo aplicativo', 17.99, 'OL554932468BR'),
                (3, 'Em andamento', 'Comprado pelo aplicativo', 21.25, '');
                
-- projetando conteúdo na tela da tabela Pedido

SELECT * FROM Pedido;

-- inserindo dados na tabela pagamento

INSERT INTO Pagamento (Pagamento_IDCliente, FormaDePagamento, CodigoBoleto, NumeroCartaoDeCredito, ValidadeCartaoDeCredito, NumeroCartaoDeDebito, ValidadeCartaoDeDebito, CVV, ChavePIX)
		VALUES	(1, 'Dinheiro', '', '', '', '', '', '', ''),
				(2, 'Dinheiro', '', '', '', '', '', '', ''),
				(3, 'Dinheiro', '', '', '', '', '', '', ''),
				(4, 'Dinheiro', '', '', '', '', '', '', ''),
				(5, 'Dinheiro', '', '', '', '', '', '', ''),
				(6, 'Dinheiro', '', '', '', '', '', '', ''),
				(1, 'Boleto', '34191751243456787123041234560005794170000026035', '', '', '', '', '', ''),
				(2, 'Boleto', '34191751243456787123041234560005494170000013200', '', '', '', '', '', ''),
				(3, 'Boleto', '34191751243456787123041234560005294170000214000', '', '', '', '', '', ''),
				(4, 'Boleto', '34191751243456787123041234560005194170000002500', '', '', '', '', '', ''),
				(5, 'Boleto', '34191751243456787123041234560005194170000054000', '', '', '', '', '', ''),
				(6, 'Boleto', '34191751243456787123041234560005494170000036500', '', '', '', '', '', ''),
				(1, 'Cartão de Débito', '', '', '', '5506051683167747', '01/2032', '475', ''),
				(2, 'Cartão de Débito', '', '', '', '5548171477759747', '01/2030', '459', ''),
				(3, 'Cartão de Débito', '', '', '', '5584513556688716', '05/2025', '973', ''),
				(4, 'Cartão de Débito', '', '', '', '4318410277031662', '01/2028', '311', ''),
				(5, 'Cartão de Débito', '', '', '', '4186081595301290', '07/2028', '345', ''),
				(6, 'Cartão de Débito', '', '', '', '4751094614146443', '12/2025', '980', ''),
				(1, 'Cartão de Crédito', '', '6363688322845744', '06/2033', '', '', '385', ''),
				(2, 'Cartão de Crédito', '', '6220754567677730', '11/2028', '', '', '822', ''),
				(3, 'Cartão de Crédito', '', '4389355676586275', '02/2028', '', '', '967', ''),
				(4, 'Cartão de Crédito', '', '6547861341776906', '04/2024', '', '', '496', ''),
				(5, 'Cartão de Crédito', '', '5153462978553325', '12/2028', '', '', '765', ''),
				(6, 'Cartão de Crédito', '', '3536104441605547', '02/2033', '', '', '845', ''),
				(1, 'PIX', '', '', '', '', '', '', '18617048441'),
				(2, 'PIX', '', '', '', '', '', '', '78529052692'),
				(3, 'PIX', '', '', '', '', '', '', '04010954592'),
				(4, 'PIX', '', '', '', '', '', '', '47503496150'),
				(5, 'PIX', '', '', '', '', '', '', '79538174704'),
				(6, 'PIX', '', '', '', '', '', '', '55982881686');

-- projetando conteúdo na tela da tabela Pagamento

SELECT * FROM Pagamento;

-- inserindo dados na tabela Produto

INSERT INTO Produto (Categoria, Avaliacao, Descricao, Valor)
		VALUES	('Eletronico', 9, 'GAMEBOY', '379.25'),
				('Eletronico', 8, 'PLAYSTATION 5', '5740.45'),
				('Brinquedo', 8, 'URSO DE PELÚCIA', '102.25'),
				('Brinquedo', 5, 'MINIATURA - FERRARI 358', '25.99'),
				('Vestuário', 10, 'CAMISETA MASCULINA - OXER', '45.58'),
				('Vestuário', 6, 'CALCINHA DEMILLUS', '52.45'),
				('Alimentos', 5, 'CHOCOLATE GAROTO', '5.99'),
				('Alimentos', 6, 'CHOCOLATE LACTA', '6.99'),
				('Moveis', 10, 'CAMABOX TECNOBOX', '258.45'),
				('Moveis', 9, 'CONJUNTO DE PANELAS', '632.25');

INSERT INTO Produto (Categoria, Avaliacao, Descricao, Valor)
		VALUES	('Brinquedo', 8, 'MINIATURA - NEW BEATLLE', '25.99');

-- projetando conteúdo na tela da tabela Produto

SELECT * FROM Produto;

-- inserindo dados na tabela Estoque

INSERT INTO Estoque (Localizacao, Quantidade)
		VALUES	('MANAUS - AM', 1500),
				('SÃO PAULO - SP', 200),
				('JOINVILLE - SC', 10000),
				('CURITIBA - PR', 900),
				('SÃO JOSÉ DOS CAMPOS - SP', 542),
				('SALVADOR - BA', 1500),
				('LIMEIRA - SP', 25000),
				('LIMEIRA - SP', 25000),
				('FEIRA DE SANTANA - BA', 9500),
				('CONTAGEM - MG', 11500);
                
-- projetando conteúdo na tela da tabela Estoque

SELECT * FROM Estoque;

-- inserindo dados na tabela Fornecedor

INSERT INTO Fornecedor (RazaoSocial, CNPJ, NomeFantasia, Contato)
		VALUES	('Bruna Bender', 42800486000192, 'Game Boy Informatica', '5137143066' ),
				('SONY BRASIL LTDA', 43447044000410, 'SONY DO BRASIL', '0' ),
                ('Claudia Ribeiro dos Santos', 20080143000168, 'J C Urso de Pelucia', '1437671116' ),
                ('Juliana Carla Vieira', 45074544000136, 'Miniaturas Carros Ph', '4832424903' ),
                ('Oxer Sport Artigos Equestres LTDA', 79179099000190, 'Oxer Sport', '0' ),
                ('De Millus S A Industria e Comercio', 33115817000830, 'Demillus', '832292556' ),
                ('Chocolates Garoto Ltda', 28053619000183, 'Chocolates Garoto Ltda', '1155084400' ),
                ('Industrias de Chocolate Lacta S A', 56993645000127, 'Industrias de Chocolate Lacta S A', '0' ),
                ('Sonhos Colchoes LTDA', 42079073000160, 'O Rei da Cama Box', '75998247687' ),
                ('Tramontina Sul SA', 93514180000100, 'Tramontina', '5434618019' );
				
                
-- projetando conteúdo na tela da tabela Estoque

SELECT * FROM Fornecedor;

-- inserindo as relações entre tabelas: RelacaoProdutoFornecedor

INSERT INTO RelacaoProdutoFornecedor (Relacao_Fornecedor_IDProduto, Relacao_Produto_IDFornecedor)
		VALUES	(1, 1),
				(2, 2),
                (3, 3),
                (4, 4),
                (5, 5),
                (6, 6),
                (7, 7),
                (8, 8),
                (9, 9),
                (10, 10);


INSERT INTO RelacaoProdutoFornecedor (Relacao_Fornecedor_IDProduto, Relacao_Produto_IDFornecedor)
		VALUES	(11, 4);

-- inserindo as relações entre tabelas: RelacaoProdutoPedido
        
INSERT INTO RelacaoProdutoPedido (Relacao_Pedido_IDProduto, Relacao_Produto_IDPedido, Quantidade, Status)
		VALUES	(6, 11, 2, 'Disponivel'),
				(2, 12, 1, 'Disponivel'),
                (4, 13, 1, 'Disponivel'),
                (3, 14, 2, 'Disponivel'),
                (2, 15, 1, 'Disponivel');

-- inserindo as relações entre tabelas: RelacaoProdutoEstoque

INSERT INTO RelacaoProdutoEstoque (Relacao_Estoque_IDProduto, Relacao_Produto_IDEstoque, Localizacao)
		VALUES	(2, 1, 'MANAUS - AM'),
				(4, 2, 'SÃO PAULO - SP'),
                (3, 3, 'JOINVILLE - SC'),
                (1, 4, 'CURITIBA - PR'),
                (5, 5, 'SÃO JOSÉ DOS CAMPOS - SP'),
                (6, 6, 'SALVADOR - BA'),
                (7, 7, 'LIMEIRA - SP'),
                (8, 8, 'LIMEIRA - SP'),
                (9, 9, 'FEIRA DE SANTANA - BA'),
                (10, 10, 'CONTAGEM - MG'),
                (11, 2, 'SÃO PAULO - SP');
  
-- inserindo as relações entre tabelas: RelacaoClientePagamentoPedido

INSERT INTO RelacaoClientePagamentoPedido (Relacao_Pedido_IDCliente, Relacao_Cliente_IDPagamento, Relacao_Cliente_IDPedido)
		VALUES	(6, 6, 11),
				(4, 22, 12),
                (2, 14, 13),
                (5, 11, 14),
                (3, 3, 15);


