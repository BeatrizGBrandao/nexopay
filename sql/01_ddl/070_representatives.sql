USE nexopay;

-- Representantes da PJ (PJ -> PF)
CREATE TABLE representatives (
  representante_id   BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  tipo_representante ENUM('LEGAL','PROCURADOR') NOT NULL,
  tipo_permissao     ENUM('GERAL','BANCARIO','FISCAL','OUTROS') NOT NULL,
  valido_de          DATE NOT NULL,
  valido_ate         DATE,
  status             ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO',
  customer_pj_id     BIGINT UNSIGNED NOT NULL,
  customer_pf_id     BIGINT UNSIGNED NOT NULL,
  created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_rep_pj FOREIGN KEY (customer_pj_id) REFERENCES customers_pj(customer_id) ON DELETE CASCADE,
  CONSTRAINT fk_rep_pf FOREIGN KEY (customer_pf_id) REFERENCES customers_pf(customer_id) ON DELETE CASCADE,
  CHECK (valido_ate IS NULL OR valido_ate > valido_de)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;