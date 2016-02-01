CREATE DATABASE IF NOT EXISTS mifatest;
use mifatest;

DROP TABLE IF EXISTS `nachricht`;
DROP TABLE IF EXISTS `bewertung`;
DROP TABLE IF EXISTS `user_fahrzeug`;
DROP TABLE IF EXISTS `passagier_fahrt`;
DROP TABLE IF EXISTS `fahrt`;
DROP TABLE IF EXISTS `fahrzeug`;
DROP TABLE IF EXISTS `ort`;
DROP TABLE IF EXISTS `passwort`;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userBildURL` varchar(128),
  `isAdmin` ENUM('false', 'true') NOT NULL DEFAULT 'false',
  `isActivated` ENUM('false', 'true') NOT NULL DEFAULT 'false',
  `telNummer` varchar(20) NOT NULL,
  `eMail` varchar(45) NOT NULL,
  `vName` varchar(20) NOT NULL,
  `nName` varchar(20) NOT NULL,
  `geburtsDatum` DATE,
  PRIMARY KEY (`userID`)
  );
  
CREATE TABLE `ort` (
  `ortID` int NOT NULL AUTO_INCREMENT,
  `PLZ` varchar(10) NOT NULL,
  `ortBezeichnung` varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY (`ortID`)
  );
  
CREATE TABLE `fahrzeug` (
  `fahrzeugID` INT NOT NULL AUTO_INCREMENT,
  `fahrzeugTyp` varchar(20) NOT NULL,
  `fahrzeugBezeichnung` varchar(45) NOT NULL,
  `nummernschild` varchar(10) NOT NULL,
  `fahrzeugFarbe` varchar(20) NOT NULL,
  `fahrzeugBildURL` varchar(128) NOT NULL,
  PRIMARY KEY (`fahrzeugID`)
  );
  
CREATE TABLE `passwort` (
  `passwortID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL,
  `passwortValue` varchar(15) NOT NULL,
  
  PRIMARY KEY (`passwortID`),

  KEY `pwuser_fk` (`userID`),
  CONSTRAINT `pwuser_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE `fahrt` (
  `fahrtID` INT NOT NULL AUTO_INCREMENT,
  `fahrerID` INT NOT NULL,
  `fahrtDatum` DATE NOT NULL,
  `fahrtStartZeit` TIME NOT NULL,
  `gepaeck` varchar(45) NOT NULL,
  `kommentar` varchar(500),
  `kapazitaet` int NOT NULL,
  `s1` varchar(45) NOT NULL,
  `s2` varchar(45),
  `s3` varchar(45),
  `s4` varchar(45),
  `s5` varchar(45),
  `s6` varchar(45) NOT NULL,
  `p1` int NOT NULL,
  `p2` int,
  `p3` int,
  `p4` int,
  `p5` int,
  `p6` int NOT NULL,
  PRIMARY KEY (`fahrtId`),
  
  KEY `fahrer_fk` (`fahrerID`),
  CONSTRAINT `fahrer_fk` FOREIGN KEY (`fahrerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
CREATE TABLE `passagier_fahrt` (
  `passagier_fahrtID` INT NOT NULL AUTO_INCREMENT,
  `fahrtID` INT NOT NULL,
  `userID` INT NOT NULL,
  `userStart` varchar(45) NOT NULL,
  `userZiel` varchar(45),
  PRIMARY KEY (`passagier_fahrtID`),
  
  KEY `passag_fahrt_fk` (`fahrtID`),
  CONSTRAINT `passag_fahrt_fk` FOREIGN KEY (`fahrtID`) REFERENCES `fahrt` (`fahrtID`) ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `passag_user_fk` (`userID`),
  CONSTRAINT `passag_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
  );
 
CREATE TABLE `user_fahrzeug` (
  `user_fahrzeugID` INT NOT NULL AUTO_INCREMENT,
  `fahrzeugID` INT NOT NULL,
  `userID` INT NOT NULL,

  PRIMARY KEY (`user_fahrzeugID`),
  
  KEY `user_fahrzeug_fk` (`userID`),
  CONSTRAINT `user_fahrzeug_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `fahrzeug_user_fk` (`fahrzeugID`),
  CONSTRAINT `fahrzeuguser_fk` FOREIGN KEY (`fahrzeugID`) REFERENCES `fahrzeug` (`fahrzeugID`) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
CREATE TABLE `bewertung` (
  `bewertungID` INT NOT NULL AUTO_INCREMENT,
  `bewertungSenderID` INT NOT NULL,
  `bewertungEmpfaengerID` INT NOT NULL,
  `fahrtID` INT NOT NULL,
  `bewertungDatum` DATE NOT NULL,
  `bewertungText` varchar(500),
  `puenktlichkeitRating` INT(1) NOT NULL,
  `fahrstilRating` INT(1),
  `freundlichkeitRating` INT(1) NOT NULL,

  PRIMARY KEY (`bewertungID`),
  
  KEY `bewertung_fahrt_fk` (`fahrtID`),
  CONSTRAINT `bewertung_fahrt_fk` FOREIGN KEY (`fahrtID`) REFERENCES `fahrt` (`fahrtID`) ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `bewertung_sender_fk` (`bewertungSenderID`),
  CONSTRAINT `bewertung_sender_fk` FOREIGN KEY (`bewertungSenderID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `bewertung_empfaenger_fk` (`bewertungEmpfaengerID`),
  CONSTRAINT `bewertung_empfaenger_fk` FOREIGN KEY (`bewertungEmpfaengerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
CREATE TABLE `nachricht` (
  `nachrichtID` INT NOT NULL AUTO_INCREMENT,
  `nachrichtSenderID` INT NOT NULL,
  `nachrichtEmpfaengerID` INT NOT NULL,
  `nachrichtZeit` TIME NOT NULL,
  `nachrichtText` varchar(500),

  PRIMARY KEY (`nachrichtID`),
  
  KEY `nachricht_sender_fk` (`nachrichtSenderID`),
  CONSTRAINT `nachricht_sender_fk` FOREIGN KEY (`nachrichtSenderID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  
  KEY `nachricht_empfaenger_fk` (`nachrichtEmpfaengerID`),
  CONSTRAINT `nachricht_empfaenger_fk` FOREIGN KEY (`nachrichtEmpfaengerID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Clemens', 'Kruse', '1990-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Martin', 'Handrick', '1989-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Steffen', 'Rogge', '1987-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Fabian', 'Richter', '1992-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Thomas', 'Zinn', '1992-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Frank', 'Schumann', '1992-10-16');
INSERT INTO `mifatest`.`user` (`userBildURL`, `isAdmin`, `isActivated`, `telNummer`, `eMail`, `vName`, `nName`, `geburtsDatum`) VALUES ('img/1.png', 'false', 'false', '0123 456 789', 'fake@mail.de', 'Captain', 'Hero', '2014-10-16');

INSERT INTO `mifatest`.`fahrt` (`fahrerID`, `fahrtDatum`, `fahrtStartZeit`, `gepaeck`, `kommentar`, `kapazitaet`, `s1`, `s2`, `s6`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`) VALUES ('1', '2016-01-14', '09:00:00', 'ausreichend Platz', 'Hallo :) freue mich auf nette Mitfahrer', '3', 'Dresden', 'Grimma', 'Leipzig', '2', '2', '2', '2', '2', '2');
INSERT INTO `mifatest`.`fahrt` (`fahrerID`, `fahrtDatum`, `fahrtStartZeit`, `gepaeck`, `kommentar`, `kapazitaet`, `s1`, `s2`, `s6`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`) VALUES ('1', '2016-01-15', '10:00:00', 'ausreichend Platz', 'Hallo :) freue mich auf nette Mitfahrer', '3', 'Leipzig', 'Grimma', 'Dresden', '2', '2', '2', '2', '2', '2');
INSERT INTO `mifatest`.`fahrt` (`fahrerID`, `fahrtDatum`, `fahrtStartZeit`, `gepaeck`, `kommentar`, `kapazitaet`, `s1`, `s2`, `s6`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`) VALUES ('2', '2016-03-26', '09:00:00', 'ausreichend Platz', 'Hallo :) freue mich auf nette Mitfahrer', '3', 'Dresden', 'Leipzig', 'Bremen', '2', '2', '2', '2', '2', '2');
INSERT INTO `mifatest`.`fahrt` (`fahrerID`, `fahrtDatum`, `fahrtStartZeit`, `gepaeck`, `kommentar`, `kapazitaet`, `s1`, `s2`, `s6`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`) VALUES ('2', '2016-03-27', '10:00:00', 'ausreichend Platz', 'Hallo :) freue mich auf nette Mitfahrer', '3', 'Bremen', 'Leipzig', 'Dresden', '2', '2', '2', '2', '2', '2');

INSERT INTO `mifatest`.`fahrzeug` (`fahrzeugTyp`, `fahrzeugBezeichnung`, `nummernschild`, `fahrzeugFarbe`, `fahrzeugBildURL`) VALUES ('Kombi', 'Golf IV', 'DDABC16', 'Schwarz', 'img/1.png');
INSERT INTO `mifatest`.`fahrzeug` (`fahrzeugTyp`, `fahrzeugBezeichnung`, `nummernschild`, `fahrzeugFarbe`, `fahrzeugBildURL`) VALUES ('Cabrio', 'BMW 3er', 'LEABC16', 'Blau', 'img/1.png');

INSERT INTO `mifatest`.`user_fahrzeug` (`fahrzeugID`, `userID`) VALUES ('1', '1');
INSERT INTO `mifatest`.`user_fahrzeug` (`fahrzeugID`, `userID`) VALUES ('2', '2');


INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('1', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('2', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('3', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('4', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('5', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('6', 'root');
INSERT INTO `mifatest`.`passwort` (`userID`, `passwortValue`) VALUES ('7', 'root');

INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('04668', 'Grimma');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('04109', 'Leipzig');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('01067 ', 'Dresden');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('28195', 'Bremen');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('20355', 'Hamburg');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('10117', 'Berlin');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('80331', 'München');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('30159', 'Hannover');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('39104', 'Magdeburg');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('60311', 'Frankfurt am Main');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('02625', 'Bautzen');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('01917', 'Kamenz');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('95030', 'Hof');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('24114', 'Kiel');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('23795', 'Bad Segeberg');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('04651', 'Bad Lausick');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('79098', 'Freiburg im Breisgau');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('19055', 'Schwerin');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('19205', 'Gadebusch'); 
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('06116', 'Halle (Saale)');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('68309', 'Mannheim');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('64283', 'Darmstadt');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('04680', 'Colditz');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('90402', 'Nürnberg');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('83022', 'Rosenheim');
INSERT INTO `mifatest`.`ort` (`PLZ`, `ortBezeichnung`) VALUES ('18057', 'Rostock');





 

  

  

  

  

  

  