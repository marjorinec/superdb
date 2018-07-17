CREATE TABLE IF NOT EXISTS Cargo (
	id_cargo int not null primary key,
	nome_cargo varchar(30) not null
);

CREATE TABLE IF NOT EXISTS Departamento (
	id_dep int not null primary key,
	nome_dep varchar(30) not null
);

CREATE TABLE IF NOT EXISTS Funcionario (
	matr_func int not null primary key, 
	reg_func varchar(14) not null, 
	nome_func varchar(80) not null, 
	endereco_func varchar(200) not null, 
	email_func varchar(80) not null,
	datanasc_func date not null, 
	salario_func double not null, 
	pfpj_func tinyint(1) not null, 
	dep_id int, 
	cargo_id int, 

	CONSTRAINT dep_id_fk 
		FOREIGN KEY (dep_id) REFERENCES Departamento (id_dep),
	CONSTRAINT cargo_id_fk
		FOREIGN KEY (cargo_id) REFERENCES Cargo (id_cargo),
	CONSTRAINT reg_func_uniq
		UNIQUE (reg_func)
);

CREATE TABLE IF NOT EXISTS Projeto (
	id_proj int not null primary key,
	nome_proj varchar(30) not null,
	valor_proj double,
	estado_proj varchar(12) not null
);

CREATE TABLE IF NOT EXISTS Cliente (
	reg_cli varchar(14) not null primary key,
	nome_cli varchar(80) not null,
	email_cli varchar(80) not null,
	apelido_cli varchar(20),
	endereco_cli varchar(200) not null
);

CREATE TABLE IF NOT EXISTS Fornecedor (
	reg_fornec int not null primary key,
	nome_fornec varchar(50) not null,
	email_fornec varchar(80) not null,
	endereco_fornec varchar(200) not null
);

CREATE TABLE IF NOT EXISTS Custo (
	id_custo int not null primary key,
	nome_custo varchar(30) not null,
	valor_custo double not null,
	projeto_id int,
	funcionario_matr int,
	fornecedor_reg varchar(14),
	
	CONSTRAINT projeto_id_fk
		FOREIGN KEY (projeto_id) REFERENCES Projeto(id_proj),
	CONSTRAINT funcionario_matr_fk
		FOREIGN KEY (funcionario_matr) REFERENCES Funcionario(matr_func),
	CONSTRAINT fornecedor_reg_fk
		FOREIGN KEY (fornecedor_reg) REFERENCES Fornecedor(reg_fornec)
);

CREATE TABLE IF NOT EXISTS Funcionario_Telefone (
	telefone_func varchar(13) not null primary key,
	func_matr int,

	CONSTRAINT func_matr
		FOREIGN KEY (func_matr) REFERENCES Funcionario(matr_func)
);

CREATE TABLE IF NOT EXISTS Trabalha_em (
	func_matr int,
	proj_id int,

	CONSTRAINT func_matr_fk
		FOREIGN KEY (func_matr) REFERENCES Funcionario(matr_func),
	CONSTRAINT proj_id_fk
		FOREIGN KEY (proj_id) REFERENCES Projeto(id_proj)
);

CREATE TABLE IF NOT EXISTS Projeto_Cliente (
	projet_id int,
	cliente_reg varchar(14),

	CONSTRAINT projet_id_fk
		FOREIGN KEY (projet_id) REFERENCES Projeto(id_proj),
	CONSTRAINT cliente_id_fk
		FOREIGN KEY (cliente_reg) REFERENCES Cliente(reg_cli)
);

CREATE TABLE IF NOT EXISTS Cliente_Telefone (
	telefone_cli varchar(13) not null primary key,
	cli_reg varchar(14),

	CONSTRAINT cli_reg_fk
		FOREIGN KEY (cli_reg) REFERENCES Cliente(reg_cli)
);

CREATE TABLE IF NOT EXISTS Funcionario_Custo (
	funcionario_matr int,
	custo_id int,

	CONSTRAINT funcionario_matr_fk
		FOREIGN KEY (funcionario_matr) REFERENCES Funcionario(matr_func),
	CONSTRAINT custo_id_fk
		FOREIGN KEY (custo_id) REFERENCES Custo(id_custo)
);

CREATE TABLE IF NOT EXISTS Custo_Fornecedor (
	cust_id int,
	forn_reg varchar(14),

	CONSTRAINT cust_id_fk
		FOREIGN KEY (cust_id) REFERENCES Custo(id_custo),
	CONSTRAINT forn_reg_fk
		FOREIGN KEY (forn_reg) REFERENCES Fornecedor(reg_fornec)
);

CREATE TABLE IF NOT EXISTS Fornecedor_Telefone (
	telefone_fornec varchar(13) not null primary key,
	fornecedor_reg varchar(14),

	CONSTRAINT fornecedor_reg_fk
		FOREIGN KEY (fornecedor_reg) REFERENCES Fornecedor(reg_fornec)
);

CREATE TABLE IF NOT EXISTS Fornecedor_Projeto (
	fornece_reg varchar(14),
	pro_id int,

	CONSTRAINT fornece_reg_fk
		FOREIGN KEY (fornece_reg) REFERENCES Fornecedor(reg_fornec),
	CONSTRAINT pro_id_fk
		FOREIGN KEY (pro_id) REFERENCES Projeto(id_proj)
);

INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (1, 'Designer');
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (2, 'Desenvolvedor');
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (3, 'Contador');
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (4, 'Gerente de TI');
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (5, 'Faxineiro');
INSERT INTO Cargo (id_cargo, nome_cargo) VALUES (6, 'Recepcionista');

INSERT INTO Departamento (id_dep, nome_dep) VALUES (1, 'Financeiro');
INSERT INTO Departamento (id_dep, nome_dep) VALUES (2, 'UX');
INSERT INTO Departamento (id_dep, nome_dep) VALUES (3, 'TI');
INSERT INTO Departamento (id_dep, nome_dep) VALUES (4, 'Assistência');
INSERT INTO Departamento (id_dep, nome_dep) VALUES (5, 'Limpeza');

INSERT INTO Funcionario (matr_func, reg_func, nome_func, endereco_func, email_func, datanasc_func, salario_func, pfpj_func) 
	VALUES (1, '12345678912', 'Joseph Joestar', 'Aquele lugar', 'joseph@joestar.com', 1960-09-27, 9999, 1);

INSERT INTO Funcionario (matr_func, reg_func, nome_func, endereco_func, email_func, datanasc_func, salario_func, pfpj_func) 
	VALUES (2, '12345678921', 'Jonathan Joestar', 'Aquele lugar ali', 'jonathan@joestar.com', 1968-04-04, 30000, 2);

INSERT INTO Funcionario (matr_func, reg_func, nome_func, endereco_func, email_func, datanasc_func, salario_func, pfpj_func) 
	VALUES (3, '12345678900', 'Lisa Lisa', 'Aquele lugar ala', 'lisalisa@joestar.com', 2000-01-01, 32000, 2);

INSERT INTO Funcionario (matr_func, reg_func, nome_func, endereco_func, email_func, datanasc_func, salario_func, pfpj_func) 
	VALUES (4, '12345678911', 'Jotaro Kujo', 'Aquele lugar niponico', 'jotaro@joestar.com', 1990-01-01, 2000, 1);

INSERT INTO Funcionario (matr_func, reg_func, nome_func, endereco_func, email_func, datanasc_func, salario_func, pfpj_func) 
	VALUES (5, '12345678922', 'Josuke Higashikata', 'Aquele niponico', 'jojo@joestar.com', 1999-01-01, 200, 1);

INSERT INTO Projeto (id_proj, nome_proj, valor_proj, estado_proj) VALUES (1, 'Ragnarok', 9999, 'Em andamento');
INSERT INTO Projeto (id_proj, nome_proj, valor_proj, estado_proj) VALUES (2, 'MTV', 999, 'Cancelado');
INSERT INTO Projeto (id_proj, nome_proj, valor_proj, estado_proj) VALUES (3, 'Aquele projeto', 8888, 'Criado');
INSERT INTO Projeto (id_proj, nome_proj, valor_proj, estado_proj) VALUES (4, 'FIRJAN', 20000, 'Concluído');
INSERT INTO Projeto (id_proj, nome_proj, valor_proj, estado_proj) VALUES (5, 'Snake Eater', 999999, 'Concluído');

INSERT INTO Cliente (reg_cli, nome_cli, email_cli, endereco_cli) VALUES ('09296295000160', 'Azul', 'azul@azul.com', 'Ali po');
INSERT INTO Cliente (reg_cli, nome_cli, email_cli, endereco_cli) VALUES ('12343243234336', 'SENAC', 'senac@senac.com', 'Ali aaaaa');
INSERT INTO Cliente (reg_cli, nome_cli, email_cli, apelido_cli, endereco_cli) VALUES ('12333333311', 'Danilo', 'danilo@gol.com', 'Dani', 'Ali a');

INSERT INTO Fornecedor (reg_fornec, nome_fornec, email_fornec, endereco_fornec) VALUES ('61190658000106', 'Dio', 'dio@dio.com', 'aliiiiii');

INSERT INTO Custo (id_custo, nome_custo, valor_custo, projeto_id, funcionario_matr) VALUES (1, 'Serviço de UX', 3000, 1, 1);
INSERT INTO Custo (id_custo, nome_custo, valor_custo, projeto_id, fornecedor_reg) VALUES (2, 'Monitor novo Apple', 4000, 1, '61190658000106');

INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999999', 1);
INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999991', 1);
INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999992', 1);
INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999993', 2);
INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999994', 4);
INSERT INTO Funcionario_Telefone (telefone_func, func_matr) VALUES ('21999999995', 6);

INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (1, 1);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (2, 1);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (4, 1);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (1, 2);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (2, 2);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (4, 2);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (1, 3);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (2, 3);
INSERT INTO Trabalha_em (func_matr, proj_id) VALUES (1, 4);

INSERT INTO Projeto_Cliente (projet_id, cliente_reg) VALUES (1, '09296295000160');
INSERT INTO Projeto_Cliente (projet_id, cliente_reg) VALUES (1, '12343243234336');
INSERT INTO Projeto_Cliente (projet_id, cliente_reg) VALUES (2, '86786739434343');
INSERT INTO Projeto_Cliente (projet_id, cliente_reg) VALUES (3, '09296295000160');

INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21992299221', '09296295000160');
INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21993399330', '12343243234336');
INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21903309329', '12343243234336');
INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21937367643', '86786739434343');
INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21973673639', '09296295000160');
INSERT INTO Cliente_Telefone (telefone_cli, cli_reg) VALUES ('21936553875', '09296295000160');

INSERT INTO Funcionario_Custo (funcionario_matr, custo_id) VALUES (1, 1);

INSERT INTO Custo_Fornecedor (cust_id, forn_reg) VALUES (2, '61190658000106');

INSERT INTO Fornecedor_Telefone (telefone_fornec, fornecedor_reg) VALUES ('21999995555', '61190658000106');
INSERT INTO Fornecedor_Telefone (telefone_fornec, fornecedor_reg) VALUES ('21999996666', '61190658000106');

INSERT INTO Fornecedor_Projeto (fornece_reg, pro_id) VALUES ('61190658000106', 1);