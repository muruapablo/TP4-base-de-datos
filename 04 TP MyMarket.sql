CREATE SCHEMA MyMarket;
USE MyMarket;

CREATE TABLE Categoria(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    categoria VARCHAR(30) NOT NULL
);
CREATE TABLE Metodo(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    metodo VARCHAR(50) NOT NULL
);
CREATE TABLE Modalidad(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    modalidad VARCHAR(40) NOT NULL
);
CREATE TABLE Productos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    Producto_nombre VARCHAR(100) NOT NULL,
    Producto_precio INT NOT NULL,
    producto_cantidad INT NOT NULL,
	categoria_id INT NOT NULL, 
    FOREIGN KEY (Categoria_id) REFERENCES Categoria(id)
    );
    CREATE TABLE Usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
	modalidad_id INT NOT NULL, 
    FOREIGN KEY (Modalidad_id) REFERENCES Modalidad(id)
    );
    CREATE TABLE Pedido(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	productos_id INT NOT NULL, 
    FOREIGN KEY (Productos_id) REFERENCES Productos(id)
    );
    CREATE TABLE Pago(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    monto INT NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Pedido_id INT NOT NULL,
    Usuario_id INT NOT NULL,
    Metodo_id INT NOT NULL, 
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (Metodo_id) REFERENCES Metodo(id)
    );
    CREATE TABLE Envio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Envio_estado VARCHAR(100) NOT NULL,
    Pedido_id INT NOT NULL, 
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id)
    );
    CREATE TABLE Envio_Usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    envio_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (Envio_id) REFERENCES Envio(id),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
    );
    CREATE TABLE Productos_Pedido(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    productos_id INT NOT NULL,
    pedido_id INT NOT NULL,
    FOREIGN KEY (Productos_id) REFERENCES Productos(id),
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id)
    );
    CREATE TABLE Pedido_Usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    pedido_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
    );
    
    
    