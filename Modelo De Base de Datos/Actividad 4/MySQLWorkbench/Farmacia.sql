CREATE DATABASE IF NOT EXISTS farmacia_db;
USE farmacia_db;

CREATE TABLE ciudad (
    nombreCiudad VARCHAR(200) NOT NULL,
    provincia VARCHAR(200) NOT NULL,
    habitantes INT(11) NOT NULL,
    superficie FLOAT NOT NULL,
    PRIMARY KEY (nombreCiudad, provincia)
) ENGINE=InnoDB;

CREATE TABLE propietario (
    dni INT(11) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    calle VARCHAR(200) NOT NULL,
    codigoPostal INT(11) NOT NULL,
    ciudad VARCHAR(200) NOT NULL,
    PRIMARY KEY (dni)
) ENGINE=InnoDB;

CREATE TABLE farmacia (
    nombreFarmacia VARCHAR(200) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    nombreCiudad VARCHAR(200) NOT NULL,
    provincia_ciudad VARCHAR(200) NOT NULL,
    propietario_dni INT(11) NOT NULL,
    PRIMARY KEY (nombreFarmacia),
    CONSTRAINT fk_farmacia_ciudad FOREIGN KEY (nombreCiudad, provincia_ciudad) REFERENCES ciudad(nombreCiudad, provincia) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_farmacia_propietario FOREIGN KEY (propietario_dni) REFERENCES propietario(dni) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE medicamento (
    id_medicamento VARCHAR(200) NOT NULL,
    nombreComercial VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_medicamento)
) ENGINE=InnoDB;

CREATE TABLE medicamento_monodroga (
    id_medicamento VARCHAR(200) NOT NULL,
    monodroga VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_medicamento, monodroga),
    CONSTRAINT fk_monodroga_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE vender (
    id_medicamento VARCHAR(200) NOT NULL,
    nombreFarmacia VARCHAR(200) NOT NULL,
    precio_vta FLOAT NOT NULL,
    PRIMARY KEY (id_medicamento, nombreFarmacia),
    CONSTRAINT fk_vender_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_vender_farmacia FOREIGN KEY (nombreFarmacia) REFERENCES farmacia(nombreFarmacia) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;