CREATE DATABASE IF NOT EXISTS biblioteca_db;
USE biblioteca_db;
CREATE TABLE autor (
    codigo INT(11) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;
CREATE TABLE libro (
    codigo INT(11) NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    pagina VARCHAR(200) NOT NULL,
    isbn VARCHAR(200) NOT NULL,
    editorial VARCHAR(200) NOT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;
CREATE TABLE escribe (
    codigo_autor INT(11) NOT NULL,
    codigo_libro INT(11) NOT NULL,
    PRIMARY KEY (codigo_autor, codigo_libro),
    CONSTRAINT fk_escribe_autor FOREIGN KEY (codigo_autor) REFERENCES autor(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_escribe_libro FOREIGN KEY (codigo_libro) REFERENCES libro(codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE ejemplar (
    codigo INT(11) NOT NULL,
    localizacion VARCHAR(200) NOT NULL,
    codigo_libro INT(11) NOT NULL,
    PRIMARY KEY (codigo),
    CONSTRAINT fk_ejemplar_libro FOREIGN KEY (codigo_libro) REFERENCES libro(codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE usuario (
    codigo INT(11) NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    telefono VARCHAR(200) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    PRIMARY KEY (codigo)
) ENGINE=InnoDB;
CREATE TABLE saca (
    codigoEjemplar INT(11) NOT NULL,
    codigoUsuario INT(11) NOT NULL,
    fechaPres DATE NOT NULL,
    fechaDev DATE NULL,
    PRIMARY KEY (codigoEjemplar, codigoUsuario, fechaPres),
    CONSTRAINT fk_saca_ejemplar FOREIGN KEY (codigoEjemplar) REFERENCES ejemplar(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_saca_usuario FOREIGN KEY (codigoUsuario) REFERENCES usuario(codigo) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;