USE nexopay;

-- Contas (cliente 1:N contas)
CREATE TABLE accounts (
  account_id         BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  customer_id        BIGINT UNSIGNED NOT NULL,
  codigo_banco       VARCHAR(10) NOT NULL,         -- ISPB ou código
  codigo_agencia     VARCHAR(10) NOT NULL,
  numero_conta       VARCHAR(20) NOT NULL,
  tipo_conta         ENUM('PAYMENT','CHECKING','SAVINGS','PJ_PAYMENT') NOT NULL,
  status             ENUM('PENDING','ACTIVE','SUSPENDED','FROZEN','CLOSED') NOT NULL DEFAULT 'PENDING',
  opened_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  closed_at          DATETIME NULL,
  canal_origem       ENUM('APP','AGENCIA','PARCEIRO','API'),
  id_agencia_origem  VARCHAR(20),
  pix_enabled        BOOLEAN DEFAULT 0,
  boleto_enabled     BOOLEAN DEFAULT 0,
  card_enabled       BOOLEAN DEFAULT 0,
  loan_enabled       BOOLEAN DEFAULT 0,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by         VARCHAR(100),
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100),
  CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  UNIQUE KEY uq_bank_account (codigo_banco, codigo_agencia, numero_conta),
  INDEX idx_account_customer (customer_id, status),
  INDEX idx_account_opened (status, opened_at),
  INDEX idx_account_agency (canal_origem, opened_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;