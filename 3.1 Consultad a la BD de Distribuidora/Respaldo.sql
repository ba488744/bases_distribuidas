CREATE DATABASE distribuidora;
USE distribuidora;

CREATE TABLE supplier (
    idSupplier INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contact VARCHAR(100) NOT NULL,
    PRIMARY KEY (idSupplier)
);

INSERT INTO supplier (name, street, number, city, state, phone, email, contact) VALUES
("Herramientas del Norte", "Calle 15", "123", "Monterrey", "Nuevo León", "818-123-4567", "ventas@herramientasnorte.com", "Alberto Ruiz"),
("Proveedores de Herramientas S.A.", "Av. Revolución", "456", "Ciudad de México", "CDMX", "555-234-5678", "contactoprovherr@hotmail.com", "Sofía Gómez"),
("Distribuciones de Herramientas", "Calle 5 de Febrero", "789", "Guadalajara", "Jalisco", "333-345-6789", "infodistribucionesherramientas@gmail.com", "Carlos Mendoza"),
("Soluciones en Herramientas", "Calle 8", "321", "Puebla", "Puebla", "222-456-7890", "soporte@solucionesherramientas.com", "María Elena Pérez"),
("Importaciones y Herramientas", "Av. 20 de Noviembre", "654", "Tijuana", "Baja California", "664-567-8901", "ventas@toolimport.com", "Luis Miguel Torres");


CREATE TABLE purchase (
    idPurchase INT NOT NULL AUTO_INCREMENT,
    idSupplier INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    folio VARCHAR(50) NOT NULL,
    payment DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idPurchase),
    FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier)
);

INSERT INTO purchase (idSupplier, date, time, folio, payment) VALUES
(1, "2024-01-15", "10:30:00", "FOL-2983", 1520.00),
(2, "2024-01-18", "14:15:00", "FOL-1756", 2500.00),
(3, "2024-01-20", "09:00:00", "FOL-4821", 1250.00),
(4, "2024-02-02", "11:45:00", "FOL-6378", 800.00),
(5, "2024-02-05", "13:30:00", "FOL-9034", 3000.00),
(1, "2024-02-10", "16:00:00", "FOL-2045", 1860.00),
(2, "2024-02-12", "08:20:00", "FOL-8746", 2200.00),
(3, "2024-02-15", "12:00:00", "FOL-3950", 950.00),
(4, "2024-02-18", "10:00:00", "FOL-5123", 500.00),
(5, "2024-03-01", "15:00:00", "FOL-7489", 4510.00);

CREATE TABLE tool (
    idTool INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    model VARCHAR(100) NOT NULL,
    manufacturer VARCHAR(100) NOT NULL,
    color VARCHAR(50) NOT NULL,
    size VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (idTool)
);

INSERT INTO tool (name, model, manufacturer, color, size, description) VALUES
("Taladro Inalámbrico", "DCD771C2", "DeWalt", "Amarillo", "M", "Taladro inalámbrico compacto con batería de 20V, ideal para uso en casa y trabajos ligeros."),
("Sierra Circular", "HS7600", "Makita", "Verde", "L", "Sierra circular de 7-1/4 pulgadas, perfecta para cortes en madera y materiales similares."),
("Juego de Destornilladores", "DR-150", "Stanley", "Negro", "S", "Juego de 15 destornilladores de precisión, ideal para reparaciones electrónicas."),
("Martillo de Framing", "51535", "Estwing", "Rojo", "M", "Martillo de 16 oz con mango de cuero, excelente para trabajos de construcción."),
("Llave de Ajuste", "DWMT19250", "Dewalt", "Gris", "M", "Llave ajustable de 10 pulgadas, fabricada en acero al carbono para mayor durabilidad.");

CREATE TABLE warehouse (
    idWarehouse INT NOT NULL AUTO_INCREMENT,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    area DECIMAL(10, 2) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    manager VARCHAR(100) NOT NULL,
    PRIMARY KEY (idWarehouse)
);

INSERT INTO warehouse (street, number, city, state, area, phone, manager) VALUES
("Av. Juárez", "100", "Ciudad de México", "CDMX", 150.5, "555-1001-100", "Ricardo Gómez"),
("Calle 15", "200", "Guadalajara", "Jalisco", 200.0, "333-1002-200", "Patricia Ramírez"),
("Calle 10", "300", "Monterrey", "Nuevo León", 250.0, "818-1003-300", "Fernando Torres"),
("Av. Insurgentes", "400", "Puebla", "Puebla", 300.5, "222-1004-400", "Isabel Castro"),
("Calle 5", "500", "Tijuana", "Baja California", 350.0, "664-1005-500", "Javier Martínez");

CREATE TABLE inventory (
    idInventory INT NOT NULL AUTO_INCREMENT,
    idWarehouse INT NOT NULL,
    idTool INT NOT NULL,
    zone VARCHAR(100) NOT NULL,
    rack VARCHAR(100) NOT NULL,
    level INT NOT NULL,
    location VARCHAR(100) NOT NULL,
    amount INT NOT NULL,
    purchasePrice DECIMAL(10, 2) NOT NULL,
    storeSalePrice DECIMAL(10, 2) NOT NULL,
    wholeSalePrice DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idInventory),
    FOREIGN KEY (idWarehouse) REFERENCES warehouse(idWarehouse),
    FOREIGN KEY (idTool) REFERENCES tool(idTool)
);

INSERT INTO inventory (idWarehouse, idTool, zone, rack, level, location, amount, purchasePrice, storeSalePrice, wholeSalePrice) VALUES
(1, 1, "Zona Norte", "Rack A", 1, "Ubicación A1", 30, 600.00, 900.00, 550.00),
(1, 2, "Zona Norte", "Rack A", 1, "Ubicación A2", 20, 1200.00, 1800.00, 1100.00),
(1, 3, "Zona Centro", "Rack B", 1, "Ubicación B1", 15, 250.00, 400.00, 230.00),
(1, 4, "Zona Centro", "Rack B", 2, "Ubicación B2", 10, 1500.00, 2200.00, 1400.00),
(1, 5, "Zona Sur", "Rack C", 1, "Ubicación C1", 25, 300.00, 450.00, 280.00),
(2, 1, "Zona Norte", "Rack A", 1, "Ubicación A3", 22, 600.00, 900.00, 550.00),
(2, 2, "Zona Norte", "Rack A", 2, "Ubicación A4", 18, 1200.00, 1800.00, 1100.00),
(2, 3, "Zona Centro", "Rack B", 1, "Ubicación B3", 28, 250.00, 400.00, 230.00),
(2, 4, "Zona Centro", "Rack B", 2, "Ubicación B4", 12, 1500.00, 2200.00, 1400.00),
(2, 5, "Zona Sur", "Rack C", 1, "Ubicación C2", 35, 300.00, 450.00, 280.00),
(3, 1, "Zona Este", "Rack D", 1, "Ubicación D1", 10, 600.00, 900.00, 550.00),
(3, 2, "Zona Este", "Rack D", 1, "Ubicación D2", 20, 1200.00, 1800.00, 1100.00),
(3, 3, "Zona Centro", "Rack E", 1, "Ubicación E1", 15, 250.00, 400.00, 230.00),
(3, 4, "Zona Centro", "Rack E", 2, "Ubicación E2", 8, 1500.00, 2200.00, 1400.00),
(3, 5, "Zona Oeste", "Rack F", 1, "Ubicación F1", 12, 300.00, 450.00, 280.00),
(4, 1, "Zona Norte", "Rack A", 1, "Ubicación A5", 25, 600.00, 900.00, 550.00),
(4, 2, "Zona Sur", "Rack C", 1, "Ubicación C3", 10, 1200.00, 1800.00, 1100.00),
(4, 3, "Zona Este", "Rack D", 1, "Ubicación D3", 18, 250.00, 400.00, 230.00),
(4, 4, "Zona Oeste", "Rack F", 2, "Ubicación F2", 5, 1500.00, 2200.00, 1400.00),
(4, 5, "Zona Centro", "Rack E", 1, "Ubicación E3", 30, 300.00, 450.00, 280.00),
(5, 1, "Zona Sur", "Rack C", 1, "Ubicación C4", 35, 600.00, 900.00, 550.00),
(5, 2, "Zona Este", "Rack D", 1, "Ubicación D4", 12, 1200.00, 1800.00, 1100.00),
(5, 3, "Zona Oeste", "Rack F", 1, "Ubicación F3", 15, 250.00, 400.00, 230.00),
(5, 4, "Zona Centro", "Rack E", 2, "Ubicación E4", 10, 1500.00, 2200.00, 1400.00),
(5, 5, "Zona Norte", "Rack A", 1, "Ubicación A6", 28, 300.00, 450.00, 280.00);

CREATE TABLE buyTool (
    idBuyTool INT NOT NULL AUTO_INCREMENT,
    idPurchase INT NOT NULL,
    idInventory INT NOT NULL,
    amount INT NOT NULL,
    unitPrice DECIMAL(10, 2) NOT NULL,
    note TEXT NOT NULL,
    PRIMARY KEY (idBuyTool),
    FOREIGN KEY (idPurchase) REFERENCES purchase(idPurchase),
    FOREIGN KEY (idInventory) REFERENCES inventory(idInventory)
);

INSERT INTO buyTool (idBuyTool, idPurchase, idInventory, amount, unitPrice, note) VALUES
(1, 1, 1, 5, 600.00, "Compra de prueba 1"),
(2, 1, 2, 3, 1200.00, "Urgente para proyecto"),
(3, 2, 3, 10, 250.00, "Reabastecimiento regular"),
(4, 2, 4, 2, 1500.00, "Compra de herramientas especializadas"),
(5, 3, 5, 7, 300.00, "Reparaciones en curso"),
(6, 3, 6, 5, 600.00, "Compra mensual"),
(7, 4, 7, 8, 1200.00, "Para proyecto específico"),
(8, 4, 8, 4, 1800.00, "Urgente"),
(9, 5, 9, 3, 450.00, "Para uso inmediato"),
(10, 5, 10, 6, 300.00, "Compra para nuevo cliente"),
(11, 6, 11, 2, 600.00, "Reabastecimiento"),
(12, 6, 12, 10, 1200.00, "Compra especial"),
(13, 7, 13, 1, 250.00, "Herramienta de alta demanda"),
(14, 7, 14, 5, 1500.00, "Para mantenimiento"),
(15, 8, 15, 4, 300.00, "Venta al por mayor"),
(16, 8, 16, 9, 600.00, "Nuevo cliente"),
(17, 9, 17, 3, 1200.00, "Reabastecimiento urgente"),
(18, 9, 18, 2, 1800.00, "Herramienta crítica"),
(19, 10, 19, 5, 450.00, "Para uso en campo"),
(20, 10, 20, 1, 300.00, "Muestra para cliente"),
(21, 1, 21, 4, 600.00, "Compra por demanda"),
(22, 1, 22, 7, 1200.00, "Para proyecto de construcción"),
(23, 2, 23, 8, 250.00, "Para reabastecimiento"),
(24, 2, 24, 6, 1500.00, "Necesidad urgente"),
(25, 3, 25, 2, 300.00, "Pedido especial"),
(26, 3, 1, 9, 600.00, "Reemplazo de herramientas viejas"),
(27, 4, 2, 3, 1200.00, "Proyecto de remodelación"),
(28, 4, 3, 4, 1800.00, "Compra para nuevo contrato"),
(29, 5, 4, 1, 450.00, "Necesidad de última hora"),
(30, 5, 5, 5, 300.00, "Para mantenimiento rutinario"),
(31, 6, 6, 6, 600.00, "Compra por demanda"),
(32, 6, 7, 3, 1200.00, "Compra mensual"),
(33, 7, 8, 5, 250.00, "Herramienta de alta rotación"),
(34, 7, 9, 4, 1500.00, "Urgente para cliente"),
(35, 8, 10, 9, 300.00, "Para prueba de calidad"),
(36, 8, 11, 7, 600.00, "Reabastecimiento"),
(37, 9, 12, 2, 1200.00, "Para reparación de maquinaria"),
(38, 9, 13, 8, 1800.00, "Requisito de proyecto"),
(39, 10, 14, 5, 450.00, "Compra mensual"),
(40, 10, 15, 3, 300.00, "Urgente para cliente"),
(41, 1, 16, 4, 600.00, "Para proyecto de construcción"),
(42, 1, 17, 2, 1200.00, "Urgente para entrega"),
(43, 2, 18, 7, 250.00, "Reabastecimiento"),
(44, 2, 19, 8, 1500.00, "Para cliente especial"),
(45, 3, 20, 6, 300.00, "Necesidad de última hora"),
(46, 3, 21, 4, 600.00, "Compra por demanda"),
(47, 4, 22, 3, 1200.00, "Proyecto de construcción"),
(48, 4, 23, 2, 1800.00, "Reabastecimiento urgente"),
(49, 5, 24, 1, 450.00, "Para uso inmediato"),
(50, 5, 25, 5, 300.00, "Reemplazo de herramientas viejas");

-- Reporte de compras del mes de enero que incluya el nombre del proveedor, el nombre de la herramienta, cantidad, precio unitario y precio total

SELECT
    MONTH(p.date) AS Mes,
    s.name AS "Nombre del proveedor",
    t.name AS "Nombre de la herramienta",
    b.amount AS "Cantidad",
    b.unitPrice AS "Precio unitario",
    b.amount * b.unitPrice AS "Precio total"
FROM purchase AS p
LEFT JOIN
    supplier AS s
    ON p.idSupplier = s.idSupplier
LEFT JOIN
    buyTool AS b
    ON p.idPurchase = b.idPurchase
LEFT JOIN
    inventory AS i
    ON b.idInventory = i.idInventory
LEFT JOIN
    tool AS t
    ON i.idTool = t.idTool
HAVING Mes = 01;

-- Reporte de inventario de la bodega de la calle 15 que incluya el nombre de la herramienta, cantidad y costo total (precio de compra * cantidad)

SELECT
    w.street AS "Calle de bodega",
    t.name AS "Nombre de la herramienta",
    i.amount AS "Cantidad",
    i.amount * i.purchasePrice AS "Costo total"
FROM warehouse AS w
LEFT JOIN
    inventory AS i
    ON w.idWarehouse = i.idWarehouse
LEFT JOIN
    tool AS t
    ON i.idTool = t.idTool
WHERE w.street = "Calle 15";

-- Reporte de compras de la herramienta “Llave de Ajuste” durante el año 2024 el nombre del proveedor, fecha de compra, cantidad, precio unitario y costo total.

SELECT
    t.name AS "Nombre de la herramienta",
    s.name AS "Nombre del proveedor",
    p.date AS "Fecha de compra",
    b.amount AS "Cantidad",
    b.unitPrice AS "Precio unitario",
    b.amount * b.unitPrice AS "Costo total"
FROM purchase AS p
LEFT JOIN
    supplier AS s
    ON p.idSupplier = s.idSupplier
LEFT JOIN
    buyTool AS b
    ON p.idPurchase = b.idPurchase
LEFT JOIN
    inventory AS i
    ON b.idInventory = i.idInventory
LEFT JOIN
    tool AS t
    ON i.idTool = t.idTool
HAVING YEAR(p.date) = 2024
AND t.name = "Llave de Ajuste";

-- Listado de responsables de las bodegas de la empresa con calle, número y teléfono.

SELECT
    w.manager AS "Responsable de bodega",
    w.street AS "Calle",
    w.number AS "Número",
    w.phone AS "Teléfono"
FROM warehouse AS w;

-- Listado de contactos con los proveedores con nombre de contacto, nombre de proveedor, teléfono y correo electrónico.

SELECT
    s.contact AS "Nombre de contacto",
    s.name AS "Proveedor",
    s.phone AS "Teléfono",
    s.email AS "Correo electrónico"
FROM supplier AS s;

-- Reporte de herramientas compradas cuyo precio unitario se menor o igual a $250.00 que incluya nombre de la herramienta, fecha de compra y cantidad comprada en orden cronológico descendiente.

SELECT
    t.name AS "Nombre de la herramienta",
    b.unitPrice AS "Precio unitario",
    p.date AS "Fecha de compra",
    b.amount AS "Cantidad comprada"
FROM purchase AS p
LEFT JOIN
    buyTool AS b
    ON p.idPurchase = b.idPurchase
LEFT JOIN
    inventory AS i
    ON b.idInventory = i.idInventory
LEFT JOIN
    tool AS t
    ON i.idTool = t.idTool
WHERE b.unitPrice <= 250.00
ORDER BY p.date DESC;

-- Reporte de herramientas en el inventario cuyo stock sea entre 5 y 20 piezas que incluya calle y número de la bodega, nombre de la herramienta, ubicación y cantidad en existencia.

SELECT
    w.street AS "Calle",
    w.number AS "Número",
    t.name AS "Nombre de la herramienta",
    i.location AS "Ubicación",
    i.amount AS Cantidad
FROM inventory AS i
LEFT JOIN
    warehouse AS w
    ON w.idWarehouse = i.idWarehouse
LEFT JOIN
    tool AS t
    ON i.idTool = t.idTool
HAVING Cantidad BETWEEN 5 AND 20;

-- Reporte del stock de todas las bodegas que incluya calle, número, responsable, teléfono y total de herramientas almacenadas.

SELECT
    w.idWarehouse AS "ID de bodega",
    w.street AS "Calle",
    w.number AS "Número",
    w.manager AS "Responsable",
    w.phone AS "Teléfono",
    SUM(i.amount) AS "Total de herramientas"
FROM warehouse AS w
LEFT JOIN
    inventory AS i
    ON w.idWarehouse = i.idWarehouse
GROUP BY w.idWarehouse;

-- Reporte de valor de inventario de todas las bodegas que incluya calle, estado y monto total de precio de venta de las herramientas almacenadas.

SELECT
    w.idWarehouse AS "ID de bodega",
    w.street AS "Calle",
    w.state AS "Estado",
    SUM(b.unitPrice) AS "Monto total de precio de venta"
FROM warehouse AS w
LEFT JOIN
    inventory AS i
    ON w.idWarehouse = i.idWarehouse
LEFT JOIN
    buyTool AS b
    ON b.idInventory = i.idInventory
GROUP BY w.idWarehouse;
