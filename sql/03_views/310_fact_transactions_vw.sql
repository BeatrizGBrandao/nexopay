USE nexopay;

DROP VIEW IF EXISTS fact_transactions_vw;

CREATE OR REPLACE VIEW fact_transactions_vw AS
SELECT
  t.transaction_id,
  t.account_id,
  t.customer_id,
  t.product_id,
  p.code              AS product_code,
  p.name              AS product_name,
  p.`group`           AS product_group,
  t.operation,
  t.amount,
  t.currency,
  t.status,
  t.created_at,
  t.settled_at,
  (t.status = 'SETTLED') AS is_settled,
  a.canal_origem,
  a.id_agencia_origem AS origin_agency_id,
  c.tipo_cliente      AS customer_type
FROM transactions t
JOIN accounts a   ON a.account_id   = t.account_id
JOIN customers c  ON c.customer_id  = t.customer_id
JOIN products  p  ON p.product_id   = t.product_id;

SHOW CREATE VIEW fact_transactions_vw;
DESCRIBE fact_transactions_vw; 
SELECT * FROM fact_transactions_vw
WHERE created_at BETWEEN '2020-01-01' AND '2025-12-31';