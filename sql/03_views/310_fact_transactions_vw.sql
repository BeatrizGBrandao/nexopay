USE nexopay;

DROP VIEW IF EXISTS fact_transactions_vw;

CREATE OR REPLACE VIEW fact_transactions_vw AS
SELECT
  t.transaction_id,
  t.account_id,
  t.customer_id,
  t.product_id,

  -- Produto
  p.code                AS product_code,
  p.name                AS product_name,
  p.`group`             AS product_group,

  -- Operação / valores
  t.operation,
  t.amount,
  t.currency,
  t.status,
  t.created_at,
  t.settled_at,
  (t.status = 'SETTLED')                           AS is_settled,
  CASE WHEN t.status = 'SETTLED' THEN ABS(t.amount) ELSE 0 END AS gmv_amount,

  -- Conta / origem
  a.canal_origem,
  a.id_agencia_origem   AS origin_agency_id,

  -- Cliente
  c.tipo_cliente        AS customer_type,           -- 'PF' ou 'PJ'
  (c.tipo_cliente = 'PF')                           AS is_pf,
  (c.tipo_cliente = 'PJ')                           AS is_pj,
  CASE WHEN c.tipo_cliente = 'PF' THEN pf.renda_mensal_declarada ELSE NULL END AS renda_mensal_declarada

FROM transactions t
JOIN accounts   a  ON a.account_id   = t.account_id
JOIN customers  c  ON c.customer_id  = t.customer_id
LEFT JOIN customers_pf pf 
       ON pf.customer_id = c.customer_id AND c.tipo_cliente = 'PF'  -- <- necessário para trazer a renda apenas de PF
JOIN products   p  ON p.product_id   = t.product_id;


SHOW CREATE VIEW fact_transactions_vw;
DESCRIBE fact_transactions_vw; 
SELECT * FROM fact_transactions_vw
WHERE created_at BETWEEN '2020-01-01' AND '2025-12-31';