USE nexopay;

-- PF: PK = FK (1:1 real com customers)
CREATE TABLE customers_pf (
  customer_id        BIGINT UNSIGNED PRIMARY KEY,
  nome_completo      VARCHAR(150) NOT NULL,
  cpf                CHAR(11) NOT NULL UNIQUE,
  dt_nascimento      DATE,
  nome_mae           VARCHAR(150),
  sexo               ENUM('F','M','OUTRO','NAO_INFORMADO') DEFAULT 'NAO_INFORMADO',
  profissao          VARCHAR(100),
  renda_mensal_declarada DECIMAL(12,2),
  CONSTRAINT fk_pf_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;