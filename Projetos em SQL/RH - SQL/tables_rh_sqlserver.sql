-- Criar banco de dados
Create database rh_gfsolucoes;

-- Ativar o banco de dados - Caso você tenha mais de um no schema.
Use rh_gfsolucoes;

-- Tabela de Funcionários
CREATE TABLE Funcionarios(
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10, 2),
    data_contratacao DATE,
    data_nascimento DATE,
	filial varchar(20)
);

-- Tabela de folha de pagamento
CREATE TABLE FolhaPagamento(
    id INT PRIMARY KEY,
    id_funcionario INT,
	fgts DECIMAL(8,2) DEFAULT 8,
    vale_transporte VARCHAR(3),
	plano_saude varchar(10),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id)
);

-- Tabela de Desempenho de funcionários
CREATE TABLE AvaliacoesDesempenho(
    id INT PRIMARY KEY,
    id_funcionario INT,
    data_avaliacao DATE,
    nota DECIMAL(2.2),
    comentario TEXT,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id)
);
