CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(100)
);

CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    departamento_id INT REFERENCES departamentos(id)
);

CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    departamento_id INT REFERENCES departamentos(id)
);

CREATE TABLE funcionarios_projetos (
    funcionario_id INT REFERENCES funcionarios(id),
    projeto_id INT REFERENCES projetos(id),
    PRIMARY KEY (funcionario_id, projeto_id)
);

INSERT INTO departamentos (nome, localizacao) VALUES 
('TI', 'Andar 5'),
('RH', 'Andar 2'),
('Financeiro', 'Andar 3');

INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES 
('Carlos Silva', 'Desenvolvedor', 6000.00, 1),
('Ana Souza', 'Analista de RH', 4500.00, 2),
('Mariana Costa', 'Gerente Financeira', 8000.00, 3),
('João Pereira', 'Suporte Técnico', 3500.00, 1);

INSERT INTO projetos (nome, descricao, departamento_id) VALUES 
('Sistema de Vendas', 'Desenvolvimento de um sistema para vendas online', 1),
('Treinamento de Equipe', 'Capacitação de novos colaboradores', 2),
('Auditoria Interna', 'Revisão das finanças da empresa', 3);

INSERT INTO funcionarios_projetos (funcionario_id, projeto_id) VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 1);
