create database ordemservico;
use ordemservico;

create table clients(
		idClients int auto_increment primary key,
		Fname varchar(10),
		Lname varchar(20),
		CPF char(11) not null,
		Address varchar(30),
        contact char(11) not null,
		constraint unique_cpf_client unique (CPF)
);

create table orders(
		idOrders int auto_increment primary key,
        idOrdersClient int,
        ordersStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
        ordersDescription varchar(255),
        ordersCategory varchar(45),
        ordersPriority enum('indefinida', 'baixa', 'média', 'alta', 'urgente') default 'indefinida', 
        constraint fk_orders_client foreign key(idOrdersClient) references clients(idClients)
);

create table responsavel(
		idClients int auto_increment primary key,
		Fname varchar(10),
		Lname varchar(20),
		CPF char(11) not null,
        contact char(11) not null,
		setor varchar(45),
        cargo varchar(45),
        identificação varchar(45)
);

create table os(
		idos int auto_increment primary key,
        descrição varchar(255),
        prioridade enum('indefinida', 'baixa', 'média', 'alta', 'urgente') default 'baixa'

);

create table orderGenerated(
		idorders int,
        idresponsavel int,
        primary key (idorders, idresponsavel),
        constraint fk_orders foreign key (idorders) references orders(idorders),
        constraint fk_responsavel foreign key (idresponsavel) references responsavel(idresponsavel)
);