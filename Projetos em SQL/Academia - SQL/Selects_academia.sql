-- Selects Básicos do SQL

-- Selecionar todos os clientes com seus respectivos planos de assinatura:
SELECT clientes.nome, clientes.cod_matricula, planos.nome_plano
FROM clientes
JOIN planos ON clientes.id_plano_assinatura = planos.id;

-- Listar todos os produtos e serviços adquiridos em um pagamento específico:
SELECT pagamentos.id, produtos.nome_produto, servicos.nome_servico
FROM pagamentos
JOIN produtos ON pagamentos.id_produto = produtos.id
JOIN servicos ON pagamentos.id_servico = servicos.id
WHERE pagamentos.id = [ID_DO_PAGAMENTO];

-- Calcular o total pago por um cliente específico:
SELECT clientes.nome, SUM(produtos.valor + servicos.valor) AS total_pago
FROM clientes
JOIN pagamentos ON clientes.id = pagamentos.id_cliente
JOIN produtos ON pagamentos.id_produto = produtos.id
JOIN servicos ON pagamentos.id_servico = servicos.id
WHERE clientes.id = [ID_DO_CLIENTE]
GROUP BY clientes.nome;
	
-- Listar os clientes e seus respectivos profissionais responsáveis:
SELECT clientes.nome, clientes.sobrenome, funcionarios.nome AS nome_profissional
FROM clientes
JOIN funcionarios ON clientes.id_profissional_responsavel = funcionarios.id;

-- Selects mais detalhados
-- Detalhes sobre o cliente e seu plano de assinatura
SELECT
    clientes.nome,
    clientes.sobrenome,
    clientes.cpf,
    planos.nome_plano,
    planos.valor
FROM clientes
JOIN planos ON clientes.id_plano_assinatura = planos.id;

-- Informações sobre os produtos e serviços em um pagamento específico, incluindo o total pago:
SELECT
    pagamentos.id AS id_pagamento,
    pagamentos.data_pagamento,
    clientes.nome AS nome_cliente,
    produtos.nome_produto,
    produtos.valor AS valor_produto,
    servicos.nome_servico,
    servicos.valor AS valor_servico,
    (produtos.valor + servicos.valor) AS total_pago
FROM pagamentos
JOIN clientes ON pagamentos.id_cliente = clientes.id
LEFT JOIN produtos ON pagamentos.id_produto = produtos.id
LEFT JOIN servicos ON pagamentos.id_servico = servicos.id
WHERE pagamentos.id = [ID_DO_PAGAMENTO];


-- Detalhes da data de pagamento incluindo tudo solicitado, produto, serviço, assinatura e o valor total
SELECT
    CONCAT(clientes.nome, ' ', clientes.sobrenome) AS nome_cliente,
    planos.nome_plano,
    planos.valor AS valor_plano,
    produtos.nome_produto,
    produtos.valor AS valor_produto,
    servicos.nome_servico,
    servicos.valor AS valor_servico,
    pagamentos.qtd,
    (produtos.valor * pagamentos.qtd) AS total_produto,
    (servicos.valor * pagamentos.qtd) AS total_servico,
    (produtos.valor * pagamentos.qtd + servicos.valor * pagamentos.qtd) AS total_geral
FROM pagamentos
JOIN clientes ON pagamentos.id_cliente = clientes.id
JOIN planos ON clientes.id_plano_assinatura = planos.id
LEFT JOIN produtos ON pagamentos.id_produto = produtos.id
LEFT JOIN servicos ON pagamentos.id_servico = servicos.id;

-- Detalhes sobre os funcionários e seus respectivos clientes atendidos:
SELECT
    funcionarios.nome AS nome_profissional,
    clientes.nome AS nome_cliente,
    clientes.sobrenome AS sobrenome_cliente
FROM funcionarios
JOIN clientes ON funcionarios.id = clientes.id_profissional_responsavel;

-- Detalhes distintos por cliente - Gastos totais por clienteSELECT
    clientes.id AS id_cliente,
    CONCAT(clientes.nome, ' ', clientes.sobrenome) AS nome_cliente,
    SUM(produtos.valor * pagamentos.qtd + servicos.valor * pagamentos.qtd) AS gasto_total
FROM pagamentos
JOIN clientes ON pagamentos.id_cliente = clientes.id
LEFT JOIN produtos ON pagamentos.id_produto = produtos.id
LEFT JOIN servicos ON pagamentos.id_servico = servicos.id
GROUP BY clientes.id, nome_cliente;