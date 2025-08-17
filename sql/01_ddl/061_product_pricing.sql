USE nexopay;

CREATE TABLE product_pricing (
  product_pricing_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  product_id         BIGINT UNSIGNED NOT NULL,
  data_lancamento    DATE NOT NULL,
  data_fim           DATE,
  tipo_cliente       ENUM('PF','PJ','MEI','ALL') NOT NULL,
  tipo_taxa          ENUM('FIXED','PERCENT','MIXED','TIERED') NOT NULL,
  taxa_valor_fixo    DECIMAL(12,2) DEFAULT 0.00,
  taxa_porcentagem   DECIMAL(7,4)  DEFAULT 0.0000,  -- 0.0250 = 2.50%
  teto_tarifa        DECIMAL(12,2),
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by         VARCHAR(100),
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100),
  CONSTRAINT fk_pricing_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
  INDEX idx_pricing_product (product_id, tipo_cliente, data_lancamento),
  CHECK (taxa_valor_fixo >= 0),
  CHECK (taxa_porcentagem >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;