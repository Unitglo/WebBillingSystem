-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-02-06 18:20:00
-- --------------------------------------
-- Server version 5.7.28 MySQL Community Server (GPL)


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `account_state_code` text NOT NULL,
  `account_country` text NOT NULL,
  `account_pin_code` varchar(10) NOT NULL,
  `account_gst_number` text NOT NULL,
  `account_pan_number` text NOT NULL,
  `account_cin_number` text NOT NULL,
  `account_phone_number` text NOT NULL,
  `account_email` text NOT NULL,
  `account_opening_balance` double(10,2) NOT NULL,
  `account_opening_balance_type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE A/C','7','2','PURCHASE A/C','Yes','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(2,'ACCOUNTANCY CHARGE PAYABLE','3','3','ACCOUNTANCY CHARGE PAYABLE','No','','','','0','','','0','','','','','',12000,'Credit',0,'2019-12-02 10:53:22'),
(3,'SALES A/C','6','1','SALES A/C','Yes','','','','0','','','0','','','1','','',0,'Credit',0,'2019-12-02 10:53:22'),
(4,'AIR CONDITION & STEBLIZER','4','1','AIR CONDITION & STEBLIZER','No','','','','0','','','0','','','','','',45421,'Debit',0,'2019-12-02 10:53:22'),
(5,'CGST-ITC A/C','5','6','CGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(6,'IGST-ITC A/C','5','6','IGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(7,'SGST-ITC A/C','5','6','SGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(8,'AMRIT ENTERPRISES','5','3','RENU PANDIT','No','COLLEGE ROAD','MUNGER','MUNGER','10','10','INDIA','','10AKOPP5113H1ZE','AKOPP5113H','','','',951984,'Debit',0,'2019-12-02 19:35:33'),
(9,'AUDIT FEE PAYABLE','3','3','AUDIT FEE PAYABLE','No','','','','0','','','','','','','','',11000,'Credit',0,'2019-12-02 20:04:30'),
(10,'AUTO ACE','4','1','AUTO ACE','No','','','','0','','','','','','','','',78220,'Debit',0,'2019-12-02 20:06:09'),
(11,'AXIS BANK  A/C NO.916020025351806','5','4','AXIS BANK  A/C NO.916020025351806','No','','','','0','','','','','','','','',14355.45,'Debit',0,'2019-12-02 20:07:42'),
(12,'AXIS BANK LTD (OD AC-917030074838374)','3','1','AXIS BANK LTD (OD AC-917030074838374)','No','','','','0','','','','','','','','',296723,'Credit',0,'2019-12-02 20:09:41'),
(13,'BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','3','1','BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','','','','','0','','','','','','','','',1101867,'Credit',0,'2019-12-02 20:10:49'),
(14,'CASH A/C','5','4','CASH A/C','No','','','','0','','','','','','','','',56896.34,'Debit',0,'2019-12-02 20:11:52'),
(15,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','3','1','CENTRAL BANK OF INDIA CC-A/C NO.3170157625','No','','','','0','','','','','','','','',427750.08,'Credit',0,'2019-12-02 20:28:49'),
(16,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543','5','4','CENTRAL BANK OF INDIA S/B A/C NO.3307952543','No','','','','0','','','','','','','','',1942.29,'Debit',0,'2019-12-02 20:29:51'),
(17,'CUSTOM DUTY RECEIABLE','5','6','CUSTOM DUTY RECEIABLE','No','','','','0','','','','','','','','',195906,'Debit',0,'2019-12-02 20:30:51'),
(18,'DESIGNEX DIGITAL','5','3','MADHU KANT PRASAD','No','1 ST FLOOR, LALSLION BUILDING,','OPP GOLDEN ICE CREAM FACTORY, EXHIBITION ROAD,','PATNA','10','10','INDIA','800001','10AMSPP5547M1ZH','AMSPP5547M','','','',629616,'Debit',0,'2019-12-02 20:35:55'),
(19,'EQUIPMENT','4','1','EQUIPMENT','No','','','','0','','','','','','','','',3586,'Debit',0,'2019-12-02 20:36:58'),
(20,'EXCEL ENTERPRISES','5','3','EXCEL ENTERPRISES','No','KADAMKUAN','','PATNA','10','10','INDIA','800003','10AADFE9983D1ZK','AADFE9983D','','','',320912,'Debit',0,'2019-12-02 20:40:04'),
(21,'EXCESS GST PAID','5','6','EXCESS GST PAID','No','','','','0','','','','','','','','',553673.83,'Debit',0,'2019-12-02 20:40:55'),
(22,'EXCESS INPUT VAT','5','6','EXCESS INPUT VAT','No','','','','0','','','','','','','','',102742.37,'Debit',0,'2019-12-02 20:41:57'),
(23,'FURNITURE & FIXTURE','5','1','FURNITURE & FIXTURE','No','','','','0','','','','','','','','',9976,'Debit',0,'2019-12-02 20:42:52'),
(24,'GOLD EAST TRADING(HONG KONG) COMPANY','3','2','GOLD EAST TRADING(HONG KONG) COMPANY','No','','','','0','','HONG KONG','','','','','','',750084.2,'Credit',0,'2019-12-02 20:55:05'),
(25,'HDFC BANK  LTD. (A/C NO- 50200026260502)','5','4','HDFC BANK  LTD. (A/C NO- 50200026260502)','No','','','','0','','','','','','','','',552,'Debit',0,'2019-12-02 20:56:24'),
(26,'INCOME TAX ADV.','5','6','INCOME TAX ADV.','No','','','','0','','','','','','','','',10000,'Debit',0,'2019-12-02 20:57:26'),
(27,'INDICA CAR','4','1','INDICA CAR','No','','','','0','','','','','','','','',66268,'Debit',0,'2019-12-02 20:58:36'),
(28,'MAGMA FINCORP LTD.','3','1','MAGMA FINCORP LTD.','No','','','','0','','','','','','','','',133484,'Credit',0,'2019-12-02 20:59:55'),
(29,'MANGALAM PAPERS & CARDS','5','3','MANGALAM PAPERS & CARDS','No','AMBEDKAR MARKET COMPLEX','DAKBUNGLOW','GAYA','10','10','','823001','10AEGPV7460M1Z4','AEGPV7460M','','','',114624,'Debit',0,'2019-12-02 21:02:53'),
(30,'MOBILE PHONE','4','1','MOBILE PHONE','No','','','','0','','','','','','','','',14365,'Debit',0,'2019-12-02 21:09:44'),
(31,'NATIONAL PAPER HOUSE','5','3','NATIONAL PAPER HOUSE','No','KADAMKUAN','','PATNA','10','10','INDIA','800003','10AACFN4095Q1Z0','AACFN4095Q','','','',210575,'Debit',0,'2019-12-02 21:12:59'),
(32,'OFFICE RENT PAYABLE','3','3','OFFICE RENT PAYABLE','No','','','','0','','','','','','','','',12000,'Credit',0,'2019-12-02 21:14:45'),
(33,'ORIENT LINKS CO.(L.L.C)','3','2','ORIENT LINKS CO.(L.L.C)','No','THE ATRIUM CENTER, OFFICE NO 609,','KHALIDBIN WALLED ROAD, PO BOX NO 52708,','','0','','DUBAI','','','','','','',209696.06,'Credit',0,'2019-12-02 21:18:39'),
(34,'POST OFFICE (RD A/C)NO.12478','4','5','POST OFFICE (RD A/C)NO.12478','No','','','','0','','','','','','','','',115500,'Debit',0,'2019-12-02 21:25:15'),
(35,'POST OFFICE R/D A/C NO.385957145','4','5','POST OFFICE R/D A/C NO.385957145','No','','','','0','','','','','','','','',14000,'Debit',0,'2019-12-02 21:26:11'),
(36,'POST OFFICE S/B A/C 3849213945','5','4','POST OFFICE S/B A/C 3849213945','No','','','','0','','','','','','','','',158,'Debit',0,'2019-12-02 21:27:01'),
(37,'PRINTING MACHINE','4','1','PRINTING MACHINE','No','','','','0','','','','','','','','',64008,'Debit',0,'2019-12-02 21:27:58'),
(38,'RAJIV RANJAN (PROP)','1','1','RAJIV RANJAN (PROP)','No','','','','0','','','','','','','','',6189944.85,'Credit',0,'2019-12-02 21:42:57'),
(39,'SALARY PAYABLE','3','3','SALARY PAYABLE','No','','','','0','','','','','','','','',18600,'Credit',0,'2019-12-02 21:46:32'),
(40,'SAMRAT OFFSET','5','3','RASHIDA BANO','No','JAMUN GALI','SABZI BAGH','PATNA','10','10','INDIA','800004','10AHJPB3509R1ZF','AHJPB3509R','','','',15126,'Debit',0,'2019-12-02 21:49:47'),
(41,'SCOOTY','4','1','SCOOTY','No','','','','0','','','','','','','','',40800,'Debit',0,'2019-12-02 21:50:37'),
(42,'SHRI DURGA PRINTING WORKS','5','3','PRADEEP KUMAR','No','KANKARBAGH','','PATNA','10','10','INDIA','800020','10AKTPK0647A1ZN','AKTPK0647A','','','',100000,'Credit',0,'2019-12-02 21:53:42'),
(43,'STATE BANK OF INDIA A/C NO.35029039458','5','4','STATE BANK OF INDIA A/C NO.35029039458','No','','','','0','','','','','','','','',140206.79,'Debit',0,'2019-12-02 21:55:15'),
(44,'TDS ( ASSETS )','5','6','TDS ( ASSETS )','No','','','','0','','','','','','','','',9515,'Debit',0,'2019-12-02 21:56:10'),
(45,'UNITED BANK OF INDIA  S/B A/C NO.0474010056707','5','4','UNITED BANK OF INDIA  S/B A/C NO.0474010056707','No','','','','0','','','','','','','','',6069.33,'Debit',0,'2019-12-02 21:57:10'),
(46,'VITAL SOLUTIONS PTE LTD.','3','2','VITAL SOLUTIONS PTE LTD.','No','#21-01, ROBINSON 77,','ROBINSON ROAD,','','0','','SINGAPUR','068896','','','','','',445921.35,'Credit',0,'2019-12-02 21:59:27'),
(47,'OP STOCK','5','2','OP STOCK','No','','','','0','','','','','','','','',5922072.14,'Debit',0,'2019-12-02 23:07:42'),
(48,'SALARY AND WAGES','7','3','SALARY AND WAGES','No','','','','0','','','','','','','','',0,'Credit',0,'2019-12-03 16:39:52'),
(49,'MISC EXPENSES','7','5','MISC EXPENSES','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-06 20:12:12'),
(50,'INTEREST','6','2','INTEREST','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-06 20:19:01'),
(51,'PRINTING & STATIONERY','7','5','','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-09 17:07:47'),
(52,'CREDIT A/C','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-07 03:51:11'),
(53,'DEBIT A/C','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 18:04:21'),
(54,'REPAIR & MAINTENENCE','7','5','REPAIR & MAINTENENCE','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:15:59'),
(55,'FREIGHT','7','5','FREIGHT','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:18:33'),
(56,'BANK CHARGES','7','5','','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:20:16'),
(57,'KHANNA PAPER MILLS LTD','3','2','KHANNA PAPER MILLS LTD','Yes','NH 3, BY PASS ROAD,','OPP METRO CASH & CARRY','AMRITSAR','3','3','INDIA','143001','03AAACK1375K1ZP','AAACK1375K','','','',0,'Debit',0,'2019-12-13 17:02:34'),
(58,'TRAVELLING EXPENSES','7','5','','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-17 10:46:28'),
(59,'AUDIT FEE','7','5','AUDIT FEE','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-17 17:29:12'),
(60,'INTEREST EXPENSES','7','5','','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-25 22:59:40'),
(61,'PRASHASTI PRINTERS','5','3','PRASHASTI PRINTERS','No','BANGALI AKHARA','LANGARTOLI','PATNA','10','10','INDIA','800004','10AGQPT0294D1ZH','AGQPT0294D','','','',0,'Debit',0,'2019-12-25 23:48:22'),
(62,'RAVI RANJAN ( PROP )','5','6','RAVI RANJAN ( PROP )','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-27 20:26:51'),
(63,'RENT','7','5','','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-27 20:27:38'),
(66,'SALES RETURN A/C','7','2','SALES RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-11 18:43:33'),
(68,'CGST-OTL A/C','3','3','CGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:40:45'),
(69,'SGST-OTL A/C','3','3','SGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:02'),
(70,'IGST-OTL A/C','3','3','IGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:33'),
(71,'PURCHASE RETURN A/C','7','2','PURCHASE RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-18 12:03:17'),
(72,'INTEREST EXPENSES','7','5','INTEREST EXPENSES','No','','','','0','','','','','','','','',0,'Debit',0,'2020-02-02 17:10:42'),
(73,'SHRI DURGA PRINTING WORKS','5','3','SHRI DURGA PRINTING WORKS','Yes','KANKARBAGH','','PATNA','10','10','INDIA','800020','10AKTPK0647A1ZN','AKTPK0647A','','','',0,'Debit',0,'2020-02-02 17:32:03');
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
(7,5,'Other expenses',0,'2019-11-15 00:00:00'),
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
  `ca_id` int(11) NOT NULL,
  `ca_name` text NOT NULL,
  `ca_code` text NOT NULL,
  `ca_password` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0 active , 2 remove',
  `date` date NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_ca_tbl
-- 

/*!40000 ALTER TABLE `pms_ca_tbl` DISABLE KEYS */;
INSERT INTO `pms_ca_tbl`(`ca_id`,`ca_name`,`ca_code`,`ca_password`,`status`,`date`,`default_date`) VALUES
(1,'Mukund','YYY001','admin!@#',0,'2029-09-25 00:00:00','2019-09-25 11:06:53');
/*!40000 ALTER TABLE `pms_ca_tbl` ENABLE KEYS */;

-- 
-- Definition of pms_company
-- 

DROP TABLE IF EXISTS `pms_company`;
CREATE TABLE IF NOT EXISTS `pms_company` (
  `company_id` int(11) NOT NULL,
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
  `company_start_date` date NOT NULL DEFAULT '0001-01-01',
  `company_end_date` date NOT NULL DEFAULT '0001-01-01',
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_start_date`,`company_end_date`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA001','db_aaa003','Company Public Not Interested','GENIAL POLYMERS PRIVATE LIMITED','','','BEHIND PANCH SHIV MANDIR','KANKARBAGH','a','PATNA','10',10,'INDIA','800020','ca.mukund@gmail.com',941889666,'10AAECG649J1ZL','AAECG649J','U2200BR2012PTC018321','123','ZZZ001','ccc001','2019','0001-01-01 00:00:00','0001-01-01 00:00:00','genialpolymers','123','STATE BANK OF INDIA','KANKARBAGH','987234100064388','SBIN0006321','RIPUNAJAY KUMAR','DIRECTOR','LOHIA NAGAR, KANKARBAGH','ca.mukund@outlook.com','8768544332','Neeraj Kumar','MD','patrakar nagar','ca.neerajkumar2012@gmail,com','8006005004','genialpolymers','123','2019-09-06 11:46:47',0),
(2,'AAA002','pms_system','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA','800001','mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','Mmsp@54321@','2019-09-07 08:53:54',0),
(3,'AAA003','pms_system','Individual','TIWARY','KUMAR','SUNIL','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,','BY-PASS ROAD','','PATNA','10',10,'INDIA','800027','haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','priyankas9','Mmsp@12334','2019-09-07 09:01:50',0),
(4,'AAA004','db_aaa004','Cooperative Sociaty','unitglo','solutions','pvtltd','chinchwad','STATION','chinchwad','pune','27',27,'india','411019','asd@gmail.com',1234568851,'27aakcm12121zp','aakcm1212','123','soc','GGG001','ccc001','2019_2020','0001-01-01 00:00:00','0001-01-01 00:00:00','uspl','uspl@123','indian bank','chinchwad station','6478077545','indian1212','dipak','assistant manager','pune','ds@gmail.com','1235668852','a','b','c','abc@gmail.com','1255555444','uspl','uspl@123','2019-10-01 11:46:38',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;
INSERT INTO `pms_expenses_product_name`(`auto_incr_id`,`expe_product_name`,`status`,`default_date`) VALUES
(1,'guest',0,'2019-12-25 15:48:25'),
(2,'RENT',0,'2019-12-27 20:30:50'),
(3,'RENT',0,'2019-12-27 20:31:46'),
(4,'RENT',0,'2019-12-27 20:37:18'),
(5,'RENT',0,'2019-12-28 15:07:54'),
(6,'pencil',0,'2020-01-11 17:49:29'),
(7,'pencil',0,'2020-01-11 17:50:49'),
(8,'duster',0,'2020-01-11 17:50:49'),
(9,'pencil',0,'2020-01-11 17:51:04'),
(10,'duster',0,'2020-01-11 17:51:04'),
(11,'pencil',0,'2020-01-18 13:13:51'),
(12,'pencil',0,'2020-01-18 14:26:59'),
(13,'pencil',0,'2020-01-18 14:28:24'),
(14,'pencil',0,'2020-01-18 14:33:02'),
(15,'pencil',0,'2020-01-18 14:34:47'),
(16,'pencil',0,'2020-01-18 14:37:40'),
(17,'pencil',0,'2020-01-18 14:38:28'),
(18,'pencil',0,'2020-01-18 14:43:41');
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
  `exp_tax_value` varchar(20) NOT NULL,
  `rate` double NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'AAA003 ',1,'KHANNA PAPER MILLS LTD',56000,0,1,0,'2020-02-06 16:40:07'),
(2,'AAA003 ',1,'IGST-OTL A/C',0,6000,1,0,'2020-02-06 16:40:07'),
(3,'AAA003 ',1,'SALES A/C',0,50000,1,0,'2020-02-06 16:40:07'),
(4,'AAA003 ',2,'KHANNA PAPER MILLS LTD',0,56000,1,0,'2020-02-06 16:40:41'),
(5,'AAA003 ',2,'IGST-OTL A/C',6000,0,1,0,'2020-02-06 16:40:41'),
(6,'AAA003 ',2,'SALES A/C',50000,0,1,0,'2020-02-06 16:40:42'),
(7,'AAA003 ',3,'KHANNA PAPER MILLS LTD',0,56000,1,0,'2020-02-06 17:21:21'),
(8,'AAA003 ',3,'IGST-OTL A/C',6000,0,1,0,'2020-02-06 17:21:22'),
(9,'AAA003 ',3,'SALES A/C',50000,0,1,0,'2020-02-06 17:21:22');
/*!40000 ALTER TABLE `pms_journal_entry_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_mst
-- 

DROP TABLE IF EXISTS `pms_journal_entry_mst`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_mst` (
  `comp_name` varchar(100) NOT NULL,
  `manual_id` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA003',1,1,'2020-02-04 00:00:00',56000,56000,'',1,'sales',1,0,'2020-02-06 16:40:06'),
('AAA003',2,2,'2020-02-04 00:00:00',56000,56000,' canseled JV agenst sales number 1',1,'sales',1,0,'2020-02-06 16:40:40'),
('AAA003',3,3,'2020-02-04 00:00:00',56000,56000,' canseled JV agenst sales number 1',1,'sales',1,0,'2020-02-06 17:21:21');
/*!40000 ALTER TABLE `pms_journal_entry_mst` ENABLE KEYS */;

-- 
-- Definition of pms_master_setting_all_prefix_series_number
-- 

DROP TABLE IF EXISTS `pms_master_setting_all_prefix_series_number`;
CREATE TABLE IF NOT EXISTS `pms_master_setting_all_prefix_series_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `generated_no` varchar(20) NOT NULL,
  `series_no` varchar(16) NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(2,'invoice','PMT/19-20/',0,0,'2020-02-04 18:29:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;
INSERT INTO `pms_master_settings`(`master_sett_id`,`terms_condition_tax_invoice`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`,`mrp_details`,`mrp_invoice_details`,`sale_price_details`,`sale_price_details_info`,`expiry_monitoring_system`,`expiry_monitoring_system_info`,`expiry_details_tax_invoice`,`batch_wise_details`,`batch_wise_details_info`,`batch_wise_details_tax_invoice`,`stock_out_method`,`stock_valuation_method`,`unit_conversion_method_required`,`prefix_generate_invoice_no`,`invoiceno`,`prefix_generate_debit_no`,`debitno`,`prefix_generate_credit_no`,`creditno`,`journal_accounting_entry`,`extra_information_tax_invoice`,`caption_name1`,`currency_sign_before_amount`,`status`,`default_date`) VALUES
(6,'1 E OE 2 Subject to Patna Jurisdiction','SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','1','1000','1','1000','1','2020-05-01 00:00:00','1','1','A','1','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket Price\tAverage Cost Price','1',1,'1',0,'0',0,'0','1','0','','1',0,'2020-02-04 18:29:40');
/*!40000 ALTER TABLE `pms_master_settings` ENABLE KEYS */;

-- 
-- Definition of pms_news_and_update
-- 

DROP TABLE IF EXISTS `pms_news_and_update`;
CREATE TABLE IF NOT EXISTS `pms_news_and_update` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `pms_news_title` text NOT NULL,
  `pms_news_description` text NOT NULL,
  `pms_news_validate_from_date` date NOT NULL DEFAULT '0001-01-01',
  `pms_news_validate_to_date` date NOT NULL DEFAULT '0001-01-01',
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
  `rate` double(10,2) NOT NULL DEFAULT '0.00',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(3,1,'1','120 GSM 585X910 COATED PAPER GLOSS','4802','KGS-KILOGRAMS','A','0001-01-01 00:00:00',1,0,50000,0,50000,0,0,6,3000,6,3000,1,0,'purchase','2020-02-04 17:10:06');
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
  `statecode` int(9) DEFAULT '0',
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
(1,'1','','2020-02-04 00:00:00','NO','10',10,'MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10',56000,6000,0,3000,3000,0,'Cash','Paid','purchase','',3,1,0,'2020-02-04 17:04:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(5,1,'PMT/19-20/1','128 GSM COATED PAPER GLOSS 58.5X91','4802','PAC-PACKS','A','2020-05-01 00:00:00',1,12,50000,0,50000,12,6000,0,0,0,0,1,2,'sales','2020-02-06 16:39:56');
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
  `ship_party_name` varchar(50) DEFAULT NULL,
  `ship_party_address` varchar(100) DEFAULT NULL,
  `ship_party_gstin` varchar(20) DEFAULT NULL,
  `ship_party_state` varchar(20) DEFAULT NULL,
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
  `payment_status` varchar(50) DEFAULT NULL,
  `invoice_type` varchar(50) DEFAULT 'sales',
  `remark` varchar(1000) NOT NULL,
  `sale_jv_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'PMT/19-20/1','','Regular','2020-02-04 00:00:00','NO','10',10,'','','2020-02-04 00:00:00','','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab','3','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,56000,'6000',6000,0,0,0,'UNITED BANK OF INDIA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','1 E OE 2 Subject to Patna Jurisdiction','SUNIL KUMAR TIWARY','Cash','Paid','sales','',1,1,2,'2020-02-04 16:51:22');
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
  `stock_opening_qty` double(10,2) NOT NULL DEFAULT '0.00',
  `stock_purc_price_per_unit` double(10,2) NOT NULL DEFAULT '0.00',
  `stock_opening_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `stock_reorder_level` text NOT NULL,
  `stock_reorder_quantity` text NOT NULL,
  `stock_minimum_stock_reminder` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(1,'1','2','COATED BOARD 300 GSM 584 X 910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0125470514429109',0,'4802','12','','','2022-10-01 00:00:00','',4782,52.13,249271.6,'0','0','0',0,'2019-12-25 22:01:14'),
(2,'1','2','COATED PAPER 100 GSM 584X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.037593984962406',0,'4802','12','','','2022-10-01 00:00:00','',4681.6,53.87,252208,'','','',0,'2019-12-25 22:01:41'),
(3,'1','2','COATED PAPER 118 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0436681222707424',0,'4802','12','','','2022-10-01 00:00:00','',4946.4,53.21,263196,'','','',0,'2019-12-25 22:02:04'),
(4,'1','2','COATED PAPER 128 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','','','2022-10-01 00:00:00','',2635.68,93.35,246044.2,'','','',0,'2019-12-25 22:02:32'),
(5,'1','2','COATED PAPER 90 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','','','2022-10-01 00:00:00','',5581.44,49.56,276592.32,'5581.44','49.56','',0,'2019-12-10 12:12:14'),
(6,'1','2','COATED PAPER 90 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0418410041841004',0,'4802','12','','','2022-10-01 00:00:00','',12093.12,67.43,815396.21,'0','0','0',0,'2019-12-10 12:06:46'),
(7,'1','2','COATED PAPER 80 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0645161290322581',0,'4802','12','','','2021-10-01 00:00:00','',6046.56,45.1,272681.76,'','','',0,'2019-12-10 12:17:25'),
(8,'1','2','COATED PAPER 80 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','','2022-10-01 00:00:00','',13100.88,62.33,816547.16,'','','',0,'2019-12-10 12:15:53'),
(9,'1','3','100 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0375685626267939',0,'4802','12','','','0001-01-01 00:00:00','',5163.89,52.58,271518.82,'5163','52','',0,'2019-12-25 22:03:18'),
(10,'1','3','115 GSM COATED PAPER GLOSS 585X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0326690623979092',0,'4802','12','','','0001-01-01 00:00:00','',4744.55,52.57,249407.71,'474','52','',0,'2019-12-25 22:03:39'),
(11,'1','3','120 GSM 510X760 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.042999656002752',0,'4802','12','','','0001-01-01 00:00:00','',3581.42,52.89,189420,'3581','52','',0,'2019-12-25 22:04:00'),
(12,'1','3','120 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0313087038196619',0,'4802','12','','','0001-01-01 00:00:00','',2874.6,52.57,151131.15,'2874','52','',0,'2019-12-25 22:04:32'),
(13,'1','3','128 GSM 510X760 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403128275417238',0,'4802','12','','','0001-01-01 00:00:00','',4762.75,52.89,251904,'4762','52','',0,'2019-12-25 22:04:52'),
(14,'1','3','128 GSM COATED PAPER GLOSS 58.5X91','PAC-PACKS','PAC-PACKS','KGS','17.035',0,'4802','12','','','0001-01-01 00:00:00','',33,901,29733,'33','901','',0,'2019-12-25 22:05:15'),
(15,'1','3','150 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.025046335721084',0,'4802','12','','','0001-01-01 00:00:00','',2754.89,52.89,145705.92,'2754.89','52','',0,'2019-12-25 22:05:31'),
(16,'1','3','170 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0220994475138122',0,'4802','12','','','0001-01-01 00:00:00','',769.25,52.89,40685.59,'769.25','52','',0,'2019-12-25 22:31:41'),
(17,'1','3','80 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','','','0001-01-01 00:00:00','',4216.21,56.52,238306.16,'','56.52','',0,'2019-12-25 22:06:02'),
(18,'1','3','90 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','','','0001-01-01 00:00:00','',10444.82,54.56,569885.31,'','54','',0,'2019-12-25 22:05:46'),
(19,'1','4','UNCOATED WOODFREE PAPER 120 GSM 58.5X91','PAC-PACKS','PAC-PACKS','KGS','15.97',0,'4802','12','','','0001-01-01 00:00:00','',183,879.34,160919.22,'','879.34','',0,'2019-12-25 22:32:53'),
(20,'1','4','UNCOATED WOODFREE PAPER 70 GSM 51X 76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0737136960047177',0,'4802','12','','','0001-01-01 00:00:00','',596.9,55.06,32866.24,'','55.06155134863461','',0,'2019-12-25 22:33:09'),
(21,'1','4','UNCOATED WOODFREE PAPER 70 GSM  58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0536711034778875',0,'4802','12','','','0001-01-01 00:00:00','',1378.77,55.06,75916.6,'','55.06110518795739','',0,'2019-12-25 22:33:32'),
(22,'1','4','UNCOATED WOODFREE PAPER 80 GSM 51 X76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.064499484004128',0,'4802','12','','','0001-01-01 00:00:00','',2790.72,55.06,153660.6,'','55','',0,'2019-12-25 22:33:49'),
(23,'1','4','UNCOATED WOODFREE PAPER 80 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','','','0001-01-01 00:00:00','',1192.46,55.06,65658.32,'','55.06123475839861','',0,'2019-12-25 22:34:05'),
(24,'1','4','UNCOATED WOODFREE PAPER 90 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','','','0001-01-01 00:00:00','',958.24,55.06,52762,'','55.06136249791284','',0,'2019-12-25 22:34:21'),
(25,'1','5','W.PAPER','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0588235294117647',0,'4802','12','','','0001-01-01 00:00:00','',17,2979.42,50650.2,'','2979.4235294117643','',0,'2019-12-25 22:35:00'),
(26,'1','1','HARD DISK','BOX-BOX','BOX-BOX','','',0,'','','','0','0001-01-01 00:00:00','',0,0,0,'0','0','0',2,'2020-01-12 00:20:52'),
(29,'1','6','WRITING PAPER-OPTIMA 58 GSM 45X55/7.2','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.13889',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-01-13 17:16:40');
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
(1,2,'Hansol',0,'2019-12-25 22:01:02'),
(1,3,'ENOVA',0,'2019-12-25 22:03:10'),
(1,4,'PAPER',0,'2019-12-25 22:32:40'),
(1,5,'WHITE',0,'2019-12-25 22:34:51'),
(1,6,'KHANNA',0,'2019-12-26 00:05:49'),
(2,1,'Service',0,'2019-11-08 12:29:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_dtl`(`dtl_dr_cr_id`,`refrance_id`,`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`,`hsn_code`,`uom`,`batch`,`expiry_date`,`quantity`,`rate`,`amount`,`discount`,`tax_value`,`igst_rate`,`igst_amount`,`cgst_rate`,`cgst_amount`,`sgst_rate`,`sgst_amount`,`total`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,1,'--Select--','PMT/19-20/1','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','128 GSM COATED PAPER GLOSS 58.5X91','4802','PAC-PACKS','0001-01-01','2020-05-01 00:00:00',1,12,50000,0,50000,12,6000,0,0,0,0,56000,1,0,'2020-02-04 18:17:07');
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
  `bill_party_state_code` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_mst`(`dr_cr_Id`,`document_no`,`date_of_issue`,`doc_state`,`doc_state_code`,`against_invoice`,`date_of_invoice`,`bill_party_name`,`bill_party_address`,`bill_party_gstin`,`bill_party_state`,`bill_party_state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`note_type`,`remarks`,`dr_cr_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'--Select--','2020-02-04 00:00:00','10',10,'PMT/19-20/1','2020-02-04 00:00:00','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,'KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,56000,6000,6000,0,0,0,'credit','',4,1,0,'2020-02-04 18:17:07');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-02-06 18:20:10
-- Total time: 0:0:0:10:233 (d:h:m:s:ms)
