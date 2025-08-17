USE nexopay;

-- ========================
-- PRODUTOS (garantia do catálogo)
-- ========================
INSERT INTO products (product_id, code, name, `group`, currency, is_active, data_lancamento, created_by) VALUES
  (1,'pix_send','PIX Envio','PAGAMENTOS','BRL',1,'2024-01-01','seed'),
  (2,'pix_receive','PIX Recebimento','PAGAMENTOS','BRL',1,'2024-01-01','seed'),
  (3,'boleto_issue','Boleto Emissão','PAGAMENTOS','BRL',1,'2024-01-01','seed'),
  (4,'boleto_pay','Boleto Pagamento','PAGAMENTOS','BRL',1,'2024-01-01','seed'),
  (5,'card_debit','Cartão Débito','CARTOES','BRL',1,'2024-01-01','seed'),
  (6,'card_credit','Cartão Crédito','CARTOES','BRL',1,'2024-01-01','seed');

-- PRECIFICAÇÃO (vigência)
INSERT INTO product_pricing (product_pricing_id, product_id, data_lancamento, data_fim, tipo_cliente, tipo_taxa, taxa_valor_fixo, taxa_porcentagem, teto_tarifa, created_by) VALUES
  (1,2,'2024-01-01',NULL,'PF','FIXED',0.00,0.0000,NULL,'seed'),
  (2,2,'2024-01-01',NULL,'PJ','FIXED',0.80,0.0000,NULL,'seed'),
  (3,2,'2024-01-01',NULL,'MEI','FIXED',0.80,0.0000,NULL,'seed'),
  (4,3,'2024-01-01',NULL,'ALL','FIXED',3.50,0.0000,NULL,'seed'),
  (5,5,'2024-01-01',NULL,'ALL','PERCENT',0.00,0.0250,NULL,'seed'),
  (6,6,'2024-01-01','2025-06-30','ALL','PERCENT',0.00,0.0400,NULL,'seed'),
  (7,6,'2025-07-01',NULL,'ALL','PERCENT',0.00,0.0380,NULL,'seed');

-- LIQUIDAÇÃO (vigência)
INSERT INTO product_settlement (product_settlement_id, product_id, data_lancamento, data_fim, regra_liquidacao, supports_refund, supports_chargeback, count_rule, created_by) VALUES
  (1,1,'2024-01-01',NULL,'D+0',1,0,'SETTLEMENT','seed'),
  (2,2,'2024-01-01',NULL,'D+0',1,0,'SETTLEMENT','seed'),
  (3,3,'2024-01-01',NULL,'D+0',0,0,'EMISSION','seed'),
  (4,4,'2024-01-01',NULL,'D+1',0,0,'SETTLEMENT','seed'),
  (5,5,'2024-01-01',NULL,'D+1',0,0,'SETTLEMENT','seed'),
  (6,6,'2024-01-01',NULL,'T+30',0,1,'SETTLEMENT','seed');

-- ========================
-- CLIENTES (14 PF + 8 PJ)  → IDs 1..22
-- ========================
INSERT INTO customers (customer_id, tipo_cliente, status_cliente, kyc_status, dt_cadastro, created_by) VALUES
  (1,'PF','ativo','aprovado','2025-05-20 09:00:00','seed'),
  (2,'PF','ativo','aprovado','2025-05-21 10:00:00','seed'),
  (3,'PF','ativo','aprovado','2025-05-22 11:00:00','seed'),
  (4,'PF','ativo','aprovado','2025-05-23 12:00:00','seed'),
  (5,'PF','ativo','aprovado','2025-05-24 13:00:00','seed'),
  (6,'PF','ativo','aprovado','2025-05-25 14:00:00','seed'),
  (7,'PF','ativo','aprovado','2025-05-26 15:00:00','seed'),
  (8,'PF','ativo','aprovado','2025-05-27 16:00:00','seed'),
  (9,'PF','ativo','aprovado','2025-05-28 17:00:00','seed'),
  (10,'PF','ativo','aprovado','2025-05-29 18:00:00','seed'),
  (11,'PF','ativo','aprovado','2025-05-30 09:30:00','seed'),
  (12,'PF','ativo','aprovado','2025-05-31 10:30:00','seed'),
  (13,'PF','ativo','aprovado','2025-06-01 11:30:00','seed'),
  (14,'PF','ativo','aprovado','2025-06-02 12:30:00','seed'),

  (15,'PJ','ativo','aprovado','2025-05-20 09:10:00','seed'),
  (16,'PJ','ativo','aprovado','2025-05-21 10:10:00','seed'),
  (17,'PJ','ativo','aprovado','2025-05-22 11:10:00','seed'),
  (18,'PJ','ativo','aprovado','2025-05-23 12:10:00','seed'),
  (19,'PJ','ativo','aprovado','2025-05-24 13:10:00','seed'),
  (20,'PJ','ativo','aprovado','2025-05-25 14:10:00','seed'),
  (21,'PJ','ativo','aprovado','2025-05-26 15:10:00','seed'),
  (22,'PJ','ativo','aprovado','2025-05-27 16:10:00','seed');

-- PF
INSERT INTO customers_pf (customer_id, nome_completo, cpf, dt_nascimento, nome_mae, sexo, profissao, renda_mensal_declarada) VALUES
 (1,'Ana Paula Souza','70000000001','1995-03-12','Maria Souza','F','Analista',3500.00),
 (2,'Bruno Azevedo','70000000002','1993-07-19','Claudia Azevedo','M','Dev',6200.00),
 (3,'Carla Nogueira','70000000003','1990-01-05','Ivone Nogueira','F','Designer',4800.00),
 (4,'Diego Martins','70000000004','1988-11-23','Rosa Martins','M','Vendedor',3200.00),
 (5,'Eduarda Lima','70000000005','1996-04-10','Sonia Lima','F','Atendimento',2800.00),
 (6,'Fabio Rocha','70000000006','1992-02-18','Luzia Rocha','M','Analista',5100.00),
 (7,'Gabriela Alves','70000000007','1994-09-02','Tereza Alves','F','Marketing',5400.00),
 (8,'Henrique Pires','70000000008','1991-12-12','Neusa Pires','M','Professor',4100.00),
 (9,'Isabela Duarte','70000000009','1997-06-21','Vera Duarte','F','Engenheira',9000.00),
 (10,'João Pedro Silveira','70000000010','1989-08-30','Marta Silveira','M','Arquiteto',7800.00),
 (11,'Karina Melo','70000000011','1998-05-04','Leda Melo','F','Estudante',1500.00),
 (12,'Luiz Otávio Prado','70000000012','1987-03-15','Regina Prado','M','Autônomo',3500.00),
 (13,'Mariana Queiroz','70000000013','1993-10-27','Silvia Queiroz','F','Advogada',12000.00),
 (14,'Nathan Ribeiro','70000000014','1991-01-17','Celia Ribeiro','M','Analista',5200.00);

-- PJ
INSERT INTO customers_pj (customer_id, razao_social, cnpj, nome_fantasia, cnae_principal, porte_empresarial, matriz_filial_flag, regime_tributario, segmento) VALUES
 (15,'Mercadinho Sol LTDA','80000000000001','Mercado Sol','4711301','ME','MATRIZ','SIMPLES','Varejo'),
 (16,'Padaria Bom Trigo ME','80000000000002','Bom Trigo','4721100','ME','MATRIZ','SIMPLES','Alimentos'),
 (17,'Tech Serviços LTDA','80000000000003','TechServ','6201501','ME','MATRIZ','SIMPLES','Serviços'),
 (18,'Clínica Bem Estar LTDA','80000000000004','Bem Estar','8640201','ME','MATRIZ','SIMPLES','Saúde'),
 (19,'Loja Estilo EPP','80000000000005','Estilo','4781400','EPP','MATRIZ','PRESUMIDO','Moda'),
 (20,'Auto Peças Rápidas LTDA','80000000000006','PeçaJá','4530703','ME','MATRIZ','SIMPLES','Auto'),
 (21,'Café da Praça MEI','80000000000007','Café Praça','5611201','MEI','MATRIZ','MEI','Alimentos'),
 (22,'Academia Strong LTDA','80000000000008','StrongFit','9311300','ME','MATRIZ','SIMPLES','Fitness');

-- ENDEREÇOS (1 por cliente, principal)
INSERT INTO addresses (address_id, customer_id, tipo, rua, numero, bairro, cidade, estado, cep, pais, e_primario, valid_from) VALUES
 (1,1,'RESIDENCIAL','Rua A','10','Centro','São Paulo','SP','01001001','BR',1,'2025-01-01'),
 (2,2,'RESIDENCIAL','Rua B','20','Centro','São Paulo','SP','01001002','BR',1,'2025-01-01'),
 (3,3,'RESIDENCIAL','Rua C','30','Centro','São Paulo','SP','01001003','BR',1,'2025-01-01'),
 (4,4,'RESIDENCIAL','Rua D','40','Centro','São Paulo','SP','01001004','BR',1,'2025-01-01'),
 (5,5,'RESIDENCIAL','Rua E','50','Centro','São Paulo','SP','01001005','BR',1,'2025-01-01'),
 (6,6,'RESIDENCIAL','Rua F','60','Centro','São Paulo','SP','01001006','BR',1,'2025-01-01'),
 (7,7,'RESIDENCIAL','Rua G','70','Centro','São Paulo','SP','01001007','BR',1,'2025-01-01'),
 (8,8,'RESIDENCIAL','Rua H','80','Centro','São Paulo','SP','01001008','BR',1,'2025-01-01'),
 (9,9,'RESIDENCIAL','Rua I','90','Centro','São Paulo','SP','01001009','BR',1,'2025-01-01'),
 (10,10,'RESIDENCIAL','Rua J','100','Centro','São Paulo','SP','01001010','BR',1,'2025-01-01'),
 (11,11,'RESIDENCIAL','Rua K','110','Centro','São Paulo','SP','01001011','BR',1,'2025-01-01'),
 (12,12,'RESIDENCIAL','Rua L','120','Centro','São Paulo','SP','01001012','BR',1,'2025-01-01'),
 (13,13,'RESIDENCIAL','Rua M','130','Centro','São Paulo','SP','01001013','BR',1,'2025-01-01'),
 (14,14,'RESIDENCIAL','Rua N','140','Centro','São Paulo','SP','01001014','BR',1,'2025-01-01'),
 (15,15,'SEDE','Av. Sol','150','Centro','São Paulo','SP','02002001','BR',1,'2025-01-01'),
 (16,16,'SEDE','Av. Trigo','160','Centro','São Paulo','SP','02002002','BR',1,'2025-01-01'),
 (17,17,'SEDE','Rua Tech','170','TechPark','São Paulo','SP','02002003','BR',1,'2025-01-01'),
 (18,18,'SEDE','Rua Saúde','180','Centro','São Paulo','SP','02002004','BR',1,'2025-01-01'),
 (19,19,'SEDE','Rua Moda','190','Centro','São Paulo','SP','02002005','BR',1,'2025-01-01'),
 (20,20,'SEDE','Rua Auto','200','Centro','São Paulo','SP','02002006','BR',1,'2025-01-01'),
 (21,21,'SEDE','Rua Café','210','Centro','São Paulo','SP','02002007','BR',1,'2025-01-01'),
 (22,22,'SEDE','Rua Fitness','220','Centro','São Paulo','SP','02002008','BR',1,'2025-01-01');

-- CONTATOS (email principal)
INSERT INTO contacts (contact_id, customer_id, tipo, valor, e_primario, e_verificado, verification_at) VALUES
 (1,1,'EMAIL','pf01@example.com',1,1,'2025-06-01'),
 (2,2,'EMAIL','pf02@example.com',1,1,'2025-06-01'),
 (3,3,'EMAIL','pf03@example.com',1,1,'2025-06-01'),
 (4,4,'EMAIL','pf04@example.com',1,1,'2025-06-01'),
 (5,5,'EMAIL','pf05@example.com',1,1,'2025-06-01'),
 (6,6,'EMAIL','pf06@example.com',1,1,'2025-06-01'),
 (7,7,'EMAIL','pf07@example.com',1,1,'2025-06-01'),
 (8,8,'EMAIL','pf08@example.com',1,1,'2025-06-01'),
 (9,9,'EMAIL','pf09@example.com',1,1,'2025-06-01'),
 (10,10,'EMAIL','pf10@example.com',1,1,'2025-06-01'),
 (11,11,'EMAIL','pf11@example.com',1,1,'2025-06-01'),
 (12,12,'EMAIL','pf12@example.com',1,1,'2025-06-01'),
 (13,13,'EMAIL','pf13@example.com',1,1,'2025-06-01'),
 (14,14,'EMAIL','pf14@example.com',1,1,'2025-06-01'),
 (15,15,'EMAIL','contato@mercadosol.com.br',1,1,'2025-06-01'),
 (16,16,'EMAIL','financeiro@bomtrigo.com.br',1,1,'2025-06-01'),
 (17,17,'EMAIL','financeiro@techserv.com.br',1,1,'2025-06-01'),
 (18,18,'EMAIL','contato@bemestar.com.br',1,1,'2025-06-01'),
 (19,19,'EMAIL','contato@lojaestilo.com.br',1,1,'2025-06-01'),
 (20,20,'EMAIL','financeiro@pecaja.com.br',1,1,'2025-06-01'),
 (21,21,'EMAIL','cafepraça@exemplo.com',1,1,'2025-06-01'),
 (22,22,'EMAIL','contato@strongfit.com.br',1,1,'2025-06-01');

-- CONTAS (30 no total)  — números únicos por banco/agência
INSERT INTO accounts (account_id, customer_id, codigo_banco, codigo_agencia, numero_conta, tipo_conta, status, opened_at, canal_origem, id_agencia_origem, pix_enabled, boleto_enabled, card_enabled) VALUES
 -- PF (18 contas)
 (1,1,'341','0001','1000001','PAYMENT','ACTIVE','2025-06-01 10:00:00','APP',NULL,1,1,0),
 (2,1,'341','0001','1000002','SAVINGS','ACTIVE','2025-06-01 10:05:00','APP',NULL,1,0,0),
 (3,2,'341','0001','1000003','PAYMENT','ACTIVE','2025-06-02 10:00:00','APP',NULL,1,1,0),
 (4,3,'341','0001','1000004','PAYMENT','ACTIVE','2025-06-02 10:05:00','APP',NULL,1,1,0),
 (5,4,'341','0001','1000005','PAYMENT','ACTIVE','2025-06-03 10:05:00','APP',NULL,1,1,0),
 (6,5,'341','0001','1000006','PAYMENT','ACTIVE','2025-06-03 10:10:00','APP',NULL,1,1,0),
 (7,6,'341','0001','1000007','PAYMENT','ACTIVE','2025-06-03 10:15:00','APP',NULL,1,1,0),
 (8,7,'341','0001','1000008','PAYMENT','ACTIVE','2025-06-04 10:15:00','APP',NULL,1,1,0),
 (9,8,'341','0001','1000009','PAYMENT','ACTIVE','2025-06-04 10:20:00','APP',NULL,1,1,0),
 (10,9,'341','0001','1000010','PAYMENT','ACTIVE','2025-06-04 11:00:00','APP',NULL,1,1,0),
 (11,10,'341','0001','1000011','PAYMENT','ACTIVE','2025-06-04 11:05:00','APP',NULL,1,1,0),
 (12,11,'341','0001','1000012','PAYMENT','ACTIVE','2025-06-05 10:00:00','APP',NULL,1,1,0),
 (13,12,'341','0001','1000013','PAYMENT','ACTIVE','2025-06-05 10:05:00','APP',NULL,1,1,0),
 (14,13,'341','0001','1000014','PAYMENT','ACTIVE','2025-06-05 10:10:00','APP',NULL,1,1,0),
 (15,14,'341','0001','1000015','PAYMENT','ACTIVE','2025-06-05 10:15:00','APP',NULL,1,1,0),
 (16,13,'341','0001','1000016','SAVINGS','ACTIVE','2025-06-06 09:00:00','APP',NULL,1,0,0),
 (17,10,'341','0001','1000017','SAVINGS','ACTIVE','2025-06-06 09:10:00','APP',NULL,1,0,0),
 (18,8,'341','0001','1000018','SAVINGS','ACTIVE','2025-06-06 09:20:00','APP',NULL,1,0,0),

 -- PJ (12 contas)
 (19,15,'341','0001','2000001','PJ_PAYMENT','ACTIVE','2025-06-01 09:30:00','AGENCIA','AG-001',1,1,1),
 (20,16,'341','0001','2000002','PJ_PAYMENT','ACTIVE','2025-06-01 09:35:00','AGENCIA','AG-001',1,1,1),
 (21,17,'341','0001','2000003','PJ_PAYMENT','ACTIVE','2025-06-02 09:30:00','API',NULL,1,1,1),
 (22,18,'341','0001','2000004','PJ_PAYMENT','ACTIVE','2025-06-02 09:35:00','API',NULL,1,1,1),
 (23,19,'341','0001','2000005','PJ_PAYMENT','ACTIVE','2025-06-02 09:40:00','AGENCIA','AG-002',1,1,1),
 (24,20,'341','0001','2000006','PJ_PAYMENT','ACTIVE','2025-06-02 09:45:00','AGENCIA','AG-002',1,1,1),
 (25,21,'341','0001','2000007','PJ_PAYMENT','ACTIVE','2025-06-03 09:30:00','PARCEIRO',NULL,1,1,1),
 (26,22,'341','0001','2000008','PJ_PAYMENT','ACTIVE','2025-06-03 09:35:00','PARCEIRO',NULL,1,1,1),
 (27,17,'341','0001','2000009','PJ_PAYMENT','ACTIVE','2025-06-03 09:40:00','API',NULL,1,1,1),
 (28,19,'341','0001','2000010','PJ_PAYMENT','ACTIVE','2025-06-03 09:45:00','AGENCIA','AG-002',1,1,1),
 (29,20,'341','0001','2000011','PJ_PAYMENT','ACTIVE','2025-06-03 09:50:00','AGENCIA','AG-002',1,1,1),
 (30,22,'341','0001','2000012','PJ_PAYMENT','ACTIVE','2025-06-03 09:55:00','PARCEIRO',NULL,1,1,1);

-- REPRESENTANTES (cada PJ tem um PF legal)
INSERT INTO representantes (representante_id, tipo_representante, tipo_permissao, valido_de, valido_ate, status, customer_pj_id, customer_pf_id) VALUES
 (1,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',15,1),
 (2,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',16,2),
 (3,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',17,3),
 (4,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',18,4),
 (5,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',19,5),
 (6,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',20,6),
 (7,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',21,7),
 (8,'LEGAL','GERAL','2025-01-01',NULL,'ATIVO',22,8);

-- ========================
-- TRANSAÇÕES (~90 linhas)
-- Regras: entrada +, saída - ; GMV considera apenas status = SETTLED (e ABS(amount)).
-- pix_send=1 (settlement_id=1), pix_receive=2 (2), boleto_issue=3 (3), boleto_pay=4 (4),
-- card_debit=5 (5), card_credit=6 (6).
-- ========================

-- PF: transações básicas (PIX)
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 (1,1,1,1,'TRANSFER',-80.00,'BRL','SETTLED','2025-06-10 08:10:00','2025-06-10 08:10:00','a1-p1','PIX-0001',NULL,1),
 (2,1,1,2,'TRANSFER',120.00,'BRL','SETTLED','2025-06-11 09:00:00','2025-06-11 09:00:00','a1-p2','PIX-0002',1,2),
 (3,2,1,2,'TRANSFER',45.00,'BRL','SETTLED','2025-06-15 10:20:00','2025-06-15 10:20:00','a2-p1','PIX-0003',1,2),

 (4,3,2,1,'TRANSFER',-50.00,'BRL','SETTLED','2025-06-12 08:00:00','2025-06-12 08:00:00','a3-p1','PIX-0010',NULL,1),
 (5,3,2,2,'TRANSFER',200.00,'BRL','SETTLED','2025-06-13 09:30:00','2025-06-13 09:30:00','a3-p2','PIX-0011',1,2),

 (6,4,3,2,'TRANSFER',150.00,'BRL','SETTLED','2025-06-14 11:00:00','2025-06-14 11:00:00','a4-p1','PIX-0020',1,2),
 (7,4,3,1,'TRANSFER',-30.00,'BRL','FAILED','2025-06-16 12:00:00',NULL,'a4-p2','PIX-0021',NULL,1),

 (8,5,4,1,'TRANSFER',-25.00,'BRL','SETTLED','2025-06-17 13:05:00','2025-06-17 13:05:00','a5-p1','PIX-0030',NULL,1),
 (9,5,4,2,'TRANSFER',90.00,'BRL','SETTLED','2025-06-20 09:10:00','2025-06-20 09:10:00','a5-p2','PIX-0031',1,2),

 (10,6,5,2,'TRANSFER',60.00,'BRL','SETTLED','2025-06-21 10:00:00','2025-06-21 10:00:00','a6-p1','PIX-0040',1,2),
 (11,7,6,1,'TRANSFER',-70.00,'BRL','SETTLED','2025-06-22 10:30:00','2025-06-22 10:30:00','a7-p1','PIX-0050',NULL,1),
 (12,8,7,2,'TRANSFER',130.00,'BRL','SETTLED','2025-06-23 11:00:00','2025-06-23 11:00:00','a8-p1','PIX-0060',1,2),
 (13,9,8,1,'TRANSFER',-40.00,'BRL','SETTLED','2025-06-24 12:00:00','2025-06-24 12:00:00','a9-p1','PIX-0070',NULL,1),
 (14,10,9,2,'TRANSFER',110.00,'BRL','SETTLED','2025-06-25 13:00:00','2025-06-25 13:00:00','a10-p1','PIX-0080',1,2),
 (15,11,10,2,'TRANSFER',95.00,'BRL','SETTLED','2025-06-26 14:00:00','2025-06-26 14:00:00','a11-p1','PIX-0090',1,2),
 (16,12,11,1,'TRANSFER',-60.00,'BRL','SETTLED','2025-06-27 15:00:00','2025-06-27 15:00:00','a12-p1','PIX-0100',NULL,1),
 (17,13,12,2,'TRANSFER',210.00,'BRL','SETTLED','2025-06-28 16:00:00','2025-06-28 16:00:00','a13-p1','PIX-0110',1,2),
 (18,14,13,2,'TRANSFER',340.00,'BRL','SETTLED','2025-06-29 17:00:00','2025-06-29 17:00:00','a14-p1','PIX-0120',1,2),
 (19,15,14,1,'TRANSFER',-75.00,'BRL','SETTLED','2025-06-30 18:00:00','2025-06-30 18:00:00','a15-p1','PIX-0130',NULL,1),
 (20,16,13,2,'TRANSFER',180.00,'BRL','SETTLED','2025-07-01 09:00:00','2025-07-01 09:00:00','a16-p1','PIX-0140',1,2),
 (21,17,10,2,'TRANSFER',150.00,'BRL','SETTLED','2025-07-02 10:00:00','2025-07-02 10:00:00','a17-p1','PIX-0150',1,2),
 (22,18,8,1,'TRANSFER',-55.00,'BRL','SETTLED','2025-07-03 11:00:00','2025-07-03 11:00:00','a18-p1','PIX-0160',NULL,1);

-- PJ: boletos, cartões e PIX recebidos
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 -- Mercadinho Sol (acc 19)
 (23,19,15,3,'EMISSION',0.00,'BRL','CREATED','2025-06-12 08:00:00',NULL,'a19-bol-001','BOL-015',4,3),
 (24,19,15,4,'PAYMENT',1800.00,'BRL','SETTLED','2025-06-15 09:00:00','2025-06-16 09:00:00','a19-bol-001-pay','BOL-015',NULL,4),
 (25,19,15,5,'CAPTURE',260.00,'BRL','SETTLED','2025-06-18 12:00:00','2025-06-19 12:00:00','a19-deb-001','DB-015',5,5),
 (26,19,15,6,'CAPTURE',1200.00,'BRL','SETTLED','2025-06-20 14:00:00','2025-07-20 14:00:00','a19-cred-001','CR-015',6,6),
 (27,19,15,2,'TRANSFER',900.00,'BRL','SETTLED','2025-06-22 15:00:00','2025-06-22 15:00:00','a19-pixrcv-001','PX-015',2,2),

 -- Padaria Bom Trigo (acc 20)
 (28,20,16,3,'EMISSION',0.00,'BRL','CREATED','2025-06-10 08:00:00',NULL,'a20-bol-001','BOL-016',4,3),
 (29,20,16,4,'PAYMENT',2200.00,'BRL','SETTLED','2025-06-12 10:00:00','2025-06-13 10:00:00','a20-bol-001-pay','BOL-016',NULL,4),
 (30,20,16,5,'CAPTURE',140.00,'BRL','SETTLED','2025-06-18 13:00:00','2025-06-19 13:00:00','a20-deb-001','DB-016',5,5),
 (31,20,16,6,'CAPTURE',800.00,'BRL','SETTLED','2025-07-05 11:00:00','2025-08-04 11:00:00','a20-cred-001','CR-016',7,6),
 (32,20,16,2,'TRANSFER',600.00,'BRL','SETTLED','2025-07-08 12:00:00','2025-07-08 12:00:00','a20-pixrcv-001','PX-016',2,2),

 -- TechServ (acc 21 e 27)
 (33,21,17,5,'CAPTURE',320.00,'BRL','SETTLED','2025-06-14 09:00:00','2025-06-15 09:00:00','a21-deb-001','DB-017',5,5),
 (34,21,17,6,'CAPTURE',1800.00,'BRL','SETTLED','2025-06-28 10:00:00','2025-07-28 10:00:00','a21-cred-001','CR-017',6,6),
 (35,27,17,6,'CAPTURE',2300.00,'BRL','SETTLED','2025-07-15 10:30:00','2025-08-14 10:30:00','a27-cred-002','CR-017B',7,6),
 (36,21,17,2,'TRANSFER',750.00,'BRL','SETTLED','2025-07-20 11:00:00','2025-07-20 11:00:00','a21-pixrcv-001','PX-017',2,2),

 -- Clínica Bem Estar (acc 22)
 (37,22,18,3,'EMISSION',0.00,'BRL','CREATED','2025-06-16 08:00:00',NULL,'a22-bol-001','BOL-018',4,3),
 (38,22,18,4,'PAYMENT',3100.00,'BRL','SETTLED','2025-06-18 09:30:00','2025-06-19 09:30:00','a22-bol-001-pay','BOL-018',NULL,4),
 (39,22,18,5,'CAPTURE',220.00,'BRL','SETTLED','2025-06-21 12:00:00','2025-06-22 12:00:00','a22-deb-001','DB-018',5,5),
 (40,22,18,6,'CAPTURE',1250.00,'BRL','SETTLED','2025-07-10 10:00:00','2025-08-09 10:00:00','a22-cred-001','CR-018',7,6),
 (41,22,18,2,'TRANSFER',980.00,'BRL','SETTLED','2025-07-12 11:00:00','2025-07-12 11:00:00','a22-pixrcv-001','PX-018',2,2),

 -- Loja Estilo (acc 23 e 28)
 (42,23,19,5,'CAPTURE',400.00,'BRL','SETTLED','2025-06-19 10:00:00','2025-06-20 10:00:00','a23-deb-001','DB-019',5,5),
 (43,23,19,6,'CAPTURE',2100.00,'BRL','SETTLED','2025-07-02 12:00:00','2025-08-01 12:00:00','a23-cred-001','CR-019',7,6),
 (44,28,19,6,'CAPTURE',900.00,'BRL','SETTLED','2025-07-18 15:00:00','2025-08-17 15:00:00','a28-cred-002','CR-019B',7,6),
 (45,23,19,2,'TRANSFER',500.00,'BRL','SETTLED','2025-07-25 09:00:00','2025-07-25 09:00:00','a23-pixrcv-001','PX-019',2,2),

 -- Auto Peças (acc 24 e 29)
 (46,24,20,3,'EMISSION',0.00,'BRL','CREATED','2025-06-20 08:00:00',NULL,'a24-bol-001','BOL-020',4,3),
 (47,24,20,4,'PAYMENT',1700.00,'BRL','SETTLED','2025-06-23 09:00:00','2025-06-24 09:00:00','a24-bol-001-pay','BOL-020',NULL,4),
 (48,24,20,5,'CAPTURE',300.00,'BRL','SETTLED','2025-06-25 10:00:00','2025-06-26 10:00:00','a24-deb-001','DB-020',5,5),
 (49,29,20,6,'CAPTURE',1600.00,'BRL','SETTLED','2025-07-06 11:00:00','2025-08-05 11:00:00','a29-cred-001','CR-020',7,6),
 (50,24,20,2,'TRANSFER',650.00,'BRL','SETTLED','2025-07-07 12:00:00','2025-07-07 12:00:00','a24-pixrcv-001','PX-020',2,2),

 -- Café da Praça (acc 25)
 (51,25,21,5,'CAPTURE',120.00,'BRL','SETTLED','2025-06-22 08:00:00','2025-06-23 08:00:00','a25-deb-001','DB-021',5,5),
 (52,25,21,6,'CAPTURE',700.00,'BRL','SETTLED','2025-07-01 09:00:00','2025-07-31 09:00:00','a25-cred-001','CR-021',7,6),
 (53,25,21,2,'TRANSFER',400.00,'BRL','SETTLED','2025-07-02 10:00:00','2025-07-02 10:00:00','a25-pixrcv-001','PX-021',2,2),

 -- StrongFit (acc 26 e 30)
 (54,26,22,5,'CAPTURE',280.00,'BRL','SETTLED','2025-06-24 11:00:00','2025-06-25 11:00:00','a26-deb-001','DB-022',5,5),
 (55,26,22,6,'CAPTURE',1300.00,'BRL','SETTLED','2025-07-04 12:00:00','2025-08-03 12:00:00','a26-cred-001','CR-022',7,6),
 (56,30,22,6,'CAPTURE',950.00,'BRL','SETTLED','2025-07-20 13:00:00','2025-08-19 13:00:00','a30-cred-002','CR-022B',7,6),
 (57,26,22,2,'TRANSFER',720.00,'BRL','SETTLED','2025-07-22 14:00:00','2025-07-22 14:00:00','a26-pixrcv-001','PX-022',2,2);

-- Mais PIX para PJ (recebimentos do dia a dia)
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 (58,20,16,2,'TRANSFER',350.00,'BRL','SETTLED','2025-07-12 09:10:00','2025-07-12 09:10:00','a20-pix-2','PX-016-2',2,2),
 (59,19,15,2,'TRANSFER',280.00,'BRL','SETTLED','2025-07-13 10:10:00','2025-07-13 10:10:00','a19-pix-2','PX-015-2',2,2),
 (60,23,19,2,'TRANSFER',410.00,'BRL','SETTLED','2025-07-14 11:10:00','2025-07-14 11:10:00','a23-pix-2','PX-019-2',2,2),
 (61,24,20,2,'TRANSFER',520.00,'BRL','SETTLED','2025-07-15 12:10:00','2025-07-15 12:10:00','a24-pix-2','PX-020-2',2,2),
 (62,21,17,2,'TRANSFER',690.00,'BRL','SETTLED','2025-07-16 13:10:00','2025-07-16 13:10:00','a21-pix-2','PX-017-2',2,2),
 (63,22,18,2,'TRANSFER',560.00,'BRL','SETTLED','2025-07-17 14:10:00','2025-07-17 14:10:00','a22-pix-2','PX-018-2',2,2),
 (64,25,21,2,'TRANSFER',340.00,'BRL','SETTLED','2025-07-18 15:10:00','2025-07-18 15:10:00','a25-pix-2','PX-021-2',2,2),
 (65,26,22,2,'TRANSFER',430.00,'BRL','SETTLED','2025-07-19 16:10:00','2025-07-19 16:10:00','a26-pix-2','PX-022-2',2,2);

-- Mais cartões (inclui chargeback de exemplo)
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 (66,21,17,6,'CAPTURE',2100.00,'BRL','SETTLED','2025-08-02 12:00:00','2025-09-01 12:00:00','a21-cred-003','CR-017-3',7,6),
 (67,21,17,6,'OTHER',-2100.00,'BRL','CHARGEBACK','2025-09-20 12:00:00','2025-09-20 12:00:00','a21-cbk-003','CBK-017-3',NULL,6),

 (68,24,20,5,'CAPTURE',180.00,'BRL','SETTLED','2025-08-05 10:00:00','2025-08-06 10:00:00','a24-deb-002','DB-020-2',5,5),
 (69,23,19,6,'CAPTURE',1500.00,'BRL','SETTLED','2025-08-06 11:00:00','2025-09-05 11:00:00','a23-cred-003','CR-019-3',7,6),
 (70,26,22,5,'CAPTURE',200.00,'BRL','SETTLED','2025-08-07 12:00:00','2025-08-08 12:00:00','a26-deb-002','DB-022-2',5,5),
 (71,22,18,6,'CAPTURE',1450.00,'BRL','SETTLED','2025-08-10 13:00:00','2025-09-09 13:00:00','a22-cred-002','CR-018-2',7,6),
 (72,25,21,5,'CAPTURE',160.00,'BRL','SETTLED','2025-08-11 14:00:00','2025-08-12 14:00:00','a25-deb-002','DB-021-2',5,5),
 (73,19,15,6,'CAPTURE',990.00,'BRL','SETTLED','2025-08-12 15:00:00','2025-09-11 15:00:00','a19-cred-002','CR-015-2',7,6);

-- Mais boletos (emite e paga)
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 (74,28,19,3,'EMISSION',0.00,'BRL','CREATED','2025-08-01 08:00:00',NULL,'a28-bol-003','BOL-019-3',4,3),
 (75,28,19,4,'PAYMENT',1350.00,'BRL','SETTLED','2025-08-03 09:00:00','2025-08-04 09:00:00','a28-bol-003-pay','BOL-019-3',NULL,4),
 (76,24,20,3,'EMISSION',0.00,'BRL','CREATED','2025-08-02 08:00:00',NULL,'a24-bol-003','BOL-020-3',4,3),
 (77,24,20,4,'PAYMENT',980.00,'BRL','SETTLED','2025-08-05 09:00:00','2025-08-06 09:00:00','a24-bol-003-pay','BOL-020-3',NULL,4),
 (78,22,18,3,'EMISSION',0.00,'BRL','CREATED','2025-08-04 08:00:00',NULL,'a22-bol-003','BOL-018-3',4,3),
 (79,22,18,4,'PAYMENT',2200.00,'BRL','SETTLED','2025-08-07 09:00:00','2025-08-08 09:00:00','a22-bol-003-pay','BOL-018-3',NULL,4);

-- Mais PIX PF (movimento recorrente)
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, pricing_id, settlement_id) VALUES
 (80,10,9,1,'TRANSFER',-95.00,'BRL','SETTLED','2025-08-15 18:00:00','2025-08-15 18:00:00','a10-p2','PIX-1000',NULL,1),
 (81,14,13,2,'TRANSFER',260.00,'BRL','SETTLED','2025-08-16 19:00:00','2025-08-16 19:00:00','a14-p2','PIX-1001',1,2),
 (82,11,10,2,'TRANSFER',140.00,'BRL','SETTLED','2025-08-17 08:00:00','2025-08-17 08:00:00','a11-p2','PIX-1002',1,2),
 (83,15,14,2,'TRANSFER',170.00,'BRL','SETTLED','2025-08-18 09:00:00','2025-08-18 09:00:00','a15-p2','PIX-1003',1,2),
 (84,16,13,1,'TRANSFER',-60.00,'BRL','SETTLED','2025-08-19 10:00:00','2025-08-19 10:00:00','a16-p2','PIX-1004',NULL,1),
 (85,12,11,2,'TRANSFER',115.00,'BRL','SETTLED','2025-08-20 11:00:00','2025-08-20 11:00:00','a12-p2','PIX-1005',1,2),
 (86,18,8,2,'TRANSFER',90.00,'BRL','SETTLED','2025-08-21 12:00:00','2025-08-21 12:00:00','a18-p2','PIX-1006',1,2),
 (87,3,2,2,'TRANSFER',75.00,'BRL','SETTLED','2025-08-22 13:00:00','2025-08-22 13:00:00','a3-p3','PIX-1007',1,2),
 (88,6,5,1,'TRANSFER',-45.00,'BRL','SETTLED','2025-08-23 14:00:00','2025-08-23 14:00:00','a6-p2','PIX-1008',NULL,1),
 (89,7,6,2,'TRANSFER',160.00,'BRL','SETTLED','2025-08-24 15:00:00','2025-08-24 15:00:00','a7-p2','PIX-1009',1,2);

-- Extra: chargeback de um crédito da Loja Estilo
INSERT INTO transactions
(transaction_id, account_id, customer_id, product_id, operation, amount, currency, status, created_at, settled_at, idempotency_key, external_ref, reversed_of_tx_id, settlement_id) VALUES
 (90,23,19,6,'OTHER',-1500.00,'BRL','CHARGEBACK','2025-09-10 10:00:00','2025-09-10 10:00:00','a23-cbk-003','CBK-019-3',69,6);
