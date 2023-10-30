# Base de Dados da Loja de Informática

Este projeto consiste em uma base de dados MySQL para gerenciar uma loja de informática. Ela inclui tabelas para produtos, clientes, vendas realizadas e fornecedores.

## Requisitos

- MySQL Server instalado e configurado.
- Cliente MySQL (como o MySQL Workbench) para importar e interagir com a base de dados.

## Instruções de Instalação

1. Abra o MySQL Workbench e conecte-se ao seu servidor MySQL.
2. Execute os seguintes comandos SQL para criar a base de dados e tabelas:

### Início do Comando de criação de tabelas em SQL
-- Criar banco de dados
CREATE DATABASE loja_informatica;

-- Usar a database selecionada
USE loja_informatica;

--  Criar tabela de produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    filial VARCHAR(50) NOT NULL,
    quantidade_estoque INT NOT NULL,
    marca VARCHAR(20) NOT NULL
);

-- Criar tabela de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    email VARCHAR(200) NOT NULL,
    whatsapp VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    sexo ENUM('M','F','I') NOT NULL
);

-- Criar tabela de vendas realizadas
CREATE TABLE venda_realizada (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    produto_id INT NOT NULL,
    cliente_id INT NOT NULL,
    FOREIGN KEY(produto_id) REFERENCES produtos(id),
    FOREIGN KEY(cliente_id) REFERENCES clientes(id)
);

-- Criar tabela de fornecedores
CREATE TABLE fornecedores (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(200) NOT NULL,
    marca_principal VARCHAR(20) NOT NULL,
    estado CHAR(2) NOT NULL
);
### Término do Comando de criação de tabelas em SQL

## Estrutura do Banco de Dados

A base de dados possui quatro tabelas principais:

- **produtos**: Armazena informações sobre os produtos disponíveis na loja.
- **clientes**: Contém informações dos clientes da loja.
- **venda_realizada**: Registra as vendas realizadas, incluindo data, quantidade, produto e cliente associado.
- **fornecedores**: Mantém informações sobre os fornecedores da loja.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

**Observação:** O código completo do SQL, contendo todos os creates, inserts e consultas estão todos neste repositório. Os comandos inserts foram feitos através do ChatGPT, visando a praticidade, pois seria complicado fazer a quantidade de inserts feitos manualmente. Os dados dos inserts são fictícios.

## Licença

Este projeto está sob a [Licença MIT](LICENSE).

## Contato

Em caso de dúvidas ou sugestões, entre em contato através do email: gabrielflorencioti@gmail.com

[LinkedIn](https://www.linkedin.com/in/gabriel-florêncio-47a318239)

**Gabriel Florêncio**
Business Intelligence | Microsoft Power B.I | Python | SQL | Storytelling | Figma