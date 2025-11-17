CREATE DATABASE DiceBattle;
USE DiceBattle;

CREATE TABLE usuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(45),
    email VARCHAR(45),
    senha CHAR(8)
)AUTO_INCREMENT = 1;

CREATE TABLE batalha(
    idBatalha INT PRIMARY KEY AUTO_INCREMENT,
    Turnos INT,
    Vencedor VARCHAR(45),
    fkUsuario INT,
        CONSTRAINT fkBatalhaUsuario
            FOREIGN KEY (fkUsuario)
                REFERENCES usuario (idUsuario)
)AUTO_INCREMENT = 1;

CREATE TABLE registro(
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    Atacante VARCHAR(45),
    Nome VARCHAR(45),
    Dano INT,
    Alvo VARCHAR(45),
    fkBatalha INT,
        CONSTRAINT fkRegistroBatalha
            FOREIGN KEY (fkBatalha)
                REFERENCES batalha (idBatalha)
)AUTO_INCREMENT = 1;


CREATE TABLE ficha(
    idFicha INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Classe VARCHAR(45),
    fkUsuario INT,
        CONSTRAINT fkFichaUsuario
            FOREIGN KEY (fkUsuario)
                REFERENCES usuario (idUsuario)
)AUTO_INCREMENT = 1;

CREATE TABLE statusF(
    idStatus INT PRIMARY KEY AUTO_INCREMENT,
    Força INT,
    Destreza INT,
    Constituicao INT,
    Inteligencia INT,
    Sabedoria INT,
    Carisma INT,
    Vida INT,
    fkFicha INT,
        CONSTRAINT fkStatusFicha
            FOREIGN KEY (fkFicha)
                REFERENCES ficha (idFicha)
)AUTO_INCREMENT = 1;

CREATE TABLE acaoPrincipal(
    idAcaoPrincipal INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Acerto INT, 
    RolagemDano INT,
    fkFicha INT,
        CONSTRAINT fkAcaoPrincipalFicha
            FOREIGN KEY (fkFicha)
                REFERENCES ficha (idFicha)    
)AUTO_INCREMENT = 1;

CREATE TABLE acaoBonus(
    idAcaoBonus INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    RolagemCura INT,
    fkFicha INT,
        CONSTRAINT fkAcaoBonusFicha
            FOREIGN KEY (fkFicha)
                REFERENCES ficha (idFicha)
)AUTO_INCREMENT = 1;


INSERT INTO usuario(Usuario, Email, Senha) VALUES
('Matheus_Panela', 'MatheusSantos@gmail.com',69692070),
('Gikarika','GiovannaJamarino@gmail.com',22022007);
                
INSERT INTO ficha(Nome, Classe, fkUsuario) VALUES
('Jin Too', 'Arqueiro', 1),
('Silver', 'Lutador', 2),
('Desmond', 'Lutador', 2),
('Tom', 'Lutador',1);
                
INSERT INTO statusF(Força, Destreza, Constituicao, Inteligencia, Sabedoria, Carisma, Vida, fkFicha) VALUES
(3,5,2,3,3,1,165,1),
(2,3,2,1,3,1,146,2),
(5,2,2,2,0,4,197,3),
(6,2,4,-3,2,3,205,4);
                
INSERT INTO acaoPrincipal(Nome, Acerto, RolagemDano, fkFicha) VALUES
('Arco Curto',11,6,1),
('Manopla Apex',11,12,2),
('Katana Tomioka',15,12,3),
('Espada Longa',15,20,4);
                
INSERT INTO acaoBonus(Nome, RolagemCura, fkFicha) VALUES
('Carga de Sangue',70,1),
('Totalidade do Corpo',51,2),
('Segundo Folego',10,3),
('Segundo Folego',10,4);