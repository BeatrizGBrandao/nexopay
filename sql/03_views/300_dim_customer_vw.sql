USE nexopay;

DROP VIEW IF EXISTS dim_customer_vw;

CREATE OR REPLACE VIEW dim_customer_vw AS
SELECT
  c.customer_id,
  c.tipo_cliente          AS customer_type,
  CASE WHEN c.tipo_cliente='PF' THEN pf.cpf ELSE pj.cnpj END AS tax_id,
  CASE WHEN c.tipo_cliente='PF' THEN pf.nome_completo ELSE pj.razao_social END AS display_name,
  CASE WHEN c.tipo_cliente='PJ' THEN pj.nome_fantasia ELSE NULL END AS trade_name,
  c.status_cliente,
  c.kyc_status,
  c.dt_cadastro,
  addr.cidade             AS city,
  addr.estado             AS state,
  addr.cep                AS postal_code,
  addr.pais               AS country,
  email.valor             AS email_principal
FROM customers c
LEFT JOIN customers_pf pf ON pf.customer_id = c.customer_id
LEFT JOIN customers_pj pj ON pj.customer_id = c.customer_id
LEFT JOIN (
  SELECT * FROM (
    SELECT a.*,
           ROW_NUMBER() OVER (
             PARTITION BY a.customer_id
             ORDER BY
               CASE WHEN a.tipo IN ('SEDE','RESIDENCIAL') THEN 0 ELSE 1 END,
               a.e_primario DESC,
               COALESCE(a.valid_from,'1900-01-01') DESC,
               a.address_id DESC
           ) AS rn
    FROM addresses a
  ) x WHERE x.rn = 1
) addr ON addr.customer_id = c.customer_id
LEFT JOIN (
  SELECT * FROM (
    SELECT ct.*,
           ROW_NUMBER() OVER (
             PARTITION BY ct.customer_id
             ORDER BY ct.e_primario DESC,
                      COALESCE(ct.verification_at,'1900-01-01') DESC,
                      ct.contact_id DESC
           ) AS rn
    FROM contacts ct
    WHERE ct.tipo = 'EMAIL'
  ) y WHERE y.rn = 1
) email ON email.customer_id = c.customer_id;

SHOW CREATE VIEW dim_customer_vw;

DESCRIBE dim_customer_vw;

SELECT * FROM dim_customer_vw;
