PRAGMA foreign_keys = ON;

CREATE TABLE
    IF NOT EXISTS CompaniaSeguros (
        idSeguro INTEGER PRIMARY KEY AUTOINCREMENT,
        InsuranceCompany TEXT NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Poliza (
        idPoliza INTEGER PRIMARY KEY AUTOINCREMENT,
        InsurancePolicy TEXT NOT NULL,
        CompaniaSeguros_idSeguro INTEGER NOT NULL,
        FOREIGN KEY (CompaniaSeguros_idSeguro) REFERENCES CompaniaSeguros (idSeguro) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE INDEX IF NOT EXISTS idx_poliza_compania ON Poliza (CompaniaSeguros_idSeguro);

CREATE TABLE
    IF NOT EXISTS Automovil (
        idCar INTEGER PRIMARY KEY AUTOINCREMENT,
        VIN TEXT NOT NULL UNIQUE,
        Make TEXT NOT NULL,
        Model TEXT NOT NULL,
        Color TEXT NOT NULL,
        Year INTEGER NOT NULL,
        Poliza_idPoliza INTEGER NOT NULL,
        FOREIGN KEY (Poliza_idPoliza) REFERENCES Poliza (idPoliza) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE INDEX IF NOT EXISTS idx_automovil_poliza ON Automovil (Poliza_idPoliza);

CREATE TABLE
    IF NOT EXISTS Owner (
        idOwner INTEGER PRIMARY KEY AUTOINCREMENT,
        OwnerName TEXT NOT NULL,
        OwnerPhone TEXT NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Automovil_has_Owner (
        Automovil_idCar INTEGER NOT NULL,
        Owner_idOwner INTEGER NOT NULL,
        PRIMARY KEY (Automovil_idCar, Owner_idOwner),
        FOREIGN KEY (Automovil_idCar) REFERENCES Automovil (idCar) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (Owner_idOwner) REFERENCES Owner (idOwner) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE INDEX IF NOT EXISTS idx_aho_owner ON Automovil_has_Owner (Owner_idOwner);

CREATE INDEX IF NOT EXISTS idx_aho_automovil ON Automovil_has_Owner (Automovil_idCar);