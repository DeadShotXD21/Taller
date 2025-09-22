-- 🔹 Eliminar la BD si existe
DROP DATABASE IF EXISTS RestauranteElPato;

-- 🔹 Crear la BD nuevamente
CREATE DATABASE RestauranteElPato
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE RestauranteElPato;

-- =========================
--  TABLA ROLES
-- =========================
CREATE TABLE Rol (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
--  TABLA USUARIOS
-- =========================
CREATE TABLE Usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(90),
  apellido VARCHAR(90),
  email VARCHAR(100),
  telefono VARCHAR(20),
  dni VARCHAR(8),
  direccion VARCHAR(100),
  clave VARCHAR(255),
  rol_id INT,
  PRIMARY KEY (id),
  UNIQUE KEY (email),
  CONSTRAINT fk_rol FOREIGN KEY (rol_id) REFERENCES Rol (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
--  TABLA ACCESO
-- =========================
CREATE TABLE Acceso (
  login VARCHAR(100) NOT NULL,
  clave VARCHAR(100) NOT NULL,
  PRIMARY KEY (login),
  CONSTRAINT fk_acceso_usuario FOREIGN KEY (login) REFERENCES Usuario(email) 
  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
--  TABLA PRODUCTO
-- =========================
CREATE TABLE Producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  codigo VARCHAR(50) NOT NULL,
  stock INT NOT NULL,
  stock_minimo INT NOT NULL,
  PRIMARY KEY (id_producto),
  UNIQUE KEY (codigo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
--  TABLA RECEPCION
-- =========================
CREATE TABLE Recepcion (
  id_recepcion INT NOT NULL AUTO_INCREMENT,
  proveedor VARCHAR(100) NOT NULL,
  producto VARCHAR(100) NOT NULL,
  cantidad INT NOT NULL,
  fecha DATE NOT NULL,
  estado ENUM('pendiente','finalizado') NOT NULL DEFAULT 'pendiente',
  descripcion TEXT,
  PRIMARY KEY (id_recepcion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- =========================
--  DATOS INICIALES
-- =========================

-- Roles
INSERT INTO Rol (id, nombre) VALUES
(1,'mesero'),
(2,'cocinero'),
(3,'admin');

-- Usuarios de ejemplo
INSERT INTO Usuario (id, nombre, apellido, email, telefono, dni, direccion, clave, rol_id)
VALUES 
(1,'Juan','Pérez','juan.perez@restaurante.com','987654321','12345678','Centro','clave1',3),
(2,'Ana','Torres','ana.torres@restaurante.com','912345678','87654321','Zona Norte','clave2',2),
(3,'Carlos','Ramírez','carlos.ramirez@restaurante.com','934567890','11223344','Zona Sur','clave3',1);

-- Accesos
INSERT INTO Acceso VALUES 
('juan.perez@restaurante.com','12345678'),
('ana.torres@restaurante.com','87654321'),
('carlos.ramirez@restaurante.com','11223344');

-- Productos iniciales
INSERT INTO Producto (id_producto, nombre, codigo, stock, stock_minimo)
VALUES 
(1,'Arroz','PROD-ARZ-001',25,10),
(2,'Pollo','PROD-POL-002',15,5),
(3,'Aceite vegetal','PROD-ACE-003',50,20),
(4,'Papas','PROD-PAP-004',40,15);
