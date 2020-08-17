-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-03-21 16:55:09
-- --------------------------------------
-- Server version 5.5.36 MySQL Community Server (GPL)


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 
-- Definition of pms_account_master
-- 

DROP TABLE IF EXISTS `pms_account_master`;
CREATE TABLE IF NOT EXISTS `pms_account_master` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_head` text NOT NULL,
  `account_main_group` text NOT NULL,
  `account_sub_group` text NOT NULL,
  `account_party_name` text NOT NULL,
  `account_inventory_value_affected` text NOT NULL,
  `account_add_one` text NOT NULL,
  `account_add_two` text NOT NULL,
  `account_district` text NOT NULL,
  `account_state` text NOT NULL,
  `account_state_code` int(11) NOT NULL DEFAULT '0',
  `account_country` text NOT NULL,
  `account_pin_code` varchar(10) NOT NULL,
  `account_gst_number` text NOT NULL,
  `account_pan_number` text NOT NULL,
  `account_cin_number` text NOT NULL,
  `account_phone_number` text NOT NULL,
  `account_email` text NOT NULL,
  `account_opening_balance` double(10,2) NOT NULL,
  `account_opening_balance_type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-add, 2-delete',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE A/C','7','2','PURCHASE A/C','Yes','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(2,'SALES A/C','6','1','SALES A/C','Yes','','','','0',0,'','0','','','1','','',0,'Credit',0,'2019-12-02 05:23:22'),
(3,'CGST-ITC A/C','5','6','CGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(4,'IGST-ITC A/C','5','6','IGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(5,'SGST-ITC A/C','5','6','SGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(6,'CASH A/C','5','4','CASH A/C','No','','','','0',0,'','','','','','','',56896.34,'Debit',0,'2019-12-02 14:41:52'),
(7,'CREDIT A/C','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27',27,'IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-06 22:21:11'),
(8,'DEBIT A/C','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27',27,'india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 12:34:21'),
(9,'SALES RETURN A/C','7','2','SALES RETURN A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-11 13:13:33'),
(10,'CGST-OTL A/C','3','3','CGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:10:45'),
(11,'SGST-OTL A/C','3','3','SGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:13:02'),
(12,'IGST-OTL A/C','3','3','IGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:13:33'),
(13,'PURCHASE RETURN A/C','7','2','PURCHASE RETURN A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-18 06:33:17'),
(14,'ACCOUNTANCY CHARGE PAYABLE','3','3','ACCOUNTANCY CHARGE PAYABLE','No','','','','0',0,'','0','','','','','',12000,'Credit',0,'2019-12-02 05:23:22'),
(15,'AMRIT ENTERPRISES','5','3','RENU PANDIT','No','COLLEGE ROAD','MUNGER','MUNGER','10',10,'INDIA','','10AKOPP5113H1ZE','AKOPP5113H','','','',951984,'Debit',0,'2019-12-02 14:05:33'),
(16,'AUDIT FEE PAYABLE','3','3','AUDIT FEE PAYABLE','No','','','','0',0,'','','','','','','',11000,'Credit',0,'2019-12-02 14:34:30'),
(17,'AUTO ACE','4','1','AUTO ACE','No','','','','0',0,'','','','','','','',78220,'Debit',0,'2019-12-02 14:36:09'),
(18,'AXIS BANK  A/C NO.916020025351806','5','4','AXIS BANK  A/C NO.916020025351806','No','RAJENDAR NAGAR','','PATNA','10',10,'','','10AAACU2414K2ZT','AAACU2414K','','','',14355.45,'Debit',0,'2019-12-02 14:37:42'),
(19,'AXIS BANK LTD (OD AC-917030074838374)','3','1','AXIS BANK LTD (OD AC-917030074838374)','No','','','PATNA','10',10,'','','10AAACU2414K2ZT','AAACU2414K','','','',296723,'Credit',0,'2019-12-02 14:39:41'),
(20,'BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','3','1','BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','','','','','0',0,'','','','','','','',1101867,'Credit',0,'2019-12-02 14:40:49'),
(21,'CASH A/C','5','4','CASH A/C','No','','','','0',0,'','','','','','','',56896.34,'Debit',0,'2019-12-02 14:41:52'),
(22,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','3','1','CENTRAL BANK OF INDIA CC-A/C NO.3170157625','No','','','PATNA','10',10,'','','10AAACC2498P3ZG','AAACC2498P','','','',427750.08,'Credit',0,'2019-12-02 14:58:49'),
(23,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543','5','4','CENTRAL BANK OF INDIA S/B A/C NO.3307952543','No','','','','0',0,'','','','','','','',1942.29,'Debit',0,'2019-12-02 14:59:51'),
(24,'CUSTOM DUTY RECEIABLE','5','6','CUSTOM DUTY RECEIABLE','No','','','','0',0,'','','','','','','',195906,'Debit',0,'2019-12-02 15:00:51'),
(25,'DESIGNEX DIGITAL','5','3','MADHU KANT PRASAD','No','1 ST FLOOR, LALSLION BUILDING,','OPP GOLDEN ICE CREAM FACTORY, EXHIBITION ROAD,','PATNA','10',10,'INDIA','800001','10AMSPP5547M1ZH','AMSPP5547M','','','',629616,'Debit',0,'2019-12-02 15:05:55'),
(26,'EQUIPMENT','4','1','EQUIPMENT','No','','','','0',0,'','','','','','','',3586,'Debit',0,'2019-12-02 15:06:58'),
(27,'EXCEL ENTERPRISES','5','3','EXCEL ENTERPRISES','No','KADAMKUAN','','PATNA','10',10,'INDIA','800003','10AADFE9983D1ZK','AADFE9983D','','','',320912,'Debit',0,'2019-12-02 15:10:04'),
(28,'EXCESS GST PAID','5','6','EXCESS GST PAID','No','','','','0',0,'','','','','','','',553673.83,'Debit',0,'2019-12-02 15:10:55'),
(29,'EXCESS INPUT VAT','5','6','EXCESS INPUT VAT','No','','','','0',0,'','','','','','','',102742.37,'Debit',0,'2019-12-02 15:11:57'),
(30,'FURNITURE & FIXTURE','5','1','FURNITURE & FIXTURE','No','','','','0',0,'','','','','','','',9976,'Debit',0,'2019-12-02 15:12:52'),
(31,'GOLD EAST TRADING(HONG KONG) COMPANY','3','2','GOLD EAST TRADING(HONG KONG) COMPANY','No','','','','0',0,'HONG KONG','','','','','','',750084.2,'Credit',0,'2019-12-02 15:25:05'),
(32,'HDFC BANK  LTD. (A/C NO- 50200026260502)','5','4','HDFC BANK  LTD. (A/C NO- 50200026260502)','No','','','','10',10,'','','10AAACH2702H1ZF','AAACH2702H','','','',552,'Debit',0,'2019-12-02 15:26:24'),
(33,'INCOME TAX ADV.','5','6','INCOME TAX ADV.','No','','','','0',0,'','','','','','','',10000,'Debit',0,'2019-12-02 15:27:26'),
(34,'INDICA CAR','4','1','INDICA CAR','No','','','','0',0,'','','','','','','',66268,'Debit',0,'2019-12-02 15:28:36'),
(35,'MAGMA FINCORP LTD.','3','1','MAGMA FINCORP LTD.','No','','','','0',0,'','','','','','','',133484,'Credit',0,'2019-12-02 15:29:55'),
(36,'MANGALAM PAPERS & CARDS','5','3','MANGALAM PAPERS & CARDS','No','AMBEDKAR MARKET COMPLEX','DAKBUNGLOW','GAYA','10',10,'','823001','10AEGPV7460M1Z4','AEGPV7460M','','','',114624,'Debit',0,'2019-12-02 15:32:53'),
(37,'MOBILE PHONE','4','1','MOBILE PHONE','No','','','','0',0,'','','','','','','',14365,'Debit',0,'2019-12-02 15:39:44'),
(38,'NATIONAL PAPER HOUSE','5','3','NATIONAL PAPER HOUSE','No','KADAMKUAN','','PATNA','10',10,'INDIA','800003','10AACFN4095Q1Z0','AACFN4095Q','','','',210575,'Debit',0,'2019-12-02 15:42:59'),
(39,'OFFICE RENT PAYABLE','3','3','OFFICE RENT PAYABLE','No','','','','0',0,'','','','','','','',12000,'Credit',0,'2019-12-02 15:44:45'),
(40,'ORIENT LINKS CO.(L.L.C)','3','2','ORIENT LINKS CO.(L.L.C)','No','THE ATRIUM CENTER, OFFICE NO 609,','KHALIDBIN WALLED ROAD, PO BOX NO 52708,','','0',0,'DUBAI','','','','','','',209696.06,'Credit',0,'2019-12-02 15:48:39'),
(41,'POST OFFICE (RD A/C)NO.12478','4','5','POST OFFICE (RD A/C)NO.12478','No','','','','0',0,'','','','','','','',115500,'Debit',0,'2019-12-02 15:55:15'),
(42,'POST OFFICE R/D A/C NO.385957145','4','5','POST OFFICE R/D A/C NO.385957145','No','','','','0',0,'','','','','','','',14000,'Debit',0,'2019-12-02 15:56:11'),
(43,'POST OFFICE S/B A/C 3849213945','5','4','POST OFFICE S/B A/C 3849213945','No','','','','0',0,'','','','','','','',158,'Debit',0,'2019-12-02 15:57:01'),
(44,'PRINTING MACHINE','4','1','PRINTING MACHINE','No','','','','0',0,'','','','','','','',64008,'Debit',0,'2019-12-02 15:57:58'),
(45,'RAJIV RANJAN (PROP)','1','1','RAJIV RANJAN (PROP)','No','','','','0',0,'','','','','','','',6189944.85,'Credit',0,'2019-12-02 16:12:57'),
(46,'SALARY PAYABLE','3','3','SALARY PAYABLE','No','','','','0',0,'','','','','','','',18600,'Credit',0,'2019-12-02 16:16:32'),
(47,'SAMRAT OFFSET','5','3','SAMRAT OFFSET','No','JAMUN GALI','SABZI BAGH','PATNA','10',10,'INDIA','800004','10AHJPB3509R1ZF','AHJPB3509R','','','',15126,'Debit',0,'2019-12-02 16:19:47'),
(48,'SCOOTY','4','1','SCOOTY','No','','','','0',0,'','','','','','','',40800,'Debit',0,'2019-12-02 16:20:37'),
(49,'SHRI DURGA PRINTING WORKS','5','3','PRADEEP KUMAR','No','KANKARBAGH','','PATNA','10',10,'INDIA','800020','10AKTPK0647A1ZN','AKTPK0647A','','','',100000,'Credit',0,'2019-12-02 16:23:42'),
(50,'STATE BANK OF INDIA A/C NO.35029039458','5','4','STATE BANK OF INDIA A/C NO.35029039458','No','','','PATNA','10',10,'','','10AAACS8577K2Z3','AAACS8577K','','','',140206.79,'Debit',0,'2019-12-02 16:25:15'),
(51,'TDS ( ASSETS )','5','6','TDS ( ASSETS )','No','','','','0',0,'','','','','','','',9515,'Debit',0,'2019-12-02 16:26:10'),
(52,'UNITED BANK OF INDIA  S/B A/C NO.0474010056707','5','4','UNITED BANK OF INDIA  S/B A/C NO.0474010056707','No','','','','0',0,'','','','','','','',6069.33,'Debit',0,'2019-12-02 16:27:10'),
(53,'VITAL SOLUTIONS PTE LTD.','3','2','VITAL SOLUTIONS PTE LTD.','No','#21-01, ROBINSON 77,','ROBINSON ROAD,','','0',0,'SINGAPUR','068896','','','','','',445921.35,'Credit',0,'2019-12-02 16:29:27'),
(54,'OP STOCK','5','2','OP STOCK','No','','','','0',0,'','','','','','','',5922072.14,'Debit',0,'2019-12-02 17:37:42'),
(55,'SALARY AND WAGES','7','3','SALARY AND WAGES','No','','','','0',0,'','','','','','','',0,'Credit',0,'2019-12-03 11:09:52'),
(56,'MISC EXPENSES','7','5','MISC EXPENSES','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-06 14:42:12'),
(57,'INTEREST','6','2','INTEREST','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-06 14:49:01'),
(58,'PRINTING & STATIONERY','7','5','','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-09 11:37:47'),
(59,'REPAIR & MAINTENENCE','7','5','REPAIR & MAINTENENCE','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:45:59'),
(60,'FREIGHT','7','5','FREIGHT','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:48:33'),
(61,'BANK CHARGES','7','5','BANK CHARGES','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:50:16'),
(62,'KHANNA PAPER MILLS LTD','3','2','KHANNA PAPER MILLS LTD','Yes','NH 3, BY PASS ROAD,','OPP METRO CASH & CARRY','AMRITSAR','3',3,'INDIA','143001','03AAACK1375K1ZP','AAACK1375K','','','',0,'Debit',0,'2019-12-13 11:32:34'),
(63,'TRAVELLING EXPENSES','7','5','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-17 05:16:28'),
(64,'AUDIT FEE','7','5','AUDIT FEE','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-17 11:59:12'),
(65,'INTEREST EXPENSES','7','5','','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-25 17:29:40'),
(66,'PRASHASTI PRINTERS','5','3','PRASHASTI PRINTERS','No','BANGALI AKHARA','LANGARTOLI','PATNA','10',10,'INDIA','800004','10AGQPT0294D1ZH','AGQPT0294D','','','',0,'Debit',0,'2019-12-25 18:18:22'),
(67,'RAVI RANJAN ( PROP )','5','6','RAVI RANJAN ( PROP )','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-27 14:56:51'),
(68,'RENT','7','5','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-27 14:57:38'),
(69,'INTEREST EXPENSES','7','5','INTEREST EXPENSES','No','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-02 11:40:42'),
(70,'SHRI DURGA PRINTING WORKS','5','3','SHRI DURGA PRINTING WORKS','Yes','KANKARBAGH','','PATNA','10',10,'INDIA','800020','10AKTPK0647A1ZN','AKTPK0647A','','','',0,'Debit',0,'2020-02-02 12:02:03'),
(71,'PATNESHWARI PRINTER','5','3','PATNESHWARI PRINTER','Yes','LANGARTOLI','','PATNA','10',10,'INDIA','800004','10CDVPB6591H1ZE','CDVPB6591H','','','',0,'Debit',0,'2020-02-12 12:57:34'),
(72,'JAGDAMBA PRINTING PRESS','5','3','JAGDAMBA PRINTING PRESS','Yes','DARIYAPUR GOLA','','PATNA','10',10,'','','10AKBPB0699M1ZD','AKBPB0699M','','','',0,'Debit',0,'2020-02-12 13:01:47'),
(73,'GLOBAL PRINT ASSOCIATES','5','3','GLOBAL PRINT ASSOCIATES','Yes','GAMUN GALI','SABZI BAGH','PATNA','10',10,'','800010','10AACPH7774A2Z9','AACPH7774A','','','',0,'Debit',0,'2020-02-12 13:07:44'),
(74,'SIMILIA RESERCH LAB PVT LTD','5','3','SIMILIA RESERCH LAB PVT LTD','Yes','MIKI MOHALLA','','ARA','10',10,'','','10AAXCS9997G1ZG','AAXCS9997G','','','',0,'Debit',0,'2020-02-12 13:27:53'),
(75,'SHARP COMPUTER','5','3','SHARP COMPUTER','Yes','G-20, GROUND FLOOR','GOPAL MARKET','PATNA','10',10,'','800004','10AMQPS9308B2Z3','AMQPS9308B','','','',0,'Debit',0,'2020-02-12 13:44:05'),
(76,'ROUND OFF','7','5','ROUND OFF','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-12 13:47:22'),
(77,'SARASWATI STORE','5','3','SARASWATI STORE','Yes','NEW CHITRAGUPTA NAGAR','KANKARBAGH','PATNA','10',10,'','800020','10AFHPK8001M1ZP','AFHPK8001M','','','',0,'Debit',0,'2020-02-12 13:51:32'),
(78,'MUKESH PRAKASHAN','5','3','MUKESH PRAKASHAN','Yes','BHUESWNESHWAR PLAZA BASEMENT','NEW MARKET','PATNA','10',10,'','','','AIDPK4368A','','','',0,'Debit',0,'2020-02-14 16:31:27'),
(79,'NEW DIGITAL GALLARY','5','3','NEW DIGITAL GALLARY','Yes','GROUND FLOOR, MAKHDUM APPARTMENT','DARIYAPUR','PATNA','10',10,'','800004','10AJOPA2672D1ZT','AJOPA2672D','','','',0,'Debit',0,'2020-02-15 10:44:31'),
(80,'CHOURSIA DEGINER PRINTER','5','3','CHOURSIA DEGINER PRINTER','Yes','E-5, INDUSTRIAL ESTATE,','RAMCHANDER PUR','BIHARSHARIF','10',10,'','','10ADBPC5074A1ZK','ADBPC5074A','','','',0,'Debit',0,'2020-02-15 16:21:58'),
(81,'EASTERN PAPER HOUSE','5','3','EASTERN PAPER HOUSE','Yes','D N DAS LANE','LANGARTOLI','PATNA','10',10,'','800001','10ASHPP5747L1ZG','ASHPP5747L','','','',0,'Debit',0,'2020-02-17 17:24:46'),
(82,'BANK CHARGES','7','5','BANK CHARGES','No','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-17 17:39:38'),
(83,'SUNRISE ENTERPRISES','5','3','SUNRISE ENTERPRISES','No','DHOBI GALI','DRIYAPUR','PATNA','10',10,'','','10AHOPK3902A1Z3','AHOPK3902A','','','',0,'Debit',0,'2020-02-18 16:52:32'),
(84,'LIC ( LOAN )','1','1','LIC ( LOAN )','No','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-18 17:31:01'),
(85,'KAJAL PRINTING PRESS','5','3','KAJAL PRINTING PRESS','No','DARIYAPUR','','PATNA','10',10,'','800004','10ASEPS6664G1ZP','ASEPS6664G','','','',0,'Debit',0,'2020-02-18 18:01:17'),
(86,'VIDYA PUBLICATION','5','3','VIDYA PUBLICATION','No','SABZI BAGH','','PATNA','10',10,'','','','','','','',0,'Debit',0,'2020-02-18 19:44:57'),
(87,'JAGDAMBA PRINT LINE','5','3','JAGDAMBA PRINT LINE','No','ABULASH LANE','MACHUATOLI','PATNA','10',10,'','800004','10AZNPP1854H1ZD','AZNPP1854H','','','',0,'Debit',0,'2020-02-19 08:04:39'),
(88,'SURYA PRINTO GRAPHICS','5','3','SURYA PRINTO GRAPHICS','Yes','SARISTABAD MAIN ROAD','GARDANIBAGH','PATNA','10',10,'','800001','10AAEHA5209D2Z7','AAEHA5209D','','','',0,'Debit',0,'2020-02-19 12:19:40'),
(89,'JAGRITI ENTERPRISES','5','3','JAGRITI ENTERPRISES','No','ASHOK NAGAR, ROAD NO-1','KANKARBAGH COLONY','PATNA','10',10,'','800020','10ASLPK5105B1ZI','ASLPK5105B','','','',0,'Debit',0,'2020-02-19 12:44:17'),
(90,'UNIQUE ENTERPRISES','5','3','UNIQUE ENTERPRISES','No','SAHAGANJ','NAHAR ROAD','PATNA','10',10,'','800006','10ANNPS6400Q1ZN','ANNPS6400Q','','','',0,'Debit',0,'2020-02-19 12:46:17'),
(91,'MAHABIR PRINTERS SUPPLY AND COMPANY','5','3','MAHABIR PRINTERS SUPPLY AND COMPANY','No','KAZIPUR','NAYA TOLA','PATNA','10',10,'','800004','10APBPS0749E1ZC','APBPS0749E','','','',0,'Debit',0,'2020-02-19 12:48:19'),
(92,'GOPAL STEAM PRINTING WORKS','5','3','GOPAL STEAM PRINTING WORKS','No','BHURA NATH CHOWK','','BHAGALPUR','10',10,'','','10ADDPD3825C1ZJ','ADDPD3825C','','','',0,'Debit',0,'2020-02-19 12:49:44'),
(93,'VAISHNAVI PRESS','5','3','VAISHNAVI PRESS','No','KAZIPUR','ROAD NO 2','PATNA','10',10,'','800004','10BSDPK8574P1Z9','BSDPK8574P','','','',0,'Debit',0,'2020-02-19 17:51:49'),
(94,'BALRAM PRINTERS','5','3','BALRAM PRINTERS','No','D N DAS LANE','LANGARTOLI','PATNA','10',10,'','800004','10AIHPK2691L1Z8','AIHPK2691L','','','',0,'Debit',0,'2020-02-19 18:00:52'),
(95,'SHREE RAM PRINTERS','5','3','SHREE RAM PRINTERS','No','POATAL PARK','KHAS MAHAL','PATNA','10',10,'','800001','10CPGPB0985J1Z5','CPGPB0985J','','','',0,'Debit',0,'2020-02-19 18:39:21'),
(96,'PERCEPT PRINTS','5','3','PERCEPT PRINTS','No','CHANDRA DATTA LANE, DHOBI GALI','DARIYAPUR GOLA','PATNA','10',10,'','800001','10ENXPS1751L1ZF','ENXPS1751L','','','',0,'Debit',0,'2020-02-19 18:58:56'),
(97,'IDEAL PRESS','5','3','IDEAL PRESS','No','HOUSE NO - 544, KALAL TOLL CHOWK','LOWER BAZAR, SHAZADI COMPLEX','RANCHI','20',20,'','','20ABQPF9990D1ZJ','ABQPF9990D','','','',0,'Debit',0,'2020-02-19 19:05:58'),
(98,'POLYGON MEDIA WORKS','5','3','POLYGON MEDIA WORKS','No','CHANDRA DUTTA BHAWAN, DHOBI GALI','DARIYAPUR','PATNA','10',10,'','800004','10ARXPS7093P1ZO','ARXPS7093P','','','',0,'Debit',0,'2020-02-19 20:25:13'),
(99,'DAE KYUNG PAPER AND PULP','3','2','DAE KYUNG PAPER AND PULP','No','KOREA BUSINESS CENTER BUILDING','SECHO DONG','SEOUL','0',0,'KOREA','','','','','','',0,'Debit',0,'2020-02-19 20:31:06'),
(100,'KHANNA PAPER MILLS LTD ( DEPOSIT )','4','8','KHANNA PAPER MILLS LTD ( DEPOSIT )','No','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-19 20:38:01'),
(101,'DHANWANTRI ENERGY PVT LTD','5','3','DHANWANTRI ENERGY PVT LTD','Yes','PLOT NO .C-74 A.G COLONY P.O AASHINA NAGAR PATNA -25 BIHAR','','PATNA','10',10,'INDIA','800025','10AADCD3002FIZP','AADCD3002F','','','',0,'Debit',0,'2020-02-20 08:17:22'),
(102,'COMPUTER GHAR','5','3','COMPUTER GHAR','Yes','PATNA 800001','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-20 08:22:29'),
(103,'SRI TARA GEETA PRINTING PRESS','5','3','SRI TARA GEETA PRINTING PRESS','Yes','SRI GANPATI PLAZA KHALIFABAG CHOWK ,BHAGALPUR','','BHAGALPUR','10',10,'INDIA','','10BXNPK2644F1ZR','BXNPK2644F','','','',0,'Debit',0,'2020-02-20 08:27:51'),
(104,'LIC MATURITY','5','6','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-20 08:32:45'),
(105,'BAJAJ FINANCE INTREST','7','7','BAJAJ FINANCE INTREST','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-20 08:47:43'),
(106,'AMRIT ENTERPRISES','5','3','AMRIT ENTERPRISES','Yes','COLEDGE ROAD MUNGER BIHAR','','MUNGER','10',10,'INDIA','','10AKOPP5113H1ZE','AKOPP5113H','','','',0,'Debit',0,'2020-02-20 09:44:22'),
(107,'INTEREST RECEIVED S/B','6','2','INTEREST RECEIVED S/B','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-20 10:20:29'),
(108,'KIRAN PRINTERS','5','3','KIRAN PRINTERS','Yes','ABULAS LANE ,MACHUA TOLL PATNA-4(BIHAR)','','PATNA','10',10,'INDIA','80004','10ALSPK6785D1ZX','ALSPK6785D','','','',0,'Debit',0,'2020-02-20 11:15:08'),
(109,'RAVI RANJAN (GODOWN)','7','7','RAVI RANJAN (GODOWN)','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-20 11:19:26'),
(110,'CAPITAL OFFSET','5','3','CAPITAL OFFSET','Yes','NAYTOLA ,PATNA -800004','','PATNA','10',10,'INDIA','','10AHEPK4831C1Z3','AHEPK4831C','','','',0,'Debit',0,'2020-02-20 11:26:19'),
(111,'S.R. PRINTERS','5','3','S.R. PRINTERS','No','NAYA TOLA','','PATNA','10',10,'','800004','10BDEPS8050E1ZV','BDEPS8050E','','','',0,'Debit',0,'2020-02-21 19:07:21'),
(112,'PATLIPUTRA LAMINATOR AND PRINTERS','5','3','PATLIPUTRA LAMINATOR AND PRINTERS','No','MALHI PAKRI, PATRKAR NAGAR','KANKARBAGH','PATNA','10',10,'','800020','10AFUPK8499L1ZK','AFUPK8499L','','','',0,'Debit',0,'2020-02-21 19:19:16'),
(113,'DIKSHA ART AND PRINTS','5','3','DIKSHA ART AND PRINTS','No','HANDLOOM BHAWAN CAMPUS','RAJENDAR NAGAR','PATNA','10',10,'','800016','10AIWPS9913Q1Z8','AIWPS9913Q','','','',0,'Debit',0,'2020-02-21 19:25:40'),
(114,'TS TRADING','5','3','TS TRADING','No','SHOP L G NO 8, INDRPRASTHA','WEST BORING CANAL ROAD','PATNA','10',10,'','800001','10ADNPB7372E1ZX','ADNPB7372E','','','',0,'Debit',0,'2020-02-21 20:16:28'),
(115,'SRI GANPATI PRINTING PRESS','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-22 08:08:17'),
(116,'BHAWANI ENTERPRISES','5','3','BHAWANI ENTERPRISES','No','KANTI MARKET, NAYA TOLA','MAKHANIA KUAN MORE','PATNA','10',10,'','800004','','','','','',0,'Debit',0,'2020-02-22 08:12:56'),
(117,'NARAYANA PRINTING PRESS','5','3','NARAYANA PRINTING PRESS','No','TRILOKI MARKET, BARI PATH,','NAYA TOLA','PATNA','10',10,'','800004','10CFVPK7484L1ZQ','CFVPK7484L','','','',0,'Debit',0,'2020-02-22 08:14:02'),
(118,'SR PRINTERS','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-22 08:17:17'),
(119,'ANIRUDH OFFSET PRINTER','5','3','ANIRUDH OFFSET PRINTER','Yes','KADAMKUAAN','PARK ROAD','PATNA','10',10,'INDIA','','10AGEPP2804K1ZQ','AGEPP2804K','','','',0,'Debit',0,'2020-02-22 08:19:30'),
(120,'THE GANDHI ENTERPRISES','5','3','THE GANDHI ENTERPRISES','No','NAYA TOLA','','PATNA','10',10,'','800004','10ADIPR5149N1Z8','ADIPR5149N','','','',0,'Debit',0,'2020-02-22 08:32:04'),
(121,'ORIENTAL INSURANCE','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-22 08:35:07'),
(122,'INTER STATE PURCHASES','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-22 08:44:03'),
(123,'BANK INTREST','1','1','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-22 09:29:48'),
(124,'MANOJ ASSOCIATE','5','3','MANOJ ASSOCIATE','Yes','POPULAR PALACE LANGARTOLI, PATNA 4 (BIHAR)','POPULAR PALACE LANGARTOLI, PATNA 4 (BIHAR)','PATNA','10',10,'INDIA','','10AJHPA0055Z1H3','AJHPA0055Z','','','',0,'Debit',0,'2020-02-22 09:44:01'),
(125,'SUBHASH GODOWN','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-22 09:47:50'),
(126,'ADITYA ENTERPRISES','5','3','ADITYA ENTERPRISES','No','RAMDIRI','BEGUSARAI','B','10',10,'','','10BAHPS6924B1Z1','BAHPS6924B','','','',0,'Debit',0,'2020-02-22 10:53:02'),
(127,'INDIAN ART OFFSET','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 06:39:21'),
(128,'HDFC (BISSINESS LOAN)','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 06:41:44'),
(129,'HDFC INTEREST','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 06:43:15'),
(130,'SHREE GANESH STORES','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 06:45:54'),
(131,'VSP ENTERPRISES','5','3','VSP ENTERPRISES','Yes','RAJENDRA NAGAR ,PATNA','RAJENDRA NAGAR ,PATNA','PATNA','10',10,'INDIA','','10BJAPK8910K1ZG','BJAPK8910K','','','',0,'Debit',0,'2020-02-23 07:17:33'),
(132,'JAI  MAA GRAPHICS','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 07:20:11'),
(133,'KARTAR COACHING CENTRE ','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 07:34:34'),
(134,'HEALTH INSRURANCE (APOLO)','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 07:43:43'),
(135,'AROONALAY','5','3','AROONALAY','Yes','RAJKISHORI COMPLEX PATNA,4( BIHAR )','RAJKISHORI COMPLEX PATNA,4( BIHAR )','PATNA','10',10,'INDIA','','10AFHPK8002J1ZU','AFHPK8002J','','','',0,'Debit',0,'2020-02-23 07:55:29'),
(136,'SU- MAA ENTERPRISES PVT LTD','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 08:10:38'),
(137,'PUJA PRINTECH PVT LTD ','5','3','PUJA PRINTECH PVT LTD ','Yes','INDUSTRIAL AREA, PARTLIPUTRA -PATNA-13','INDUSTRIAL AREA, PARTLIPUTRA -PATNA-13','PATNA','10',10,'INDIA','800013','10AABCP4962E2ZT','AABCP4962E','','','',0,'Debit',0,'2020-02-23 08:19:13'),
(138,'AXIS BANK CHARGE ','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 08:30:56'),
(139,'SIMNI','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 08:48:10'),
(140,'VEE FORMS ','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-23 09:02:44'),
(141,'HDFC BANK CHARGE','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 07:13:26'),
(142,'MBC PUBLICATION','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 07:23:07'),
(143,'JOB PRINTERS','5','3','JOB PRINTERS','Yes','BABA BAZAR ,SARALYAGANJ MUZAFFARPUR (BIHAR)','BABA BAZAR ,SARALYAGANJ MUZAFFARPUR (BIHAR)','MUZAFFARPUR','10',10,'INDIA','','10AFBPG9092G1ZR','AFBPG9092G','','','',0,'Debit',0,'2020-02-24 07:30:18'),
(144,'THE SCREEN HOUSE','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 07:39:13'),
(145,'GAS SABCIDY','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 07:45:18'),
(146,'ROSHAN PRINTER','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 07:58:46'),
(147,'AXIS BANK INPUT CGST@9%','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 08:08:49'),
(148,'AXIS BANK INPUT SGST @ 9%','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 08:10:28'),
(149,'KHANNA PAPER MILLS LTD. (BOARD)','1','1','','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-02-24 08:21:59'),
(150,'NEW GRAPHICS COMPUTER ','5','3','NEW GRAPHICS COMPUTER ','Yes','NAYA TOLA PATNA-4(BIHAR)','NAYA TOLA PATNA -4(BIHAR)','PATNA','10',10,'INDIA','800004','10ARTPK2999N1ZZ','ARTPK2999N','','','',0,'Debit',0,'2020-02-26 03:56:45'),
(151,'VEENA PUSTAK BHAWAN','5','3','VEENA PUSTAK BHAWAN','Yes','NAYA TOLA PATNA-4(BIHAR)','NAYA TOLA PATNA -4(BIHAR)','PATNA','10',10,'INDIA','800004','10AANFV3096N1Z0','AANFV3096N','','','',0,'Debit',0,'2020-02-26 04:44:41'),
(152,'RAJDHANI LITHO ART PRINTING PRESS','5','3','RAJDHANI LITHO ART PRINTING PRESS','Yes','PATNA (BIHAR) ','PATNA (BIHAR) ','PATNA','10',10,'INDIA','','10AGDPJ3858G1ZS','AGDPJ3858G','','','',0,'Debit',0,'2020-02-26 06:16:59'),
(153,'SRISHTI PRINTEX','5','3','SRISHTI PRINTEX','Yes','KADAMKUAN, PATNA-3','KADAMKUAN, PATNA-3','PATNA','10',10,'INDIA','800003','10BKVPS3888Q1ZY','BKVPS3888Q','','','',0,'Debit',0,'2020-02-26 07:06:05'),
(154,'SRI GANPATI PRINTING WORKS','5','3','SRI GANPATI PRINTING WORKS','Yes','JAKARIAPUR,TRANSPORT NAGAR','','PATNA','10',10,'INDIA','800007','10ABKPP7777L2Z1','ABKPP7777L','','','',0,'Debit',0,'2020-02-26 07:59:41'),
(155,'S. R .PRINTERS','5','3','S. R .PRINTERS','Yes','NAYA TOLA PATNA-4(BIHAR)','NAYA TOLA PATNA-4(BIHAR)','PATNA','10',10,'INDIA','800004','10BDEPS8050E1ZV','BDEPS8050E','','','',0,'Debit',0,'2020-02-28 14:53:40'),
(156,'AMAFHHA MEDIA PVT. LTD.','5','3','AMAFHHA MEDIA PVT. LTD.','Yes','213,SHANTI COMPLEX,S P VERMA ROAD PATNA 7','213,SHANTI COMPLEX,S P VERMA ROAD PATNA 7','PATNA','10',10,'INDIA','800007','10AANCA3956D1ZZ','AANCA3956D','','','',0,'Debit',0,'2020-02-29 14:51:21'),
(157,'BHARTI BOOK DEPOT','5','3','BHARTI BOOK DEPOT','Yes','KHAZANCHI ROAD PATNA 4 (BIHAR)','KHAZANCHI ROAD PATNA 4 (BIHAR)','PATNA','10',10,'INDIA','800004','','','','','',0,'Debit',0,'2020-03-01 03:36:21'),
(158,'SHYAM COMPUTER','5','3','SHYAM COMPUTER','Yes','HIMANSHU COMPLEX ,BHAGAT SINGH CHOUK ,DARBHANGHA,(BIHAR)','HIMANSHU COMPLEX ,BHAGAT SINGH CHOUK ,DARBHANGHA,(BIHAR)','DARBHANGA','10',10,'INDIA','846004','10BWCPS38883G1ZS','BWCPS38883G','','','',0,'Debit',0,'2020-03-01 03:48:51'),
(159,'GANPATI PAPER','5','3','GANPATI PAPER','Yes','POPULAR PALACE, LANGERTOLI,PATNA-4(BIHAR)','POPULAR PALACE, LANGERTOLI,PATNA-4(BIHAR)','PATNA','10',10,'INDIA','800004','10ERVPK8241R1ZY','ERVPK8241R','','','',0,'Debit',0,'2020-03-01 03:56:15'),
(160,'JAI DURGA PAPER','5','3','JAI DURGA PAPER','Yes','D. N. DAS LANE, LANGERTOLI,PATNA-4','D. N. DAS LANE, LANGERTOLI,PATNA-4','PATNA','10',10,'INDIA','800004','10AIKPK8697F1Z0','AIKPK8697F','','','',0,'Debit',0,'2020-03-02 03:00:47'),
(161,'KAIMUR JAGMOHAN OFFSET PRESS','5','3','KAIMUR JAGMOHAN OFFSET PRESS','Yes','LANGARTOLI, PATNA -4 (BIHAR)','LANGARTOLI, PATNA -4 (BIHAR)','PATNA','10',10,'INDIA','800004','10ACBPB0402A1ZA','ACBPB0402A','','','',0,'Debit',0,'2020-03-02 03:06:32'),
(162,'ADITIYA ENTERPRISES,PATNA','5','3','ADITIYA ENTERPRISES,PATNA','Yes','DARIYAPUR, GOLA PATNA -4 (BIHAR)','DARIYAPUR, GOLA PATNA -4 (BIHAR)','PATNA','10',10,'INDIA','800004','10AUVPS1732J2ZD','AUVPS1732J','','','',0,'Debit',0,'2020-03-02 03:15:06'),
(163,'FIRST PRINT','5','3','FIRST PRINT','Yes','KADAMKUAN, PATNA-4 (BIHAR)','KADAMKUAN, PATNA-4 (BIHAR)','PATNA','10',10,'INDIA','','10ANMPK2406R2ZV','ANMPK2406R','','','',0,'Debit',0,'2020-03-02 08:21:11'),
(164,'MAA GYATRI PRINTERS ','5','3','MAA GYATRI PRINTERS ','Yes','MANJU COMPLEX, NEAR UNITED BANK BHATTA BAZAR -PURNEA(BIHAR)','MANJU COMPLEX, NEAR UNITED BANK BHATTA BAZAR -PURNEA(BIHAR)','PURNEA','10',10,'INDIA','854301','10AIWPD4129M1Z5','AIWPD4129M','','','',0,'Debit',0,'2020-03-02 10:25:26'),
(165,'ACE GRAPHICS','5','3','ACE GRAPHICS','Yes','','','','10',10,'','','','','','','',0,'Debit',0,'2020-03-02 11:13:46');
/*!40000 ALTER TABLE `pms_account_master` ENABLE KEYS */;

-- 
-- Definition of pms_account_master_main_group
-- 

DROP TABLE IF EXISTS `pms_account_master_main_group`;
CREATE TABLE IF NOT EXISTS `pms_account_master_main_group` (
  `account_master_main_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_group_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_master_main_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master_main_group
-- 

/*!40000 ALTER TABLE `pms_account_master_main_group` DISABLE KEYS */;
INSERT INTO `pms_account_master_main_group`(`account_master_main_group_id`,`main_group_name`,`status`,`default_date`) VALUES
(1,'Share Holder Fund',0,'2019-06-03 06:10:05'),
(2,'Non-Current Liab',0,'2019-10-31 18:30:00'),
(3,'Current Liab',0,'2019-06-03 10:08:32'),
(4,'Non-current assets',0,'2019-06-03 10:08:32'),
(5,'Current assets',0,'2019-06-03 10:08:32'),
(6,'Revenue',0,'2019-06-03 10:08:32'),
(7,'Expenses',0,'2019-06-03 10:08:32');
/*!40000 ALTER TABLE `pms_account_master_main_group` ENABLE KEYS */;

-- 
-- Definition of pms_account_master_sub_group
-- 

DROP TABLE IF EXISTS `pms_account_master_sub_group`;
CREATE TABLE IF NOT EXISTS `pms_account_master_sub_group` (
  `account_master_main_group_id` int(11) NOT NULL,
  `account_master_sub_group_id` int(11) NOT NULL,
  `account_master_sub_group_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_master_main_group_id`,`account_master_sub_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master_sub_group
-- 

/*!40000 ALTER TABLE `pms_account_master_sub_group` DISABLE KEYS */;
INSERT INTO `pms_account_master_sub_group`(`account_master_main_group_id`,`account_master_sub_group_id`,`account_master_sub_group_name`,`status`,`default_date`) VALUES
(1,1,'Share Capital',0,'2019-10-09 18:30:00'),
(1,2,'Reserves and surplus',0,'2019-09-07 00:53:05'),
(1,3,'Money received against share warrants',0,'2019-09-07 00:53:01'),
(1,4,'Share Application Money pending allotment',0,'2019-09-07 00:53:13'),
(2,1,'Long-term borrowings',0,'2019-09-07 00:53:13'),
(2,2,'Deferred tax liabilities (Net)',0,'2019-09-07 00:53:13'),
(2,3,'Other long term liabilities',0,'2019-09-07 00:53:13'),
(2,4,'Long-term provisions',0,'2019-09-07 00:53:13'),
(3,1,'Short-term borrowings',0,'2019-09-07 00:53:13'),
(3,2,'Trade payables / Sundry Creditors',0,'2019-09-07 00:53:13'),
(3,3,'Other current liabilities',0,'2019-09-07 00:53:13'),
(3,4,'Short-term provisions',0,'2019-09-07 00:53:13'),
(4,1,'Tangible assets',0,'2019-09-07 00:53:13'),
(4,2,'Intangible assets',0,'2019-09-07 00:53:13'),
(4,3,'Capital work-in-Progress',0,'2019-09-07 00:53:13'),
(4,4,'Intangible assets under development',0,'2019-09-07 00:53:13'),
(4,5,'Non-current investments',0,'2019-09-07 00:53:13'),
(4,6,'Deferred tax assets (net)',0,'2019-09-07 00:53:13'),
(4,7,'Long-term loans and advances',0,'2019-09-07 00:53:13'),
(4,8,'Other non-current assets',0,'2019-09-07 00:53:13'),
(5,1,'Current investments',0,'2019-09-07 00:53:13'),
(5,2,'Inventories',0,'2019-09-07 00:53:13'),
(5,3,'Trade receivables',0,'2019-09-07 00:53:13'),
(5,4,'Cash and cash equivalents',0,'2019-09-07 00:53:13'),
(5,5,'Short-term loans and advances',0,'2019-09-07 00:53:13'),
(5,6,'Other current assets',0,'2019-09-07 00:53:13'),
(6,1,'Revenue from operations',0,'2019-09-07 00:53:13'),
(6,2,'Other income',0,'2019-09-07 00:53:13'),
(7,1,'Cost of material Consumed',0,'2019-09-07 00:53:13'),
(7,2,'Purchase of stock-in-trade',0,'2019-09-07 00:53:13'),
(7,3,'Employee benefit expenses',0,'2019-09-07 00:53:13'),
(7,4,'Depreciation and amortization expenses',0,'2019-09-07 00:53:13'),
(7,5,'Other expenses',0,'2020-02-21 00:00:00'),
(7,6,'Direct expenses',0,'2019-09-07 00:53:13');
/*!40000 ALTER TABLE `pms_account_master_sub_group` ENABLE KEYS */;

-- 
-- Definition of pms_account_state
-- 

DROP TABLE IF EXISTS `pms_account_state`;
CREATE TABLE IF NOT EXISTS `pms_account_state` (
  `pms_account_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `pms_account_state_name` text NOT NULL,
  `pms_account_state_code` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_account_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_state
-- 

/*!40000 ALTER TABLE `pms_account_state` DISABLE KEYS */;
INSERT INTO `pms_account_state`(`pms_account_state_id`,`pms_account_state_name`,`pms_account_state_code`,`status`,`default_date`) VALUES
(1,'Jammu and Kashmir',1,0,'2019-09-26 04:52:37'),
(2,'Himachal Pradesh',2,0,'2019-09-26 04:52:37'),
(3,'Punjab',3,0,'2019-09-26 04:52:37'),
(4,'Chandigarh',4,0,'2019-09-26 04:52:37'),
(5,'Uttarakhand',5,0,'2019-09-26 04:52:37'),
(6,'Haryana',6,0,'2019-09-26 04:52:37'),
(7,'Delhi',7,0,'2019-09-26 04:52:37'),
(8,'Rajasthan',8,0,'2019-09-26 04:52:37'),
(9,'Uttar Pradesh',9,0,'2019-09-26 04:52:37'),
(10,'Bihar',10,0,'2019-09-26 04:52:37'),
(11,'Sikkim',11,0,'2019-09-26 04:52:37'),
(12,'Arunachal Pradesh',12,0,'2019-09-26 04:52:37'),
(13,'Nagaland',13,0,'2019-09-26 04:52:37'),
(14,'Manipur',14,0,'2019-09-26 04:52:37'),
(15,'Mizoram',15,0,'2019-09-26 04:52:37'),
(16,'Tripura',16,0,'2019-09-26 04:52:37'),
(17,'Meghalaya',17,0,'2019-09-26 04:52:37'),
(18,'Assam',18,0,'2019-09-26 04:52:37'),
(19,'West Bengal',19,0,'2019-09-26 04:52:37'),
(20,'Jharkhand',20,0,'2019-09-26 04:52:37'),
(21,'Odisha',21,0,'2019-09-26 04:52:37'),
(22,'Chhattisgarh',22,0,'2019-09-26 04:52:37'),
(23,'Madhya Pradesh',23,0,'2019-09-26 04:52:37'),
(24,'Gujrat',24,0,'2019-09-26 04:52:37'),
(25,'Daman and Diu',25,0,'2019-09-26 04:52:37'),
(26,'Dadra and Nagar Haveli',26,0,'2019-09-26 04:52:37'),
(27,'Maharastra',27,0,'2019-09-26 04:52:37'),
(29,'Karnataka',29,0,'2019-09-26 04:52:45'),
(30,'Goa',30,0,'2019-09-26 04:52:37'),
(31,'Lakshdweep',31,0,'2019-09-26 04:52:37'),
(32,'Kerala',32,0,'2019-09-26 04:52:37'),
(33,'Tamil Nadu',33,0,'2019-09-26 04:52:37'),
(34,'PuchuCherry',34,0,'2019-09-26 04:52:37'),
(35,'Andaman and Nicobar Islands',35,0,'2019-09-26 04:52:37'),
(36,'Telangana',36,0,'2019-09-26 04:52:37'),
(37,'Andhra Pradesh',37,0,'2019-09-26 04:52:37'),
(97,'Other Territory',97,0,'2019-09-26 04:52:37');
/*!40000 ALTER TABLE `pms_account_state` ENABLE KEYS */;

-- 
-- Definition of pms_ca_tbl
-- 

DROP TABLE IF EXISTS `pms_ca_tbl`;
CREATE TABLE IF NOT EXISTS `pms_ca_tbl` (
  `ca_id` int(11) NOT NULL AUTO_INCREMENT,
  `ca_name` text NOT NULL,
  `ca_code` text NOT NULL,
  `ca_password` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 active , 2 remove',
  `date` date NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_ca_tbl
-- 

/*!40000 ALTER TABLE `pms_ca_tbl` DISABLE KEYS */;
INSERT INTO `pms_ca_tbl`(`ca_id`,`ca_name`,`ca_code`,`ca_password`,`status`,`date`,`default_date`) VALUES
(1,'Mukund Sahay','YYY001','admin!@#',0,'2029-09-25 00:00:00','2019-09-25 11:06:53');
/*!40000 ALTER TABLE `pms_ca_tbl` ENABLE KEYS */;

-- 
-- Definition of pms_company
-- 

DROP TABLE IF EXISTS `pms_company`;
CREATE TABLE IF NOT EXISTS `pms_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_ucid` varchar(6) NOT NULL,
  `company_db` text NOT NULL,
  `company_person_type` text NOT NULL,
  `company_surname` text NOT NULL,
  `company_middle_name` text NOT NULL,
  `company_first_name` text NOT NULL,
  `company_address_one` text NOT NULL,
  `company_address_two` text NOT NULL,
  `company_address_three` text NOT NULL,
  `company_district` text NOT NULL,
  `company_state` text NOT NULL,
  `company_state_code` int(11) NOT NULL,
  `company_country` text NOT NULL,
  `company_pincode` varchar(11) NOT NULL,
  `company_email` text NOT NULL,
  `company_phone_number` int(11) NOT NULL,
  `company_gst_number` text NOT NULL,
  `company_pan_number` text NOT NULL,
  `company_cin_number` text NOT NULL,
  `company_trade_name` text NOT NULL,
  `company_gst_practitioner_ucid` text NOT NULL,
  `company_ca_ucid` varchar(20) NOT NULL,
  `company_financial_year_start` text NOT NULL,
  `company_start_date` date NOT NULL DEFAULT '0000-00-00',
  `company_end_date` date NOT NULL DEFAULT '0000-00-00',
  `company_gst_id` text NOT NULL,
  `company_gst_password` text NOT NULL,
  `company_bank_name` text NOT NULL,
  `company_bank_branch_name` text NOT NULL,
  `company_bank_account_number` text NOT NULL,
  `company_bank_ifsc_code` text NOT NULL,
  `company_primary_sign_name` text NOT NULL,
  `company_primary_sign_designation` text NOT NULL,
  `company_primary_sign_address` text NOT NULL,
  `company_primary_sign_email` text NOT NULL,
  `company_primapry_sign_phone` text NOT NULL,
  `company_secondery_sign_name` text NOT NULL,
  `company_secondery_sign_designation` text NOT NULL,
  `company_secondery_sign_address` text NOT NULL,
  `company_secondery_sign_email` text NOT NULL,
  `company_secondery_sign_phone` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_start_date`,`company_end_date`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA001','pms_test','Company Public Not Interested','GENIAL POLYMERS PRIVATE LIMITED','','','BEHIND PANCH SHIV MANDIR','KANKARBAGH','a','PATNA','10',10,'INDIA','800020','ca.mukund@gmail.com',941889666,'10AAECG649J1ZL','AAECG649J','U2200BR2012PTC018321','123','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','genialpolymers','123','STATE BANK OF INDIA','KANKARBAGH','987234100064388','SBIN0006321','RIPUNAJAY KUMAR','DIRECTOR','LOHIA NAGAR, KANKARBAGH','ca.mukund@outlook.com','8768544332','Neeraj Kumar','MD','patrakar nagar','ca.neerajkumar2012@gmail,com','8006005004','genialpolymers','123','2019-09-06 11:46:47',0),
(2,'AAA002','pms','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA','800001','mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','Mmsp@54321@','2019-09-07 08:53:54',0),
(3,'AAA003','pms','Individual','TIWARY','KUMAR','SUNIL','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,','BY-PASS ROAD','','PATNA','10',10,'INDIA','800027','haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','priyankas9','Mmsp@12334','2019-09-07 09:01:50',0),
(4,'YYY004','db_pms__unitglo_2019_2020','H.U.F.','PVT LTD','SOLUTIONS','UNITGLO','CHINCHAWAD STATION','PIMPARI CHINCHAWAD','HAWELI','PUNE','27',27,'INDIA','414019','',0,'27SFVDSGFJNZ31','SFVDSGFJN','','','','ZZZ001`','2019','0001-01-01 00:00:00','0001-01-01 00:00:00','ZZZ001','unitglo','','','','','','','','','','','','','','','ZZZ001','unitglo','2020-02-20 23:47:11',0);
/*!40000 ALTER TABLE `pms_company` ENABLE KEYS */;

-- 
-- Definition of pms_company_person_type
-- 

DROP TABLE IF EXISTS `pms_company_person_type`;
CREATE TABLE IF NOT EXISTS `pms_company_person_type` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company_person_type
-- 

/*!40000 ALTER TABLE `pms_company_person_type` DISABLE KEYS */;
INSERT INTO `pms_company_person_type`(`person_id`,`person_type_name`,`status`,`default_date`) VALUES
(1,'Individual',0,'2019-10-14 17:35:40'),
(2,'H.U.F.',0,'2019-06-03 10:08:32'),
(3,'Firm',0,'2019-06-03 10:08:32'),
(4,'AOP',0,'2019-06-03 10:08:32'),
(5,'AOP Trust',0,'2019-06-03 10:08:32'),
(6,'Body Of Individual',0,'2019-10-14 17:36:03'),
(7,'Artificial Jurdicial Person',0,'2019-06-03 10:08:32'),
(8,'Cooperative Society',0,'2019-10-14 17:37:25'),
(9,'Company Public Interested',0,'2019-06-03 10:08:32'),
(10,'Company Public Not Interested',0,'2019-06-03 10:08:32'),
(11,'Company Private',0,'2019-06-03 10:08:32'),
(12,'Local Authority',0,'2019-06-03 10:08:32');
/*!40000 ALTER TABLE `pms_company_person_type` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_product_name
-- 

DROP TABLE IF EXISTS `pms_expenses_product_name`;
CREATE TABLE IF NOT EXISTS `pms_expenses_product_name` (
  `auto_incr_id` int(11) NOT NULL AUTO_INCREMENT,
  `expe_product_name` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_incr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_expenses_product_name` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_voucher_dtl
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_dtl`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_dtl` (
  `exp_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_voucherno` varchar(20) NOT NULL,
  `expenses_head` varchar(100) NOT NULL,
  `exp_product_name` varchar(100) NOT NULL,
  `exp_hsn_code` varchar(20) DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `exp_tax_value` varchar(20) NOT NULL,
  `exp_igst_rate` varchar(20) NOT NULL,
  `exp_igst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_cgst_rate` varchar(20) NOT NULL,
  `exp_cgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_sgst_rate` varchar(20) NOT NULL,
  `exp_sgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_total_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_dtl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_voucher_mst
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_mst`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_mst` (
  `exp_voucher_no` int(11) NOT NULL AUTO_INCREMENT,
  `manual_id` int(11) NOT NULL DEFAULT '0',
  `exp_voucher_date` date NOT NULL,
  `exp_place_of_supply` varchar(50) NOT NULL,
  `exp_reverse_charge` varchar(3) NOT NULL,
  `exp_state` varchar(20) NOT NULL,
  `exp_state_code` int(11) NOT NULL DEFAULT '0',
  `exp_supplier_name` varchar(200) NOT NULL,
  `exp_supplier_addr` varchar(1000) NOT NULL,
  `exp_supplier_gstin` varchar(20) NOT NULL,
  `exp_supplier_state` varchar(20) NOT NULL,
  `exp_supplier_state_code` int(11) NOT NULL DEFAULT '0',
  `expenses_head` varchar(100) NOT NULL,
  `total_cost` double(10,2) NOT NULL DEFAULT '0.00',
  `total_gst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_igst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_cgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_sgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `company_name` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `expenses_jv_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_voucher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_dtl
-- 

DROP TABLE IF EXISTS `pms_journal_entry_dtl`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_dtl` (
  `jv_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(50) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `debit_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `credit_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`jv_dtl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'AAA002 ',1,'PURCHASE A/C',5600.22,0,0,0,'2020-03-21 15:21:01'),
(2,'AAA002 ',1,'IGST-OTL A/C',0,600.02,0,0,'2020-03-21 15:21:01'),
(3,'AAA002 ',1,'SALES A/C',0,5000.2,0,0,'2020-03-21 15:21:01'),
(4,'AAA002 ',2,'SALES A/C',1382.08,0,0,0,'2020-03-21 15:36:46'),
(5,'AAA002 ',2,'IGST-OTL A/C',0,148.08,0,0,'2020-03-21 15:36:46'),
(6,'AAA002 ',2,'SALES A/C',0,1234,0,0,'2020-03-21 15:36:46'),
(7,'AAA002 ',3,'PURCHASE A/C',7900,0,0,0,'2020-03-21 15:44:59'),
(8,'AAA002 ',3,'CGST-ITC A/C',474,0,0,0,'2020-03-21 15:44:59'),
(9,'AAA002 ',3,'SGST-ITC A/C',474,0,0,0,'2020-03-21 15:45:00'),
(10,'AAA002 ',3,'DESIGNEX DIGITAL',0,8848,0,0,'2020-03-21 15:45:00'),
(11,'AAA002 ',4,'DESIGNEX DIGITAL',560.25,0,0,0,'2020-03-21 16:24:48'),
(12,'AAA002 ',4,'CGST-OTL A/C',0,30.01,0,0,'2020-03-21 16:24:48'),
(13,'AAA002 ',4,'SGST-OTL A/C',0,30.01,0,0,'2020-03-21 16:24:48'),
(14,'AAA002 ',4,'SALES A/C',0,500.23,0,0,'2020-03-21 16:24:48');
/*!40000 ALTER TABLE `pms_journal_entry_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_mst
-- 

DROP TABLE IF EXISTS `pms_journal_entry_mst`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_mst` (
  `comp_name` varchar(100) NOT NULL,
  `manual_id` int(11) NOT NULL,
  `journal_id` int(11) NOT NULL AUTO_INCREMENT,
  `jv_date` date NOT NULL,
  `dr_total` double(10,2) NOT NULL DEFAULT '0.00',
  `cr_total` double(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(500) NOT NULL,
  `master_id` int(11) NOT NULL DEFAULT '0',
  `master_id_type` text NOT NULL,
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA002',1,1,'2020-03-21 00:00:00',5600.22,5600.22,'',1,'sales',0,0,'2020-03-21 15:21:01'),
('AAA002',2,2,'2020-03-21 00:00:00',1382.08,1382.08,'',2,'sales',0,0,'2020-03-21 15:36:46'),
('AAA002',3,3,'2020-03-21 00:00:00',8848,8848,'',1,'purchase',0,0,'2020-03-21 15:44:59'),
('AAA002',4,4,'2020-03-21 00:00:00',560.25,560.25,'',3,'sales',0,0,'2020-03-21 16:24:48');
/*!40000 ALTER TABLE `pms_journal_entry_mst` ENABLE KEYS */;

-- 
-- Definition of pms_master_setting_all_prefix_series_number
-- 

DROP TABLE IF EXISTS `pms_master_setting_all_prefix_series_number`;
CREATE TABLE IF NOT EXISTS `pms_master_setting_all_prefix_series_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_no` varchar(20) NOT NULL,
  `series_no` varchar(16) DEFAULT '""',
  `count` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(1,'invoice','PMS/1920/',3,0,'2020-03-21 15:03:36'),
(2,'debit','DEBIT/1920/',0,0,'2020-03-21 15:03:37');
/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` ENABLE KEYS */;

-- 
-- Definition of pms_master_settings
-- 

DROP TABLE IF EXISTS `pms_master_settings`;
CREATE TABLE IF NOT EXISTS `pms_master_settings` (
  `master_sett_id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_condition_tax_invoice` varchar(500) NOT NULL,
  `authorized_signatory_tax_invoice` varchar(50) NOT NULL,
  `authorized_signatory_other_voucher` varchar(50) NOT NULL,
  `mrp_details` varchar(3) NOT NULL,
  `mrp_invoice_details` varchar(100) NOT NULL,
  `sale_price_details` varchar(3) NOT NULL,
  `sale_price_details_info` varchar(100) NOT NULL,
  `expiry_monitoring_system` varchar(3) NOT NULL,
  `expiry_monitoring_system_info` date NOT NULL,
  `expiry_details_tax_invoice` varchar(3) NOT NULL,
  `batch_wise_details` varchar(3) NOT NULL,
  `batch_wise_details_info` varchar(500) NOT NULL,
  `batch_wise_details_tax_invoice` varchar(3) NOT NULL,
  `stock_out_method` varchar(30) NOT NULL,
  `stock_valuation_method` text NOT NULL,
  `unit_conversion_method_required` varchar(3) NOT NULL,
  `prefix_generate_invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoiceno` varchar(16) NOT NULL,
  `prefix_generate_debit_no` int(11) NOT NULL DEFAULT '0',
  `debitno` varchar(16) NOT NULL,
  `prefix_generate_credit_no` int(11) NOT NULL DEFAULT '0',
  `creditno` varchar(16) NOT NULL,
  `journal_accounting_entry` varchar(3) NOT NULL,
  `extra_information_tax_invoice` varchar(3) NOT NULL,
  `caption_name1` varchar(100) NOT NULL,
  `currency_sign_before_amount` varchar(3) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`master_sett_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;
INSERT INTO `pms_master_settings`(`master_sett_id`,`terms_condition_tax_invoice`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`,`mrp_details`,`mrp_invoice_details`,`sale_price_details`,`sale_price_details_info`,`expiry_monitoring_system`,`expiry_monitoring_system_info`,`expiry_details_tax_invoice`,`batch_wise_details`,`batch_wise_details_info`,`batch_wise_details_tax_invoice`,`stock_out_method`,`stock_valuation_method`,`unit_conversion_method_required`,`prefix_generate_invoice_no`,`invoiceno`,`prefix_generate_debit_no`,`debitno`,`prefix_generate_credit_no`,`creditno`,`journal_accounting_entry`,`extra_information_tax_invoice`,`caption_name1`,`currency_sign_before_amount`,`status`,`default_date`) VALUES
(1,'abc','MUKUND MOHAN SAHAY','NEERAJ KUMAR','1','','0','','0','0001-01-01 00:00:00','0','0','','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket Price\tAverage Cost Price','0',1,'0',1,'0',1,'0','1','0','','0',0,'2020-03-21 15:03:33');
/*!40000 ALTER TABLE `pms_master_settings` ENABLE KEYS */;

-- 
-- Definition of pms_news_and_update
-- 

DROP TABLE IF EXISTS `pms_news_and_update`;
CREATE TABLE IF NOT EXISTS `pms_news_and_update` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `pms_news_title` text NOT NULL,
  `pms_news_description` text NOT NULL,
  `pms_news_validate_from_date` date NOT NULL DEFAULT '0000-00-00',
  `pms_news_validate_to_date` date NOT NULL DEFAULT '0000-00-00',
  `pms_news_in_out_app` int(11) NOT NULL DEFAULT '0',
  `pms_news_outapp_link` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_news_and_update
-- 

/*!40000 ALTER TABLE `pms_news_and_update` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_news_and_update` ENABLE KEYS */;

-- 
-- Definition of pms_notification_table
-- 

DROP TABLE IF EXISTS `pms_notification_table`;
CREATE TABLE IF NOT EXISTS `pms_notification_table` (
  `notif_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_ucid` text NOT NULL,
  `ca_ucid` text NOT NULL,
  `notif_file_link` text NOT NULL,
  `notif_backupfile_link` text NOT NULL,
  `notif_gst_status` int(11) NOT NULL DEFAULT '1' COMMENT '1-gst created and 2-gst filed',
  `notif_data_load_status` int(11) NOT NULL DEFAULT '1' COMMENT '1-load data and 2-send to company',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notif_auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_notification_table
-- 

/*!40000 ALTER TABLE `pms_notification_table` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_notification_table` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice_dtl` (
  `pur_dtl_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `invoice_no` varchar(16) NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax_val` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_rate` int(11) NOT NULL,
  `igst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_rate` int(11) NOT NULL,
  `cgst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `sgst_rate` int(11) NOT NULL,
  `sgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `invoice_type` varchar(20) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pur_dtl_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'1','WRITING PAPER ECO BRITE PLUS 54 GSM 89 CM ','4782','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,8000,100,7900,0,0,6,474,6,474,0,0,'purchase','2020-03-21 15:43:54');
/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice_mst
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice_mst`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice_mst` (
  `pur_mst_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
  `invoice_irn_no` text NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `reverse_charge` varchar(5) DEFAULT NULL,
  `i_state` varchar(50) DEFAULT NULL,
  `statecode` int(9) DEFAULT NULL,
  `seller_name` varchar(100) NOT NULL,
  `Seller_address` varchar(100) DEFAULT NULL,
  `gstin` varchar(50) DEFAULT NULL,
  `s_state` varchar(50) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `total_cost` double(10,2) NOT NULL DEFAULT '0.00',
  `total_gst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_igst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_cgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_sgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `payment_mode` varchar(50) NOT NULL DEFAULT '',
  `payment_status` varchar(50) NOT NULL DEFAULT '',
  `invoice_type` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `purchase_journal_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 default, 1 Data Send to CA,2 CA Edit, 3 Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pur_mst_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_irn_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`purchase_journal_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'1','','2020-03-21 00:00:00','NO','10',10,'MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10',8848,948,0,474,474,100,'Cash','Paid','purchase','',3,0,0,'2020-03-21 15:43:54');
/*!40000 ALTER TABLE `pms_purchase_invoice_mst` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_dtl` (
  `sale_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `invoice_no` varchar(16) NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `qty` int(100) NOT NULL DEFAULT '0',
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax_val` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_rate` double NOT NULL DEFAULT '0',
  `igst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_rate` double NOT NULL DEFAULT '0',
  `cgst_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `sgst_rate` double NOT NULL DEFAULT '0',
  `sgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0',
  `invoice_type` varchar(20) NOT NULL DEFAULT 'sales',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_dtl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'PMS/1920/','100 GSM 585X910 COATED PAPER GLOSS','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,12,5000.2,0,5000.2,12,600.02,0,0,0,0,0,0,'sales','2020-03-21 15:20:50'),
(2,2,'PMS/1920/','115 GSM COATED PAPER GLOSS 585X910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,12,1234,0,1234,12,148.08,0,0,0,0,0,0,'sales','2020-03-21 15:22:30'),
(3,3,'PMS/1920/','115 GSM COATED PAPER GLOSS 585X910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,12,500.22,0,500.22,0,0,6,30.01,6,30.01,0,0,'sales','2020-03-21 16:24:24');
/*!40000 ALTER TABLE `pms_sale_invoice_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_mst
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_mst`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_mst` (
  `sale_mst_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
  `invoice_irn_no` text NOT NULL,
  `sale_invoice_type` text NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `reverse_charge` varchar(5) DEFAULT NULL,
  `i_state` varchar(50) DEFAULT NULL,
  `statecode` int(9) DEFAULT NULL,
  `transport_mode` varchar(20) NOT NULL,
  `vehicle_no` varchar(20) NOT NULL,
  `date_of_supply` date NOT NULL,
  `place_of_supply` varchar(100) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `Seller_address` varchar(100) DEFAULT NULL,
  `gstin` varchar(50) DEFAULT NULL,
  `s_state` varchar(50) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `ship_party_name` varchar(50) NOT NULL,
  `ship_party_address` varchar(100) NOT NULL,
  `ship_party_gstin` varchar(20) NOT NULL,
  `ship_party_state` varchar(20) NOT NULL,
  `ship_party_state_code` int(11) DEFAULT '0',
  `total_cost` double(10,2) NOT NULL DEFAULT '0.00',
  `total_gst` varchar(20) NOT NULL,
  `total_igst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_cgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_sgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `bank_ac_no` varchar(50) NOT NULL DEFAULT '',
  `bank_ifsc_code` varchar(50) NOT NULL DEFAULT '',
  `company_name` varchar(100) NOT NULL,
  `terms_and_condition` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `invoice_type` varchar(50) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `sale_jv_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'PMS/1920/1','','Regular','2020-03-21 00:00:00','NO','10',10,'','','2020-03-21 00:00:00','','PURCHASE A/C','','','','','PURCHASE A/C','','','',0,5600.22,'600.02',600.02,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','abc','MUKUND MOHAN SAHAY','Cash','Paid','','',1,0,0,'2020-03-21 15:20:46'),
(2,'PMS/1920/2','','Regular','2020-03-21 00:00:00','NO','10',10,'','','2020-03-21 00:00:00','','SALES A/C','','','','','SALES A/C','','','',0,1382.08,'148.08',148.08,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','abc','MUKUND MOHAN SAHAY','Cash','Paid','','',2,0,0,'2020-03-21 15:22:30'),
(3,'PMS/1920/3','','Regular','2020-03-21 00:00:00','NO','10',10,'','','2020-03-21 00:00:00','','MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10','PRADEEP KUMAR','KANKARBAGH','10AKTPK0647A1ZN','Bihar',10,560.25,'0.00',0,30.01,30.01,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','abc','MUKUND MOHAN SAHAY','Cash','Paid','','',4,0,0,'2020-03-21 16:24:24');
/*!40000 ALTER TABLE `pms_sale_invoice_mst` ENABLE KEYS */;

-- 
-- Definition of pms_stock
-- 

DROP TABLE IF EXISTS `pms_stock`;
CREATE TABLE IF NOT EXISTS `pms_stock` (
  `pms_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_nature_of_opration` text NOT NULL,
  `stock_group` text NOT NULL,
  `stock_product_name` text NOT NULL,
  `stock_unit_of_measurment` text NOT NULL,
  `stock_pri_unit_of_measurment` text NOT NULL,
  `stock_sec_unit_of_measurement` varchar(50) NOT NULL,
  `stock_conversion_factor` varchar(50) NOT NULL,
  `stock_chk_default_id` int(11) NOT NULL DEFAULT '0' COMMENT '0-primary uom, 1-secondary uom',
  `stock_hsn_sac_code` varchar(20) NOT NULL,
  `stock_gst_rate` text NOT NULL,
  `stock_mrp` varchar(50) NOT NULL,
  `stock_sale_price_without_gst` varchar(50) NOT NULL,
  `stock_expiry_date` date DEFAULT NULL,
  `stock_batch` varchar(50) NOT NULL,
  `stock_opening_qty` double NOT NULL DEFAULT '0',
  `stock_purc_price_per_unit` double NOT NULL DEFAULT '0',
  `stock_opening_amt` double NOT NULL DEFAULT '0',
  `stock_reorder_level` text NOT NULL,
  `stock_reorder_quantity` text NOT NULL,
  `stock_minimum_stock_reminder` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(1,'1','2','COATED BOARD 300 GSM 584 X 910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0125470514429109',0,'4802','12','500','425','2022-10-01 00:00:00','',4782,52.13,249271.6,'0','0','0',0,'2020-02-28 09:21:16'),
(2,'1','2','COATED PAPER 100 GSM 584X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.037593984962406',0,'4802','12','','','2022-10-01 00:00:00','',4681.6,53.87,252208,'','','',0,'2019-12-25 16:31:41'),
(3,'1','2','COATED PAPER 118 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0436681222707424',0,'4802','12','','','2022-10-01 00:00:00','',4946.4,53.21,263196,'','','',0,'2019-12-25 16:32:04'),
(4,'1','2','COATED PAPER 128 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','','','2022-10-01 00:00:00','',2635.68,93.35,246044.2,'','','',0,'2019-12-25 16:32:32'),
(5,'1','2','COATED PAPER 90 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','','','2022-10-01 00:00:00','',5581.44,49.56,276592.32,'5581.44','49.56','',0,'2019-12-10 06:42:14'),
(6,'1','2','COATED PAPER 90 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0418410041841004',0,'4802','12','','','2022-10-01 00:00:00','',12093.12,67.43,815396.21,'0','0','0',0,'2019-12-10 06:36:46'),
(7,'1','2','COATED PAPER 80 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0645161290322581',0,'4802','12','','','2021-10-01 00:00:00','',6046.56,45.1,272681.76,'','','',0,'2019-12-10 06:47:25'),
(8,'1','2','COATED PAPER 80 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','','2022-10-01 00:00:00','',13100.88,62.33,816547.16,'','','',0,'2019-12-10 06:45:53'),
(9,'1','3','100 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0375685626267939',0,'4802','12','','','0001-01-01 00:00:00','',5163.89,52.58,271518.82,'5163','52','',0,'2019-12-25 16:33:18'),
(10,'1','3','115 GSM COATED PAPER GLOSS 585X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0326690623979092',0,'4802','12','','','0001-01-01 00:00:00','',4744.55,52.57,249407.71,'474','52','',0,'2019-12-25 16:33:39'),
(11,'1','3','120 GSM 510X760 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.042999656002752',0,'4802','12','','','0001-01-01 00:00:00','',3581.42,52.89,189420,'3581','52','',0,'2019-12-25 16:34:00'),
(12,'1','3','120 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0313087038196619',0,'4802','12','','','0001-01-01 00:00:00','',2874.6,52.57,151131.15,'2874','52','',0,'2019-12-25 16:34:32'),
(13,'1','3','COATED ART PAPER GLOSS 128 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403128275417238',0,'4802','12','','','0001-01-01 00:00:00','',4762.75,52.89,251904,'4762','52','',0,'2020-03-05 06:48:41'),
(14,'1','3','128 GSM COATED PAPER GLOSS 58.5X91','PAC-PACKS','PAC-PACKS','KGS','17.035',0,'4802','12','','','0001-01-01 00:00:00','',33,901,29733,'33','901','',0,'2019-12-25 16:35:15'),
(15,'1','3','150 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.025046335721084',0,'4802','12','','','0001-01-01 00:00:00','',2754.89,52.89,145705.92,'2754.89','52','',0,'2019-12-25 16:35:31'),
(16,'1','3','170 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0220994475138122',0,'4802','12','','','0001-01-01 00:00:00','',769.25,52.89,40685.59,'769.25','52','',0,'2019-12-25 17:01:41'),
(17,'1','3','80 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','','','0001-01-01 00:00:00','',4216.21,56.52,238306.16,'','56.52','',0,'2019-12-25 16:36:02'),
(18,'1','3','90 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','','','0001-01-01 00:00:00','',10444.82,54.56,569885.31,'','54','',0,'2019-12-25 16:35:46'),
(19,'1','4','UNCOATED WOODFREE PAPER 120 GSM 58.5X91','PAC-PACKS','PAC-PACKS','KGS','15.97',0,'4802','12','','','0001-01-01 00:00:00','',183,879.34,160919.22,'','879.34','',0,'2019-12-25 17:02:53'),
(20,'1','4','UNCOATED WOODFREE PAPER 70 GSM 51X 76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0737136960047177',0,'4802','12','','','0001-01-01 00:00:00','',596.9,55.06,32866.24,'','55.06155134863461','',0,'2019-12-25 17:03:09'),
(21,'1','4','UNCOATED WOODFREE PAPER 70 GSM  58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0536711034778875',0,'4802','12','','','0001-01-01 00:00:00','',1378.77,55.06,75916.6,'','55.06110518795739','',0,'2019-12-25 17:03:32'),
(22,'1','4','UNCOATED WOODFREE PAPER 80 GSM 51 X76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.064499484004128',0,'4802','12','','','0001-01-01 00:00:00','',2790.72,55.06,153660.6,'','55','',0,'2019-12-25 17:03:49'),
(23,'1','4','UNCOATED WOODFREE PAPER 80 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','','','0001-01-01 00:00:00','',1192.46,55.06,65658.32,'','55.06123475839861','',0,'2019-12-25 17:04:05'),
(24,'1','4','UNCOATED WOODFREE PAPER 90 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','','','0001-01-01 00:00:00','',958.24,55.06,52762,'','55.06136249791284','',0,'2019-12-25 17:04:21'),
(25,'1','5','W.PAPER','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0588235294117647',0,'4802','12','','','0001-01-01 00:00:00','',17,2979.42,50650.2,'','2979.4235294117643','',0,'2019-12-25 17:05:00'),
(26,'1','1','HARD DISK','BOX-BOX','BOX-BOX','','',0,'','','','0','0001-01-01 00:00:00','',0,0,0,'0','0','0',2,'2020-01-11 18:50:52'),
(27,'1','6','WRITING PAPER-OPTIMA 58 GSM 45X55/7.2','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.13889',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-01-13 11:46:40'),
(28,'1','6','WRITING PAPER-OPTIMA 64 GSM 58.5X91/17 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','.058823529',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-12 14:09:15'),
(29,'1','6','WRITING PAPER-OPTIMA 70 GSM 58.5X91/18.6 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','.053763441',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-12 14:12:14'),
(30,'2','1','BANK CHARGES','','','','',0,'99','18','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-17 17:51:20'),
(31,'1','6','WRITING PAPER-OPTIMA 80 GSM58.5X91/21.3 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 09:26:19'),
(32,'1','6','WRITING PAPER (GRAPHICA)45X55/7.2 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.138888888888889',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 19:44:20'),
(33,'1','6','WRITING PAPER(GRAPHICA)58.5X91/17 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0588235294117647',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 19:45:19'),
(34,'1','6','WRITING PAPER(GRAPHICA)58.5X91/18.6 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.053763440860215',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 19:46:09'),
(35,'1','6','WRITING PAPER (GRAPHICA)58.5X91/21.3 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 19:46:56'),
(36,'1','6','WRITING PAPER(GRAPHICA)51X76/15.5 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0645161290322581',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-19 19:47:47'),
(37,'1','6','WRITING PAPER -OPTIMA 58 GSM 86CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4802','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 08:11:46'),
(38,'1','6','WRITING PAPER- OPTIMA 58GSM 74CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','2019-06-22 00:00:00','0.00',0,58.49,0,'0.00','0.00','0.00',0,'2020-02-22 08:23:12'),
(39,'1','6','WRITING PAPER -OPTIMA 58 GSM 89CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 08:35:56'),
(40,'1','6','WRITING PAPER -OPTIMA 58GSM 72CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 08:42:12'),
(41,'1','6','WRITING PAPER-GRAFIKA 58 GSM 58.5*91/15.4KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.06493506493',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 08:52:55'),
(42,'1','1','BOARD 250 GSM 51*76 CM 9.7 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 11:02:46'),
(43,'1','1','BOARD OPTICA WHITE 285 GSM 51*76/11 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 11:06:18'),
(44,'1','1','BOARD 230 GSM 58.5*91 CM 12.2 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 18:03:53'),
(45,'1','1','BOARD 250 GSM 58.5*91 CM 13.3 KG','PAC-PACKS','PAC-PACKS','','',0,'','','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 10:52:32'),
(46,'1','6','WRITING PAPER -GRAFIKA 70GSM 51*76/13.6KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.073529412',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 11:24:18'),
(47,'1','1','BOARD 320 GSM 58.5*91 CM 17 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 08:27:39'),
(48,'1','1','BOARD 285 GSM 58.5*91 CM 17 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-22 11:24:31'),
(49,'1','6','WRITING PAPER ECO BRITE PLUS 54 GSM 72 CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-23 08:03:14'),
(50,'1','6','WRITING PAPER ECO BRITE PLUS 54 GSM 89 CM ','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-23 08:06:45'),
(51,'1','6','WRITING PAPER-OPTIMA 58 GSM 86CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4802','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-24 09:03:23'),
(52,'1','6','WRITING PAPER -OPTTIMA 58 GSM 58.5*91/15.4KG','REAM','KGS-KILOGRAMS','REAM','',1,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',2,'2020-02-25 08:31:03'),
(53,'1','6','WRITING PAPER -OPTIMA 58 GSM 58.5*91/15.4KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.064935',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 10:28:10'),
(54,'1','6','BOARD 230 GSM 51*76 CM 8.9 KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 10:42:15'),
(55,'1','6','BOARD 250 GSM 51*76CM 9.7KG ','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 10:45:01'),
(56,'1','6','BOARD 285 GSM 58.5*91CM 15.2 KG ','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 10:48:55'),
(57,'1','6','BOARD OPTIC WHITE 350 GSM 58.5*91/18.6KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:04:19'),
(58,'1','6','BOARD 250 GSM 63.*91.0/14.4KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:13:55'),
(59,'1','6','BOARD 285 GSM 63.5 *91.0/16.5KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:15:53'),
(60,'1','6','BOARD 285 GSM 66*96/18.1KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:17:53'),
(61,'1','6','WRITING PAPER GRAFIKA 64 GSM 89 CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-05 07:20:16'),
(62,'1','6','WRITING PAPER GRAFIKA 60 GSM 585*91/16KG ','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.0625',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:34:58'),
(63,'1','7','COATED PAPER-GLOSS 90 GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0416666667',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:39:53'),
(64,'1','7','COATED ART PAPER GLOSS 100GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.03759398',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 11:53:19'),
(65,'1','7','COATED ART PAPER GLOSS-118GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','31.40',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-05 06:22:24'),
(66,'1','7','COATED ART PAPER GLOSS 128 GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','34.10',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:21:48'),
(67,'1','1','COATED ART PAPER   148GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','39.40',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:23:39'),
(68,'1','7','COATED ART PAPER GLOSS 170GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','45.20',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:25:40'),
(69,'1','7','COATED ART PAPER GLOSS 148 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','32.90',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:27:01'),
(70,'1','7','COATED ART PAPER GLOSS 170 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','32.80',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:28:37'),
(71,'1','7','COATED ART PAPER GLOSS 200GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','53.20',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:29:54'),
(72,'1','7','COATED ART PAPER GLOSS 218 GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:32:53'),
(73,'1','7','COATED ART PAPER GLOSS 250 GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-25 12:32:23'),
(74,'1','1','WRITING PAPER GRAPHICA 58 GSM 45*55.5/7.2','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.1388888',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 17:58:47'),
(75,'1','1','WRITING PAPER GRAFIKA 68 GSM 58.5*91/18.1','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.055524',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 18:08:58'),
(76,'1','1','WRITING PAPER GRAFIKA 78 GSM 45.5*66/11.7','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.08546',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 18:10:24'),
(77,'1','1','WRITING PAPER GRAFIKA 90 GSM 58.5*91/24','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.038',0,'','','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-02-26 18:11:23'),
(78,'1','1','WRITING PAPER GRAFIKA 90 GSM 58.5*91/24','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-02 09:33:23'),
(79,'1','7','COATED ART PAPER-GLOSS 113GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0333',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-02 09:00:27'),
(80,'1','1','WRITING PAPER GRAPHICA 68 GSM 51*76/13.2 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.1388',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-02 09:01:28'),
(81,'1','7','COATED ART PAPER GLOSSS 300GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-02 09:35:29'),
(82,'1','7','COATED ART PAPER GLOSS 100 GSM 585X910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.037593984962406',0,'4802','12','2000','1990','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-04 07:37:48'),
(83,'1','6','WRITING PAPER GRAFIKA 64 GSM 64CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-03-05 09:34:17');
/*!40000 ALTER TABLE `pms_stock` ENABLE KEYS */;

-- 
-- Definition of pms_stock_addgroup
-- 

DROP TABLE IF EXISTS `pms_stock_addgroup`;
CREATE TABLE IF NOT EXISTS `pms_stock_addgroup` (
  `stock_nature_of_opration_id` int(11) NOT NULL,
  `stock_group_id` int(11) NOT NULL,
  `stock_group_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_nature_of_opration_id`,`stock_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock_addgroup
-- 

/*!40000 ALTER TABLE `pms_stock_addgroup` DISABLE KEYS */;
INSERT INTO `pms_stock_addgroup`(`stock_nature_of_opration_id`,`stock_group_id`,`stock_group_name`,`status`,`default_date`) VALUES
(1,1,'Goods',0,'2019-09-09 06:42:19'),
(2,1,'Service',0,'2020-02-21 00:00:00');
/*!40000 ALTER TABLE `pms_stock_addgroup` ENABLE KEYS */;

-- 
-- Definition of pms_stock_nature_of_opration
-- 

DROP TABLE IF EXISTS `pms_stock_nature_of_opration`;
CREATE TABLE IF NOT EXISTS `pms_stock_nature_of_opration` (
  `stock_nature_of_opration_id` int(11) NOT NULL AUTO_INCREMENT,
  `nature_of_opration_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_nature_of_opration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock_nature_of_opration
-- 

/*!40000 ALTER TABLE `pms_stock_nature_of_opration` DISABLE KEYS */;
INSERT INTO `pms_stock_nature_of_opration`(`stock_nature_of_opration_id`,`nature_of_opration_name`,`status`,`default_date`) VALUES
(1,'Goods',0,'2019-09-09 06:41:04'),
(2,'Service',0,'2019-09-09 06:41:13');
/*!40000 ALTER TABLE `pms_stock_nature_of_opration` ENABLE KEYS */;

-- 
-- Definition of pms_unit_of_measuremt
-- 

DROP TABLE IF EXISTS `pms_unit_of_measuremt`;
CREATE TABLE IF NOT EXISTS `pms_unit_of_measuremt` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_unitof_measuremt_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_unit_of_measuremt
-- 

/*!40000 ALTER TABLE `pms_unit_of_measuremt` DISABLE KEYS */;
INSERT INTO `pms_unit_of_measuremt`(`unit_id`,`unit_unitof_measuremt_name`,`status`,`default_date`) VALUES
(1,'BAG-BAGS',0,'2019-06-03 10:08:32'),
(2,'BAL-BALE',0,'2019-06-03 10:08:32'),
(3,'BDL-BUNDLES',0,'2019-06-03 10:08:32'),
(4,'BKL-BUCKLES',0,'2019-06-03 10:08:32'),
(5,'BOU-BILLION OF UNITS',0,'2019-06-03 10:08:32'),
(6,'BOX-BOX',0,'2019-06-03 10:08:32'),
(7,'BTL-BOTTLES',0,'2019-06-03 10:08:32'),
(8,'BUN-BUNCHES',0,'2019-06-03 10:08:32'),
(9,'CAN-CANS',0,'2019-06-03 10:08:32'),
(10,'CBM-CUBIC METERS',0,'2019-06-03 10:08:32'),
(11,'CCM-CUBIC CENTIMETERS',0,'2019-06-03 10:08:32'),
(12,'CMS-CENTIMETERS',0,'2019-06-03 10:08:32'),
(13,'CTN-CARTONS',0,'2019-06-03 10:08:32'),
(14,'DOZ-DOZENS',0,'2019-06-03 10:08:32'),
(15,'DRM-DRUMS',0,'2019-06-03 10:08:32'),
(16,'GGK-GREAT GROSS',0,'2019-06-03 10:08:32'),
(17,'GMS-GRAMMES',0,'2019-06-03 10:08:32'),
(18,'GRS-GROSS',0,'2019-06-03 10:08:32'),
(19,'GYD-GROSS YARDS',0,'2019-06-03 10:08:32'),
(20,'KGS-KILOGRAMS',0,'2019-06-03 10:08:32'),
(21,'KLR-KILOLITRE',0,'2019-06-03 10:08:32'),
(22,'KME-KILOMETRE',0,'2019-06-03 10:08:32'),
(23,'MLT-MILILITRE',0,'2019-06-03 10:08:32'),
(24,'MTR-METERS',0,'2019-06-03 10:08:32'),
(25,'MTS-METRIC TON',0,'2019-06-03 10:08:32'),
(26,'NOS-NUMBERS',0,'2019-06-03 10:08:32'),
(27,'PAC-PACKS',0,'2019-06-03 10:08:32'),
(28,'PCS-PIECES',0,'2019-06-03 10:08:32'),
(29,'PRS-PAIRS',0,'2019-06-03 10:08:32'),
(30,'QTL-QUINTAL',0,'2019-06-03 10:08:32'),
(31,'ROL-ROLLS',0,'2019-06-03 10:08:32'),
(32,'SET-SETS',0,'2019-06-03 10:08:32'),
(33,'SQF-SQUARE FEET',0,'2019-06-03 10:08:32'),
(34,'SQM-SQUARE METERS',0,'2019-06-03 10:08:32'),
(35,'SQY-SQUARE YARDS',0,'2019-06-03 10:08:32'),
(36,'TBS-TABLETS',0,'2019-06-03 10:08:32'),
(37,'TGM-TEN GROSS',0,'2019-06-03 10:08:32'),
(38,'THD-THOUSANDS',0,'2019-06-03 10:08:32'),
(39,'TON-TONNES',0,'2019-06-03 10:08:32'),
(40,'TUB-TUBES',0,'2019-06-03 10:08:32'),
(41,'UGS-US GALLONS',0,'2019-06-03 10:08:32'),
(42,'UNT-UNITS',0,'2019-06-03 10:08:32'),
(43,'YDS-YARDS',0,'2019-06-03 10:08:32'),
(44,'OTH-OTHERS',0,'2019-06-03 10:08:32');
/*!40000 ALTER TABLE `pms_unit_of_measuremt` ENABLE KEYS */;

-- 
-- Definition of pms_voucher_dr_cr_note_dtl
-- 

DROP TABLE IF EXISTS `pms_voucher_dr_cr_note_dtl`;
CREATE TABLE IF NOT EXISTS `pms_voucher_dr_cr_note_dtl` (
  `dtl_dr_cr_id` int(11) NOT NULL AUTO_INCREMENT,
  `refrance_id` int(11) NOT NULL,
  `document_no` varchar(16) NOT NULL,
  `againt_invoice` varchar(16) NOT NULL,
  `bill_party_name` varchar(50) NOT NULL,
  `ship_party_name` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(20) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL DEFAULT '0001-01-01',
  `quantity` int(11) NOT NULL,
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax_value` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_rate` double(10,2) NOT NULL DEFAULT '0.00',
  `igst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_rate` double(10,2) NOT NULL DEFAULT '0.00',
  `cgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `sgst_rate` double(10,2) NOT NULL DEFAULT '0.00',
  `sgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dtl_dr_cr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_voucher_dr_cr_note_mst
-- 

DROP TABLE IF EXISTS `pms_voucher_dr_cr_note_mst`;
CREATE TABLE IF NOT EXISTS `pms_voucher_dr_cr_note_mst` (
  `dr_cr_Id` int(11) NOT NULL AUTO_INCREMENT,
  `document_no` varchar(16) NOT NULL,
  `date_of_issue` date NOT NULL DEFAULT '0001-01-01',
  `doc_state` varchar(20) NOT NULL,
  `doc_state_code` int(11) NOT NULL DEFAULT '0',
  `against_invoice` varchar(16) NOT NULL,
  `date_of_invoice` date NOT NULL DEFAULT '0001-01-01',
  `bill_party_name` varchar(50) NOT NULL,
  `bill_party_address` varchar(100) NOT NULL,
  `bill_party_gstin` varchar(20) NOT NULL,
  `bill_party_state` varchar(30) NOT NULL,
  `bill_party_state_code` int(11) NOT NULL,
  `ship_party_name` varchar(50) NOT NULL,
  `ship_party_address` varchar(100) NOT NULL,
  `ship_party_gstin` varchar(20) NOT NULL,
  `ship_party_state` varchar(30) NOT NULL,
  `ship_party_code` int(11) NOT NULL DEFAULT '0',
  `total_cost` double(10,2) NOT NULL DEFAULT '0.00',
  `total_gst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_igst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_cgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_sgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `note_type` varchar(15) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `dr_cr_jv_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dr_cr_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-03-21 16:55:11
-- Total time: 0:0:0:1:787 (d:h:m:s:ms)
