-- MySQL Script generated by MySQL Workbench
-- Tue Nov  3 16:28:55 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema controleteste
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema controleteste
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `controleteste` DEFAULT CHARACTER SET utf8 ;
USE `controleteste` ;

-- -----------------------------------------------------
-- Table `controleteste`.`escopo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`escopo` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`escopo` (
  `esccod` INT NOT NULL AUTO_INCREMENT,
  `escnome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`esccod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`usuario` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`usuario` (
  `gercod` INT NOT NULL AUTO_INCREMENT,
  `usuusername` VARCHAR(50) NOT NULL,
  `usunome` VARCHAR(50) NOT NULL,
  `usuemail` VARCHAR(50) NOT NULL,
  `ususenha` VARCHAR(50) NOT NULL,
  `usuimagem` VARCHAR(100) NULL,
  `usufone` VARCHAR(20) NOT NULL,
  `usupermissao` INT NOT NULL,
  `escopo_esccod` INT NOT NULL,
  PRIMARY KEY (`gercod`),
  INDEX `fk_usuario_escopo1_idx` (`escopo_esccod` ASC),
  CONSTRAINT `fk_usuario_escopo1`
    FOREIGN KEY (`escopo_esccod`)
    REFERENCES `controleteste`.`escopo` (`esccod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`motorista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`motorista` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`motorista` (
  `motcod` INT NOT NULL,
  `motnome` VARCHAR(45) NULL,
  `motrua` VARCHAR(45) NULL,
  `motbairro` VARCHAR(45) NULL,
  `motcidade` VARCHAR(45) NULL,
  `motestado` VARCHAR(45) NULL,
  `motemail` VARCHAR(45) NULL,
  `motsenha` VARCHAR(45) NULL,
  `motfone` VARCHAR(45) NULL,
  `motcpf` VARCHAR(45) NULL,
  `motrg` VARCHAR(45) NULL,
  `motcnh` VARCHAR(45) NULL,
  `motdtadmissao` VARCHAR(45) NULL,
  `motdtafast` VARCHAR(45) NULL,
  `motsituacao` VARCHAR(45) NULL,
  `usuario_gercod` INT NOT NULL,
  PRIMARY KEY (`motcod`),
  INDEX `fk_motorista_usuario1_idx` (`usuario_gercod` ASC),
  CONSTRAINT `fk_motorista_usuario1`
    FOREIGN KEY (`usuario_gercod`)
    REFERENCES `controleteste`.`usuario` (`gercod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`jorinter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`jorinter` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`jorinter` (
  `jorintercod` INT NOT NULL AUTO_INCREMENT,
  `jorinterinicial` TIME NULL,
  `jorinterfinal` TIME NULL,
  PRIMARY KEY (`jorintercod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`jorref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`jorref` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`jorref` (
  `jorrefcod` INT NOT NULL AUTO_INCREMENT,
  `jorrefinicial` TIME NULL,
  `jorreffinal` TIME NULL,
  `jorrefcol` VARCHAR(45) NULL,
  PRIMARY KEY (`jorrefcod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`joresp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`joresp` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`joresp` (
  `jorespcod` INT NOT NULL AUTO_INCREMENT,
  `jorespinicial` TIME NULL,
  `jorespfinal` TIME NULL,
  PRIMARY KEY (`jorespcod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`estado` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`estado` (
  `estcod` INT NOT NULL AUTO_INCREMENT,
  `estnome` VARCHAR(50) NOT NULL,
  `estsigla` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`estcod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`cidade` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`cidade` (
  `cidcod` INT NOT NULL AUTO_INCREMENT,
  `cidnome` VARCHAR(50) NOT NULL,
  `estado_estcod` INT NOT NULL,
  PRIMARY KEY (`cidcod`),
  INDEX `fk_cidade_estado1_idx` (`estado_estcod` ASC),
  CONSTRAINT `fk_cidade_estado1`
    FOREIGN KEY (`estado_estcod`)
    REFERENCES `controleteste`.`estado` (`estcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`tpveiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`tpveiculo` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`tpveiculo` (
  `tpvcod` INT NOT NULL,
  `tpvnome` VARCHAR(45) NULL,
  PRIMARY KEY (`tpvcod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`veiculo` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`veiculo` (
  `veicod` INT NOT NULL AUTO_INCREMENT,
  `veiplaca` VARCHAR(10) NULL,
  `veiano` VARCHAR(45) NULL,
  `veimodelo` VARCHAR(45) NULL,
  `tpveiculo_tpvcod` INT NOT NULL,
  PRIMARY KEY (`veicod`),
  INDEX `fk_veiculo_tpveiculo1_idx` (`tpveiculo_tpvcod` ASC),
  CONSTRAINT `fk_veiculo_tpveiculo1`
    FOREIGN KEY (`tpveiculo_tpvcod`)
    REFERENCES `controleteste`.`tpveiculo` (`tpvcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`jornada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`jornada` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`jornada` (
  `jorcod` INT NOT NULL,
  `jortitulo` VARCHAR(45) NULL,
  `jordia` DATE NULL,
  `jorhorainicio` TIME NULL,
  `jorhorafinal` TIME NULL,
  `jorhoraext` VARCHAR(45) NULL,
  `jordescanso` VARCHAR(45) NULL,
  `motorista_motcod` INT NOT NULL,
  `jorinter_jorintercod` INT NOT NULL,
  `jorref_jorrefcod` INT NOT NULL,
  `joresp_jorespcod` INT NOT NULL,
  `cidade_cidcod` INT NOT NULL,
  `veiculo_veicod` INT NOT NULL,
  `gerente_gercod` INT NOT NULL,
  PRIMARY KEY (`jorcod`),
  INDEX `fk_jornada_motorista1_idx` (`motorista_motcod` ASC),
  INDEX `fk_jornada_jorinter1_idx` (`jorinter_jorintercod` ASC),
  INDEX `fk_jornada_jorref1_idx` (`jorref_jorrefcod` ASC),
  INDEX `fk_jornada_joresp1_idx` (`joresp_jorespcod` ASC),
  INDEX `fk_jornada_cidade1_idx` (`cidade_cidcod` ASC),
  INDEX `fk_jornada_veiculo1_idx` (`veiculo_veicod` ASC),
  INDEX `fk_jornada_gerente1_idx` (`gerente_gercod` ASC),
  CONSTRAINT `fk_jornada_motorista1`
    FOREIGN KEY (`motorista_motcod`)
    REFERENCES `controleteste`.`motorista` (`motcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_jorinter1`
    FOREIGN KEY (`jorinter_jorintercod`)
    REFERENCES `controleteste`.`jorinter` (`jorintercod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_jorref1`
    FOREIGN KEY (`jorref_jorrefcod`)
    REFERENCES `controleteste`.`jorref` (`jorrefcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_joresp1`
    FOREIGN KEY (`joresp_jorespcod`)
    REFERENCES `controleteste`.`joresp` (`jorespcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_cidade1`
    FOREIGN KEY (`cidade_cidcod`)
    REFERENCES `controleteste`.`cidade` (`cidcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_veiculo1`
    FOREIGN KEY (`veiculo_veicod`)
    REFERENCES `controleteste`.`veiculo` (`veicod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jornada_gerente1`
    FOREIGN KEY (`gerente_gercod`)
    REFERENCES `controleteste`.`usuario` (`gercod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controleteste`.`regrasjornada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `controleteste`.`regrasjornada` ;

CREATE TABLE IF NOT EXISTS `controleteste`.`regrasjornada` (
  `rjocod` INT NOT NULL,
  `rjotrabinint` VARCHAR(45) NULL,
  `rjodesc` VARCHAR(45) NULL,
  `rjodescinint` VARCHAR(45) NULL,
  `rjorefeicao` VARCHAR(45) NULL,
  `rjomaxdia` VARCHAR(45) NULL,
  `rjoextra` VARCHAR(45) NULL,
  `rjoesprep` VARCHAR(45) NULL,
  `rjodescinter` VARCHAR(45) NULL,
  `tpveiculo_tpvcod` INT NOT NULL,
  `jornada_jorcod` INT NOT NULL,
  PRIMARY KEY (`rjocod`),
  INDEX `fk_regrasjornada_tpveiculo1_idx` (`tpveiculo_tpvcod` ASC),
  INDEX `fk_regrasjornada_jornada1_idx` (`jornada_jorcod` ASC),
  CONSTRAINT `fk_regrasjornada_tpveiculo1`
    FOREIGN KEY (`tpveiculo_tpvcod`)
    REFERENCES `controleteste`.`tpveiculo` (`tpvcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_regrasjornada_jornada1`
    FOREIGN KEY (`jornada_jorcod`)
    REFERENCES `controleteste`.`jornada` (`jorcod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;