
-- Postgres database --

-- Limpar a base de dados
drop table  empresas;
drop table  candidatos;
drop table  vagas;
drop table  candidaturas;

commit;

-- Executar essas queries antes de subir a API
CREATE TABLE empresas (
    id_empresa SERIAL PRIMARY key,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE vagas (
    id_vaga SERIAL PRIMARY key,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
    salario DECIMAL(10, 2),
    data_publicacao DATE NOT NULL,
    data_expiracao DATE,
    empresa_id INT,
    FOREIGN KEY (empresa_id) REFERENCES empresas(id_empresa) on delete cascade on update cascade
);

CREATE TABLE candidatos (
    id_candidato SERIAL PRIMARY key,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_nascimento DATE,
    experiencia TEXT
);

CREATE TABLE candidaturas (
    id_candidatura SERIAL PRIMARY key,
    candidato_id INT,
    vaga_id INT,
    data_candidatura DATE NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (candidato_id) REFERENCES candidatos(id_candidato)  on delete cascade on update cascade,
    FOREIGN KEY (vaga_id) REFERENCES vagas(id_vaga)  on delete cascade on update cascade
);

commit;
---------------------------------