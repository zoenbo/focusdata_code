-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: focusdata
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fd_clinic_user`
--

DROP TABLE IF EXISTS `fd_clinic_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fd_clinic_user` (
  `CLINIC_USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLINIC_USER_PWD` varchar(50) NOT NULL,
  `CLINIC_USER_MAIL` varchar(50) NOT NULL,
  `CLINIC_NAME` varchar(200) NOT NULL,
  `CLINIC_PHONE` varchar(50) NOT NULL,
  `CLINIC_PHOTO` varchar(200) NOT NULL,
  `CLINIC_ADDR` varchar(200) NOT NULL,
  `CLINIC_POSTCODE` varchar(50) NOT NULL,
  `CLINIC_SUBURB` varchar(50) NOT NULL,
  `CLINIC_LAT` varchar(20) NOT NULL,
  `CLINIC_LNG` varchar(20) NOT NULL,
  `STATE_ID` int(11) NOT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT '1',
  `CLINIC_OVERVIEW` varchar(5000) DEFAULT NULL,
  `IS_YELLOWPAGE` int(11) NOT NULL,
  `CREATE_USER` varchar(50) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `UPDATE_USER` varchar(50) NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CLINIC_USER_ID`),
  KEY `FK_fd_clinic_user_2` (`STATE_ID`),
  CONSTRAINT `FK_fd_clinic_user_2` FOREIGN KEY (`STATE_ID`) REFERENCES `fd_dict_state` (`STATE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fd_clinic_user`
--

LOCK TABLES `fd_clinic_user` WRITE;
/*!40000 ALTER TABLE `fd_clinic_user` DISABLE KEYS */;
INSERT INTO `fd_clinic_user` VALUES (1,'933943','test@gmail.com','Box Hill Superclinic','','下载.jpeg','810 Whitehorse Road','3127','Box Hill','-37.8174219','145.11538080000003',7,1,'',0,'bencaotang@gmail.com','2017-01-23 08:37:39','admin','2017-05-09 10:33:21'),(2,'933943','test@gmail.com','Box Hill Medical Centre','','medical.jpg','528 Station Street','3128','Box Hill','','',7,1,NULL,0,'baozhilin@gmail.com','2017-01-20 13:16:46','baozhilin@gmail.com','2017-01-20 13:16:46'),(3,'933943','test@gmail.com','Box Hill Mall Medical Centre','','mall.jpg','8 Market Street','3128','Box Hill','','',7,1,NULL,0,'jingwumen@gmail.com','2017-01-20 13:18:09','jingwumen@gmail.com','2017-01-20 13:18:09'),(10001,'933943','test@gmail.com','Wong Robert','(03) 9590 0147','DefaultClinic.jpg','302 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10002,'933943','test@gmail.com','Waverley Heart Clinic','(03) 9561 9688','DefaultClinic.jpg','Ste 7/ 264 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10003,'933943','test@gmail.com','Waverley General Practice','(03) 9802 8155','DefaultClinic.jpg','370 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10004,'933943','test@gmail.com','Waverley Eye Clinic','(03) 9886 5522','DefaultClinic.jpg','226 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10005,'933943','test@gmail.com','Warburton Fiona Dr','(03) 9802 8844','DefaultClinic.jpg','1 Fairhills Parade','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10006,'933943','test@gmail.com','Walton Tony','(03) 9426 6693','DefaultClinic.jpg','Suite 6 262- 264 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10007,'933943','test@gmail.com','Wallis Ben Dr','(03) 9814 9999','DefaultClinic.jpg','244 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10008,'933943','test@gmail.com','Vinci Angela Dr','(03) 9814 9999','DefaultClinic.jpg','244 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10009,'933943','test@gmail.com','Veins Clinic','(03) 9803 4800','DefaultClinic.jpg','747 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10010,'933943','test@gmail.com','Vasta C S & Corrigan M L','(03) 9560 1266','DefaultClinic.jpg','17 Hampshire Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10011,'933943','test@gmail.com','Thomas Clayton Dr','(03) 9566 2733','DefaultClinic.jpg','499 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10012,'933943','test@gmail.com','Thean Janice Dr','(03) 9886 5522','DefaultClinic.jpg','226 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10013,'933943','test@gmail.com','Specialist Vein Care','(03) 9561 5155','DefaultClinic.jpg','258 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10014,'933943','test@gmail.com','Skinner TG Dr','(03) 9802 8844','DefaultClinic.jpg','1 Fairhills Parade','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10015,'933943','test@gmail.com','Singh Harpreet','(03) 9802 8155','DefaultClinic.jpg','370 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10016,'933943','test@gmail.com','Robertson I E V','(03) 9802 9101','DefaultClinic.jpg','598 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10017,'933943','test@gmail.com','Robertson Dr. Ian','(03) 9802 9101','DefaultClinic.jpg','598 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10018,'933943','test@gmail.com','Riseley Judith Dr','(03) 9814 9999','DefaultClinic.jpg','244 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10019,'933943','test@gmail.com','Riseley Judith','(03) 9803 4800','DefaultClinic.jpg','747 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10020,'933943','test@gmail.com','Reid John D.','Send Enquiry','DefaultClinic.jpg','859 Waverley Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10021,'933943','test@gmail.com','Pippa Marsdland Dr.','(03) 9802 8155','DefaultClinic.jpg','370 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10022,'933943','test@gmail.com','A Wheelers Hill Clinic','','DefaultClinic.jpg','847 Ferntree Gully Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10023,'933943','test@gmail.com','AAA Waverley Medical Centre','','DefaultClinic.jpg','244 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10024,'933943','test@gmail.com','Ah Sang Wendy','(03) 9561 3200','DefaultClinic.jpg','847 Ferntree Gully Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10025,'933943','test@gmail.com','Al-Souffi M Dr','(03) 9562 2288','DefaultClinic.jpg','Cnr Springvale Rd and Magid Ave','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10026,'933943','test@gmail.com','Appletree Hill Medical Centre','(03) 9887 8223','DefaultClinic.jpg','888 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10027,'933943','test@gmail.com','Arnold Carolyn Dr','(03) 9566 2733','DefaultClinic.jpg','499 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10028,'933943','test@gmail.com','Banerjee Pramita Dr','(03) 9814 9999','DefaultClinic.jpg','244 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10029,'933943','test@gmail.com','Bob Haran Dr','(03) 9561 6102','DefaultClinic.jpg','6 Ondine Dr','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10030,'933943','test@gmail.com','Cheah S H DR','(03) 9561 3999','DefaultClinic.jpg','183 Jells Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10031,'933943','test@gmail.com','Chitra Haran, Dr','(03) 9561 6102','DefaultClinic.jpg','6 Ondine Dr','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10032,'933943','test@gmail.com','Court D','(03) 9561 3200','DefaultClinic.jpg','847 Ferntree Gully Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10033,'933943','test@gmail.com','Court D B','(03) 9561 3200','DefaultClinic.jpg','847 Ferntree Gully Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10034,'933943','test@gmail.com','Courtney Peter Dr','(03) 9566 2759','DefaultClinic.jpg','499 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10035,'933943','test@gmail.com','DeSouza Michael Dr','(03) 9803 5494','DefaultClinic.jpg','888 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10036,'933943','test@gmail.com','Diagnostic Medical Ultrasound Services Pty Ltd','1300 693 246','DefaultClinic.jpg','Suite Ground Floor 24 202 Jells Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10037,'933943','test@gmail.com','Ebrahim E','(03) 9560 9473','DefaultClinic.jpg','705 Waverley Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10038,'933943','test@gmail.com','Edwards Christine Dr','(03) 9803 5494','DefaultClinic.jpg','888 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10039,'933943','test@gmail.com','Elderton Janette Dr','(03) 9803 5494','DefaultClinic.jpg','888 High Street Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10040,'933943','test@gmail.com','Fairhills Medical Clinic','','DefaultClinic.jpg','1 Fairhills Parade','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10041,'933943','test@gmail.com','Freeman Anne','(03) 9562 2288','DefaultClinic.jpg','2 Magid Ave','3170','Mulgrave','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10042,'933943','test@gmail.com','Gregory Lee','(03) 9562 2288','DefaultClinic.jpg','2 Magid Ave','3170','Mulgrave','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10043,'933943','test@gmail.com','Athari Dr.','(03) 9748 9777','DefaultClinic.jpg','241 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10044,'933943','test@gmail.com','Barnetson W','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10045,'933943','test@gmail.com','Bermudez R','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10046,'933943','test@gmail.com','Bradley M F','(03) 9741 9511','DefaultClinic.jpg','1 Pine Ave','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10047,'933943','test@gmail.com','Braude G','(03) 9749 2766','DefaultClinic.jpg','229 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10048,'933943','test@gmail.com','Burke Dr','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10049,'933943','test@gmail.com','Calder R T Dr','(03) 9216 8633','DefaultClinic.jpg','300 Princess Hwy','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10050,'933943','test@gmail.com','Caric Vladimir Dr','(03) 9395 6333','DefaultClinic.jpg','Shop 33/ 300 Point Cook Rd','3030','Point Cook','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10051,'933943','test@gmail.com','Caroline Syme','0432 023 416','DefaultClinic.jpg','5 Huntington Ct','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10052,'933943','test@gmail.com','Cox Dr','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10053,'933943','test@gmail.com','Dalton Dr','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10054,'933943','test@gmail.com','Dillane P','(03) 9741 2033','DefaultClinic.jpg','13 Synnot St','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10055,'933943','test@gmail.com','Dr Jared Mee','(03) 9749 7846','DefaultClinic.jpg','297 Princess Hwy','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10056,'933943','test@gmail.com','Dr. Chalam Kolli','','DefaultClinic.jpg','15 Princes Hwy','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10057,'933943','test@gmail.com','Dr. Peter Pocock','(03) 9395 3899','DefaultClinic.jpg','69 Sanctuary Lakes South Blv','3030','Point Cook','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10058,'933943','test@gmail.com','Dunne K','(03) 9741 9191','DefaultClinic.jpg','297 Princes Hwy','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10059,'933943','test@gmail.com','Feekery Colin','(03) 9749 2766','DefaultClinic.jpg','229 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10060,'933943','test@gmail.com','Fernando Dr','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10061,'933943','test@gmail.com','Giam E','(03) 9749 2766','DefaultClinic.jpg','229 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10062,'933943','test@gmail.com','Giam Edward','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10063,'933943','test@gmail.com','Gilani M','(03) 9749 2766','DefaultClinic.jpg','233 Heaths Rd','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10064,'933943','test@gmail.com','Grogan Helen Dr','','DefaultClinic.jpg','242 Hoppers Lane','3030','Werribee','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10065,'933943','test@gmail.com','A M Monteith','(03) 9830 7130','DefaultClinic.jpg','524 Whitehorse Rd','3127','Surrey Hills','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10066,'933943','test@gmail.com','A Whiter Smiley','1300 661 159','DefaultClinic.jpg','541 Elgar Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10067,'933943','test@gmail.com','Alpha Dental Group','(03) 9894 4479','DefaultClinic.jpg','20C Blackburn Rd','3130','Blackburn','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10068,'933943','test@gmail.com','An Eileen Dr','(03) 9899 0288','DefaultClinic.jpg','Level 1 934 Whitehorse Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10069,'933943','test@gmail.com','Australian Unity Dental Care','(03) 9897 1038','DefaultClinic.jpg','973 Whitehorse Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10070,'933943','test@gmail.com','Bastian Kathryn Dr','(03) 9808 1735','DefaultClinic.jpg','204 Elgar Rd','3128','Box Hill South','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10071,'933943','test@gmail.com','Blackburn Clinic Dental Centre','(03) 9878 1597','DefaultClinic.jpg','195 Whitehorse Rd','3130','Blackburn','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10072,'933943','test@gmail.com','Blackburn Dental Group','(03) 9878 1411','DefaultClinic.jpg','23 Blackburn Rd','3130','Blackburn','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10073,'933943','test@gmail.com','Box Hill Dental','(03) 9890 7364','DefaultClinic.jpg','106 Thames St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10074,'933943','test@gmail.com','Box Hill Family Dentistry','(03) 9899 3110','DefaultClinic.jpg','Level 2/ 43 Carrington Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10075,'933943','test@gmail.com','Boyd Robyn','(03) 9890 7364','DefaultClinic.jpg','106 Thames St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10076,'933943','test@gmail.com','Burwood Dental Centre','(03) 9888 7534','DefaultClinic.jpg','356 Burwood Hwy','3125','Burwood','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10077,'933943','test@gmail.com','Chan Steven K W Dr','(03) 9890 7100','DefaultClinic.jpg','Suite 8, Centro Box Hill North , 17 Market St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10078,'933943','test@gmail.com','Chang Juliana Dr','(03) 9899 0288','DefaultClinic.jpg','Level 1 934 Whitehorse Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10079,'933943','test@gmail.com','Cheung D K S Dr','(03) 9899 3415','DefaultClinic.jpg','1st Floor 591 Station St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10080,'933943','test@gmail.com','Chong Dental Surgery','(03) 9899 2980','DefaultClinic.jpg','Level 1/587- 589 Station St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10081,'933943','test@gmail.com','Chong Dental Surgery','(03) 9899 2980','DefaultClinic.jpg','1st Floor 587- 589 Station St','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10082,'933943','test@gmail.com','Crystal Dental Imaging','(03) 9897 1569','DefaultClinic.jpg','1029 Whitehorse Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10083,'933943','test@gmail.com','Dental Care Today','0448 832 867','DefaultClinic.jpg','244 Canterbury Rd','3131','Forest Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10084,'933943','test@gmail.com','Dentalcare For All','(03) 9897 1174','DefaultClinic.jpg','Suite 3/ 1A Carrington Rd','3128','Box Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10085,'933943','test@gmail.com','A. Pacella Dr','(03) 9560 9573','DefaultClinic.jpg','268 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10086,'933943','test@gmail.com','AA Pacella Dr & Associates','(03) 9560 9573','DefaultClinic.jpg','268 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10087,'933943','test@gmail.com','Agha Karim Dr','(03) 9561 1118','DefaultClinic.jpg','568 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10088,'933943','test@gmail.com','Bloom Jason Dr','(03) 9803 0964','DefaultClinic.jpg','312 Blackburn Rd','3149','Mt Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10089,'933943','test@gmail.com','Borgula Luke Dr','(03) 9574 7757','DefaultClinic.jpg','Suite 2 262- 264 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10090,'933943','test@gmail.com','Chan Michelle','(03) 9887 8787','DefaultClinic.jpg','230 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10091,'933943','test@gmail.com','Chong Kiang Dr.','(03) 9561 5355','DefaultClinic.jpg','686 Ferntree Gully Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10092,'933943','test@gmail.com','Chua Lawrence Dr','(03) 9802 0198','DefaultClinic.jpg','470 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10093,'933943','test@gmail.com','De Hoyos Miro Dr','(03) 9561 1118','DefaultClinic.jpg','568 Blackburn Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10094,'933943','test@gmail.com','Dentist @ 330','(03) 9886 5318','DefaultClinic.jpg','330 Highbury Rd','3149','Mt Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10095,'933943','test@gmail.com','Dowling Lawrence G & Melissa','(03) 9802 2899','DefaultClinic.jpg','240 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10096,'933943','test@gmail.com','Dr A Pacella Pty Ltd','(03) 9560 9573','DefaultClinic.jpg','268 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10097,'933943','test@gmail.com','Dr Andreas Bechler & Associates','(03) 9803 3998','DefaultClinic.jpg','1C Hanover Rd','3133','Vermont South','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10098,'933943','test@gmail.com','Dr Barry Kave','(03) 9560 2702','DefaultClinic.jpg','861A Waverley Rd','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10099,'933943','test@gmail.com','Dr Kevin Prouse and Dr M. Timol','(03) 9560 5581','DefaultClinic.jpg','9 Collegium Ave','3150','Wheelers Hill','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10100,'933943','test@gmail.com','EK Dental','(03) 9887 8787','DefaultClinic.jpg','230 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10101,'933943','test@gmail.com','EK Dental Surgery','(03) 9887 8787','DefaultClinic.jpg','230 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10102,'933943','test@gmail.com','Ek Lee C Dr','(03) 9887 8787','DefaultClinic.jpg','230 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10103,'933943','test@gmail.com','Estioko Leora Dr','(03) 9560 2177','DefaultClinic.jpg','Suite 5 Level 1 264 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10104,'933943','test@gmail.com','Farmer Glenda','(03) 9802 2899','DefaultClinic.jpg','240 Springvale Rd','3150','Glen Waverley','','',7,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10105,'933943','test@gmail.com','Advanced Imaging Parramatta','','DefaultClinic.jpg','116 Macquarie St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10106,'933943','test@gmail.com','Agar Ashish Dr','(02) 9635 7077','DefaultClinic.jpg','152 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10107,'933943','test@gmail.com','Andrew Malous','(02) 9687 6395','DefaultClinic.jpg','191 Church St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10108,'933943','test@gmail.com','Argyle Street Medical Centre','(02) 9893 8733','DefaultClinic.jpg','Shop 13, Westfield Shopping Town, Cnr Marsden and Argyle Sreets','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10109,'933943','test@gmail.com','Aroney Jim & Caraiscos Phillip','(02) 9893 8733','DefaultClinic.jpg','144- 146 Church St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10110,'933943','test@gmail.com','Banerjee Bharati Dr','(02) 9635 7077','DefaultClinic.jpg','152 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10111,'933943','test@gmail.com','Chan Derek Dr','(02) 9635 7077','DefaultClinic.jpg','152 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10112,'933943','test@gmail.com','Christopher','(02) 8677 7043','DefaultClinic.jpg','302 Church St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10113,'933943','test@gmail.com','Dr Dai Tran','(02) 9687 7664','DefaultClinic.jpg','Level 2 Suite 6 154 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10114,'933943','test@gmail.com','Dr Dai Tran','(02) 9687 7664','DefaultClinic.jpg','Suite 6 Level 2 154 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10115,'933943','test@gmail.com','Dr Stewart Precians','(02) 9687 7664','DefaultClinic.jpg','Ste 6/ 154 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10116,'933943','test@gmail.com','Fed Dept Health','(02) 9865 9333','DefaultClinic.jpg','20 Smith St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10117,'933943','test@gmail.com','Fitzsimons Ross Dr','(02) 9635 7077','DefaultClinic.jpg','152 Marsden St','2150','Parramatta','','',2,1,NULL,1,'admin','2017-01-23 08:37:39','admin','2017-01-23 08:37:39'),(10118,'933943','test@gmail.com','f','','','f','1234','f','-35.4734679','149.01236789999996',3,1,NULL,0,'fudanyinxin@gmail.com','2017-05-09 10:33:57','admin','2017-05-09 10:34:19'),(10119,'933943','test@gmail.com','hahah','','','1','1','1','-35.2421201','149.0572644',3,1,NULL,0,'222@a.com','2017-05-10 10:13:29','222@a.com','2017-05-10 10:13:29'),(10120,'933943','test@gmail.com','fina','','','f','f','f','-35.4734679','149.01236789999996',3,1,NULL,0,'final@f','2017-05-10 10:15:45','final@f','2017-05-10 10:15:45');
/*!40000 ALTER TABLE `fd_clinic_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-10 23:06:27