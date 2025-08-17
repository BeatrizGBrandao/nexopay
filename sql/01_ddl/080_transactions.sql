USE nexopay;

CREATE TABLE transactions (
  transaction_id     BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  account_id         BIGINT UNSIGNED NOT NULL,
  customer_id        BIGINT UNSIGNED NOT NULL,
  product_id         BIGINT UNSIGNED NOT NULL,
  operation          ENUM('AUTH','CAPTURE','EMISSION','PAYMENT','TRANSFER','OTHER') NOT NULL,
  amount             DECIMAL(18,2) NOT NULL,
  currency           CHAR(3) NOT NULL DEFAULT 'BRL',
  status             ENUM('CREATED','AUTHORIZED','CAPTURED','SETTLED','FAILED','CANCELED','REVERSED','CHARGEBACK') NOT NULL,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  settled_at         DATETIME NULL,
  error_code         VARCHAR(50),
  idempotency_key    VARCHAR(64),
  external_ref       VARCHAR(64),
  reversed_of_tx_id  BIGINT UNSIGNED NULL,
  pricing_id         BIGINT UNSIGNED NULL,
  settlement_id      BIGINT UNSIGNED NULL,
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100),
  CONSTRAINT fk_tx_account   FOREIGN KEY (account_id)  REFERENCES accounts(account_id),
  CONSTRAINT fk_tx_customer  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_tx_product   FOREIGN KEY (product_id)  REFERENCES products(product_id),
  CONSTRAINT fk_tx_pricing   FOREIGN KEY (pricing_id)  REFERENCES product_pricing(product_pricing_id),
  CONSTRAINT fk_tx_settle    FOREIGN KEY (settlement_id) REFERENCES product_settlement(product_settlement_id),
  CONSTRAINT fk_tx_reversed  FOREIGN KEY (reversed_of_tx_id) REFERENCES transactions(transaction_id),
  UNIQUE KEY uq_idem_per_account (account_id, idempotency_key),
  INDEX idx_tx_cust_settle (customer_id, settled_at),
  INDEX idx_tx_prod_settle (product_id, settled_at),
  INDEX idx_tx_status_settle (status, settled_at)
  -- Regra de amount != 0 quando SETTLED: implemente via trigger se necessário.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
