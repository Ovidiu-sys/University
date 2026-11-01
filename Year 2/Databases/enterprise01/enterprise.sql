USE Intreprindere;

DROP TABLE IF EXISTS VANZARI, COMPOZITII, ACHIZITII, ACTIVITATI, DEPENDENTI, SECRETARE, INGINERI, ANGAJATI, CLIENTI, PRODUSE, COMPONENTE, FURNIZORI, PROIECTIE, SECTII;

CREATE TABLE SECTII (
    IdSectie INT PRIMARY KEY AUTO_INCREMENT,
    Nume VARCHAR(100) NOT NULL
);

CREATE TABLE PROIECTIE (
    IdProiect INT PRIMARY KEY AUTO_INCREMENT,
    Denumire VARCHAR(100) NOT NULL,
    Termen DATE,
    Buget DECIMAL(12, 2)
);

CREATE TABLE FURNIZORI (
    IdFurnizor INT PRIMARY KEY AUTO_INCREMENT,
    Nume VARCHAR(50) NOT NULL,
    Prenume VARCHAR(50),
    Adresa VARCHAR(150)
);

CREATE TABLE COMPONENTE (
    IdComponenta INT PRIMARY KEY AUTO_INCREMENT,
    Denumire VARCHAR(100) NOT NULL,
    Descriere TEXT
);

CREATE TABLE PRODUSE (
    IdProdus INT PRIMARY KEY AUTO_INCREMENT,
    Denumire VARCHAR(100) NOT NULL,
    Descriere TEXT
);

CREATE TABLE CLIENTI (
    IdClient INT PRIMARY KEY AUTO_INCREMENT,
    Nume VARCHAR(50) NOT NULL,
    Prenume VARCHAR(50),
    Adresa VARCHAR(150)
);

CREATE TABLE ANGAJATI (
    IdAngajat INT PRIMARY KEY AUTO_INCREMENT,
    Nume VARCHAR(50) NOT NULL,
    Prenume VARCHAR(50) NOT NULL,
    DataNasterii DATE,
    Adresa VARCHAR(150),
    Functie VARCHAR(50),
    Salariu DECIMAL(10, 2),
    IdSectie INT,
    FOREIGN KEY (IdSectie) REFERENCES SECTII(IdSectie)
);

CREATE TABLE INGINERI (
    IdIngineri INT PRIMARY KEY AUTO_INCREMENT,
    IdAngajat INT NOT NULL,
    Specialitatea VARCHAR(100),
    FOREIGN KEY (IdAngajat) REFERENCES ANGAJATI(IdAngajat)
);

CREATE TABLE SECRETARE (
    IdSecretara INT PRIMARY KEY AUTO_INCREMENT,
    IdAngajat INT NOT NULL,
    VitezaRedactare INT,
    FOREIGN KEY (IdAngajat) REFERENCES ANGAJATI(IdAngajat)
);

CREATE TABLE DEPENDENTI (
    IdDependent INT PRIMARY KEY AUTO_INCREMENT,
    IdAngajat INT NOT NULL,
    Nume VARCHAR(50) NOT NULL,
    Prenume VARCHAR(50) NOT NULL,
    DataNasterii DATE,
    GradRudenie VARCHAR(50),
    FOREIGN KEY (IdAngajat) REFERENCES ANGAJATI(IdAngajat)
);

CREATE TABLE ACTIVITATI (
    IdActivitati INT PRIMARY KEY AUTO_INCREMENT,
    IdProiect INT NOT NULL,
    IdAngajat INT NOT NULL,
    Ore INT,
    FOREIGN KEY (IdProiect) REFERENCES PROIECTIE(IdProiect),
    FOREIGN KEY (IdAngajat) REFERENCES ANGAJATI(IdAngajat)
);

CREATE TABLE ACHIZITII (
    IdAchizitie INT PRIMARY KEY AUTO_INCREMENT,
    IdFurnizor INT NOT NULL,
    IdComponenta INT NOT NULL,
    IdAchizitor INT NOT NULL,
    Data DATE,
    NrComponente INT,
    PretUnitar DECIMAL(10, 2),
    FOREIGN KEY (IdFurnizor) REFERENCES FURNIZORI(IdFurnizor),
    FOREIGN KEY (IdComponenta) REFERENCES COMPONENTE(IdComponenta),
    FOREIGN KEY (IdAchizitor) REFERENCES ANGAJATI(IdAngajat)
);

CREATE TABLE COMPOZITII (
    IdCompozitie INT PRIMARY KEY AUTO_INCREMENT,
    IdComponenta INT NOT NULL,
    IdProdus INT NOT NULL,
    NrComponete INT,
    FOREIGN KEY (IdComponenta) REFERENCES COMPONENTE(IdComponenta),
    FOREIGN KEY (IdProdus) REFERENCES PRODUSE(IdProdus)
);

CREATE TABLE VANZARI (
    IdVanzare INT PRIMARY KEY AUTO_INCREMENT,
    IdProdus INT NOT NULL,
    IdClient INT NOT NULL,
    IdVanzator INT NOT NULL,
    DataVanzare DATE,
    NrProduse INT,
    FOREIGN KEY (IdProdus) REFERENCES PRODUSE(IdProdus),
    FOREIGN KEY (IdClient) REFERENCES CLIENTI(IdClient),
    FOREIGN KEY (IdVanzator) REFERENCES ANGAJATI(IdAngajat)
);
USE Intreprindere;


INSERT INTO SECTII (Nume) VALUES
('Producție'),
('Asamblare'),
('Calitate'),
('Cercetare și Dezvoltare'),
('Administrativ');


INSERT INTO PROIECTIE (Denumire, Termen, Buget) VALUES
('Automatizare Linie 1', '2026-06-30', 150000.00),
('Modernizare Motoare', '2026-09-15', 85000.00),
('Sistem Reciclare', '2026-12-01', 45000.00),
('Echipament Laser', '2027-02-28', 210000.00),
('Optimizare Software PLC', '2026-05-20', 30000.00);


INSERT INTO FURNIZORI (Nume, Prenume, Adresa) VALUES
('Popa', 'Gheorghe', 'Str. Industriei nr. 10, București'),
('TechSupply', 'SRL', 'Bd. Unirii nr. 45, Cluj-Napoca'),
('Metallica', 'SA', 'Str. Uzinei nr. 2, Brașov'),
('Ionescu', 'Dan', 'Str. Florilor nr. 12, Timișoara'),
('ElectroPart', 'SRL', 'Calea Moldovei nr. 88, Iași');

INSERT INTO COMPONENTE (Denumire, Descriere) VALUES
('Senzor Optic', 'Senzor infraroșu pentru detecție poziție'),
('Placă Circuit PCB', 'Placă de bază comandă motor'),
('Rulment Suport', 'Rulment industrial oțel inoxidabil'),
('Motor Pas cu Pas', 'Motor hibrid 24V'),
('Carcasă Aluminiu', 'Carcasă de protecție rezistentă la apă');

INSERT INTO PRODUSE (Denumire, Descriere) VALUES
('Robot Industrial X1', 'Braț articulat pentru manipulare'),
('Bandă Transportoare T5', 'Bandă rulantă 5m cu viteză reglabilă'),
('Modul Senzorial', 'Unitate integrată de senzori'),
('Panou Comandă Touch', 'Interfață om-mașină 10 inch'),
('Actuator Pneumatic', 'Sistem de acționare cu aer comprimat');

INSERT INTO CLIENTI (Nume, Prenume, Adresa) VALUES
('AutoParts', 'SRL', 'Str. Fabricilor nr. 5, Pitești'),
('Vasilescu', 'Elena', 'Str. Libertății nr. 3, Craiova'),
('BuildCorp', 'SA', 'Bd. Victoriei nr. 101, Sibiu'),
('Marinescu', 'Cristian', 'Str. Principală nr. 22, Arad'),
('SmartTech', 'SRL', 'Str. Tehnologiei nr. 14, Constanța');


INSERT INTO ANGAJATI (Nume, Prenume, DataNasterii, Adresa, Functie, Salariu, IdSectie) VALUES
('Ionescu', 'Andrei', '1985-04-12', 'Str. Muncii nr. 1, București', 'Inginer Șef', 8500.00, 1),
('Popescu', 'Maria', '1992-08-25', 'Str. Păcii nr. 15, București', 'Secretară', 4200.00, 5),
('Dumitrescu', 'Mihai', '1988-11-03', 'Str. Soarelui nr. 7, București', 'Inginer Automatizări', 7800.00, 4),
('Stan', 'Florin', '1995-01-19', 'Str. Lalelelor nr. 9, București', 'Tehnician Vânzări', 5000.00, 5),
('Radu', 'Ana', '1990-06-30', 'Str. Toamnei nr. 4, București', 'Operator Calitate', 4600.00, 3);


INSERT INTO INGINERI (IdAngajat, Specialitatea) VALUES
(1, 'Mecanică Fină'),
(3, 'Robotică și Automatizări'),
(1, 'Sisteme Embedded'),
(3, 'Optimizare Procese'),
(1, 'Proiectare CAD');

INSERT INTO SECRETARE (IdAngajat, VitezaRedactare) VALUES
(2, 95),
(2, 110),
(2, 85),
(2, 100),
(2, 105);

INSERT INTO DEPENDENTI (IdAngajat, Nume, Prenume, DataNasterii, GradRudenie) VALUES
(1, 'Ionescu', 'Matei', '2015-05-10', 'Fiul'),
(1, 'Ionescu', 'Ioana', '2018-09-14', 'Fiică'),
(3, 'Dumitrescu', 'Sofia', '2020-02-01', 'Fiică'),
(4, 'Stan', 'George', '2021-12-11', 'Fiul'),
(5, 'Radu', 'David', '2019-07-22', 'Fiul');

INSERT INTO ACTIVITATI (IdProiect, IdAngajat, Ore) VALUES
(1, 1, 120),
(1, 3, 80),
(2, 3, 150),
(3, 5, 40),
(4, 1, 200);

INSERT INTO ACHIZITII (IdFurnizor, IdComponenta, IdAchizitor, Data, NrComponente, PretUnitar) VALUES
(1, 1, 1, '2026-01-15', 50, 120.50),
(2, 2, 3, '2026-02-10', 100, 45.00),
(3, 3, 1, '2026-02-22', 200, 18.20),
(4, 4, 3, '2026-03-05', 30, 250.00),
(5, 5, 1, '2026-03-18', 40, 85.00);

INSERT INTO COMPOZITII (IdComponenta, IdProdus, NrComponete) VALUES
(1, 1, 4),
(2, 1, 2),
(3, 2, 8),
(4, 1, 1),
(5, 3, 2);

INSERT INTO VANZARI (IdProdus, IdClient, IdVanzator, DataVanzare, NrProduse) VALUES
(1, 1, 4, '2026-02-01', 2),
(2, 3, 4, '2026-02-15', 5),
(3, 2, 4, '2026-03-01', 10),
(4, 5, 4, '2026-03-10', 1),
(5, 4, 4, '2026-03-25', 4);
