create database projeto;
use projeto;
CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo CHAR(1) NOT NULL,
  tipo_diabetes VARCHAR(255) NOT NULL,
  data_diagnostico DATE NOT NULL,
  nivel_acucar_sangue FLOAT NOT NULL,
  peso FLOAT NOT NULL,
  altura FLOAT NOT NULL,
  pressao_arterial FLOAT NOT NULL,
  historico_medico VARCHAR(255) NOT NULL,
  medicamentos VARCHAR(255) NOT NULL,
  alergias VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE registro_saude (
  id INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  data DATE NOT NULL,
  nivel_acucar_sangue FLOAT NOT NULL,
  peso FLOAT NOT NULL,
  altura FLOAT NOT NULL,
  pressao_arterial FLOAT NOT NULL,
  glicose_na_urina BOOLEAN NOT NULL,
  hipoglicemia BOOLEAN NOT NULL,
  hiperglicemia BOOLEAN NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

CREATE TABLE contato_emergencia (
  id INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefone VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

CREATE TABLE doenca (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE medicamento (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  dosagem FLOAT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE alergia (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE informacoes_emergencia (
  id INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  nome_contato VARCHAR(255) NOT NULL,
  email_contato VARCHAR(255) NOT NULL,
  telefone_contato VARCHAR(255) NOT NULL,
  instrucoes_atendimento VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

ALTER TABLE registro_saude ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id);

ALTER TABLE contato_emergencia ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id);

CREATE TABLE usuario_doenca (
  id_usuario INT NOT NULL,
  id_doenca INT NOT NULL,
  PRIMARY KEY (id_usuario, id_doenca),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id),
  FOREIGN KEY (id_doenca) REFERENCES doenca (id)
);

CREATE TABLE usuario_medicamento (
  id_usuario INT NOT NULL,
  id_medicamento INT NOT NULL,
  PRIMARY KEY (id_usuario, id_medicamento),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id),
  FOREIGN KEY (id_medicamento) REFERENCES medicamento (id)
);

CREATE TABLE alergia_usuario (
  id_usuario INT NOT NULL,
  id_alergia INT NOT NULL,
  PRIMARY KEY (id_usuario, id_alergia),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id),
  FOREIGN KEY (id_alergia) REFERENCES alergia (id)
);

ALTER TABLE usuario MODIFY pressao_arterial VARCHAR(255);

INSERT INTO usuario (nome, email, cpf, data_nascimento, sexo, tipo_diabetes, data_diagnostico, nivel_acucar_sangue, peso, altura, pressao_arterial, historico_medico, medicamentos, alergias)
VALUES
('John Doe', 'john.doe@example.com', '12345678901', '1990-05-15', 'M', 'Type 1', '2020-03-10', 120, 70.5, 175, '120/80', 'None', 'Insulin', 'None'),
('Jane Smith', 'jane.smith@example.com', '98765432101', '1988-09-20', 'F', 'Type 2', '2018-06-25', 140, 62.3, 160, '130/90', 'High blood pressure', 'Metformin', 'Pollen allergy');

INSERT INTO registro_saude (id_usuario, data, nivel_acucar_sangue, peso, altura, pressao_arterial, glicose_na_urina, hipoglicemia, hiperglicemia)
VALUES
(1, '2023-10-01', 130, 71.2, 175, 120/80, FALSE, FALSE, TRUE),
(2, '2023-10-02', 150, 63.5, 160, 130/90, TRUE, FALSE, FALSE);

INSERT INTO contato_emergencia (id_usuario, nome, email, telefone)
VALUES
(1, 'Emergency Contact 1', 'emergency1@example.com', '123-456-7890'),
(2, 'Emergency Contact 2', 'emergency2@example.com', '987-654-3210');

INSERT INTO doenca (nome, descricao)
VALUES
('Hypertension', 'High blood pressure'),
('High Cholesterol', 'Elevated levels of cholesterol in the blood');

INSERT INTO medicamento (nome, descricao, dosagem)
VALUES
('Metformin', 'Used to treat type 2 diabetes', 1000),
('Insulin', 'Hormone for blood sugar control', 10);

INSERT INTO alergia (nome, descricao)
VALUES
('Pollen', 'Allergic reaction to pollen'),
('Penicillin', 'Allergic reaction to penicillin');

INSERT INTO informacoes_emergencia (id_usuario, nome_contato, email_contato, telefone_contato, instrucoes_atendimento)
VALUES
(1, 'Emergency Contact 1', 'emergency1@example.com', '123-456-7890', 'Call 911 in case of emergency'),
(2, 'Emergency Contact 2', 'emergency2@example.com', '987-654-3210', 'Administer prescribed medication as needed');

SELECT * FROM usuario;

SELECT rs.* 
FROM registro_saude rs
WHERE rs.id_usuario = 1; 

SELECT * 
FROM usuario
WHERE tipo_diabetes = 'Type 1';

SELECT ce.* 
FROM contato_emergencia ce
WHERE ce.id_usuario = 2; 

SELECT u.* 
FROM usuario u
JOIN usuario_doenca ud ON u.id = ud.id_usuario
JOIN doenca d ON ud.id_doenca = d.id
WHERE d.nome = 'Hypertension';

SELECT m.nome, m.dosagem
FROM medicamento m
JOIN usuario_medicamento um ON m.id = um.id_medicamento
WHERE um.id_usuario = 1; 

select * from usuario;