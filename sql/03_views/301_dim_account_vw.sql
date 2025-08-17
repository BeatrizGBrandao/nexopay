USE nexopay;

DROP VIEW IF EXISTS dim_account_vw;

CREATE OR REPLACE VIEW dim_account_vw AS
SELECT
  a.account_id,
  a.customer_id,
  c.tipo_cliente        AS customer_type,
  a.tipo_conta          AS account_type,
  a.status,
  a.opened_at,
  a.closed_at,
  a.canal_origem,
  a.id_agencia_origem   AS origin_agency_id,
  a.pix_enabled, a.boleto_enabled, a.card_enabled, a.loan_enabled
FROM accounts a
JOIN customers c ON c.customer_id = a.customer_id;

SHOW CREATE VIEW dim_account_vw;
DESCRIBE dim_account_vw;
SELECT * FROM dim_account_vw;
