USE nexopay;

CREATE TABLE products (
  product_id         BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  code               VARCHAR(50) NOT NULL UNIQUE,  -- ex.: pix_send
  name               VARCHAR(100) NOT NULL,
  `group`            ENUM('PAGAMENTOS','CARTOES','CREDITO','INVESTIMENTOS') NOT NULL,
  currency           CHAR(3) NOT NULL DEFAULT 'BRL',
  is_active          BOOLEAN NOT NULL DEFAULT 1,
  data_lancamento    DATE,
  data_fim           DATE,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by         VARCHAR(100),
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;