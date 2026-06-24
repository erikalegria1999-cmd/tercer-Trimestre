CREATE DATABASE IF NOT EXISTS negocio_db;
USE negocio_db;

CREATE TABLE persona (
    id_persona INT NOT NULL AUTO_INCREMENT,
    identificacion VARCHAR(45) NOT NULL,
    nombres VARCHAR(450) NOT NULL,
    direccion VARCHAR(250) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    codigo_postal VARCHAR(15) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(250) NOT NULL,
    PRIMARY KEY (id_persona),
    UNIQUE INDEX identificacion_UNIQUE (identificacion ASC)
) ENGINE=InnoDB;

CREATE TABLE compania (
    id_compania SMALLINT NOT NULL AUTO_INCREMENT,
    nit VARCHAR(45) NOT NULL,
    compania VARCHAR(450) NOT NULL,
    PRIMARY KEY (id_compania),
    UNIQUE INDEX nit_UNIQUE (nit ASC)
) ENGINE=InnoDB;

CREATE TABLE termino (
    id_termino TINYINT NOT NULL AUTO_INCREMENT,
    termino VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_termino)
) ENGINE=InnoDB;

CREATE TABLE categoria (
    id_categoria SMALLINT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_categoria)
) ENGINE=InnoDB;

CREATE TABLE producto (
    id_producto INT NOT NULL AUTO_INCREMENT,
    id_categoria SMALLINT NOT NULL,
    producto VARCHAR(150) NOT NULL,
    existencia INT NOT NULL,
    valor_unitario_venta FLOAT NOT NULL,
    valor_unitario_compra FLOAT NOT NULL,
    PRIMARY KEY (id_producto),
    INDEX fk_producto_categoria1_idx (id_categoria ASC),
    CONSTRAINT fk_producto_categoria1 FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE factura (
    id_factura BIGINT NOT NULL AUTO_INCREMENT,
    id_persona INT NOT NULL,
    id_compania SMALLINT NOT NULL,
    id_termino TINYINT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    sub_total FLOAT NOT NULL,
    tasa_impuesto FLOAT NOT NULL,
    PRIMARY KEY (id_factura),
    INDEX fk_factura_persona_idx (id_persona ASC),
    INDEX fk_factura_compania1_idx (id_compania ASC),
    INDEX fk_factura_termino1_idx (id_termino ASC),
    CONSTRAINT fk_factura_persona FOREIGN KEY (id_persona) REFERENCES persona (id_persona) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_factura_compania1 FOREIGN KEY (id_compania) REFERENCES compania (id_compania) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_factura_termino1 FOREIGN KEY (id_termino) REFERENCES termino (id_termino) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE factura_producto (
    id_factura BIGINT NOT NULL,
    id_producto INT NOT NULL,
    valor_unitario FLOAT NOT NULL,
    cantidad SMALLINT NOT NULL,
    PRIMARY KEY (id_factura, id_producto),
    INDEX fk_factura_has_producto_producto1_idx (id_producto ASC),
    INDEX fk_factura_has_producto_factura1_idx (id_factura ASC),
    CONSTRAINT fk_factura_has_producto_factura1 FOREIGN KEY (id_factura) REFERENCES factura (id_factura) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_factura_has_producto_producto1 FOREIGN KEY (id_producto) REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;