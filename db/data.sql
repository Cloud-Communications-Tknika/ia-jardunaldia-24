-- Hiriak
INSERT INTO hiria (id, izena, probintzia) VALUES
('H1', 'Bilbo', 'Bizkaia'),
('H2', 'Donostia', 'Gipuzkoa'),
('H3', 'Gasteiz', 'Araba'),
('H4', 'Iruñea', 'Nafarroa'),
('H5', 'Durango', 'Bizkaia'),
('H6', 'Zarautz', 'Gipuzkoa');

-- Erabiltzaileak
INSERT INTO erabiltzailea (id, izena, abizena, email, telefonoa, pasahitza) VALUES
('E1', 'Ane', 'Etxeberria', 'ane@email.com', '666111222', 'pass123'),
('E2', 'Mikel', 'Garcia', 'mikel@email.com', '666333444', 'pass123'),
('E3', 'Miren', 'Lopez', 'miren@email.com', '666555666', 'pass123'),
('E4', 'Jon', 'Martinez', 'jon@email.com', '666777888', 'pass123'),
('E5', 'Iker', 'Fernandez', 'iker@email.com', '666999000', 'pass123');

-- Gidariak
INSERT INTO gidaria (erabiltzailea_id, gida_baimena) VALUES
('E1', 'B12345'),
('E2', 'B67890');

-- Bidaiariak
INSERT INTO bidaiaria (erabiltzailea_id) VALUES
('E3'),
('E4'),
('E5');

-- Bidaiak
INSERT INTO bidaia (id, data, plaza_kopurua, prezioa_bidaiari, sortze_data, gidaria_id, jatorri_hiria_id, helmuga_hiria_id) VALUES
('B1', '2024-04-01', 3, 5.0, '2024-03-15 10:00:00', 'E1', 'H1', 'H2'),
('B2', '2024-04-02', 2, 7.0, '2024-03-15 11:00:00', 'E2', 'H2', 'H3'),
('B3', '2024-04-03', 4, 6.0, '2024-03-15 12:00:00', 'E1', 'H1', 'H4'),
('B4', '2024-04-04', 1, 8.0, '2024-03-15 13:00:00', 'E2', 'H5', 'H6');

-- Erreserbak
INSERT INTO erreserba (id, plaza_kopurua, eskaera_data, egoera, bidaia_id, bidaiaria_id) VALUES
('R1', 2, '2024-03-16 09:00:00', 'ONARTUTA', 'B1', 'E3'),
('R2', 1, '2024-03-16 10:00:00', 'ESKATUTA', 'B2', 'E4'),
('R3', 2, '2024-03-16 11:00:00', 'UKATUTA', 'B3', 'E5');

-- Mezuak
INSERT INTO mezua (id, gaia, edukia, data, igorlea_id, hartzailea_id) VALUES
('M1', 'Bilbo-Donostia bidaia', 'Kaixo, non elkartuko gara?', '2024-03-17 10:00:00', 'E3', 'E1'),
('M2', 'Re: Bilbo-Donostia bidaia', 'Abando geltokian', '2024-03-17 10:30:00', 'E1', 'E3'),
('M3', 'Donostia-Gasteiz bidaia', 'Arratsaldeko bidaia da?', '2024-03-17 11:00:00', 'E4', 'E2');

-- Alertak
INSERT INTO alerta (id, sortze_data, plaza_kopurua, bidaia_data, aktiboa, bidaiaria_id, jatorri_hiria_id, helmuga_hiria_id) VALUES
('A1', '2024-03-18 09:00:00', 2, '2024-04-05', 1, 'E3', 'H1', 'H2'),
('A2', '2024-03-18 10:00:00', 1, '2024-04-06', 1, 'E4', 'H2', 'H3'),
('A3', '2024-03-18 11:00:00', 3, '2024-04-07', 0, 'E5', 'H3', 'H4');
