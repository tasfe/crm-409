SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `crm` DEFAULT CHARACTER SET utf8 ;
USE `crm` ;

-- -----------------------------------------------------
-- Table `crm`.`t_user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(50) NULL ,
  `password` VARCHAR(36) NULL ,
  `head` VARCHAR(50) NULL DEFAULT '1.jpg' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_product` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_company`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_company` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `weibo` VARCHAR(20) NULL ,
  `content` TEXT NULL ,
  `productid` INT NOT NULL ,
  `userid` INT NOT NULL ,
  `view` VARCHAR(50) NULL ,
  `createtime` VARCHAR(20) NULL ,
  `code` VARCHAR(30) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_company_t_product1` (`productid` ASC) ,
  INDEX `fk_t_company_t_user1` (`userid` ASC) ,
  CONSTRAINT `fk_t_company_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_company_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_contact`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_contact` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `position` VARCHAR(20) NULL ,
  `weibo` VARCHAR(20) NULL ,
  `content` TEXT NULL ,
  `companyid` INT NULL ,
  `productid` INT NOT NULL ,
  `userid` INT NOT NULL ,
  `view` VARCHAR(50) NULL ,
  `createtime` VARCHAR(20) NULL ,
  `code` VARCHAR(30) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_contact_t_company` (`companyid` ASC) ,
  INDEX `fk_t_contact_t_product1` (`productid` ASC) ,
  INDEX `fk_t_contact_t_user1` (`userid` ASC) ,
  CONSTRAINT `fk_t_contact_t_company`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_contact_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_contact_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_user_product`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_user_product` (
  `userid` INT NOT NULL ,
  `productid` INT NOT NULL ,
  `role` INT NULL ,
  `id` INT NOT NULL AUTO_INCREMENT ,
  INDEX `fk_t_user_has_t_product_t_product1` (`productid` ASC) ,
  INDEX `fk_t_user_has_t_product_t_user1` (`userid` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_t_user_has_t_product_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_user_has_t_product_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_chancesort`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_chancesort` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `color` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_chance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_chance` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `content` TEXT NULL ,
  `money` FLOAT NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  `userid` INT NOT NULL ,
  `chancesortid` INT NULL ,
  `state` VARCHAR(10) NULL ,
  `createtime` VARCHAR(20) NULL ,
  `productid` INT NOT NULL ,
  `view` VARCHAR(50) NULL ,
  `managerid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_chance_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_chance_t_company1` (`companyid` ASC) ,
  INDEX `fk_t_chance_t_user1` (`userid` ASC) ,
  INDEX `fk_t_chance_t_sort1` (`chancesortid` ASC) ,
  INDEX `fk_t_chance_t_product1` (`productid` ASC) ,
  CONSTRAINT `fk_t_chance_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`productid` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_chance_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_chance_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_chance_t_sort1`
    FOREIGN KEY (`chancesortid` )
    REFERENCES `crm`.`t_chancesort` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_chance_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_event` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` TEXT NULL ,
  `createtime` VARCHAR(20) NULL ,
  `chanceid` INT NULL ,
  `userid` INT NOT NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  `productid` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_event_t_chance1` (`chanceid` ASC) ,
  INDEX `fk_t_event_t_user1` (`userid` ASC) ,
  INDEX `fk_t_event_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_event_t_company1` (`companyid` ASC) ,
  INDEX `fk_t_event_t_product1` (`productid` ASC) ,
  CONSTRAINT `fk_t_event_t_chance1`
    FOREIGN KEY (`chanceid` )
    REFERENCES `crm`.`t_chance` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_event_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_event_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_event_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_event_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_eventnote`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_eventnote` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` TEXT NULL ,
  `createtime` VARCHAR(20) NULL ,
  `eventid` INT NOT NULL ,
  `userid` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_eventnote_t_event1` (`eventid` ASC) ,
  INDEX `fk_t_eventnote_t_user1` (`userid` ASC) ,
  CONSTRAINT `fk_t_eventnote_t_event1`
    FOREIGN KEY (`eventid` )
    REFERENCES `crm`.`t_event` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_eventnote_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_tasksort`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_tasksort` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `color` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_task`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_task` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `createtime` VARCHAR(20) NULL ,
  `userid` INT NOT NULL ,
  `productid` INT NOT NULL ,
  `state` INT NULL DEFAULT 1 ,
  `enableshow` TINYINT(1)  NULL ,
  `tasksortid` INT NULL ,
  `managerid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_task_t_user1` (`userid` ASC) ,
  INDEX `fk_t_task_t_product1` (`productid` ASC) ,
  INDEX `fk_t_task_t_tasksort1` (`tasksortid` ASC) ,
  CONSTRAINT `fk_t_task_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_task_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_task_t_tasksort1`
    FOREIGN KEY (`tasksortid` )
    REFERENCES `crm`.`t_tasksort` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '\n' ;


-- -----------------------------------------------------
-- Table `crm`.`t_message`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_message` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `content` TEXT NULL ,
  `createtime` VARCHAR(20) NULL ,
  `productid` INT NOT NULL ,
  `userid` INT NOT NULL ,
  `sort` VARCHAR(10) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_message_t_product1` (`productid` ASC) ,
  INDEX `fk_t_message_t_user1` (`userid` ASC) ,
  CONSTRAINT `fk_t_message_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_message_t_user1`
    FOREIGN KEY (`userid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_imporydate`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_imporydate` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `contactid` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_imporydate_t_contact1` (`contactid` ASC) ,
  CONSTRAINT `fk_t_imporydate_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_group` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `productid` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_group_t_product1` (`productid` ASC) ,
  CONSTRAINT `fk_t_group_t_product1`
    FOREIGN KEY (`productid` )
    REFERENCES `crm`.`t_product` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_user_group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_user_group` (
  `usrid` INT NOT NULL ,
  `groupid` INT NOT NULL ,
  `role` INT NULL ,
  `id` INT NOT NULL AUTO_INCREMENT ,
  INDEX `fk_t_user_has_t_group_t_group1` (`groupid` ASC) ,
  INDEX `fk_t_user_has_t_group_t_user1` (`usrid` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_t_user_has_t_group_t_user1`
    FOREIGN KEY (`usrid` )
    REFERENCES `crm`.`t_user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_user_has_t_group_t_group1`
    FOREIGN KEY (`groupid` )
    REFERENCES `crm`.`t_group` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_email` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(20) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_email_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_email_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_email_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_email_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_tel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_tel` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `tel` VARCHAR(20) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_tel_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_tel_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_tel_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_tel_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_email` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(20) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_email_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_email_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_email_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_email_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_im`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_im` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `im` VARCHAR(20) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_im_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_im_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_im_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_im_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_site`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_site` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `site` VARCHAR(20) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_site_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_site_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_site_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_site_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`t_address`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `crm`.`t_address` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `address` VARCHAR(50) NULL ,
  `contactid` INT NULL ,
  `companyid` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_t_address_t_contact1` (`contactid` ASC) ,
  INDEX `fk_t_address_t_company1` (`companyid` ASC) ,
  CONSTRAINT `fk_t_address_t_contact1`
    FOREIGN KEY (`contactid` )
    REFERENCES `crm`.`t_contact` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_t_address_t_company1`
    FOREIGN KEY (`companyid` )
    REFERENCES `crm`.`t_company` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
