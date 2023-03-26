CREATE TABLE cuidad(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE articulo(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_serie INT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    descripcion TEXT NOT NULL,
    precio DECIMAL(15,2) UNSIGNED NOT NULL,
    existencias SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (numero_serie)
);

CREATE TABLE cliente (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cedula INT UNSIGNED NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    cuidad_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (cedula),
    FOREIGN KEY (cuidad_id) REFERENCES cuidad(id)
);

CREATE TABLE factura(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    fecha DATETIME NOT NULL,
    total DECIMAL(15, 2) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE pedido(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    articulo_id INT UNSIGNED NOT NULL,
    cantidad SMALLINT UNSIGNED NOT NULL,
    total DECIMAL(15, 2) NOT NULL,
    factura_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (articulo_id) REFERENCES articulo(id),
    FOREIGN KEY (factura_id) REFERENCES factura(id)
);
