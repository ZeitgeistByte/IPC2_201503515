CREATE DATABASE  'base2' ;
USE 'base2' ;

CREATE TABLE  'Producto' (
  'idProducto' INT NOT NULL,
  'costoProducto' DECIMAL(2) NOT NULL,
  'nombreProducto' VARCHAR(45) NOT NULL,
  'descripcionProducto' VARCHAR(45) NULL,
  'existenciaProducto' INT NOT NULL,
  PRIMARY KEY ('idProducto'))


CREATE TABLE  'Empleado' (
  'idEmpleado' INT NOT NULL,
  'nombre' VARCHAR(45) NOT NULL,
  'apellido' VARCHAR(45) NOT NULL,
  'puesto' VARCHAR(45) NOT NULL,
  'salario' DECIMAL(2) NOT NULL,
  PRIMARY KEY ('idEmpleado'))


CREATE TABLE  'Cliente' (
  'idCliente' INT NOT NULL,
  'nombre' VARCHAR(45) NOT NULL,
  'apellido' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('idCliente'))


CREATE TABLE  'Venta' (
  'idVenta' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'Cliente_idCliente' INT NOT NULL,
  'fechaVenta' DATE NOT NULL,
  'totalVenta' DECIMAL(2) NULL,
  'impuestoVenta' VARCHAR(45) NULL,
  PRIMARY KEY ('idVenta', 'Empleado_idEmpleado', 'Cliente_idCliente'),
  INDEX 'fk_Venta_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  INDEX 'fk_Venta_Cliente1_idx' ('Cliente_idCliente' ASC),
  CONSTRAINT 'fk_Venta_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Venta_Cliente1'
    FOREIGN KEY ('Cliente_idCliente')
    REFERENCES 'Cliente' ('idCliente')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE  'DetalleVenta' (
  'idDetalleVenta' INT NOT NULL,
  'Venta_idVenta' INT NOT NULL,
  'producto' INT NULL,
  'cantidad' INT NULL,
  'DetalleVentacol' VARCHAR(45) NULL,
  PRIMARY KEY ('idDetalleVenta', 'Venta_idVenta'),
  INDEX 'fk_DetalleVenta_Venta1_idx' ('Venta_idVenta' ASC),
  CONSTRAINT 'fk_DetalleVenta_Venta1'
    FOREIGN KEY ('Venta_idVenta')
    REFERENCES 'Venta' ('idVenta')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE  'Proveedor' (
  'idProveedor' INT NOT NULL,
  'nombre' VARCHAR(45) NOT NULL,
  'apellido' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('idProveedor'))


CREATE TABLE  'Compra' (
  'idCompra' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'Proveedor_idProveedor' INT NOT NULL,
  'fechaPedido' DATE NOT NULL,
  'fechaRecibido' DATE NOT NULL,
  'facturaCompra' VARCHAR(45) NOT NULL,
  'costoCompra' DECIMAL(2) NOT NULL,
  PRIMARY KEY ('idCompra', 'Empleado_idEmpleado', 'Proveedor_idProveedor'),
  INDEX 'fk_Compra_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  INDEX 'fk_Compra_Proveedor1_idx' ('Proveedor_idProveedor' ASC),
  CONSTRAINT 'fk_Compra_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Compra_Proveedor1'
    FOREIGN KEY ('Proveedor_idProveedor')
    REFERENCES 'Proveedor' ('idProveedor')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

CREATE TABLE  'DetalleCompra' (
  'idDetalleCompra' INT NOT NULL,
  'Compra_idCompra' INT NOT NULL,
  'producto' INT NOT NULL,
  'cantidad' INT NOT NULL,
  PRIMARY KEY ('idDetalleCompra', 'Compra_idCompra'),
  INDEX 'fk_DetalleCompra_Compra1_idx' ('Compra_idCompra' ASC),
  CONSTRAINT 'fk_DetalleCompra_Compra1'
    FOREIGN KEY ('Compra_idCompra')
    REFERENCES 'Compra' ('idCompra')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE  'Vehiculo' (
  'idVehiculo' INT NOT NULL,
  'placas' VARCHAR(45) NOT NULL,
  'modelo' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('idVehiculo'))



CREATE TABLE  'Viaje' (
  'idViaje' INT NOT NULL,
  'Vehiculo_idVehiculo' INT NOT NULL,
  'fecha_Salida' DATE NOT NULL,
  'fecha_Llegada' DATE NOT NULL,
  PRIMARY KEY ('idViaje', 'Vehiculo_idVehiculo'),
  INDEX 'fk_Viaje_Vehiculo1_idx' ('Vehiculo_idVehiculo' ASC),
  CONSTRAINT 'fk_Viaje_Vehiculo1'
    FOREIGN KEY ('Vehiculo_idVehiculo')
    REFERENCES 'Vehiculo' ('idVehiculo')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Viaje_has_Producto' (
  'Viaje_idViaje' INT NOT NULL,
  'Viaje_Vehiculo_idVehiculo' INT NOT NULL,
  'Producto_idProducto' INT NOT NULL,
  PRIMARY KEY ('Viaje_idViaje', 'Viaje_Vehiculo_idVehiculo', 'Producto_idProducto'),
  INDEX 'fk_Viaje_has_Producto_Producto1_idx' ('Producto_idProducto' ASC),
  INDEX 'fk_Viaje_has_Producto_Viaje1_idx' ('Viaje_idViaje' ASC, 'Viaje_Vehiculo_idVehiculo' ASC),
  CONSTRAINT 'fk_Viaje_has_Producto_Viaje1'
    FOREIGN KEY ('Viaje_idViaje' , 'Viaje_Vehiculo_idVehiculo')
    REFERENCES 'Viaje' ('idViaje' , 'Vehiculo_idVehiculo')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Viaje_has_Producto_Producto1'
    FOREIGN KEY ('Producto_idProducto')
    REFERENCES 'Producto' ('idProducto')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Viaje_has_Empleado' (
  'Viaje_idViaje' INT NOT NULL,
  'Viaje_Vehiculo_idVehiculo' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'rolEmpleado' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('Viaje_idViaje', 'Viaje_Vehiculo_idVehiculo', 'Empleado_idEmpleado'),
  INDEX 'fk_Viaje_has_Empleado_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  INDEX 'fk_Viaje_has_Empleado_Viaje1_idx' ('Viaje_idViaje' ASC, 'Viaje_Vehiculo_idVehiculo' ASC),
  CONSTRAINT 'fk_Viaje_has_Empleado_Viaje1'
    FOREIGN KEY ('Viaje_idViaje' , 'Viaje_Vehiculo_idVehiculo')
    REFERENCES 'Viaje' ('idViaje' , 'Vehiculo_idVehiculo')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 'fk_Viaje_has_Empleado_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Publicacion' (
  'idPublicacion' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'Contenido' VARCHAR(45) NOT NULL,
  'fechaPublicacion' DATE NOT NULL,
  PRIMARY KEY ('idPublicacion', 'Empleado_idEmpleado'),
  INDEX 'fk_Publicacion_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  CONSTRAINT 'fk_Publicacion_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Comentario' (
  'idComentario' INT NOT NULL,
  'Publicacion_idPublicacion' INT NOT NULL,
  'Publicacion_Empleado_idEmpleado' INT NOT NULL,
  'ContenidoComentario' VARCHAR(45) NOT NULL,
  PRIMARY KEY ('idComentario', 'Publicacion_idPublicacion', 'Publicacion_Empleado_idEmpleado'),
  INDEX 'fk_Comentario_Publicacion1_idx' ('Publicacion_idPublicacion' ASC, 'Publicacion_Empleado_idEmpleado' ASC),
  CONSTRAINT 'fk_Comentario_Publicacion1'
    FOREIGN KEY ('Publicacion_idPublicacion' , 'Publicacion_Empleado_idEmpleado')
    REFERENCES 'Publicacion' ('idPublicacion' , 'Empleado_idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Evento' (
  'idEvento' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'nombreEvento' VARCHAR(45) NOT NULL,
  'fechaEvento' DATE NOT NULL,
  'estadoEvento' INT NOT NULL,
  PRIMARY KEY ('idEvento', 'Empleado_idEmpleado'),
  INDEX 'fk_Evento_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  CONSTRAINT 'fk_Evento_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Oportunidad_CRM' (
  'idOportunidad_CRM' INT NOT NULL,
  'Cliente_idCliente' INT NOT NULL,
  'tituloCRM' VARCHAR(45) NOT NULL,
  'prioridad' INT NOT NULL,
  'estadoCRM' INT NOT NULL,
  'ingresoAprox' DECIMAL(2) NOT NULL,
  PRIMARY KEY ('idOportunidad_CRM', 'Cliente_idCliente'),
  INDEX 'fk_Oportunidad_CRM_Cliente1_idx' ('Cliente_idCliente' ASC),
  CONSTRAINT 'fk_Oportunidad_CRM_Cliente1'
    FOREIGN KEY ('Cliente_idCliente')
    REFERENCES 'Cliente' ('idCliente')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



CREATE TABLE  'Entrevista' (
  'idEntrevista' INT NOT NULL,
  'Empleado_idEmpleado' INT NOT NULL,
  'fecha' DATE NOT NULL,
  PRIMARY KEY ('idEntrevista', 'Empleado_idEmpleado'),
  INDEX 'fk_Entrevista_Empleado1_idx' ('Empleado_idEmpleado' ASC),
  CONSTRAINT 'fk_Entrevista_Empleado1'
    FOREIGN KEY ('Empleado_idEmpleado')
    REFERENCES 'Empleado' ('idEmpleado')
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
