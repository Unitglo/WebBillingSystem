-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2019-12-27 11:36:27
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
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-add, 2-delete',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE','7','2','PURCHASE','Yes','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(2,'ACCOUNTANCY CHARGE PAYABLE','3','3','ACCOUNTANCY CHARGE PAYABLE','No','','','','0','','','0','','','','','',12000,'Credit',0,'2019-12-02 10:53:22'),
(3,'SALES','6','1','SALES','Yes','','','','0','','','0','','','1','','',0,'Credit',0,'2019-12-02 10:53:22'),
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
(14,'CASH','5','4','CASH','No','','','','0','','','','','','','','',56896.34,'Debit',0,'2019-12-02 20:11:52'),
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
(29,'MANGALAM PAPERS & CARDS','5','1','KUMARI VANDANA','No','AMBEDKAR MARKET COMPLEX','DAKBUNGLOW','GAYA','10','10','','823001','10AEGPV7460M1Z4','AEGPV7460M','','','',114624,'Debit',0,'2019-12-02 21:02:53'),
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
(52,'CREDIT','7','1','CREDIT','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-07 03:51:11'),
(53,'DEBIT','3','2','DEBIT','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 18:04:21'),
(54,'REPAIR & MAINTENENCE','7','5','REPAIR & MAINTENENCE','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:15:59'),
(55,'FREIGHT','7','5','FREIGHT','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:18:33'),
(56,'BANK CHARGES','7','5','','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-12 16:20:16'),
(57,'KHANNA PAPER MILLS LTD','3','2','KHANNA PAPER MILLS LTD','Yes','NH 3, BY PASS ROAD,','OPP METRO CASH & CARRY','AMRITSAR','3','3','INDIA','143001','03AAACK1375K1ZP','AAACK1375K','','','',0,'Debit',0,'2019-12-13 17:02:34'),
(58,'TRAVELLING EXPENSES','7','5','','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-17 10:46:28'),
(59,'AUDIT FEE','7','5','AUDIT FEE','No','','','','0','','','','','','','','',0,'Debit',0,'2019-12-17 17:29:12'),
(60,'CASH A/C','1','1','CASH A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2019-12-26 13:03:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_start_date`,`company_end_date`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA001','pms_test','Company Public Not Interested','GENIAL POLYMERS PRIVATE LIMITED','','','BEHIND PANCH SHIV MANDIR','KANKARBAGH','a','PATNA','10',10,'INDIA','800020','ca.mukund@gmail.com',941889666,'10AAECG649J1ZL','AAECG649J','U2200BR2012PTC018321','123','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','genialpolymers','123','STATE BANK OF INDIA','KANKARBAGH','987234100064388','SBIN0006321','RIPUNAJAY KUMAR','DIRECTOR','LOHIA NAGAR, KANKARBAGH','ca.mukund@outlook.com','8768544332','Neeraj Kumar','MD','patrakar nagar','ca.neerajkumar2012@gmail,com','8006005004','genialpolymers','123','2019-09-06 11:46:47',0),
(2,'AAA002','pms','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA','800001','mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','2018-04-01 00:00:00','2019-03-31 00:00:00','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','Mmsp@54321@','2019-09-07 08:53:54',0),
(3,'AAA003','pms_test','Individual','TIWARY','KUMAR','SUNIL','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,','BY-PASS ROAD','','PATNA','10',10,'INDIA','800027','haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','priyankas9','Mmsp@12334','2019-09-07 09:01:50',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;
INSERT INTO `pms_expenses_product_name`(`auto_incr_id`,`expe_product_name`,`status`,`default_date`) VALUES
(1,'lunch with guests',0,'2019-12-02 17:49:08'),
(3,'laptop',0,'2019-12-03 11:46:53'),
(4,'pen',0,'2019-12-03 11:46:57'),
(5,'lunch with guests',0,'2019-12-03 11:47:49'),
(6,'lunch with guests',0,'2019-12-10 13:46:56'),
(7,'laptop',0,'2019-12-10 13:47:00'),
(8,'lunch with guests',0,'2019-12-25 15:53:19'),
(9,'laptop',0,'2019-12-25 15:53:19'),
(10,'lunch with guests',0,'2019-12-25 15:56:36'),
(11,'laptop',0,'2019-12-25 15:56:36'),
(12,'lunch with guests',0,'2019-12-26 13:38:41'),
(13,'lunch with guests',0,'2019-12-26 13:42:17'),
(14,'lunch with guests',0,'2019-12-26 13:45:13'),
(15,'lunch with guests',0,'2019-12-26 13:46:53'),
(16,'lunch with guests',0,'2019-12-26 15:46:15'),
(17,'lunch with guests',0,'2019-12-26 15:47:07'),
(18,'lunch with guests',0,'2019-12-26 15:48:19'),
(19,'lunch with guests',0,'2019-12-26 15:49:29'),
(20,'laptop',0,'2019-12-26 16:37:53'),
(21,'laptop',0,'2019-12-26 16:37:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_dtl`(`exp_dtl_id`,`exp_voucherno`,`expenses_head`,`exp_product_name`,`exp_hsn_code`,`rate`,`exp_tax_value`,`exp_igst_rate`,`exp_igst_amount`,`exp_cgst_rate`,`exp_cgst_amount`,`exp_sgst_rate`,`exp_sgst_amount`,`exp_total_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(7,'3','print and script','laptop','0',18,'50000','18',9000,'0',0,'0',0,59000,0,1,'2019-12-03 11:46:55'),
(8,'3','print and script','pen','pen123',5,'60','5',3,'0',0,'0',0,63,0,1,'2019-12-03 11:46:59'),
(14,'2','CENTRAL BANK OF INDIA S/B A/C NO.3307952543','lunch with guests','0',5,'500','5',25,'0',0,'0',0,525,0,0,'2019-12-25 15:56:36'),
(15,'2','CENTRAL BANK OF INDIA S/B A/C NO.3307952543','laptop','123',0,'50000','0',0,'0',0,'0',0,50000,0,0,'2019-12-25 15:56:36'),
(23,'4','AXIS BANK LTD (OD AC-917030074838374)','lunch with guests','12345',5,'5000.56','5',250.03,'0',0,'0',0,5250.59,0,0,'2019-12-26 15:49:29'),
(24,'5','CUSTOM DUTY RECEIABLE','laptop','123',15,'10000.63','15',1500.09,'0',0,'0',0,11500.72,0,0,'2019-12-26 16:37:53'),
(25,'6','CUSTOM DUTY RECEIABLE','laptop','123',15,'10000.63','15',1500.09,'0',0,'0',0,11500.72,0,0,'2019-12-26 16:37:56');
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
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `company_name` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_mst`(`exp_voucher_no`,`exp_voucher_date`,`exp_place_of_supply`,`exp_reverse_charge`,`exp_state`,`exp_state_code`,`exp_supplier_name`,`exp_supplier_addr`,`exp_supplier_gstin`,`exp_supplier_state`,`exp_supplier_state_code`,`expenses_head`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`company_name`,`auth_name`,`payment_mode`,`ca_approved_status`,`status`,`default_date`) VALUES
(2,'2018-12-25 00:00:00','pune','NO','10',10,'AIR CONDITION & STEBLIZER','','','27',27,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543',50525,25,25,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Outstanding',0,0,'2019-12-02 18:59:00'),
(3,'2019-12-03 00:00:00','mumbai','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','',0,'print and script',59063,9003,9003,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',0,1,'2019-12-03 11:03:30'),
(4,'2018-12-26 00:00:00','pune','NO','10',10,'KUMARI VANDANA','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','10',10,'AXIS BANK LTD (OD AC-917030074838374)',5250.59,250.03,250.03,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Outstanding',0,0,'2019-12-26 13:38:41'),
(5,'2018-12-26 00:00:00','','NO','10',10,'CREDIT','chinchwad','11ABCDEFGHD1AS','27',27,'CUSTOM DUTY RECEIABLE',11500.72,1500.09,1500.09,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',0,0,'2019-12-26 16:37:53'),
(6,'2018-12-26 00:00:00','','NO','10',10,'CREDIT','chinchwad','11ABCDEFGHD1AS','27',27,'CUSTOM DUTY RECEIABLE',11500.72,1500.09,1500.09,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',0,0,'2019-12-26 16:37:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'AAA002 ',1,'AWADH LAXMI MULTI SERVICES',563,0,0,0,'2019-12-19 15:07:05'),
(2,'AAA002 ',1,'AWADH LAXMI MULTI SERVICES',0,563,0,0,'2019-12-19 15:07:07'),
(3,'AAA002 ',2,'A F ENTERPRISES',5000,0,0,0,'2019-12-19 15:11:55'),
(4,'AAA002 ',2,' APEX PET PRODUCTS PRIVATE LIMITED',0,1000,0,0,'2019-12-19 15:11:57'),
(5,'AAA002 ',2,'PURCHASE',0,1000,0,0,'2019-12-19 15:11:58'),
(6,'AAA002 ',2,' APEX PET PRODUCTS PRIVATE LIMITED',0,1000,0,0,'2019-12-19 15:11:59'),
(7,'AAA002 ',2,'SGST-ITC A/C',0,2000,0,0,'2019-12-19 15:12:00'),
(8,'AAA002 ',3,'AUDIT FEE',500,0,0,0,'2019-12-19 17:36:34'),
(9,'AAA002 ',3,'AIR CONDITION & STEBLIZER',0,500,0,0,'2019-12-19 17:36:36'),
(10,'AAA002 ',4,'DESIGNEX DIGITAL',90000.56,0,0,0,'2019-12-20 13:02:27'),
(11,'AAA002 ',4,'CGST-ITC A/C',8100.55,0,0,0,'2019-12-20 13:02:27'),
(12,'AAA002 ',4,'SGST-ITC A/C',8100.55,0,0,0,'2019-12-20 13:02:28'),
(13,'AAA002 ',4,'SALES',0,106200.66,0,0,'2019-12-20 13:02:30'),
(14,'AAA002 ',4,'',1,0,0,0,'2019-12-20 13:02:31'),
(15,'AAA002 ',4,'',0,2,0,0,'2019-12-20 13:02:33'),
(16,'AAA002 ',5,'KHANNA PAPER MILLS LTD',5999.72,0,0,0,'2019-12-20 13:21:37'),
(17,'AAA002 ',5,'IGST-ITC A/C',1080.99,0,0,0,'2019-12-20 13:21:37'),
(18,'AAA002 ',5,'SALES',0,7080.71,0,0,'2019-12-20 13:21:38'),
(19,'AAA002 ',6,'AXIS BANK LTD (OD AC-917030074838374)',5000.56,0,0,0,'2019-12-26 15:50:02'),
(20,'AAA002 ',6,'IGST-ITC A/C',250.03,0,0,0,'2019-12-26 15:50:02'),
(21,'AAA002 ',6,'KUMARI VANDANA',0,5250.59,0,0,'2019-12-26 15:50:02'),
(22,'AAA002 ',7,'CUSTOM DUTY RECEIABLE',10000.63,0,0,0,'2019-12-26 16:38:13'),
(23,'AAA002 ',7,'IGST-ITC A/C',1500.09,0,0,0,'2019-12-26 16:38:13'),
(24,'AAA002 ',7,'CASH A/C',0,11500.72,0,0,'2019-12-26 16:38:13');
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
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA002',5,1,'2018-12-19 00:00:00',563,563,'asd',0,0,'2019-12-19 15:07:02'),
('AAA002',1,2,'2018-04-01 00:00:00',5000,5000,'asdfhh',0,0,'2019-12-19 15:11:53'),
('AAA002',4,3,'2018-12-12 00:00:00',500,500,'',0,0,'2019-12-19 17:36:25'),
('AAA002',3,4,'2018-09-06 00:00:00',106202.66,106202.66,'',0,0,'2019-12-20 13:02:23'),
('AAA002',2,5,'2018-04-01 00:00:00',7080.71,7080.71,'',0,0,'2019-12-20 13:21:34'),
('AAA002',6,6,'2018-12-26 00:00:00',5250.59,5250.59,'',0,0,'2019-12-26 15:50:02'),
('AAA002',7,7,'2018-12-26 00:00:00',11500.72,11500.72,'',0,0,'2019-12-26 16:38:13');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_master_settings` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice_dtl` (
  `pur_dtl_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `invoice_no` varchar(16) NOT NULL,
  `seller_no` varchar(50) NOT NULL,
  `statecode` int(20) NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` int(100) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`seller_no`,`statecode`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(14,14,'1','Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)',10,'LAPTOP','','PAC-PACKS','','0001-01-01 00:00:00',1,18,48000,0,48000,18,8640,0,0,0,0,0,1,'purchase','2019-12-03 13:43:26'),
(15,15,'3','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED',10,'LAPTOP','','ream','','0001-01-01 00:00:00',1,18,50000,500,49500,18,8910,0,0,0,0,0,0,'purchase','2019-12-10 18:30:12'),
(16,16,'5','RAJESH KUMAR',10,'LAPTOP','','ream','','0001-01-01 00:00:00',1,18,50000.36,0,50000.36,0,0,9,4500.03,9,4500.03,0,0,'purchase','2019-12-18 18:40:03'),
(17,17,'6','A F ENTERPRISES',10,'LAPTOP','','ream','A','2020-02-01 00:00:00',1,18,60000,0,60000,0,0,9,5400,9,5400,0,0,'purchase','2019-12-19 12:18:22'),
(18,17,'6','A F ENTERPRISES',10,'BOTTLE','','BTL-BOTTLES','A','2020-02-01 00:00:00',1,5,100,0,100,0,0,3,2.5,3,2.5,0,0,'purchase','2019-12-19 12:18:23'),
(19,18,'1','RAJESH KUMAR',10,'LAPTOP','','ream','A','2020-02-10 00:00:00',2,18,60000,0,120000,0,0,9,10800,9,10800,0,0,'purchase','2019-12-19 12:50:33'),
(20,18,'1','RAJESH KUMAR',10,'PENCIL','123','','A','2020-02-10 00:00:00',5,5,50,0,250,0,0,3,6.25,3,6.25,0,0,'purchase','2019-12-19 12:50:34'),
(21,19,'7','ARSH ENTERPRISES',10,'LAPTOP','','ream','','0001-01-01 00:00:00',2,18,60000.56,1200,118801.12,0,0,9,10692.1,9,10692.1,0,0,'purchase','2019-12-19 13:02:29'),
(22,20,'8','BALAJEE ENTERPRISES',10,'CABLE','123','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,18,3000.64,300,2700.64,0,0,9,243.06,9,243.06,0,0,'purchase','2019-12-19 13:06:48'),
(23,21,'9','MOHAMMAD QUAISER',10,'BOTTLE','','BTL-BOTTLES','','0001-01-01 00:00:00',1,5,90.9,10,80.9,0,0,3,2.02,3,2.02,0,0,'purchase','2019-12-19 13:08:33'),
(24,22,'9','POONAM KESHRI',10,'LAPTOP','','ream','','0001-01-01 00:00:00',1,18,22222.23,222,22000.23,0,0,9,1980.02,9,1980.02,0,0,'purchase','2019-12-19 13:22:23'),
(25,23,'10','MADHU KANT PRASAD',10,'LAPTOP','','ream','A','2020-12-10 00:00:00',1,18,90000.56,0,90000.56,0,0,9,8100.55,9,8100.55,0,0,'purchase','2019-12-20 13:00:51'),
(26,24,'11','KUMARI VANDANA',10,'BOTTLE','','BTL-BOTTLES','','0001-01-01 00:00:00',2,5,90.35,0,180.7,0,0,3,4.76,3,4.76,0,0,'purchase','2019-12-20 13:12:30'),
(27,25,'12','KHANNA PAPER MILLS LTD',10,'CABLE','123','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,18,6000.6,0,6000.6,18,1080.99,0,0,0,0,0,0,'purchase','2019-12-20 13:21:09'),
(28,26,'13','HDFC BANK  LTD. (A/C NO- 50200026260502)',10,'LAPTOP','','ream','A','2020-02-01 00:00:00',1,18,50000,200,49800,18,8964,0,0,0,0,0,0,'purchase','2019-12-25 11:16:26');
/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice_mst
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice_mst`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice_mst` (
  `pur_mst_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
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
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0 default, 1 Data Send to CA,2 CA Edit, 3 Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pur_mst_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`ca_approved_status`,`status`,`default_date`) VALUES
(14,'1','2019-12-03 00:00:00','NO','10',10,'Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)','','','','',56640,8640,8640,0,0,0,'Cash','Paid','purchase','ASD',0,0,'2019-12-03 13:43:24'),
(15,'3','2019-12-10 00:00:00','NO','10',10,'IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19','19',58410,8910,8910,0,0,500,'Cash','Paid','purchase','asd',0,0,'2019-12-10 18:30:10'),
(16,'5','2019-12-18 00:00:00','NO','10',10,'RAJESH KUMAR','','10BDQPK7517J1ZE','10','10',64901.17,0,9000.06,4500.03,4500.03,0,'Cash','Paid','purchase','asd',0,0,'2019-12-18 18:40:01'),
(17,'6','2019-12-19 00:00:00','NO','10',10,'A F ENTERPRISES','','10ABBFA7750K1ZO','10','10',70905,0,59405,5402.5,54002.5,0,'Cash','Paid','purchase','asdf',0,0,'2019-12-19 12:18:19'),
(18,'1','2019-12-19 00:00:00','NO','10',10,'RAJESH KUMAR','','10BDQPK7517J1ZE','10','10',141862.5,0,21612.5,10806.25,10806.25,0,'Cash','Paid','purchase','asdfgh',0,0,'2019-12-19 12:50:31'),
(19,'7','2019-12-19 00:00:00','YES','10',10,'ARSH ENTERPRISES','','','10','10',140185.32,0,21384.2,10692.1,10692.1,1200,'Cash','Paid','purchase','asdfgh',0,0,'2019-12-19 13:02:27'),
(20,'8','2019-12-19 00:00:00','YES','10',10,'BALAJEE ENTERPRISES','','10AALFB4388D1ZQ','10','10',3186.76,0,486.12,243.06,243.06,300,'Cash','Paid','purchase','asdfgh',0,0,'2019-12-19 13:06:46'),
(21,'9','2019-12-19 00:00:00','YES','10',10,'MOHAMMAD QUAISER','PURNEA','10AADPQ4586G1ZS','10','10',84.95,0,4.04,2.02,2.02,10,'Cash','Paid','purchase','asdfgh',0,0,'2019-12-19 13:08:32'),
(22,'9','2019-12-19 00:00:00','NO','10',10,'POONAM KESHRI','','10AENPK6359M2Z3','10','10',25960.27,0,3960.04,1980.02,1980.02,222,'Cash','Paid','purchase','adfgh',0,0,'2019-12-19 13:22:22'),
(23,'10','2019-12-20 00:00:00','YES','10',10,'MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10',106200.66,0,16201.1,8100.55,8100.55,0,'','Not Paid','purchase','',0,0,'2019-12-20 13:00:49'),
(24,'11','2019-12-20 00:00:00','NO','10',10,'KUMARI VANDANA','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar','10',189.73,0,9.52,4.76,4.76,0,'Cash','Paid','purchase','',0,0,'2019-12-20 13:12:29'),
(25,'12','2019-12-20 00:00:00','NO','10',10,'KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab','3',7080.71,1080.99,1080.99,0,0,0,'Cash','Paid','purchase','',0,0,'2019-12-20 13:21:07'),
(26,'13','2019-12-25 00:00:00','NO','10',10,'HDFC BANK  LTD. (A/C NO- 50200026260502)','','','','',58764,8964,8964,0,0,200,'Cash','Paid','purchase','',0,0,'2019-12-25 11:16:25');
/*!40000 ALTER TABLE `pms_purchase_invoice_mst` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_dtl` (
  `sale_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `invoice_no` varchar(16) NOT NULL,
  `seller_no` varchar(50) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`seller_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(7,6,'1','Central Bank of India CC-A/c No.3170157625','LAPTOP','','PAC-PACKS','','0001-01-01 00:00:00',1,18,52000,0,52000,18,9360,0,0,0,0,0,0,'sales','2019-12-10 13:18:18');
/*!40000 ALTER TABLE `pms_sale_invoice_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_mst
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_mst`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_mst` (
  `sale_mst_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
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
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`ca_approved_status`,`status`,`default_date`) VALUES
(6,'1','2019-12-10 00:00:00','NO','10',10,'road','mh-23 9563','2019-12-10 00:00:00','pune','Central Bank of India CC-A/c No.3170157625','','','','','Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)','','','',0,61360,'9360',9360,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','MADAN MOHAN MISHRA PVT LTD  ','','','Cash','Paid','','ASD',0,0,'2019-12-03 13:39:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(7,'1','1','LAPTOP','ream','PAC-PACKS','ream','70.70',1,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',0,'2019-12-09 15:05:15'),
(8,'2','1','BOTTLE','BTL-BOTTLES','','','',0,'','5','50','60','2019-10-01 00:00:00','A',0,0,0,'10','40','',0,'2019-12-05 17:04:56'),
(9,'1','1','CABLE','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'123','18','6000','7000','2026-01-01 00:00:00','A',10,5000,50000,'0','0','0',0,'2019-12-09 11:34:44'),
(10,'1','1','CHARGER','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'12345','10','3000','3500','2020-02-05 00:00:00','B',6.5,3000.6,19503.9,'0','0','0',0,'2019-12-13 11:36:09'),
(11,'1','1','AC','BOX-BOX','BOX-BOX','REAM','79.70',0,'','18','15000','1000','2020-02-24 00:00:00','A',10,13000,130000,'0','0','0',0,'2019-12-17 15:19:04'),
(12,'1','1','FAN','DOZ-DOZENS','DOZ-DOZENS','REAM','7970',0,'','10','1200','1100','0001-01-01 00:00:00','A',15,1000,15000,'0','0','0',0,'2019-12-17 15:28:48'),
(13,'2','1','PENCIL','','','','',0,'123','5','','','0001-01-01 00:00:00','',0,0,0,'','','',0,'2019-12-17 17:51:00'),
(14,'2','1','USB','','','','',0,'234','5','','','0001-01-01 00:00:00','',0,0,0,'','','',0,'2019-12-18 13:21:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_dtl`(`dtl_dr_cr_id`,`refrance_id`,`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`,`hsn_code`,`uom`,`batch`,`expiry_date`,`quantity`,`rate`,`amount`,`discount`,`tax_value`,`igst_rate`,`igst_amount`,`cgst_rate`,`cgst_amount`,`sgst_rate`,`sgst_amount`,`total`,`ca_approved_status`,`status`,`default_date`) VALUES
(14,10,'1','1','AXIS BANK LTD (OD AC-917030074838374)','AXIS BANK LTD (OD AC-917030074838374)','LAPTOP','','PAC-PACKS','','0001-01-01 00:00:00',1,18,48000,0,48000,0,0,9,4320,9,4320,56640,0,0,'2019-12-03 13:57:08'),
(17,11,'2','1','AXIS BANK LTD (OD AC-917030074838374)','Central Bank of India CC-A/c No.3170157625','BOTTLE','','BTL-BOTTLES','0001-01-01','0001-01-01 00:00:00',1,5,60,0,60,0,0,2.5,1.5,2.5,1.5,63,0,0,'2019-12-10 13:40:57'),
(18,12,'2','1','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','RABINDRA PRASAD SINGH','LAPTOP','','ream','','0001-01-01 00:00:00',1,18,10000,0,10000,18,1800,0,0,0,0,11800,0,0,'2019-12-10 17:52:09'),
(19,13,'3','1','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','LAPTOP','','ream','','0001-01-01 00:00:00',1,18,10,0,10,18,1.8,0,0,0,0,11.8,0,0,'2019-12-10 18:20:23'),
(20,14,'4','1','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','BOTTLE','','BTL-BOTTLES','A','2020-01-25 00:00:00',1,5,40,0,40,5,2,0,0,0,0,42,0,0,'2019-12-10 18:21:35');
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
  `ca_approved_status` int(11) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dr_cr_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_mst`(`dr_cr_Id`,`document_no`,`date_of_issue`,`doc_state`,`doc_state_code`,`against_invoice`,`date_of_invoice`,`bill_party_name`,`bill_party_address`,`bill_party_gstin`,`bill_party_state`,`bill_party_state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`note_type`,`remarks`,`ca_approved_status`,`status`,`default_date`) VALUES
(10,'1','2019-12-03 00:00:00','10',10,'1','2019-12-03 00:00:00','AXIS BANK LTD (OD AC-917030074838374)','','','',10,'AXIS BANK LTD (OD AC-917030074838374)','','','',0,56640,0,0,4320,4320,0,'debit','AWER',0,0,'2019-12-03 13:57:05'),
(11,'2','2019-12-10 00:00:00','10',10,'1','2019-12-10 00:00:00','AXIS BANK LTD (OD AC-917030074838374)','','','',10,'Central Bank of India CC-A/c No.3170157625','','','',10,63,3,0,1.5,1.5,0,'credit','sp',0,0,'2019-12-05 14:58:57'),
(12,'2','2019-12-10 00:00:00','10',10,'1','2019-12-10 00:00:00','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19',19,'RABINDRA PRASAD SINGH','','10AYZPS5231J1Z0','10',10,11800,1800,1800,0,0,0,'debit','asd',0,0,'2019-12-10 17:52:06'),
(13,'3','2019-12-10 00:00:00','10',10,'1','2019-12-10 00:00:00','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19',19,'IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19',19,11.8,1.8,1.8,0,0,0,'debit','asd',0,0,'2019-12-10 18:20:15'),
(14,'4','2019-12-10 00:00:00','10',10,'1','2019-12-10 00:00:00','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19',19,'IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','',0,42,2,2,0,0,0,'debit','asd',0,0,'2019-12-10 18:21:33');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;

-- 
-- Definition of test_ids
-- 

DROP TABLE IF EXISTS `test_ids`;
CREATE TABLE IF NOT EXISTS `test_ids` (
  `ids` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `manual_id` int(11) NOT NULL,
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table test_ids
-- 

/*!40000 ALTER TABLE `test_ids` DISABLE KEYS */;
INSERT INTO `test_ids`(`ids`,`date`,`manual_id`) VALUES
(1,'2019-11-02 00:00:00',5),
(2,'2019-11-01 00:00:00',4),
(3,'2019-10-01 00:00:00',1),
(4,'2019-11-03 00:00:00',6),
(5,'2019-10-02 00:00:00',2),
(6,'2019-11-03 00:00:00',7),
(7,'2019-10-03 00:00:00',3),
(8,'2019-11-03 00:00:00',8);
/*!40000 ALTER TABLE `test_ids` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2019-12-27 11:36:28
-- Total time: 0:0:0:0:913 (d:h:m:s:ms)
