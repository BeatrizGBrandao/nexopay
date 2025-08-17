USE nexopay;

-- Contatos (1:N)
CREATE TABLE contacts (
  contact_id         BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  customer_id        BIGINT UNSIGNED NOT NULL,
  tipo               ENUM('EMAIL','PHONE','WHATSAPP') NOT NULL,
  valor              VARCHAR(254) NOT NULL,
  e_primario         BOOLEAN NOT NULL DEFAULT 0,
  e_verificado       BOOLEAN NOT NULL DEFAULT 0,
  verification_at    DATETIME,
  valid_from         DATE,
  valid_to           DATE,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_contact_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
  INDEX idx_contact_customer (customer_id, tipo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;