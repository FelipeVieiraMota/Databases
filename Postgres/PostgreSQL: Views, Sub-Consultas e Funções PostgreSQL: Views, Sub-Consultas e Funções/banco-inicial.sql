CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Inês Ribeiro', 		'Lawson', 		'1982-10-27');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Tiago Costa', 			'Ramirez', 		'2004-03-11');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Mariana Sousa', 		'Patel', 		'1975-12-04');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Pedro Silva', 	    	'Nguyen', 		'1998-07-19');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Ana Santos', 			'Walker', 		'2012-01-08');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('David Ferreira', 		'Takahashi', 	'1968-05-15');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Catarina Oliveira',	'Jackson', 		'2007-09-22');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Miguel Lopes', 		'McKenzie', 	'1989-02-06');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('Sofia Martins', 		'Esposito', 	'2001-11-30');
insert into aluno (primeiro_nome, ultimo_nome, data_nascimento) values ('João Mendes', 			'Dubois', 		'1971-08-13');

insert into categoria (nome) values ('Technologies');
insert into categoria (nome) values ('Business Skills');

insert into curso (categoria_id, nome) values (1, 'Ethical Hacking Fundamentals');
insert into curso (categoria_id, nome) values (1, 'Cloud Computing for Beginners');
insert into curso (categoria_id, nome) values (1, 'Data Visualization with Python');
insert into curso (categoria_id, nome) values (1, 'DevOps: Infrastructure Automation');
insert into curso (categoria_id, nome) values (1, 'Introduction to Cybersecurity');
insert into curso (categoria_id, nome) values (1, 'Machine Learning Crash Course');
insert into curso (categoria_id, nome) values (1, 'Building Responsive Websites with HTML, CSS & JavaScript');
insert into curso (categoria_id, nome) values (1, 'Network Security and Administration');
insert into curso (categoria_id, nome) values (1, 'SQL for Data Analysis');
insert into curso (categoria_id, nome) values (1, 'IT Project Management Essentials');
insert into curso (categoria_id, nome) values (2, 'Project Management');
insert into curso (categoria_id, nome) values (2, 'Marketing Fundamentals');
insert into curso (categoria_id, nome) values (2, 'Financial Literacy for Non-Financial Professionals');
insert into curso (categoria_id, nome) values (2, 'Leadership and Communication');
insert into curso (categoria_id, nome) values (2, 'Business Analytics');
insert into curso (categoria_id, nome) values (2, 'Entrepreneurship');

insert into aluno_curso (aluno_id, curso_id) values (2	, 13);
insert into aluno_curso (aluno_id, curso_id) values (8	,  4);
insert into aluno_curso (aluno_id, curso_id) values (1	, 10);
insert into aluno_curso (aluno_id, curso_id) values (4	,  3);
insert into aluno_curso (aluno_id, curso_id) values (7	, 12);
insert into aluno_curso (aluno_id, curso_id) values (9	,  1);
insert into aluno_curso (aluno_id, curso_id) values (5	, 11);
insert into aluno_curso (aluno_id, curso_id) values (3	, 16);
insert into aluno_curso (aluno_id, curso_id) values (10 ,  7);
insert into aluno_curso (aluno_id, curso_id) values (6	,  9);











