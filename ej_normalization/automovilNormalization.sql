PRAGMA foreign_keys = ON;

CREATE TABLE
    IF NOT EXISTS Owner (
        idOwner INTEGER PRIMARY KEY AUTOINCREMENT,
        OwnerName TEXT NOT NULL,
        OwnerPhone TEXT NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Seguro (
        idSeguro INTEGER PRIMARY KEY AUTOINCREMENT,
        InsuranceCompany TEXT NOT NULL,
        InsurancePolicy TEXT NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS Automovil (
        idCar INTEGER PRIMARY KEY AUTOINCREMENT,
        VIN TEXT NOT NULL UNIQUE,
        Make TEXT NOT NULL,
        Model TEXT NOT NULL,
        Color TEXT NOT NULL,
        Year INTEGER NOT NULL,
        Owner_idOwner INTEGER NOT NULL,
        Seguro_idSeguro INTEGER NOT NULL,
        FOREIGN KEY (Owner_idOwner) REFERENCES Owner (idOwner) ON DELETE NO ACTION ON UPDATE NO ACTION,
        FOREIGN KEY (Seguro_idSeguro) REFERENCES Seguro (idSeguro) ON DELETE NO ACTION ON UPDATE NO ACTION
    );

CREATE INDEX IF NOT EXISTS idx_automovil_owner ON Automovil (Owner_idOwner);

CREATE INDEX IF NOT EXISTS idx_automovil_seguro ON Automovil (Seguro_idSeguro);