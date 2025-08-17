USE nexopay;

CREATE TABLE product_settlement (
  product_settlement_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  product_id         BIGINT UNSIGNED NOT NULL,
  data_lancamento    DATE NOT NULL,
  data_fim           DATE,
  regra_liquidacao   ENUM('D+0','D+1','D+2','T+30','T+2') NOT NULL,
  supports_refund    BOOLEAN NOT NULL DEFAULT 0,
  supports_chargeback BOOLEAN NOT NULL DEFAULT 0,
  count_rule         ENUM('EMISSION','PAYMENT','SETTLEMENT') NOT NULL,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by         VARCHAR(100),
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100),
  CONSTRAINT fk_settle_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
  INDEX idx_settle_product (product_id, data_lancamento)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;