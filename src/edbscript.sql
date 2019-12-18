DROP DATABASE IF EXISTS edb;
CREATE DATABASE edb;
USE edb;

DROP TABLE IF exists cliente;

CREATE table cliente(
	code int primary key AUTO_INCREMENT,
	name char(25) not null,
	cognome char(30),
    username char(30),
    password char(30),
    email char(50),
    numerotelefono int,
    indirizzo char(40),
    citta char(25)
);

DROP TABLE IF EXISTS fermata;

create table fermata(
	code int primary key AUTO_INCREMENT,
    id_corsa int,
    nomefermata char(30),
    foreign key(id_corsa)references fermata(code)
);

DROP TABLE IF exists tratta;

create table tratta(
	code int primary key auto_increment,
    cittapartenza char(20),
    cittadiarr char(20)
);

DROP table if exists autista;

create table autista(
	code int primary key auto_increment,
    username char(30),
    password char(30),
    nome char(30),
    cognome char (30)
);

DROP table if exists autobus;

create table autobus(
	code int primary key auto_increment,
    id_autista int,
    modello char(30),
    numeroposti int,
    annoimm int,
    chilometri int,
    foreign key(id_autista)references autista(code)
);

DROP TABLE IF EXISTS corsa;

create table corsa(
	code int primary key AUTO_INCREMENT,
    id_tratta int,
    id_autobus int,
    orapartenza char(10),
    datapartenza char(10),
    durata int,
    foreign key(id_tratta)references tratta(code),
	foreign key(id_autobus)references autobus(code)
);

DROP TABLE IF EXISTS biglietto;

CREATE table biglietto(
	code int primary key AUTO_INCREMENT,
	id_cliente int,
    id_corsa int,
    foreign key(id_cliente)references cliente(code),
	foreign key(id_corsa)references corsa(code)
);

DROP TABLE if exists manager;

create table manager(
	code int primary key auto_increment,
    username char(30),
    password char(30),
    nome char(30),
    cognome char(30)
);

DROP table if exists richiestacorsa;

create table richiestacorsa(
	code int primary key auto_increment,
    orapartenza char(10),
    datapartenza char(10),
    durata int
);

DROP table if exists richiestafermata;

create table richiestafermata(
	code int primary key auto_increment,
	nomefermata char(30)
);


DROP table if exists richiestatratta;

create table richiestatratta(
	code int primary key auto_increment,
    cittapartenza char(20),
    cittadiarr char(20)
);



