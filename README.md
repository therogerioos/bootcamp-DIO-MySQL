# Bootcamp DIO & Potência Tech - Ciência de Dados com Python
### Projeto de banco de dados - Desafio 1

Este repositório foi criado para a entrega do desafio de projeto da DIO sobre desenvolvimento lógico de um banco de dados utilizando o diagrama EER e, consequentemente, o script dos schemas de um banco de dados relacional utilizando o MySQL.

Abaixo está a descrição de todos os passos utilizados neste projeto:

## Diagrama EER
### Clique aqui: [bootcamp-diagrama-EER-Desafio-de-Projeto-1](https://github.com/therogerioos/bootcamp-DIO-MySQL/blob/main/bootcamp-diagrama-EER-Desafio-de-Projeto-1.mwb)
Este arquivo contém o diagrama utilizado na construção do projeto lógico do banco de dados relacional. Esse modelo é uma replicação solicitada pelo especialista da DIO, com customização de nomenclaturas de entidades e atributos.

Foi realizada a inserção da entidade "Pagamento" e sua relação entre "Pagamento", "Cliente" e "Produto". Além disso, foi feita a inclusão do campo "código de rastreio" em "Pedido".

Também foi adicionada uma validação para distinguir se o cliente é uma Pessoa Jurídica (PJ) ou Pessoa Física (PF) na entidade "Cliente".

## Criação dos schemas do banco de dados
### Clique aqui: [bootcamp-script-SQL-Desafio-de-Projeto-1](https://github.com/therogerioos/bootcamp-DIO-MySQL/blob/main/bootcamp-script-SQL-Desafio-de-Projeto-1.sql)
Foram criadas as tabelas com base no diagrama apresentado anteriormente, incluindo validações com ENUM e geração de chaves estrangeiras (FK) com atualização em cascata, assim como em exclusão. Para as devidas validações, é possível criar um banco de dados na sequência contida neste arquivo que não ocorrerão erros de criação.

## Inserção de dados fakes no banco de dados
### Clique aqui: [bootcamp-inserção-de-dados-SQL-Desafio-de-Projeto-1](https://github.com/therogerioos/bootcamp-DIO-MySQL/blob/main/bootcamp-inser%C3%A7%C3%A3o-de-dados-SQL-Desafio-de-Projeto-1.sql)
As inserções de dados contêm informações fictícias para ilustrar o funcionamento do banco de dados e demonstrar a didática das consultas. Da mesma forma, é possível importar os dados na sequência demonstrada no arquivo.

## Consultas no banco de dados
### Clique aqui: [bootcamp-consulta-de-dados-SQL-Desafio-de-Projeto-1](https://github.com/therogerioos/bootcamp-DIO-MySQL/blob/main/bootcamp-consulta-de-dados-SQL-Desafio-de-Projeto-1.sql)
Realizamos diversas consultas com base em questionamentos criados, como por exemplo:
* Compras por UF.
* Status de pedidos.
* Relação de pedidos ao seus compradores com dados de entrega.
* Ponderação das notas de avaliação entre Ruim, Regular e Bom - utilização da CASE WHEN THEN
* Valor faturado pelas compras.
* Agrupamento e filtragem Having.
* Uso de JOIN e de junções com o próprio relacionamento das tabelas (possuem consultas dos dois modos para efeitos comparativos).

