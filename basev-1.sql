-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Sistema_colaborativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Sistema_colaborativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Sistema_colaborativo` DEFAULT CHARACTER SET utf8 ;
USE `Sistema_colaborativo` ;

-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`usuario` (
  `correo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fecha_nacimiendo` DATE NOT NULL,
  `activo` TINYINT(1) NOT NULL DEFAULT 1,
  `numero` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `calificacion` DOUBLE NOT NULL DEFAULT 5.0,
  `tipoUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`resena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`resena` (
  `comentario` MEDIUMTEXT NULL,
  `calificacion` INT NOT NULL,
  `idResena` INT NOT NULL AUTO_INCREMENT,
  `rIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResena`),
  INDEX `r_idusuario_idx` (`rIdUsuario` ASC) VISIBLE,
  CONSTRAINT `r_idusuario`
    FOREIGN KEY (`rIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`alumno` (
  `idAlumno` INT NOT NULL AUTO_INCREMENT,
  `aIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  CONSTRAINT `a_idUsuario`
    FOREIGN KEY (`aIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`profesor` (
  `contratado` TINYINT(1) NOT NULL DEFAULT 1,
  `idProfesor` INT NOT NULL AUTO_INCREMENT,
  `pIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProfesor`),
  INDEX `idUsuario_idx` (`pIdUsuario` ASC) VISIBLE,
  CONSTRAINT `p_idUsuario`
    FOREIGN KEY (`pIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`horario` (
  `dia` VARCHAR(20) NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFin` TIME NOT NULL,
  `disponible` TINYINT NOT NULL DEFAULT 1,
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `hIdProfesor` INT NOT NULL,
  PRIMARY KEY (`idHorario`),
  CONSTRAINT `h_idProfesor`
    FOREIGN KEY (`hIdProfesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`idProfesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`nivel` (
  `nivel` VARCHAR(45) NOT NULL,
  `idNivel` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`materia` (
  `materia` VARCHAR(45) NOT NULL,
  `idMateria` INT NOT NULL AUTO_INCREMENT,
  `mIdNivel` INT NOT NULL,
  PRIMARY KEY (`idMateria`),
  CONSTRAINT `m_idNivel`
    FOREIGN KEY (`mIdNivel`)
    REFERENCES `Sistema_colaborativo`.`nivel` (`idNivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`tema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`tema` (
  `tema` VARCHAR(45) NOT NULL,
  `idTema` INT NOT NULL AUTO_INCREMENT,
  `tIdMateria` INT NOT NULL,
  PRIMARY KEY (`idTema`),
  CONSTRAINT `t_idMateria`
    FOREIGN KEY (`tIdMateria`)
    REFERENCES `Sistema_colaborativo`.`materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`asesorar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`asesorar` (
  `idAsesorar` INT NOT NULL AUTO_INCREMENT,
  `aIdHorario` INT NOT NULL,
  `aIdTema` INT NOT NULL,
  `aIdProfesor` INT NOT NULL,
  `aIdAlumno` INT NOT NULL,
  PRIMARY KEY (`idAsesorar`),
  CONSTRAINT `a_idHorario`
    FOREIGN KEY (`aIdHorario`)
    REFERENCES `Sistema_colaborativo`.`horario` (`idHorario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idTema`
    FOREIGN KEY (`aIdTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idProfesor`
    FOREIGN KEY (`aIdProfesor`)
    REFERENCES `Sistema_colaborativo`.`profesor` (`idProfesor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `a_idAlumno`
    FOREIGN KEY (`aIdAlumno`)
    REFERENCES `Sistema_colaborativo`.`alumno` (`idAlumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`interesar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`interesar` (
  `idInteresar` INT NOT NULL AUTO_INCREMENT,
  `iIdNivel` INT NOT NULL,
  `iIdMateria` INT NOT NULL,
  `iIdTema` INT NOT NULL,
  `iIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInteresar`),
  CONSTRAINT `i_idNivel`
    FOREIGN KEY (`iIdNivel`)
    REFERENCES `Sistema_colaborativo`.`nivel` (`idNivel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idMateria`
    FOREIGN KEY (`iIdMateria`)
    REFERENCES `Sistema_colaborativo`.`materia` (`idMateria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idTema`
    FOREIGN KEY (`iIdTema`)
    REFERENCES `Sistema_colaborativo`.`tema` (`idTema`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `i_idUsuario`
    FOREIGN KEY (`iIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`tarjeta` (
  `ccv` INT NOT NULL,
  `numero` INT NOT NULL,
  `vencimiento` DATE NOT NULL,
  `idTarjeta` INT NOT NULL,
  `tIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  CONSTRAINT `t_idUsuario`
    FOREIGN KEY (`tIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sistema_colaborativo`.`denuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sistema_colaborativo`.`denuncia` (
  `motivo` MEDIUMTEXT NOT NULL,
  `idDenuncia` INT NOT NULL AUTO_INCREMENT,
  `dIdUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDenuncia`),
  CONSTRAINT `d_idUsuario`
    FOREIGN KEY (`dIdUsuario`)
    REFERENCES `Sistema_colaborativo`.`usuario` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
