--Autor:Rodolfo Gomes
--Criação do banco de dados para gerenciar a jornada de trabalho dos colaboradores.


CREATE TABLE categoria_usuario(
id  serial,
descricao VARCHAR(100) NOT NULL,
primary key (id)
 
);


create table jornada_trabalho(
id  serial,
descricao VARCHAR(100) NOT NULL,
primary key (id)
 
);


create table ocorrencia(
id  serial,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(100) NOT NULL,
primary key (id)
);

create table tipo_data(
id  serial,
descricao VARCHAR(100) NOT NULL,
primary key (id)
);



create table calendario(
	id  serial,
	tipo_data_id integer references tipo_data(id),
	descricao VARCHAR(100) NOT NULL,
	data_especial date not null,
	primary key(id)
);

create table usuario(
id  serial,
categoria_id int not null,
nome varchar(50) not null,
empresa_id int not null,
nivel_acesso_id int not null,
jornada_trabalho_id int not null,
hora_inicio date,
hora_saida date,

primary key (id),
 CONSTRAINT fk_categoria_usuario
    FOREIGN KEY (categoria_id)
    REFERENCES categoria_usuario (id),
CONSTRAINT fk_jornada_trabalho_usuario
    FOREIGN KEY (jornada_trabalho_id)
    REFERENCES jornada_trabalho (id)

);



create table movimentacao(
id  serial,
usuario_id int not null,
data_entrada date,
data_saida date,
permanencia decimal,
ocorrencia_id int,
calendario_id int,

primary key (id,usuario_id),
constraint fk_movimentacao_usuario
	foreign key (usuario_id)
	references usuario(id)
);

create table banco_horas(
id  serial,
movimentacao_id int not null,
usuario_id int not null,
data_trabalhada date,
qtd_horas decimal,
saldo decimal
);
