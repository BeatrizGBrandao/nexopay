USE nexopay;

-- PJ: PK = FK (1:1 real com customers)
CREATE TABLE customers_pj (
  customer_id        BIGINT UNSIGNED PRIMARY KEY,
  razao_social       VARCHAR(180) NOT NULL,
  cnpj               CHAR(14) NOT NULL UNIQUE,
  nome_fantasia      VARCHAR(180),
  cnae_principal     VARCHAR(10),
  porte_empresarial  ENUM('MEI','ME','EPP','MEDIO','GRANDE'),
  matriz_filial_flag ENUM('MATRIZ','FILIAL') DEFAULT 'MATRIZ',
  regime_tributario  ENUM('MEI','SIMPLES','PRESUMIDO','REAL'),
  segmento           VARCHAR(80),
  CONSTRAINT fk_pj_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;