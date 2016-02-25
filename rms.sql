SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

BEGIN;
CREATE DATABASE IF NOT EXISTS `RMS`;
COMMIT;

USE `RMS`;


-- ----------------------------
--  Table structure for `ABITAZIONE`
-- ----------------------------
DROP TABLE IF EXISTS `Abitazione`;
CREATE TABLE `Abitazione` (
  `IdAbitazione` int(11) NOT NULL AUTO_INCREMENT,
  `Proprietario` varchar(20) NOT NULL,
  `Ubicazione` int(11) NOT NULL,
  `Gestione` int(11) DEFAULT NULL,
  `Giardino` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`IdAbitazione`),
  FOREIGN KEY (`Gestione`) REFERENCES `Sede`(`IdSede`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`Proprietario`) REFERENCES `Utente`(`Username`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`Ubicazione`) REFERENCES `Luogo`(`IdLuogo`)ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ABITAZIONE`
-- ----------------------------
BEGIN;
INSERT INTO `Abitazione` VALUES (1,'Ermenegilda50',7,1,'Y');
INSERT INTO `Abitazione` VALUES (2,'Giuseppe70',14,2,'N');
COMMIT;



-- ----------------------------
--  Table structure for `AGENZIA`
-- ----------------------------
DROP TABLE IF EXISTS `Agenzia`;
CREATE TABLE `Agenzia` (
  `PartitaIva` varchar(20) NOT NULL,
  `RagSociale` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Direttore` varchar(20) NOT NULL,
  PRIMARY KEY (`PartitaIva`),
  FOREIGN KEY (`Direttore`) REFERENCES `Utente`(`Username`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `AGENZIA`
-- ----------------------------
BEGIN;
INSERT INTO `Agenzia` VALUES ('FR12345678912','Immobiliare','info@immobiliare.com','Remi55');
INSERT INTO `Agenzia` VALUES ('IT01114601006','Stile Casa','info@stilecasa.com','Mario75');
COMMIT;



-- ----------------------------
--  Table structure for `ANAGRAFICA`
-- ----------------------------
DROP TABLE IF EXISTS `Anagrafica`;
CREATE TABLE `Anagrafica` (
  `CodFiscale` varchar(20) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Cognome` varchar(20) NOT NULL,
  `DataNascita` date NOT NULL,
  `LuogoNascita` varchar(20) NOT NULL,
  `Cittadinanza` varchar(20) NOT NULL,
  `Sesso` varchar(1) NOT NULL,
  `Utente` varchar(20) NOT NULL,
  `Residenza` int(11) NOT NULL,
  PRIMARY KEY (`CodFiscale`),
  FOREIGN KEY (`Residenza`) REFERENCES `Luogo`(`IdLuogo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`Utente`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ANAGRAFICA`
-- ----------------------------
BEGIN;
INSERT INTO `Anagrafica` VALUES ('ERMTRC50','Ermenegilda','Turchesi','1950-02-01','Napoli','Italiana','F','Ermenegilda50',6);
INSERT INTO `Anagrafica` VALUES ('ERNGLL85','Ernesto','Gialli','1985-03-02','Venezia','Italiana','M','Ernesto85',10);
INSERT INTO `Anagrafica` VALUES ('FRNGLL45','Francesca','Galli','1945-08-09','Agrigento','Italiana','F','Francesca45',16);
INSERT INTO `Anagrafica` VALUES ('GNNARC40','Gennaro','Arancioni','1940-10-14','Bari','Italiana','M','Gennaro40',15);
INSERT INTO `Anagrafica` VALUES ('GSPVRD70','Giuseppe','Verdi','1970-05-12','Lucca','Italiana','M','Giuseppe70',3);
INSERT INTO `Anagrafica` VALUES ('JHNDOE80','John','Doe','1980-02-27 00:00:00','London','Inglese','M','John80',9);
INSERT INTO `Anagrafica` VALUES ('LCRZZR90','Lucrezia','Azzurri','1990-12-09','Firenze','Italiana','F','Lucrezia90',5);
INSERT INTO `Anagrafica` VALUES ('MARRSS75','Mario','Rossi','1975-06-01','Pisa','Italiana','M','Mario75',1);
INSERT INTO `Anagrafica` VALUES ('RMIMRT55','Remi','Martell','1955-08-30','Nizza','Francese','M','Remi55',13);
INSERT INTO `Anagrafica` VALUES ('SVRORS65','Saverio','Orsucci','1965-09-23','Genova','Italiana','M','Saverio65',12);
COMMIT;



-- ----------------------------
--  Table structure for `ATTRIBUZIONE`
-- ----------------------------
DROP TABLE IF EXISTS `Attribuzione`;
CREATE TABLE `Attribuzione` (
  `Utente` varchar(20) NOT NULL,
  `Spesa` int(11) NOT NULL,
  PRIMARY KEY (`Spesa`,`Utente`),
  FOREIGN KEY (`Spesa`) REFERENCES `Spesa`(`IdSpesa`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Utente`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ATTRIBUZIONE`
-- ----------------------------
BEGIN;
INSERT INTO `Attribuzione` VALUES ('Saverio65',1);
INSERT INTO `Attribuzione` VALUES ('Saverio65',2);
INSERT INTO `Attribuzione` VALUES ('Ernesto85',3);
INSERT INTO `Attribuzione` VALUES ('Ernesto85',4);
INSERT INTO `Attribuzione` VALUES ('Saverio65',4);
INSERT INTO `Attribuzione` VALUES ('Ernesto85',5);
INSERT INTO `Attribuzione` VALUES ('Saverio65',5);
INSERT INTO `Attribuzione` VALUES ('Ernesto85',6);
INSERT INTO `Attribuzione` VALUES ('Saverio65',6);
COMMIT;



-- ----------------------------
--  Table structure for `BENE`
-- ----------------------------
DROP TABLE IF EXISTS `Bene`;
CREATE TABLE `Bene` (
  `Idbene` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(10) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Descrizione` varchar(1000) DEFAULT NULL,
  `DataScadenza` date DEFAULT NULL,
  `Abitazione` int(11) DEFAULT NULL,
  `Possessore` varchar(20) NOT NULL,
  PRIMARY KEY (`Idbene`),
  FOREIGN KEY (`Abitazione`) REFERENCES `Abitazione`(`IdAbitazione`) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (`Possessore`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `BENE`
-- ----------------------------
BEGIN;
INSERT INTO `Bene` VALUES (1,'Alimentare','Yogurt','uno yogurt da mangiare','2013-06-01',1,'Saverio65');
INSERT INTO `Bene` VALUES (2,'Generico','Mazza da Golf','una mazza da golf',NULL,1,'Ernesto85');
COMMIT;



-- ----------------------------
--  Table structure for `IMPRESAPULIZIA`
-- ----------------------------
DROP TABLE IF EXISTS `ImpresaPulizia`;
CREATE TABLE `ImpresaPulizia` (
    `PartitaIva` varchar(20) NOT NULL,
    `RagSociale` varchar(50) NOT NULL,
    `Email` varchar(40) NOT NULL,
    PRIMARY KEY (`PartitaIva`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `IMPRESAPULIZIA`
-- ----------------------------
BEGIN;
INSERT INTO `ImpresaPulizia` VALUES ('IT12345678910','Pulizie Intense SRL','info@pulizieintense.com');
COMMIT;



-- ----------------------------
--  Table structure for `INVENTARIO`
-- ----------------------------
DROP TABLE IF EXISTS `Inventario`;
CREATE TABLE `Inventario` (
  `IdOggetto` int(11) NOT NULL AUTO_INCREMENT,
  `Tipologia` varchar(20) NOT NULL,
  `Stato` varchar(1) NOT NULL,
  `Zona` int(11) NOT NULL,
  PRIMARY KEY (`IdOggetto`),
  FOREIGN KEY (`Zona`) REFERENCES `Zona`(`IdZona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `INVENTARIO`
-- ----------------------------
BEGIN;
INSERT INTO `Inventario` VALUES (1,'Mobile','U',1);
INSERT INTO `Inventario` VALUES (2,'Sedia','N',1);
INSERT INTO `Inventario` VALUES (3,'Tavolo','U',1);
INSERT INTO `Inventario` VALUES (4,'Poltrona','U',4);
INSERT INTO `Inventario` VALUES (5,'Lampadario','U',4);
INSERT INTO `Inventario` VALUES (6,'Letto','U',3);
INSERT INTO `Inventario` VALUES (7,'Letto','U',3);
COMMIT;



-- ----------------------------
--  Table structure for `LUOGO`
-- ----------------------------
DROP TABLE IF EXISTS `Luogo`;
CREATE TABLE `Luogo` (
    `IdLuogo` int(11) NOT NULL AUTO_INCREMENT,
    `Indirizzo` varchar(50) NOT NULL,
    `Comune` varchar(20) NOT NULL,
    `Provincia` varchar(20) NOT NULL,
    `CAP` int(11) NOT NULL,
    `Stato` varchar(20) NOT NULL,
    PRIMARY KEY (`IdLuogo`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `LUOGO`
-- ----------------------------
BEGIN;
INSERT INTO `Luogo` VALUES (1,'Via Dante Alighieri, 25','San Giuliano Terme','Pisa',12345,'Italy');
INSERT INTO `Luogo` VALUES (2,'Piazza Garibaldi, 30','Pisa','Pisa',12345,'Italy');
INSERT INTO `Luogo` VALUES (3,'Via Fillungo, 40','Lucca','Lucca',12345,'Italy');
INSERT INTO `Luogo` VALUES (4,'Via Cavour, 45','Roma','Roma',12345,'Italy');
INSERT INTO `Luogo` VALUES (5,'Largo Lucio Lazzarino, 125','Varazze','Savona',12345,'Italy');
INSERT INTO `Luogo` VALUES (6,'Vicolo Corto, 89','Montefalcone','Terni',12345,'Italy');
INSERT INTO `Luogo` VALUES (7,'Viale della Vittoria, 345','Agrigento','Agrigento',12345,'Italy');
INSERT INTO `Luogo` VALUES (8,'Via Ho Chi Min, 34','Nizza','Nizza',12345,'France');
INSERT INTO `Luogo` VALUES (9,'Oxford Street, 321','Liverpool','Liverpool',12345,'England');
INSERT INTO `Luogo` VALUES (10,'Piazza Giulio Cesare, 66','MIlano','Milano',12345,'Italy');
INSERT INTO `Luogo` VALUES (11,'Via Marconi, 43','Agrigento','Agrigento',12345,'Italy');
INSERT INTO `Luogo` VALUES (12,'Via Dell\'Orto, 35','Lecce','Lecce',12345,'Italy');
INSERT INTO `Luogo` VALUES (13,'Piazza Voilà, 43','Paris','Paris',12345,'France');
INSERT INTO `Luogo` VALUES (14,'Piazza Dante, 100','Scandicci','Firenze',12345,'Italy');
INSERT INTO `Luogo` VALUES (15,'Via Martiri, 56','Bari','Bari',12345,'Italy');
INSERT INTO `Luogo` VALUES (16,'Piazza delle Vettovaglie, 30','Pisa','Pisa',12345,'Italy');
COMMIT;



-- ----------------------------
--  Table structure for `PULIZIA`
-- ----------------------------
DROP TABLE IF EXISTS `Pulizia`;
CREATE TABLE `Pulizia` (
  `IdPulizia` int(11) NOT NULL AUTO_INCREMENT,
  `DataPrevista` datetime NOT NULL,
  `DataEffettiva` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPulizia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PULIZIA`
-- ----------------------------
BEGIN;
INSERT INTO `Pulizia` VALUES (1,'2013-01-01 00:00:00','2013-01-01 00:00:00');
INSERT INTO `Pulizia` VALUES (2,'2013-02-01 00:00:00','2013-02-01 00:00:00');
INSERT INTO `Pulizia` VALUES (3,'2013-03-01 00:00:00','2013-03-01 00:00:00');
INSERT INTO `Pulizia` VALUES (4,'2013-04-01 00:00:00','2013-04-01 00:00:00');
INSERT INTO `Pulizia` VALUES (5,'2013-05-01 00:00:00','2013-05-01 00:00:00');
INSERT INTO `Pulizia` VALUES (6,'2013-06-01 00:00:00','2013-06-01 00:00:00');
INSERT INTO `Pulizia` VALUES (7,'2013-07-01 00:00:00',NULL);
INSERT INTO `Pulizia` VALUES (8,'2013-08-01 00:00:00',NULL);
INSERT INTO `Pulizia` VALUES (9,'2013-09-01 00:00:00',NULL);
INSERT INTO `Pulizia` VALUES (10,'2013-10-01 00:00:00',NULL);
INSERT INTO `Pulizia` VALUES (11,'2013-11-01 00:00:00',NULL);
INSERT INTO `Pulizia` VALUES (12,'2013-12-01 00:00:00',NULL);
COMMIT;



-- ----------------------------
--  Table structure for `PULIZIAIMPRESA`
-- ----------------------------
DROP TABLE IF EXISTS `PuliziaImpresa`;
CREATE TABLE `PuliziaImpresa` (
  `Pulizia` int(11) NOT NULL,
  `Impresa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pulizia`,`Impresa`),
  FOREIGN KEY (`Impresa`) REFERENCES `ImpresaPulizia`(`PartitaIva`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Pulizia`) REFERENCES `Pulizia`(`IdPulizia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PULIZIAIMPRESA`
-- ----------------------------
BEGIN;
INSERT INTO `PuliziaImpresa` VALUES (1,'IT12345678910');
INSERT INTO `PuliziaImpresa` VALUES (3,'IT12345678910');
INSERT INTO `PuliziaImpresa` VALUES (5,'IT12345678910');
INSERT INTO `PuliziaImpresa` VALUES (7,'IT12345678910');
INSERT INTO `PuliziaImpresa` VALUES (9,'IT12345678910');
INSERT INTO `PuliziaImpresa` VALUES (11,'IT12345678910');
COMMIT;



-- ----------------------------
--  Table structure for `PULIZIAUTENTE`
-- ----------------------------
DROP TABLE IF EXISTS `PuliziaUtente`;
CREATE TABLE `PuliziaUtente` (
  `Pulizia` int(11) NOT NULL,
  `Utente` varchar(20) NOT NULL,
  PRIMARY KEY (`Pulizia`,`Utente`),
  FOREIGN KEY (`Pulizia`) REFERENCES `Pulizia`(`IdPulizia`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Utente`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PULIZIAUTENTE`
-- ----------------------------
INSERT INTO `PuliziaUtente` VALUES (2,'Saverio65');
INSERT INTO `PuliziaUtente` VALUES (4,'Ernesto85');
INSERT INTO `PuliziaUtente` VALUES (6,'Ernesto85');
INSERT INTO `PuliziaUtente` VALUES (6,'Saverio65');
INSERT INTO `PuliziaUtente` VALUES (8,'Saverio65');
INSERT INTO `PuliziaUtente` VALUES (10,'Ernesto85');
INSERT INTO `PuliziaUtente` VALUES (12,'Ernesto85');
INSERT INTO `PuliziaUtente` VALUES (12,'Saverio65');



-- ----------------------------
--  Table structure for `PULIZIAZONA`
-- ----------------------------
DROP TABLE IF EXISTS `PuliziaZona`;
CREATE TABLE `PuliziaZona` (
  `Pulizia` int(11) NOT NULL,
  `Zona` int(11) NOT NULL,
  PRIMARY KEY (`Pulizia`,`Zona`),
  FOREIGN KEY (`Pulizia`) REFERENCES `Pulizia`(`IdPulizia`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Zona`) REFERENCES `Zona`(`IdZona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PULIZIAZONA`
-- ----------------------------
BEGIN;
INSERT INTO `PuliziaZona` VALUES (1,1);
INSERT INTO `PuliziaZona` VALUES (1,2);
INSERT INTO `PuliziaZona` VALUES (1,3);
INSERT INTO `PuliziaZona` VALUES (1,4);
INSERT INTO `PuliziaZona` VALUES (2,1);
INSERT INTO `PuliziaZona` VALUES (2,2);
INSERT INTO `PuliziaZona` VALUES (2,3);
INSERT INTO `PuliziaZona` VALUES (2,4);
INSERT INTO `PuliziaZona` VALUES (3,1);
INSERT INTO `PuliziaZona` VALUES (3,2);
INSERT INTO `PuliziaZona` VALUES (3,3);
INSERT INTO `PuliziaZona` VALUES (3,4);
INSERT INTO `PuliziaZona` VALUES (4,1);
INSERT INTO `PuliziaZona` VALUES (4,2);
INSERT INTO `PuliziaZona` VALUES (4,3);
INSERT INTO `PuliziaZona` VALUES (4,4);
INSERT INTO `PuliziaZona` VALUES (5,1);
INSERT INTO `PuliziaZona` VALUES (5,2);
INSERT INTO `PuliziaZona` VALUES (5,3);
INSERT INTO `PuliziaZona` VALUES (5,4);
INSERT INTO `PuliziaZona` VALUES (6,1);
INSERT INTO `PuliziaZona` VALUES (6,2);
INSERT INTO `PuliziaZona` VALUES (6,3);
INSERT INTO `PuliziaZona` VALUES (6,4);
INSERT INTO `PuliziaZona` VALUES (7,1);
INSERT INTO `PuliziaZona` VALUES (7,2);
INSERT INTO `PuliziaZona` VALUES (7,3);
INSERT INTO `PuliziaZona` VALUES (7,4);
INSERT INTO `PuliziaZona` VALUES (8,1);
INSERT INTO `PuliziaZona` VALUES (8,2);
INSERT INTO `PuliziaZona` VALUES (8,3);
INSERT INTO `PuliziaZona` VALUES (8,4);
INSERT INTO `PuliziaZona` VALUES (9,1);
INSERT INTO `PuliziaZona` VALUES (9,2);
INSERT INTO `PuliziaZona` VALUES (9,3);
INSERT INTO `PuliziaZona` VALUES (9,4);
INSERT INTO `PuliziaZona` VALUES (10,1);
INSERT INTO `PuliziaZona` VALUES (10,2);
INSERT INTO `PuliziaZona` VALUES (10,3);
INSERT INTO `PuliziaZona` VALUES (10,4);
INSERT INTO `PuliziaZona` VALUES (11,1);
INSERT INTO `PuliziaZona` VALUES (11,2);
INSERT INTO `PuliziaZona` VALUES (11,3);
INSERT INTO `PuliziaZona` VALUES (11,4);
INSERT INTO `PuliziaZona` VALUES (12,1);
INSERT INTO `PuliziaZona` VALUES (12,2);
INSERT INTO `PuliziaZona` VALUES (12,3);
INSERT INTO `PuliziaZona` VALUES (12,4);
COMMIT;



-- ----------------------------
--  Table structure for `RUBRICA`
-- ----------------------------
DROP TABLE IF EXISTS `Rubrica`;
CREATE TABLE `Rubrica` (
  `IdTel` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` varchar(20) NOT NULL,
  `Tipologia` varchar(20) NOT NULL,
  PRIMARY KEY (`IdTel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `RUBRICA`
-- ----------------------------
BEGIN;
INSERT INTO `Rubrica` VALUES (1,'1234 1234567','Cellulare');
INSERT INTO `Rubrica` VALUES (2,'1234 1234567','Fisso');
INSERT INTO `Rubrica` VALUES (3,'1234 1234567','Cellulare');
INSERT INTO `Rubrica` VALUES (4,'1234 1234567','Cellulare');
INSERT INTO `Rubrica` VALUES (5,'1234 1234567','Cellulare');
INSERT INTO `Rubrica` VALUES (6,'1234 1234567','Fax');
INSERT INTO `Rubrica` VALUES (7,'1234 1234567','Fisso');
INSERT INTO `Rubrica` VALUES (8,'1234 1234567','Fax');
COMMIT;



-- ----------------------------
--  Table structure for `RUBRICAABITAZIONE`
-- ----------------------------
DROP TABLE IF EXISTS `RubricaAbitazione`;
CREATE TABLE `RubricaAbitazione` (
  `Tel` int(11) NOT NULL,
  `Abitazione` int(11) NOT NULL,
  PRIMARY KEY (`Tel`),
  FOREIGN KEY (`Tel`) REFERENCES `Rubrica`(`IdTel`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Abitazione`) REFERENCES `Abitazione`(`IdAbitazione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `RUBRICAABITAZIONE`
-- ----------------------------
BEGIN;
INSERT INTO `RubricaAbitazione` VALUES (7,1);
COMMIT;



-- ----------------------------
--  Table structure for `RUBRICAIMPRESA`
-- ----------------------------
DROP TABLE IF EXISTS `RubricaImpresa`;
CREATE TABLE `RubricaImpresa` (
  `Tel` int(11) NOT NULL,
  `Impresa` varchar(20) NOT NULL,
  PRIMARY KEY (`Tel`),
  FOREIGN KEY (`Tel`) REFERENCES `Rubrica`(`IdTel`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Impresa`) REFERENCES `ImpresaPulizia`(`PartitaIva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `RUBRICAIMPRESA`
-- ----------------------------
BEGIN;
INSERT INTO `RubricaImpresa` VALUES (8,'IT12345678910');
COMMIT;



-- ----------------------------
--  Table structure for `RUBRICASEDE`
-- ----------------------------
DROP TABLE IF EXISTS `RubricaSede`;
CREATE TABLE `RubricaSede` (
  `Tel` int(11) NOT NULL,
  `Sede` int(11) NOT NULL,
  PRIMARY KEY (`Tel`),
  FOREIGN KEY (`Tel`) REFERENCES `Rubrica`(`IdTel`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Sede`) REFERENCES `Sede`(`IdSede`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `RUBRICASEDE`
-- ----------------------------
BEGIN;
INSERT INTO `RubricaSede` VALUES (6,1);
COMMIT;



-- ----------------------------
--  Table structure for `RUBRICAUTENTE`
-- ----------------------------
DROP TABLE IF EXISTS `RubricaUtente`;
CREATE TABLE `RubricaUtente` (
  `Tel` int(11) NOT NULL,
  `Utente` varchar(20) NOT NULL,
  PRIMARY KEY (`Tel`),
  FOREIGN KEY (`Tel`) REFERENCES `Rubrica`(`IdTel`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Utente`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `RUBRICAUTENTE`
-- ----------------------------
BEGIN;
INSERT INTO `RubricaUtente` VALUES (1,'Ermenegilda50');
INSERT INTO `RubricaUtente` VALUES (2,'Saverio65');
INSERT INTO `RubricaUtente` VALUES (3,'Ernesto85');
INSERT INTO `RubricaUtente` VALUES (4,'Mario75');
INSERT INTO `RubricaUtente` VALUES (5,'Giuseppe70');
COMMIT;



-- ----------------------------
--  Table structure for `SEDE`
-- ----------------------------
DROP TABLE IF EXISTS `Sede`;
CREATE TABLE `Sede` (
  `IdSede` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(40) NOT NULL,
  `Posizione` int(11) NOT NULL,
  `Agenzia` varchar(20) NOT NULL,
  PRIMARY KEY (`IdSede`),
  FOREIGN KEY (`Agenzia`) REFERENCES `Agenzia`(`PartitaIva`) ON DELETE NO ACTION ON UPDATE CASCADE,
  FOREIGN KEY (`Posizione`) REFERENCES `Luogo`(`IdLuogo`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SEDE`
-- ----------------------------
BEGIN;
INSERT INTO `Sede` VALUES (1,'pisa@stilecasa.com',2,'IT01114601006');
INSERT INTO `Sede` VALUES (2,'roma@stilecasa.com',4,'IT01114601006');
INSERT INTO `Sede` VALUES (3,'agrigento@stilecasa.com',11,'IT01114601006');
INSERT INTO `Sede` VALUES (4,'nizza@immobiliare.com',8,'FR12345678912');
COMMIT;



-- ----------------------------
--  Table structure for `SOGGIORNO`
-- ----------------------------
DROP TABLE IF EXISTS `Soggiorno`;
CREATE TABLE `Soggiorno` (
  `IdSoggiorno` int(11) NOT NULL AUTO_INCREMENT,
  `DataInizio` datetime NOT NULL,
  `DataFine` datetime NOT NULL,
  `Quota` int(11) NOT NULL,
  `Zona` int(11) NOT NULL,
  `Utente` varchar(20) NOT NULL,
  PRIMARY KEY (`IdSoggiorno`),
  FOREIGN KEY (`Zona`) REFERENCES `Zona`(`IdZona`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Utente`) REFERENCES `Utente`(`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CHECK(DataFine < DataInizio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SOGGIORNO`
-- ----------------------------
BEGIN;
INSERT INTO `Soggiorno` VALUES (1,'2010-01-01 00:00:00','2011-01-01 00:00:00',2000,3,'Saverio65');
INSERT INTO `Soggiorno` VALUES (2,'2013-01-01 00:00:00','2014-01-01 00:00:00',3000,3,'Saverio65');
INSERT INTO `Soggiorno` VALUES (5,'2012-01-01 00:00:00','2014-01-01 00:00:00',5000,4,'Ernesto85');
COMMIT;



-- ----------------------------
--  Table structure for `SPESA`
-- ----------------------------
DROP TABLE IF EXISTS `Spesa`;
CREATE TABLE `Spesa` (
  `IdSpesa` int(11) NOT NULL AUTO_INCREMENT,
  `Descrizione` varchar(100) DEFAULT NULL,
  `DataScadenza` date NOT NULL,
  `DataPagata` date DEFAULT NULL,
  `Importo` int(11) NOT NULL,
  `Mora` int(11) DEFAULT NULL,
  `Abitazione` int(11) NOT NULL,
  PRIMARY KEY (`IdSpesa`),
  FOREIGN KEY (`Abitazione`) REFERENCES `Abitazione`(`IdAbitazione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `SPESA`
-- ----------------------------
BEGIN;
INSERT INTO `Spesa` VALUES (1,'Affitto','2011-01-01','2011-01-01',2000,0,1);
INSERT INTO `Spesa` VALUES (2,'Affitto','2014-01-01',NULL,3000,NULL,1);
INSERT INTO `Spesa` VALUES (3,'Affitto','2014-01-01','2013-01-01',5000,0,1);
INSERT INTO `Spesa` VALUES (4,'Acqua','2013-02-01','2013-01-20',100,0,1);
INSERT INTO `Spesa` VALUES (5,'Luce','2013-02-01','2013-01-25',200,0,1);
INSERT INTO `Spesa` VALUES (6,'Gas','2013-02-01','2013-01-27',100,0,1);
COMMIT;



-- ----------------------------
--  Table structure for `UTENTE`
-- ----------------------------
DROP TABLE IF EXISTS `Utente`;
CREATE TABLE `Utente` (
  `Username` varchar(20) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Afferenza` int(11) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  FOREIGN KEY (`Afferenza`) REFERENCES `Sede`(`IdSede`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `UTENTE`
-- ----------------------------
BEGIN;
INSERT INTO `Utente` VALUES ('Ermenegilda50','6f3240543cede5da63dc8d44bba868ac','ermenegilda.turchesi@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Ernesto85','6f3240543cede5da63dc8d44bba868ac','ernesto.gialli@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Francesca45','6f3240543cede5da63dc8d44bba868ac','francesca.galli@gmail.com',3);
INSERT INTO `Utente` VALUES ('Gennaro40','6f3240543cede5da63dc8d44bba868ac','gennaro.arancioni@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Giuseppe70','6f3240543cede5da63dc8d44bba868ac','giuseppe.verdi@gmail.com',2);
INSERT INTO `Utente` VALUES ('John80','6f3240543cede5da63dc8d44bba868ac','john.doe@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Lucrezia90','6f3240543cede5da63dc8d44bba868ac','lucrezia.azzurri@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Mario75','6f3240543cede5da63dc8d44bba868ac','mario.rossi@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Remi55','6f3240543cede5da63dc8d44bba868ac','remi.martell@gmail.com',NULL);
INSERT INTO `Utente` VALUES ('Saverio65','6f3240543cede5da63dc8d44bba868ac','saverio.orsucci@gmail.com',NULL);
COMMIT;



-- ----------------------------
--  Table structure for `ZONA`
-- ----------------------------
DROP TABLE IF EXISTS `Zona`;
CREATE TABLE `Zona` (
  `IdZona` int(11) NOT NULL AUTO_INCREMENT,
  `Tipologia` varchar(20) NOT NULL,
  `Abitazione` int(11) NOT NULL,
  PRIMARY KEY (`IdZona`),
  FOREIGN KEY (`Abitazione`) REFERENCES `Abitazione`(`IdAbitazione`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ZONA`
-- ----------------------------
BEGIN;
INSERT INTO `Zona` VALUES (1,'Cucina',1);
INSERT INTO `Zona` VALUES (2,'Bagno',1);
INSERT INTO `Zona` VALUES (3,'Camera',1);
INSERT INTO `Zona` VALUES (4,'Camera',1);
INSERT INTO `Zona` VALUES (5,'Giardino',1);
INSERT INTO `Zona` VALUES (6,'Cucina',2);
INSERT INTO `Zona` VALUES (7,'Bagno',2);
INSERT INTO `Zona` VALUES (8,'Camera',2);
INSERT INTO `Zona` VALUES (9,'Camera',2);
INSERT INTO `Zona` VALUES (10,'Area Condominiale',2);
COMMIT;


-- ----------------------------
--  SEZIONE TRIGGER
-- ----------------------------

-- ----------------------------
--  Trigger structure for `CHK_SESSO_IN`
-- ----------------------------
DROP TRIGGER IF EXISTS chk_Sesso_in;
delimiter $$
CREATE TRIGGER chk_Sesso_in BEFORE INSERT ON `Anagrafica`
FOR EACH ROW
BEGIN
DECLARE msg varchar(255);
IF (NEW.Sesso <> 'M' AND NEW.Sesso <> 'F')
THEN
SET msg = CONCAT('Constraint chk_Sesso violated: Sesso non può contenere il valore ', CAST(NEW.Sesso as char));
SIGNAL sqlstate '45000' SET message_text = msg;
END IF;
END$$
delimiter ;	
-- ----------------------------
--  Trigger structure for `CHK_SESSO_UP`
-- ----------------------------
DROP TRIGGER IF EXISTS chk_Sesso_up;
delimiter $$
CREATE TRIGGER chk_Sesso_up BEFORE UPDATE ON `Anagrafica`
FOR EACH ROW
BEGIN
DECLARE msg varchar(255);
IF (NEW.Sesso <> 'M' AND NEW.Sesso <> 'F')
THEN
SET msg = CONCAT('Constraint chk_Sesso violated: Sesso non può contenere il valore ', CAST(NEW.Sesso as char));
SIGNAL sqlstate '45100' SET message_text = msg;
END IF;
END$$
delimiter ;	



-- ----------------------------
--  Trigger structure for `RIDGIARDINOIN`
-- ----------------------------
DROP TRIGGER IF EXISTS RidGiardinoINS;
DELIMITER $$

CREATE TRIGGER RidGiardinoINS 
AFTER INSERT ON `Zona` FOR EACH ROW
BEGIN

IF (NEW.Tipologia ='Giardino')
THEN
UPDATE Abitazione
SET Giardino = 'Y'
WHERE IdAbitazione = NEW.Abitazione;
END IF;

END$$
DELIMITER ;



-- ----------------------------
--  Trigger structure for `RIDGIARDINOUP`
-- ----------------------------
DROP TRIGGER IF EXISTS RidGiardinoUP;
DELIMITER $$

CREATE TRIGGER RidGiardinoUP 
AFTER UPDATE ON `Zona` FOR EACH ROW
BEGIN

IF (NEW.Tipologia ='Giardino')
THEN
UPDATE Abitazione
SET Giardino = 'Y'
WHERE IdAbitazione = NEW.Abitazione;
END IF;

IF (OLD.Tipologia ='Giardino')
THEN
UPDATE Abitazione
SET Giardino = 'N'
WHERE IdAbitazione = OLD.Abitazione AND 0 =(
										    SELECT COUNT(*)
										    FROM Zona
										    WHERE Abitazione = OLD.Abitazione AND Tipologia='Giardino');
END IF;

END$$
DELIMITER ;	



-- ----------------------------
--  Trigger structure for `RIDGIARDINODEL`
-- ----------------------------
DROP TRIGGER IF EXISTS RidGiardinoDel;
DELIMITER $$

CREATE TRIGGER RidGiardinoDel
AFTER DELETE ON `Zona` FOR EACH ROW
BEGIN

IF (OLD.Tipologia ='Giardino')
THEN
UPDATE Abitazione
SET Giardino = 'N'
WHERE IdAbitazione = OLD.Abitazione AND 0 =(
										    SELECT COUNT(*)
										    FROM Zona
										    WHERE Abitazione = OLD.Abitazione AND Tipologia='Giardino');
END IF;

END$$
DELIMITER ;	


-- ----------------------------
--  Trigger structure for `CHKDATASCADENZAINS`
-- ----------------------------
DROP TRIGGER IF EXISTS ChkDataScadenzaINS;
DELIMITER $$

CREATE TRIGGER ChkDataScadenzaINS
BEFORE INSERT ON `Bene` FOR EACH ROW
BEGIN

DECLARE msg varchar(255);

IF (NEW.Tipo <> 'Alimentare' AND NEW.DataScadenza IS NOT NULL)
THEN
SET msg = CONCAT('DataScadenza non può contenere alcun valore per gli attributi di Tipo ', CAST(NEW.Tipo AS CHAR));
SIGNAL SQLSTATE '45100' SET MESSAGE_TEXT = msg;
END IF;

IF (NEW.Tipo = 'Alimentare' AND NEW.DataScadenza IS NULL)
THEN
SET msg = 'DataScadenza non può contenere il valore NULL per gli attributi di Tipo Alimentare';
SIGNAL SQLSTATE '45100' SET MESSAGE_TEXT = msg;
END IF;

END$$
DELIMITER ;

-- ----------------------------
--  Trigger structure for `CHKDATASCADENZAUP`
-- ----------------------------
DROP TRIGGER IF EXISTS ChkDataScadenzaUP;
DELIMITER $$

CREATE TRIGGER ChkDataScadenzaUP
BEFORE UPDATE ON `Bene` FOR EACH ROW
BEGIN

DECLARE msg varchar(255);

IF (NEW.Tipo <> 'Alimentare' AND NEW.DataScadenza IS NOT NULL)
THEN
SET msg = CONCAT('DataScadenza non può contenere alcun valore per gli attributi di Tipo ', CAST(NEW.Tipo AS CHAR));
SIGNAL SQLSTATE '45100' SET MESSAGE_TEXT = msg;
END IF;

IF (NEW.Tipo = 'Alimentare' AND NEW.DataScadenza IS NULL)
THEN
SET msg = 'DataScadenza non può contenere il valore NULL per gli attributi di Tipo Alimentare';
SIGNAL SQLSTATE '45100' SET MESSAGE_TEXT = msg;
END IF;

END$$
DELIMITER ;


SET FOREIGN_KEY_CHECKS = 1;