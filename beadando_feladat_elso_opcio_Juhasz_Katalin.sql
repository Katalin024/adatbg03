--Fizikai modell

DROP TABLE Tanulok;
DROP TABLE Oktatok;
DROP TABLE Jarmuvek;
DROP TABLE Tanorak;
DROP TABLE Vizsgak;

CREATE TABLE Tanulok (
    tanulo_id INTEGER PRIMARY KEY,
    nev TEXT NOT NULL,
    szuletesi_datum DATE,
    lakcim TEXT,
    telefonszam TEXT,
    jelentkezes_datuma DATE
);

CREATE TABLE Oktatok (
    oktato_id INTEGER PRIMARY KEY,
    nev TEXT NOT NULL,
    telefonszam TEXT,
    jogositvany_tipus TEXT
);

CREATE TABLE Jarmuvek (
    jarmu_id INTEGER PRIMARY KEY,
    rendszam TEXT UNIQUE NOT NULL,
    tipus TEXT,
    gyartasi_ev INTEGER,
    oktato_id INTEGER,
    FOREIGN KEY (oktato_id) REFERENCES Oktatok(oktato_id)
);

CREATE TABLE Tanorak (
    tanora_id INTEGER PRIMARY KEY,
    tanulo_id INTEGER,
    jarmu_id INTEGER,
    datum DATE,
    idotartam_perc INTEGER,
    FOREIGN KEY (tanulo_id) REFERENCES Tanulok(tanulo_id),
    FOREIGN KEY (jarmu_id) REFERENCES Jarmuvek(jarmu_id)
);

CREATE TABLE Vizsgak (
    vizsga_id INTEGER PRIMARY KEY,
    tanulo_id INTEGER,
    tipus TEXT,  -- elméleti vagy gyakorlati
    datum DATE,
    eredmeny TEXT,  -- sikeres vagy sikertelen
    FOREIGN KEY (tanulo_id) REFERENCES Tanulok(tanulo_id)
);

INSERT INTO Tanulok (tanulo_id, nev, szuletesi_datum, lakcim, telefonszam, jelentkezes_datuma) VALUES
(1, 'Kovács Ádám', '1995-02-14', '1111 Budapest, Fő utca 10.', '06201234567', '2023-01-01'),
(2, 'Szabó Eszter', '1998-06-25', '1112 Budapest, Kossuth Lajos utca 5.', '06301234568', '2023-01-10'),
(3, 'Nagy Gábor', '1992-10-30', '1113 Budapest, Petőfi utca 12.', '06401234569', '2023-01-15'),
(4, 'Tóth László', '1990-03-18', '1114 Budapest, Rákóczi utca 8.', '06501234570', '2023-01-20'),
(5, 'Varga Zita', '2000-07-05', '1115 Budapest, Akácfa utca 3.', '06201234571', '2023-02-01'),
(6, 'Farkas Péter', '1993-12-02', '1116 Budapest, Jókai utca 21.', '06201234572', '2023-02-05'),
(7, 'Bíró Erika', '1997-01-20', '1117 Budapest, Hunyadi utca 7.', '06401234573', '2023-02-10'),
(8, 'Kiss Imre', '1996-08-13', '1118 Budapest, Vasút utca 25.', '06301234574', '2023-02-15');

INSERT INTO Oktatok (oktato_id, nev, telefonszam, jogositvany_tipus) VALUES
(1, 'Kovács János', '06301234577', 'B'),
(2, 'Nagy Zoltán', '06201234578', 'B'),
(3, 'Tóth Gabriella', '06501234579', 'A'),
(4, 'Farkas László', '06401234580', 'C'),
(5, 'Varga Márta', '06301234581', 'B'),
(6, 'Kiss Gábor', '06501234582', 'A'),
(7, 'Bíró József', '06401234583', 'B'),
(8, 'Papp Erika', '06201234584', 'D'),
(9, 'Horváth Áron', '06301234585', 'C'),
(10, 'Szabó Katalin', '06401234586', 'B');

INSERT INTO Jarmuvek (jarmu_id, rendszam, tipus, gyartasi_ev, oktato_id) VALUES
(1, 'ABC123', 'Suzuki Swift', 2015, 1),
(2, 'XYZ789', 'Volkswagen Golf', 2018, 2),
(3, 'DEF456', 'Opel Astra', 2017, 3),
(4, 'GHI123', 'Ford Focus', 2016, 4),
(5, 'JKL987', 'Renault Clio', 2020, 5),
(6, 'MNO654', 'Hyundai i30', 2019, 6),
(7, 'PQR321', 'Toyota Corolla', 2014, 7),
(8, 'STU654', 'Peugeot 208', 2021, 8),
(9, 'VWX987', 'BMW 3 Series', 2016, 9),
(10, 'YZA543', 'Mercedes-Benz A-Class', 2022, 10);

INSERT INTO Tanorak (tanora_id, tanulo_id, jarmu_id, datum, idotartam_perc) VALUES
(1, 1, 1, '2023-01-07', 60), (2, 1, 1, '2023-01-09', 60), (3, 1, 1, '2023-01-11', 90),
(4, 1, 1, '2023-01-13', 60), (5, 1, 1, '2023-01-15', 60), (6, 1, 1, '2023-01-17', 90),
(7, 1, 1, '2023-01-19', 60), (8, 1, 1, '2023-01-21', 90), (9, 1, 1, '2023-01-23', 75),
(10, 1, 1, '2023-01-25', 60), (11, 1, 1, '2023-01-27', 90), (12, 1, 1, '2023-01-29', 60),

(13, 2, 2, '2023-01-26', 60), (14, 2, 2, '2023-01-28', 75), (15, 2, 2, '2023-01-30', 90),
(16, 2, 2, '2023-02-01', 60), (17, 2, 2, '2023-02-03', 60), (18, 2, 2, '2023-02-06', 75),
(19, 2, 2, '2023-02-08', 60), (20, 2, 2, '2023-02-10', 90), (21, 2, 2, '2023-02-12', 75),
(22, 2, 2, '2023-02-14', 60), (23, 2, 2, '2023-02-16', 75), (24, 2, 2, '2023-02-18', 60),

(25, 3, 3, '2023-01-22', 90), (26, 3, 3, '2023-01-24', 60), (27, 3, 3, '2023-01-26', 75),
(28, 3, 3, '2023-01-28', 90), (29, 3, 3, '2023-01-30', 60), (30, 3, 3, '2023-02-01', 60),
(31, 3, 3, '2023-02-03', 90), (32, 3, 3, '2023-02-05', 60), (33, 3, 3, '2023-02-07', 75),
(34, 3, 3, '2023-02-09', 60), (35, 3, 3, '2023-03-01', 90), (36, 3, 3, '2023-03-05', 60),

(37, 4, 4, '2023-01-28', 60), (38, 4, 4, '2023-01-30', 90), (39, 4, 4, '2023-02-02', 60),
(40, 4, 4, '2023-02-04', 75), (41, 4, 4, '2023-02-06', 60), (42, 4, 4, '2023-02-08', 60),
(43, 4, 4, '2023-02-10', 75), (44, 4, 4, '2023-02-12', 90), (45, 4, 4, '2023-02-14', 60),
(46, 4, 4, '2023-02-16', 90), (47, 4, 4, '2023-02-18', 75),

(48, 5, 5, '2023-02-07', 90), (49, 5, 5, '2023-02-09', 75), (50, 5, 5, '2023-02-11', 60),
(51, 5, 5, '2023-02-13', 90), (52, 5, 5, '2023-02-15', 60), (53, 5, 9, '2023-02-17', 60),
(54, 5, 9, '2023-02-19', 75), (55, 5, 9, '2023-02-21', 90), (56, 5, 9, '2023-02-23', 75),
(57, 5, 9, '2023-03-01', 90), (58, 5, 9, '2023-03-05', 75), (59, 5, 9, '2023-03-10', 60),

(60, 6, 6, '2023-02-12', 60), (61, 6, 6, '2023-02-14', 90), (62, 6, 6, '2023-02-16', 60),
(63, 6, 6, '2023-02-18', 75), (64, 6, 6, '2023-02-20', 90), (65, 6, 6, '2023-02-22', 60),
(66, 6, 6, '2023-02-24', 75), (67, 6, 6, '2023-02-26', 60), (68, 6, 6, '2023-02-28', 90),
(69, 6, 6, '2023-03-02', 75), (70, 6, 6, '2023-03-04', 60),

(71, 7, 7, '2023-02-17', 90), (72, 7, 7, '2023-02-19', 60), (73, 7, 7, '2023-02-21', 75),
(74, 7, 7, '2023-02-23', 60), (75, 7, 7, '2023-02-25', 60), (76, 7, 7, '2023-02-27', 75),
(77, 7, 7, '2023-03-01', 90), (78, 7, 7, '2023-03-03', 60), (79, 7, 7, '2023-03-05', 75),

(80, 8, 8, '2023-02-22', 60), (81, 8, 8, '2023-02-24', 75), (82, 8, 8, '2023-02-26', 60),
(83, 8, 8, '2023-02-28', 90), (84, 8, 8, '2023-03-02', 75), (85, 8, 8, '2023-03-04', 60),
(86, 8, 8, '2023-03-06', 75), (87, 8, 8, '2023-03-08', 60), (88, 8, 8, '2023-03-10', 90),
(89, 8, 8, '2023-03-12', 75), (90, 8, 8, '2023-03-14', 60), (91, 8, 8, '2023-03-16', 75);

INSERT INTO Vizsgak (vizsga_id, tanulo_id, tipus, datum, eredmeny) VALUES
(1, 1, 'elméleti', '2023-01-05', 'sikeres'),
(2, 1, 'gyakorlati', '2023-02-15', 'sikeres'),
(3, 2, 'elméleti', '2023-01-15', 'sikertelen'),
(4, 2, 'elméleti', '2023-01-25', 'sikeres'),
(5, 2, 'gyakorlati', '2023-03-01', 'sikeres'),
(6, 3, 'elméleti', '2023-01-20', 'sikeres'),
(7, 3, 'gyakorlati', '2023-02-28', 'sikertelen'),
(8, 3, 'gyakorlati', '2023-03-20', 'sikeres'),
(9, 4, 'elméleti', '2023-01-25', 'sikeres'),
(10, 4, 'gyakorlati', '2023-03-10', 'sikeres'),
(11, 5, 'elméleti', '2023-02-05', 'sikeres'),
(12, 5, 'gyakorlati', '2023-03-15', 'sikertelen'),
(13, 5, 'gyakorlati', '2023-04-10', 'sikeres'),
(14, 6, 'elméleti', '2023-02-10', 'sikeres'),
(15, 6, 'gyakorlati', '2023-03-20', 'sikeres'),
(16, 7, 'elméleti', '2023-02-15', 'sikeres'),
(17, 7, 'gyakorlati', '2023-03-30', 'sikeres'),
(18, 8, 'elméleti', '2023-02-20', 'sikeres'),
(19, 8, 'gyakorlati', '2023-04-01', 'sikeres');

--Lekérdezések


--1.Hűséges, 10 vagy több tanórán részt vett tanulók:
SELECT t.nev, 
	COUNT(*) AS tanorak_szama
FROM Tanorak o JOIN Tanulok t ON o.tanulo_id = t.tanulo_id
GROUP BY t.tanulo_id
HAVING COUNT(*) >= 10
ORDER BY tanorak_szama DESC;

--2.Oktatók által ledolgozott idő percben a vizsgált időszakban:
SELECT o.nev AS oktato_nev, 
	SUM(t.idotartam_perc) AS ledolgozott_perc
FROM Tanorak t
JOIN Jarmuvek j ON t.jarmu_id = j.jarmu_id
JOIN Oktatok o ON j.oktato_id = o.oktato_id
GROUP BY o.oktato_id
ORDER BY ledolgozott_perc DESC;

--3.Oktatók által használt járművek átlagéletkoránál fiatalabb járművek:
SELECT *,
       (YEAR(GETDATE()) - gyartasi_ev) AS [jármű életkora]
FROM Jarmuvek
WHERE (YEAR(GETDATE()) - gyartasi_ev) <
      (
        SELECT AVG(YEAR(GETDATE()) - gyartasi_ev)
        FROM Jarmuvek
      );
	  
--4.Tanulónkénti összes vizsga (mind gyakorlati, mind elméleti) sikerességi aránya:
SELECT t.nev,
       COUNT(CASE WHEN v.eredmeny = 'sikeres' THEN 1 END) * 100.0 / COUNT(*) AS sikeressegi_arany
FROM Vizsgak v
JOIN Tanulok t ON v.tanulo_id = t.tanulo_id
GROUP BY t.tanulo_id
ORDER BY sikeressegi_arany DESC;

--5.Sikeres gyakorlati vizsgák aránya tanulonként a vett tanórák számával és összidejével együtt feltűntetve:
SELECT t.nev AS tanulo_neve,
    	COUNT(ta.tanora_id) AS tanorak_szama,
   	 	SUM(ta.idotartam_perc) AS tanorak_osszido,
    	CONCAT(ROUND(AVG(CASE 
                        	WHEN v.eredmeny = 'sikeres' AND v.tipus = 'gyakorlati' THEN 1
                        	WHEN v.tipus = 'gyakorlati' THEN 0
                        	ELSE NULL
                    	END) * 100, 2), '%') AS atlagos_gyakorlati_sikeresseg_szazalekban
FROM Tanulok t
JOIN  Tanorak ta ON t.tanulo_id = ta.tanulo_id
LEFT JOIN Vizsgak v ON t.tanulo_id = v.tanulo_id
GROUP BY t.nev
ORDER BY tanorak_szama DESC;