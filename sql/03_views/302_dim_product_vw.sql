USE nexopay;

DROP VIEW IF EXISTS dim_product_vw;

CREATE OR REPLACE VIEW dim_product_vw AS
SELECT
  p.product_id,
  p.code,
  p.name,
  p.`group`    AS product_group,
  p.currency,
  p.is_active,
  p.data_lancamento,
  p.data_fim,
  cur.regra_liquidacao   AS current_settlement_rule,
  cur.count_rule         AS current_count_rule,
  cur.supports_refund,
  cur.supports_chargeback
FROM products p
LEFT JOIN (
  SELECT * FROM (
    SELECT ps.*,
           ROW_NUMBER() OVER (
             PARTITION BY ps.product_id
             ORDER BY ps.data_lancamento DESC, ps.product_settlement_id DESC
           ) AS rn
    FROM product_settlement ps
    WHERE (ps.data_fim IS NULL OR ps.data_fim > CURDATE())
      AND ps.data_lancamento <= CURDATE()
  ) z WHERE z.rn = 1
) cur ON cur.product_id = p.product_id;

SHOW CREATE VIEW dim_product_vw;
DESCRIBE dim_product_vw;
SELECT * FROM dim_product_vw;
