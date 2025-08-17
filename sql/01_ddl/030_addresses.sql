USE nexopay;

-- Endereços (1:N)
CREATE TABLE addresses (
  address_id         BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  customer_id        BIGINT UNSIGNED NOT NULL,
  tipo               ENUM('RESIDENCIAL','COMERCIAL','COBRANCA','CORRESPONDENCIA','SEDE','FILIAL') NOT NULL,
  rua                VARCHAR(150) NOT NULL,
  numero             VARCHAR(20),
  complemento        VARCHAR(60),
  bairro             VARCHAR(80),
  cidade             VARCHAR(100) NOT NULL,
  estado             CHAR(2) NOT NULL,
  cep                CHAR(8) NOT NULL,
  pais               CHAR(2) NOT NULL DEFAULT 'BR',
  e_primario         BOOLEAN NOT NULL DEFAULT 0,
  valid_from         DATE,
  valid_to           DATE,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_addr_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
  INDEX idx_addr_customer (customer_id, tipo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;