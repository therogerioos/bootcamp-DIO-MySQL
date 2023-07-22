
use ecommerce;

-- projetando conteúdo na tela da tabela: Demonstre na tela os dados dos produtos e seus respectivos fornecedores.

SELECT Categoria, Descricao, Valor, NomeFantasia, CNPJ FROM Produto, Fornecedor, RelacaoProdutoFornecedor
WHERE IDProduto = Relacao_Fornecedor_IDProduto and IDFornecedor = Relacao_Produto_IDFornecedor;

-- SELECT * FROM Produto;
-- SELECT * FROM Fornecedor;
-- SELECT * FROM RelacaoProdutoPedido;
-- SELECT * FROM RelacaoProdutoEstoque;
-- SELECT * FROM RelacaoClientePagamentoPedido;
-- SELECT * FROM Pedido;
-- SELECT * FROM Pagamento
-- WHERE Pagamento_IDCliente = 6;

-- projetando conteúdo na tela da tabela: Exiba os dados básicos dos clientes, o status dos seus pedidos e o valor do frete, assim como, o código de rastreio.

SELECT IDPedido, Tipo, CONCAT(PrimeiroNome, ' ',NomeDoMeio, ' ',Sobrenome) as 'Nome do Cliente', CPF, StatusDoPedido, Frete, CodigoRastreio FROM Cliente, Pedido
WHERE IDCliente = Pedido_IDCliente;

-- projetando conteúdo na tela da tabela: Exibir os dados do cliente, quais pedidos realizados, demonstrando a quantidade, o valor unitário, o valor do frete, assim como o valor total pago, assim como, o status do pedido e seu código de rastreio.

SELECT 
	CONCAT(Cl.PrimeiroNome, ' ', Cl.NomeDoMeio, ' ', Cl.Sobrenome) as 'Nome do Cliente' , 
    Cl.Tipo as 'Perfil', 
    Cl.CPF as 'CPF do Cliente', 
    Cl.Endereco as 'Endereço da entrega', 
    Pr.Descricao as 'Produto Adquirido', 
    Rel.Quantidade as 'Quantidade', 
    Pr.Valor as 'Valor Unitário',
    Pe.Frete as 'Valor do Frete',
    ROUND((Rel.Quantidade*Pr.Valor)+Pe.Frete,2) as 'Valor Total',
    Pe.StatusDoPedido as 'Status do Pedido',
    Pe.CodigoRastreio as 'Rastreamento'
FROM Cliente as Cl, Pedido as Pe, Produto as Pr, RelacaoProdutoPedido as Rel
WHERE IDCliente = Pedido_IDCliente and Relacao_Pedido_IDProduto = IDProduto and Relacao_Produto_IDPedido = IDPedido;

SELECT * FROM Cliente, Pedido, Produto, RelacaoProdutoPedido
WHERE IDCliente = Pedido_IDCliente and Relacao_Pedido_IDProduto = IDProduto and Relacao_Produto_IDPedido = IDPedido;

-- projetando conteúdo na tela da tabela: Precisamos saber qual o nível das notas de avaliação dos clientes, com isso, validar como 'Ruim' as notas entre 0 e menor que 5, 'Regular' para igual ou maior que 5 e menor que 8 e 'Ótimo' para os restantes. Será necessário exibir a quantidade em estoque e sua localização.

SELECT 
	Pr.Categoria as 'Categoria', 
    Pr.Descricao as 'Descrição', 
    Pr.Avaliacao as 'Nota de Avaliação', 
    CASE 
		WHEN Pr.Avaliacao >= 5 and Pr.Avaliacao < 8 THEN 'Regular'
        WHEN Pr.Avaliacao >= 8 and Pr.Avaliacao < 11 THEN 'Ótimo'
        ELSE 'Ruim'
	END as 'Classificação da Avaliação',
    Es.Quantidade as 'Qtd em Estoque',
    Es.Localizacao as 'Armazenado em:'
FROM Produto as Pr, Estoque as Es, RelacaoProdutoEstoque as Rel
WHERE IDProduto = Relacao_Estoque_IDProduto and IDEstoque = Relacao_Produto_IDEstoque
ORDER BY Pr.Categoria asc, Pr.Avaliacao asc;

SELECT * FROM Produto, Estoque, RelacaoProdutoEstoque
WHERE IDProduto = Relacao_Estoque_IDProduto and IDEstoque = Relacao_Produto_IDEstoque;

-- projetando conteúdo na tela da tabela: Exibir os dados dos clientes, dados do pedido e a forma de pagamento, assim como, o calculo de valor total.

SELECT 
	CONCAT(Cl.PrimeiroNome, ' ', Cl.NomeDoMeio, ' ', Cl.Sobrenome) as 'Nome do Cliente' , 
    Cl.Tipo as 'Perfil', 
    Cl.CPF as 'CPF do Cliente', 
    Cl.Endereco as 'Endereço da entrega', 
    Pr.Descricao as 'Produto Adquirido', 
    Rel.Quantidade as 'Quantidade', 
    Pr.Valor as 'Valor Unitário',
    Pe.Frete as 'Valor do Frete',
    ROUND((Rel.Quantidade*Pr.Valor)+Pe.Frete,2) as 'Valor Total',
    Pg.FormaDePagamento as 'Forma de Pagamento',
    Pe.StatusDoPedido as 'Status do Pedido',
    Pe.CodigoRastreio as 'Rastreamento'
FROM Pedido as Pe, Cliente as Cl, Produto as Pr, Pagamento as Pg, RelacaoClientePagamentoPedido as RelPg, RelacaoProdutoPedido as Rel
WHERE IDProduto = Relacao_Pedido_IDProduto 
	and IDCliente = Relacao_Pedido_IDCliente 
    and IDPedido = Relacao_Cliente_IDPedido 
    and IDPagamento = Relacao_Cliente_IDPagamento 
    and IDPedido = Relacao_Produto_IDPedido;
  
--  projetando conteúdo na tela da tabela: Exiba a quantidade de produtos vendidos por Status do Pedido 
  
SELECT StatusDoPedido, COUNT(*) as Quantidade FROM Pedido
GROUP BY StatusDoPedido;

--  projetando conteúdo na tela da tabela: Exiba a quantidade de produtos vendidos por Status do Pedido que estejam maior igual a 2
  
SELECT StatusDoPedido, COUNT(*) as Quantidade FROM Pedido
GROUP BY StatusDoPedido
HAVING Quantidade >= 2;

--  projetando conteúdo na tela da tabela: Quantidade de produtos vendidos por UF, utilizando as relações entre tabelas
SELECT 
    RIGHT(Cl.Endereco, 2) as 'UF da entrega', 
    Rel.Quantidade as 'Quantidade'
FROM Pedido as Pe, Cliente as Cl, RelacaoClientePagamentoPedido as RelPg, RelacaoProdutoPedido as Rel
WHERE Cl.IDCliente = RelPg.Relacao_Pedido_IDCliente 
    and Pe.IDPedido = RelPg.Relacao_Cliente_IDPedido
    and Pe.IDPedido = Rel.Relacao_Produto_IDPedido;
    
--  projetando conteúdo na tela da tabela: Quantidade de produtos vendidos por UF, utilizando as clausulas JOIN

SELECT  
	RIGHT(Cl.Endereco, 2) as 'UF da entrega',
    Rel.Quantidade as 'Quantidade'
FROM Cliente as Cl
	INNER JOIN Pedido as Pe
	ON Cl.IDCliente = Pe.Pedido_IDCliente
	INNER JOIN RelacaoProdutoPedido as Rel
	ON Pe.IDPedido = Rel.Relacao_Produto_IDPedido;

--  projetando conteúdo na tela da tabela: Qual o valor faturado por UF, somando o custo de frete, utilizando as clausulas JOIN

SELECT  
	RIGHT(Cl.Endereco, 2) as 'UF da entrega',
    ROUND((Rel.Quantidade * Pr.Valor) + Pe.Frete,2) as 'Quantidade'
FROM Cliente as Cl
	INNER JOIN Pedido as Pe
	ON Cl.IDCliente = Pe.Pedido_IDCliente
	INNER JOIN RelacaoProdutoPedido as Rel
	ON Pe.IDPedido = Rel.Relacao_Produto_IDPedido
    INNER JOIN Produto as Pr
    ON Pr.IDProduto = Relacao_Pedido_IDProduto
ORDER BY Quantidade DESC;

