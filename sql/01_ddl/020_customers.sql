USE nexopay;
CREATE TABLE customers (
  customer_id        BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  tipo_cliente       ENUM('PF','PJ') NOT NULL,
  status_cliente     ENUM('prospect','ativo','suspenso','encerrado') NOT NULL DEFAULT 'prospect',
  kyc_status         ENUM('pendente','aprovado','reprovado') DEFAULT 'pendente',
  dt_cadastro        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by         VARCHAR(100),
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  updated_by         VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;