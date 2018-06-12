CREATE DATABASE  `base1` ;
USE `base1` ;

CREATE TABLE  `Usuario` (
  `idUsuario` INT NOT NULL,
  `Usuario_idUsuario` INT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `correoUsuario` VARCHAR(45) NOT NULL,
  `contraseñaUsuario` VARCHAR(45) NOT NULL,
  `rolUsuario` TINYINT NOT NULL,
  `tarjetaCredito` VARCHAR(45) NOT NULL,
  `nombreEmpresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_Usuario_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE  `Administrador` (
  `idAdministrador` INT NOT NULL,
  `nombreAdmin` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdministrador`))


CREATE TABLE  `Modulo` (
  `idModulo` INT NOT NULL,
  `Administrador_idAdministrador` INT NULL,
  `costo` VARCHAR(45) NOT NULL,
  `nombreModulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModulo`),
  INDEX `fk_Modulo_Administrador1_idx` (`Administrador_idAdministrador` ASC),
  CONSTRAINT `fk_Modulo_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


CREATE TABLE  `Pago` (
  `idPago` INT NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  `Modulo_idModulo` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`idPago`, `Usuario_idUsuario`, `Modulo_idModulo`),
  INDEX `fk_Pago_Usuario1_idx` (`Usuario_idUsuario` ASC),
  INDEX `fk_Pago_Modulo1_idx` (`Modulo_idModulo` ASC),
  CONSTRAINT `fk_Pago_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Modulo1`
    FOREIGN KEY (`Modulo_idModulo`)
    REFERENCES `Modulo` (`idModulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
