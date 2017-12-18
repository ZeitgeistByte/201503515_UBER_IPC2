CREATE TABLE SERVICIO(
idServicio INT PRIMARY KEY,
tarifa VARCHAR(45) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
capacidad INT NOT NULL
);


CREATE TABLE VEHICULO(
idVehiculo INT PRIMARY KEY,
tipo TINYINT NOT NULL,
modelo VARCHAR(50) NOT NULL,
anio INT NOT NULL,
caracteristicas VARCHAR(50) NOT NULL
);

CREATE TABLE USUARIO(
idUsuario INT PRIMARY KEY,
correo VARCHAR(50) NOT NULL,
contrasenia VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NOT NULL 
);

CREATE TABLE CONDUCTOR(
idConducor INT PRIMARY KEY,
nombre_conductor VARCHAR(50) NOT NULL,
licencia INT NOT NULL,
CONSTRAINT fk_Vehiculo FOREIGN KEY(Vehiculo_idVehiculo) REFERENCES VEHICULO(idVehiculo)
);

CREATE TABLE VIAJE(
idViaje INT PRIMARY KEY,
Servicio_idServicio VARCHAR(50) NOT NULL,
distancia_recorrida DOUBLE NOT NULL,
metodo_pago VARCHAR(45),
CONSTRAINT fk_Servicio FOREIGN KEY(Servicio_idSerivicio) REFERENCES Servicio(idServicio)
);

ALTER TABLE conductor ADD COLUMN (anios_experiencia INT NOT NULL);
ALTER TABLE vehiculo MODIFY COLUMN modelo INT NOT NULL;
