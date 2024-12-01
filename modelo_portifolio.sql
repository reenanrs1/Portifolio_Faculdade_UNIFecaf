CREATE DATABASE faculdade_unifecaf;

USE faculdade_unifecaf;


CREATE TABLE tbl_bolsa(
	id_bolsa INT NOT NULL AUTO_INCREMENT,
    desconto FLOAT,
    validade DATE,
    tipo VARCHAR(45)
);
CREATE TABLE tbl_aluno(
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    id_bolsa INT,
    
    CONSTRAINT FK_BOLSA_ALUNO
    FOREIGN KEY (id_bolsa)
    REFERENCES tbl_bolsa (id_bolsa)
);

CREATE TABLE tbl_endereco_aluno(
	id_endereco_aluno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    logradouro VARCHAR(45),
    bairro VARCHAR(45),
    cep VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    id_aluno INT NOT NULL,
    
    CONSTRAINT FK_ENDERECO_ALUNO
    FOREIGN KEY(id_aluno)
    REFERENCES tbl_aluno(id_aluno)
);

CREATE TABLE tbl_telefone_aluno(
	id_telefone_aluno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    id_aluno INT NOT NULL,
    
    CONSTRAINT FK_TELEFONE_ALUNO
    FOREIGN KEY (id_aluno)
    REFERENCES tbl_aluno (id_aluno)
);

CREATE TABLE tbl_matricula(
	id_matricula INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data_matricula DATE NOT NULL,
    data_conclusao DATE,
    status_pagamento VARCHAR(45) NOT NULL,
    id_aluno INT NOT NULL,
    
	CONSTRAINT FK_MATRICULA_ALUNO
    FOREIGN KEY (id_aluno)
    REFERENCES tbl_aluno (id_aluno)
);

CREATE TABLE tbl_pagamento(
	id_pagamento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	forma_pagamento VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL,
    status_pagamento VARCHAR(45) NOT NULL,
    id_matricula INT NOT NULL,
    
    CONSTRAINT FK_PAGAMENTO_MATRICULA
    FOREIGN KEY (id_matricula)
    REFERENCES tbl_matricula (id_matricula)
);

CREATE TABLE tbl_funcionarios(
	id_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao DATE NOT NULL,
    data_demissao DATE,
    area_atuacao VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL
);

CREATE TABLE tbl_endereco_funcionario(
	id_endereco_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    logradouro VARCHAR(45),
    bairro VARCHAR(45),
    cep VARCHAR(45),
    cidade VARCHAR(45),
    estado VARCHAR(45),
    id_funcionario INT NOT NULL,
    
    CONSTRAINT FK_ENDERECO_FUNCIONARIO
    FOREIGN KEY(id_funcionario)
    REFERENCES tbl_funcionarios(id_funcionario)
);

CREATE TABLE tbl_telefone_funcionario(
	id_telefone_funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    id_funcionario INT NOT NULL,
    
    CONSTRAINT FK_TELEFONE_FUNCIONARIO
    FOREIGN KEY (id_funcionario)
    REFERENCES tbl_funcionarios (id_funcionario)
);
CREATE TABLE tbl_curso(
	id_curso INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    turno VARCHAR(45) NOT NULL,
    modalidade VARCHAR(45) NOT NULL,
    nome VARCHAR(100) NOT NULL,
	id_matricula INT,
	id_disciplina INT NOT NULL,
    
    CONSTRAINT FK_CURSO_MATRICULA
    FOREIGN KEY (id_matricula)
    REFERENCES tbl_matricula (id_matricula)
);
CREATE TABLE tbl_disciplina(
	id_disciplina INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome TEXT NOT NULL,
    categoria VARCHAR(45) NOT NULL,
    semestre VARCHAR(45) NOT NULL,
    carga_horaria INT NOT NULL,
    id_funcionario INT NOT NULL,
    
    CONSTRAINT FK_FUNCIONARIO_DISCIPLINA
    FOREIGN KEY (id_funcionario)
    REFERENCES tbl_funcionarios(id_funcionario)
);

CREATE TABLE tbl_disciplina_curso (
	id_disciplina_curso INT NOT NULL PRIMARY KEY,
    id_curso INT NOT NULL,
    id_disciplina INT NOT NULL,
    
    CONSTRAINT FK_CURSO_DISCIPLINA_C 
    FOREIGN KEY (id_curso)
	REFERENCES tbl_curso (id_curso),
    
    CONSTRAINT FK_DISCIPLINA_CURSO_DISCIPLINA
    FOREIGN KEY (id_disciplina)
	REFERENCES tbl_disciplina (id_disciplina)
);