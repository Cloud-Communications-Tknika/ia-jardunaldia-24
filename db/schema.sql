-- Erabiltzailea taula
CREATE TABLE erabiltzailea (
    id TEXT PRIMARY KEY,
    izena TEXT NOT NULL,
    abizena TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefonoa TEXT NOT NULL,
    pasahitza TEXT NOT NULL
);

-- Gidaria taula (Erabiltzailea-ren azpiklasea)
CREATE TABLE gidaria (
    erabiltzailea_id TEXT PRIMARY KEY,
    gida_baimena TEXT NOT NULL,
    FOREIGN KEY (erabiltzailea_id) REFERENCES erabiltzailea(id)
);

-- Bidaiaria taula (Erabiltzailea-ren azpiklasea)
CREATE TABLE bidaiaria (
    erabiltzailea_id TEXT PRIMARY KEY,
    FOREIGN KEY (erabiltzailea_id) REFERENCES erabiltzailea(id)
);

-- Hiria taula
CREATE TABLE hiria (
    id TEXT PRIMARY KEY,
    izena TEXT NOT NULL,
    probintzia TEXT NOT NULL,
    UNIQUE(izena, probintzia)
);

-- Bidaia taula
CREATE TABLE bidaia (
    id TEXT PRIMARY KEY,
    data DATE NOT NULL,
    plaza_kopurua INTEGER NOT NULL,
    prezioa_bidaiari REAL NOT NULL,
    sortze_data DATETIME NOT NULL,
    gidaria_id TEXT NOT NULL,
    jatorri_hiria_id TEXT NOT NULL,
    helmuga_hiria_id TEXT NOT NULL,
    FOREIGN KEY (gidaria_id) REFERENCES gidaria(erabiltzailea_id),
    FOREIGN KEY (jatorri_hiria_id) REFERENCES hiria(id),
    FOREIGN KEY (helmuga_hiria_id) REFERENCES hiria(id)
);

-- Erreserba taula
CREATE TABLE erreserba (
    id TEXT PRIMARY KEY,
    plaza_kopurua INTEGER NOT NULL,
    eskaera_data DATETIME NOT NULL,
    egoera TEXT NOT NULL CHECK (egoera IN ('ESKATUTA', 'ONARTUTA', 'UKATUTA')),
    bidaia_id TEXT NOT NULL,
    bidaiaria_id TEXT NOT NULL,
    FOREIGN KEY (bidaia_id) REFERENCES bidaia(id),
    FOREIGN KEY (bidaiaria_id) REFERENCES bidaiaria(erabiltzailea_id)
);

-- Mezua taula
CREATE TABLE mezua (
    id TEXT PRIMARY KEY,
    gaia TEXT NOT NULL,
    edukia TEXT NOT NULL,
    data DATETIME NOT NULL,
    igorlea_id TEXT NOT NULL,
    hartzailea_id TEXT NOT NULL,
    FOREIGN KEY (igorlea_id) REFERENCES erabiltzailea(id),
    FOREIGN KEY (hartzailea_id) REFERENCES erabiltzailea(id)
);

-- Alerta taula
CREATE TABLE alerta (
    id TEXT PRIMARY KEY,
    sortze_data DATETIME NOT NULL,
    plaza_kopurua INTEGER NOT NULL,
    bidaia_data DATE NOT NULL,
    aktiboa BOOLEAN NOT NULL DEFAULT 1,
    bidaiaria_id TEXT NOT NULL,
    jatorri_hiria_id TEXT NOT NULL,
    helmuga_hiria_id TEXT NOT NULL,
    FOREIGN KEY (bidaiaria_id) REFERENCES bidaiaria(erabiltzailea_id),
    FOREIGN KEY (jatorri_hiria_id) REFERENCES hiria(id),
    FOREIGN KEY (helmuga_hiria_id) REFERENCES hiria(id)
);

-- Indexak
CREATE INDEX idx_bidaia_data ON bidaia(data);
CREATE INDEX idx_erreserba_bidaia ON erreserba(bidaia_id);
CREATE INDEX idx_alerta_aktiboa ON alerta(aktiboa);
CREATE INDEX idx_mezua_hartzailea ON mezua(hartzailea_id);
