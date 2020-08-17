-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-03-03 11:39:59
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE A/C','7','2','PURCHASE A/C','Yes','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(2,'ACCOUNTANCY CHARGE PAYABLE','3','3','ACCOUNTANCY CHARGE PAYABLE','No','','','','0',0,'','0','','','','','',12000,'Credit',0,'2019-12-02 05:23:22'),
(3,'SALES A/C','6','1','SALES A/C','Yes','','','','0',0,'','0','','','1','','',0,'Credit',0,'2019-12-02 05:23:22'),
(4,'AIR CONDITION & STEBLIZER','4','1','AIR CONDITION & STEBLIZER','No','','','','0',0,'','0','','','','','',45421,'Debit',0,'2019-12-02 05:23:22'),
(5,'CGST-ITC A/C','5','6','CGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(6,'IGST-ITC A/C','5','6','IGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(7,'SGST-ITC A/C','5','6','SGST-ITC A/C','No','','','','0',0,'','0','','','','','',0,'Debit',0,'2019-12-02 05:23:22'),
(8,'AMRIT ENTERPRISES','5','3','RENU PANDIT','No','COLLEGE ROAD','MUNGER','MUNGER','10',10,'INDIA','','10AKOPP5113H1ZE','AKOPP5113H','','','',951984,'Debit',0,'2019-12-02 14:05:33'),
(9,'AUDIT FEE PAYABLE','3','3','AUDIT FEE PAYABLE','No','','','','0',0,'','','','','','','',11000,'Credit',0,'2019-12-02 14:34:30'),
(10,'AUTO ACE','4','1','AUTO ACE','No','','','','0',0,'','','','','','','',78220,'Debit',0,'2019-12-02 14:36:09'),
(11,'AXIS BANK  A/C NO.916020025351806','5','4','AXIS BANK  A/C NO.916020025351806','No','','','','0',0,'','','','','','','',14355.45,'Debit',0,'2019-12-02 14:37:42'),
(12,'AXIS BANK LTD (OD AC-917030074838374)','3','1','AXIS BANK LTD (OD AC-917030074838374)','No','','','','0',0,'','','','','','','',296723,'Credit',0,'2019-12-02 14:39:41'),
(13,'BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','3','1','BAJAJ FINANANCE LTD.(A/C NO- 4L6BFR54786687)','','','','','0',0,'','','','','','','',1101867,'Credit',0,'2019-12-02 14:40:49'),
(14,'CASH A/C','5','4','CASH A/C','No','','','','0',0,'','','','','','','',56896.34,'Debit',0,'2019-12-02 14:41:52'),
(15,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','3','1','CENTRAL BANK OF INDIA CC-A/C NO.3170157625','No','','','','0',0,'','','','','','','',427750.08,'Credit',0,'2019-12-02 14:58:49'),
(16,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543','5','4','CENTRAL BANK OF INDIA S/B A/C NO.3307952543','No','','','','0',0,'','','','','','','',1942.29,'Debit',0,'2019-12-02 14:59:51'),
(17,'CUSTOM DUTY RECEIABLE','5','6','CUSTOM DUTY RECEIABLE','No','','','','0',0,'','','','','','','',195906,'Debit',0,'2019-12-02 15:00:51'),
(18,'DESIGNEX DIGITAL','5','3','MADHU KANT PRASAD','No','1 ST FLOOR, LALSLION BUILDING,','OPP GOLDEN ICE CREAM FACTORY, EXHIBITION ROAD,','PATNA','10',10,'INDIA','800001','10AMSPP5547M1ZH','AMSPP5547M','','','',629616,'Debit',0,'2019-12-02 15:05:55'),
(19,'EQUIPMENT','4','1','EQUIPMENT','No','','','','0',0,'','','','','','','',3586,'Debit',0,'2019-12-02 15:06:58'),
(20,'EXCEL ENTERPRISES','5','3','EXCEL ENTERPRISES','No','KADAMKUAN','','PATNA','10',10,'INDIA','800003','10AADFE9983D1ZK','AADFE9983D','','','',320912,'Debit',0,'2019-12-02 15:10:04'),
(21,'EXCESS GST PAID','5','6','EXCESS GST PAID','No','','','','0',0,'','','','','','','',553673.83,'Debit',0,'2019-12-02 15:10:55'),
(22,'EXCESS INPUT VAT','5','6','EXCESS INPUT VAT','No','','','','0',0,'','','','','','','',102742.37,'Debit',0,'2019-12-02 15:11:57'),
(23,'FURNITURE & FIXTURE','5','1','FURNITURE & FIXTURE','No','','','','0',0,'','','','','','','',9976,'Debit',0,'2019-12-02 15:12:52'),
(24,'GOLD EAST TRADING(HONG KONG) COMPANY','3','2','GOLD EAST TRADING(HONG KONG) COMPANY','No','','','','0',0,'HONG KONG','','','','','','',750084.2,'Credit',0,'2019-12-02 15:25:05'),
(25,'HDFC BANK  LTD. (A/C NO- 50200026260502)','5','4','HDFC BANK  LTD. (A/C NO- 50200026260502)','No','','','','0',0,'','','','','','','',552,'Debit',0,'2019-12-02 15:26:24'),
(26,'INCOME TAX ADV.','5','6','INCOME TAX ADV.','No','','','','0',0,'','','','','','','',10000,'Debit',0,'2019-12-02 15:27:26'),
(27,'INDICA CAR','4','1','INDICA CAR','No','','','','0',0,'','','','','','','',66268,'Debit',0,'2019-12-02 15:28:36'),
(28,'MAGMA FINCORP LTD.','3','1','MAGMA FINCORP LTD.','No','','','','0',0,'','','','','','','',133484,'Credit',0,'2019-12-02 15:29:55'),
(29,'MANGALAM PAPERS & CARDS','5','1','KUMARI VANDANA','No','AMBEDKAR MARKET COMPLEX','DAKBUNGLOW','GAYA','10',10,'','823001','10AEGPV7460M1Z4','AEGPV7460M','','','',114624,'Debit',0,'2019-12-02 15:32:53'),
(30,'MOBILE PHONE','4','1','MOBILE PHONE','No','','','','0',0,'','','','','','','',14365,'Debit',0,'2019-12-02 15:39:44'),
(31,'NATIONAL PAPER HOUSE','5','3','NATIONAL PAPER HOUSE','No','KADAMKUAN','','PATNA','10',10,'INDIA','800003','10AACFN4095Q1Z0','AACFN4095Q','','','',210575,'Debit',0,'2019-12-02 15:42:59'),
(32,'OFFICE RENT PAYABLE','3','3','OFFICE RENT PAYABLE','No','','','','0',0,'','','','','','','',12000,'Credit',0,'2019-12-02 15:44:45'),
(33,'ORIENT LINKS CO.(L.L.C)','3','2','ORIENT LINKS CO.(L.L.C)','No','THE ATRIUM CENTER, OFFICE NO 609,','KHALIDBIN WALLED ROAD, PO BOX NO 52708,','','0',0,'DUBAI','','','','','','',209696.06,'Credit',0,'2019-12-02 15:48:39'),
(34,'POST OFFICE (RD A/C)NO.12478','4','5','POST OFFICE (RD A/C)NO.12478','No','','','','0',0,'','','','','','','',115500,'Debit',0,'2019-12-02 15:55:15'),
(35,'POST OFFICE R/D A/C NO.385957145','4','5','POST OFFICE R/D A/C NO.385957145','No','','','','0',0,'','','','','','','',14000,'Debit',0,'2019-12-02 15:56:11'),
(36,'POST OFFICE S/B A/C 3849213945','5','4','POST OFFICE S/B A/C 3849213945','No','','','','0',0,'','','','','','','',158,'Debit',0,'2019-12-02 15:57:01'),
(37,'PRINTING MACHINE','4','1','PRINTING MACHINE','No','','','','0',0,'','','','','','','',64008,'Debit',0,'2019-12-02 15:57:58'),
(38,'RAJIV RANJAN (PROP)','1','1','RAJIV RANJAN (PROP)','No','','','','0',0,'','','','','','','',6189944.85,'Credit',0,'2019-12-02 16:12:57'),
(39,'SALARY PAYABLE','3','3','SALARY PAYABLE','No','','','','0',0,'','','','','','','',18600,'Credit',0,'2019-12-02 16:16:32'),
(40,'SAMRAT OFFSET','5','3','RASHIDA BANO','No','JAMUN GALI','SABZI BAGH','PATNA','10',10,'INDIA','800004','10AHJPB3509R1ZF','AHJPB3509R','','','',15126,'Debit',0,'2019-12-02 16:19:47'),
(41,'SCOOTY','4','1','SCOOTY','No','','','','0',0,'','','','','','','',40800,'Debit',0,'2019-12-02 16:20:37'),
(42,'SHRI DURGA PRINTING WORKS','5','3','PRADEEP KUMAR','No','KANKARBAGH','','PATNA','10',10,'INDIA','800020','10AKTPK0647A1ZN','AKTPK0647A','','','',100000,'Credit',0,'2019-12-02 16:23:42'),
(43,'STATE BANK OF INDIA A/C NO.35029039458','5','4','STATE BANK OF INDIA A/C NO.35029039458','No','','','','0',0,'','','','','','','',140206.79,'Debit',0,'2019-12-02 16:25:15'),
(44,'TDS ( ASSETS )','5','6','TDS ( ASSETS )','No','','','','0',0,'','','','','','','',9515,'Debit',0,'2019-12-02 16:26:10'),
(45,'UNITED BANK OF INDIA  S/B A/C NO.0474010056707','5','4','UNITED BANK OF INDIA  S/B A/C NO.0474010056707','No','','','','0',0,'','','','','','','',6069.33,'Debit',0,'2019-12-02 16:27:10'),
(46,'VITAL SOLUTIONS PTE LTD.','3','2','VITAL SOLUTIONS PTE LTD.','No','#21-01, ROBINSON 77,','ROBINSON ROAD,','','0',0,'SINGAPUR','068896','','','','','',445921.35,'Credit',0,'2019-12-02 16:29:27'),
(47,'OP STOCK','5','2','OP STOCK','No','','','','0',0,'','','','','','','',5922072.14,'Debit',0,'2019-12-02 17:37:42'),
(48,'SALARY AND WAGES','7','3','SALARY AND WAGES','No','','','','0',0,'','','','','','','',0,'Credit',0,'2019-12-03 11:09:52'),
(49,'MISC EXPENSES','7','5','MISC EXPENSES','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-06 14:42:12'),
(50,'INTEREST','6','2','INTEREST','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-06 14:49:01'),
(51,'PRINTING & STATIONERY','7','5','','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-09 11:37:47'),
(52,'CREDIT A/C','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27',27,'IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-06 22:21:11'),
(53,'DEBIT A/C','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27',27,'india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 12:34:21'),
(54,'REPAIR & MAINTENENCE','7','5','REPAIR & MAINTENENCE','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:45:59'),
(55,'FREIGHT','7','5','FREIGHT','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:48:33'),
(56,'BANK CHARGES','7','5','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-12 10:50:16'),
(57,'KHANNA PAPER MILLS LTD','3','2','KHANNA PAPER MILLS LTD','Yes','NH 3, BY PASS ROAD,','OPP METRO CASH & CARRY','AMRITSAR','3',3,'INDIA','143001','03AAACK1375K1ZP','AAACK1375K','','','',0,'Debit',0,'2019-12-13 11:32:34'),
(58,'TRAVELLING EXPENSES','7','5','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-17 05:16:28'),
(59,'AUDIT FEE','7','5','AUDIT FEE','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-17 11:59:12'),
(60,'INTEREST EXPENSES','7','5','','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-25 17:29:40'),
(61,'PRASHASTI PRINTERS','5','3','PRASHASTI PRINTERS','No','BANGALI AKHARA','LANGARTOLI','PATNA','10',10,'INDIA','800004','10AGQPT0294D1ZH','AGQPT0294D','','','',0,'Debit',0,'2019-12-25 18:18:22'),
(62,'RAVI RANJAN ( PROP )','5','6','RAVI RANJAN ( PROP )','No','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-27 14:56:51'),
(63,'RENT','7','5','','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2019-12-27 14:57:38'),
(66,'SALES RETURN A/C','7','2','SALES RETURN A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-11 13:13:33'),
(68,'CGST-OTL A/C','3','3','CGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:10:45'),
(69,'SGST-OTL A/C','3','3','SGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:13:02'),
(70,'IGST-OTL A/C','3','3','IGST-OTL A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-17 12:13:33'),
(71,'PURCHASE RETURN A/C','7','2','PURCHASE RETURN A/C','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-18 06:33:17'),
(73,'WER','1','1','WER','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-01-22 13:04:59'),
(74,'ABC','3','1','ABC','Yes','','','','27',27,'','','','','','','',0,'Debit',0,'2020-01-27 12:16:07'),
(87,'ASD','1','1','ASD','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-13 16:10:38'),
(88,'AAA BBB CCC','6','1','AAA','Yes','','','','0',0,'','','','','','','',0,'Debit',2,'2020-02-21 12:25:16'),
(89,'ABCD','1','1','ABC','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-24 17:36:30'),
(90,'ABC DASD','1','1','ABC DASD','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-29 12:10:20'),
(91,'PS','1','1','PS','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-29 12:13:50'),
(92,'ABC SP','1','1','ABC SP','Yes','','','','0',0,'','','','','','','',0,'Debit',0,'2020-02-29 12:18:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;
INSERT INTO `pms_expenses_product_name`(`auto_incr_id`,`expe_product_name`,`status`,`default_date`) VALUES
(1,'launch',0,'2020-02-26 11:38:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_dtl`(`exp_dtl_id`,`exp_voucherno`,`expenses_head`,`exp_product_name`,`exp_hsn_code`,`rate`,`exp_tax_value`,`exp_igst_rate`,`exp_igst_amount`,`exp_cgst_rate`,`exp_cgst_amount`,`exp_sgst_rate`,`exp_sgst_amount`,`exp_total_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'1','','launch','123',15,'501256.46','15',75188.47,'0',0,'0',0,501256.46,0,0,'2020-02-26 11:38:28');
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
  `expenses_jv_id` int(11) NOT NULL DEFAULT '0',
  `ca_approved_status` int(1) NOT NULL DEFAULT '0' COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_mst`(`exp_voucher_no`,`exp_voucher_date`,`exp_place_of_supply`,`exp_reverse_charge`,`exp_state`,`exp_state_code`,`exp_supplier_name`,`exp_supplier_addr`,`exp_supplier_gstin`,`exp_supplier_state`,`exp_supplier_state_code`,`expenses_head`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`company_name`,`auth_name`,`payment_mode`,`expenses_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'2020-02-26 00:00:00','','NO','10',10,'','','','',0,'',501256.46,75188.47,75188.47,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','MUKUND MOHAN SAHAY','Cash',0,0,0,'2020-02-26 11:38:28'),
(2,'2020-02-26 00:00:00','','NO','10',10,'','','','',0,'',100000,0,0,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','MUKUND MOHAN SAHAY','',0,0,0,'2020-02-26 11:53:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(30,'AAA002 ',3,'AUDIT FEE PAYABLE',1000,0,0,0,'2020-02-25 12:40:49'),
(31,'AAA002 ',3,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625',0,500,0,0,'2020-02-25 12:40:49'),
(32,'AAA002 ',3,'AXIS BANK  A/C NO.916020025351806',0,500,0,0,'2020-02-25 12:40:49'),
(38,'AAA002 ',2,'PURCHASE A/C',605000.2,0,0,0,'2020-02-25 12:42:27'),
(39,'AAA002 ',2,'CGST-ITC A/C',54450.02,0,0,0,'2020-02-25 12:42:27'),
(40,'AAA002 ',2,'SGST-ITC A/C',54450.02,0,0,0,'2020-02-25 12:42:27'),
(41,'AAA002 ',2,'DESIGNEX DIGITAL',0,713900.24,0,0,'2020-02-25 12:42:27'),
(42,'AAA002 ',4,'ACCOUNTANCY CHARGE PAYABLE',4000,0,0,0,'2020-02-25 15:39:01'),
(43,'AAA002 ',4,'TRAVELLING EXPENSES',0,522,0,0,'2020-02-25 15:39:01'),
(44,'AAA002 ',4,'AXIS BANK LTD (OD AC-917030074838374)',0,500,0,0,'2020-02-25 15:39:01'),
(45,'AAA002 ',4,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543',0,3000,0,0,'2020-02-25 15:39:01'),
(46,'AAA002 ',4,'AIR CONDITION & STEBLIZER',22,0,0,0,'2020-02-25 15:39:01'),
(47,'AAA002 ',5,'ACCOUNTANCY CHARGE PAYABLE',4000,0,0,0,'2020-02-25 15:39:03'),
(48,'AAA002 ',5,'TRAVELLING EXPENSES',0,522,0,0,'2020-02-25 15:39:03'),
(49,'AAA002 ',5,'AXIS BANK LTD (OD AC-917030074838374)',0,500,0,0,'2020-02-25 15:39:04'),
(50,'AAA002 ',5,'CENTRAL BANK OF INDIA S/B A/C NO.3307952543',0,3000,0,0,'2020-02-25 15:39:04'),
(51,'AAA002 ',5,'AIR CONDITION & STEBLIZER',22,0,0,0,'2020-02-25 15:39:04'),
(52,'AAA002 ',1,'DESIGNEX DIGITAL',18246.63,0,0,0,'2020-03-02 15:00:49'),
(53,'AAA002 ',1,'CGST-OTL A/C',0,1273.04,0,0,'2020-03-02 15:00:49'),
(54,'AAA002 ',1,'SGST-OTL A/C',0,1273.04,0,0,'2020-03-02 15:00:49'),
(55,'AAA002 ',1,'SALES A/C',0,15700.55,0,0,'2020-03-02 15:00:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA002',4,1,'2020-02-21 00:00:00',18246.63,18246.63,'',1,'sales',2,0,'2020-02-21 13:31:46'),
('AAA002',1,2,'2020-02-01 00:00:00',713900.24,713900.24,'',1,'purchase',0,0,'2020-02-21 14:47:32'),
('AAA002',5,3,'2020-02-25 00:00:00',1000,1000,'asd',0,'journal',0,0,'2020-02-25 12:40:49'),
('AAA002',2,4,'2020-02-01 00:00:00',4022,4022,'asdfghj',0,'journal',0,0,'2020-02-25 15:39:01'),
('AAA002',3,5,'2020-02-01 00:00:00',4022,4022,'asdfghj',0,'journal',0,0,'2020-02-25 15:39:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(1,'invoice','PMS/1920/',1,0,'2020-02-21 12:52:24'),
(2,'invoice','INVOICE/1920/',0,0,'2020-02-21 12:52:26'),
(3,'debit','DEBIT/1920/',0,0,'2020-02-21 12:52:28'),
(4,'debit','PMS/DEBIT/',0,0,'2020-02-21 12:52:31'),
(5,'credit','CREDIT/1920/',0,0,'2020-02-21 12:52:33');
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
(1,'1 Write a terms and conditions section addressing price State clearly what the price does or doesn t include such as duties or taxes 2 Provide a paragraph defining terms or words used that might cause customer confusion For example use of the word goods may refer to both product and services in your','MUKUND MOHAN SAHAY','NEERAJ KUMAR','0','','1','50000000','1','2020-03-03 00:00:00','0','1','A','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket Price\tAverage Cost Price','0',1,'0',1,'0',1,'0','1','1','ABC','0',0,'2020-02-21 12:52:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_news_and_update
-- 

/*!40000 ALTER TABLE `pms_news_and_update` DISABLE KEYS */;
INSERT INTO `pms_news_and_update`(`auto_id`,`pms_news_title`,`pms_news_description`,`pms_news_validate_from_date`,`pms_news_validate_to_date`,`pms_news_in_out_app`,`pms_news_outapp_link`,`status`,`default_date`) VALUES
(1,'PS','ps DAJCASHDC SJHSDBS JSDBSJK HDNSLKJDCN KHDID KDKaj','2020-01-05 00:00:00','2020-02-28 00:00:00',0,'http://localhost:53130/News/News_And_Updates',0,'2020-01-13 19:40:02'),
(2,'Please Keep Silence','huhsydbsjafgywuehsjdfiuhdfjkancjabcsajfbwgef gyyed guiehqwd uqhdeqw uiqwhq ','2020-01-13 00:00:00','2020-01-13 00:00:00',1,'',0,'2020-01-13 19:49:42'),
(3,'XYZ','smmt','2020-01-10 00:00:00','2020-01-10 00:00:00',0,'http://www.google.com',0,'2020-01-23 12:31:20'),
(4,'Abc','abc','2020-01-23 00:00:00','2020-03-31 00:00:00',1,'',2,'2020-01-23 12:32:34'),
(5,'Holidays','Today is shivratri festival, in 21 feb 2020','2020-02-20 00:00:00','2020-02-21 00:00:00',1,'',0,'2020-02-20 23:27:15');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(10,1,'1','LAPTOP','','Nos - Numbers','A','0001-01-01 00:00:00',1,50000,0,600000,0,0,9,54000,9,54000,0,0,'purchase','2020-02-27 15:43:38'),
(11,1,'1','CABLE','123','KGS-KILOGRAMS','A','2020-03-03 00:00:00',1,5000.2,0,5000.2,0,0,9,450.02,9,450.02,0,0,'purchase','2020-02-27 15:43:38');
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
(1,'1','','2020-02-01 00:00:00','NO','10',10,'MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10',713900.24,108900.04,0,54450.02,54450.02,0,'Cash','Paid','purchase','',2,0,0,'2020-02-21 14:46:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(21,1,'PMS/1920/1','LAPTOP','','Nos - Numbers','A','2020-03-03 00:00:00',1,18,5200.12,0,5200.12,0,0,9,468.01,9,468.01,0,0,'sales','2020-03-02 15:00:33'),
(22,1,'PMS/1920/1','CABLE','123','KGS-KILOGRAMS','A','2020-03-03 00:00:00',1,18,7000.2,0,7000.2,0,0,9,630.02,9,630.02,0,0,'sales','2020-03-02 15:00:34'),
(23,1,'PMS/1920/1','CHARGER','12345','KGS-KILOGRAMS','A','2020-03-03 00:00:00',1,10,3500.23,0,3500.23,0,0,5,175.01,5,175.01,0,0,'sales','2020-03-02 15:00:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'PMS/1920/1','','Regular','2020-02-21 00:00:00','NO','10',10,'ROAD','MH-12 6356','2020-02-21 00:00:00','PUNE','MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar','10','MADHU KANT PRASAD','1 ST FLOOR, LALSLION BUILDING,','10AMSPP5547M1ZH','Bihar',10,18246.63,'0.00',0,1273.04,1273.04,0,'UNION BANK OF INDIA','987654321123','UBIN000123','  MADAN MOHAN MISHRA PVT LTD','1 Write a terms and conditions section addressing price State clearly what the price does or doesn t include such as duties or taxes 2 Provide a paragraph defining terms or words used that might cause customer confusion For example use of the word goods may refer to both product and services in your','MUKUND MOHAN SAHAY','Cash','Paid','','',1,2,0,'2020-02-21 13:31:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(7,'1','1','LAPTOP','Nos - Numbers','BOX-BOX','Nos - Numbers','12',1,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',0,'2019-12-28 19:16:30'),
(8,'2','1','BOTTLE','BTL-BOTTLES','','','',0,'','5','50','60','2019-10-01 00:00:00','A',0,0,0,'10','40','',2,'2020-01-22 16:53:41'),
(9,'1','1','CABLE','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'123','18','6000','7000','2026-01-01 00:00:00','A',10,5000,50000,'0','0','0',0,'2019-12-09 11:34:44'),
(10,'1','1','CHARGER','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'12345','10','3000','3500','2020-02-05 00:00:00','B',6.5,3000.6,19503.9,'0','0','0',0,'2019-12-13 11:36:09'),
(11,'1','1','AC','BOX-BOX','BOX-BOX','REAM','79.70',0,'','18','15000','1000','2020-02-24 00:00:00','A',10,13000,130000,'0','0','0',0,'2019-12-17 15:19:04'),
(12,'1','1','FAN','DOZ-DOZENS','DOZ-DOZENS','REAM','7970',0,'','10','1200','1100','0001-01-01 00:00:00','A',15,1000,15000,'0','0','0',0,'2019-12-17 15:28:48'),
(13,'2','1','PENCIL','','','','',0,'123','5','','','0001-01-01 00:00:00','',0,0,0,'','','',2,'2020-02-21 12:31:55'),
(14,'2','1','USB','','','','',0,'234','5','','','0001-01-01 00:00:00','',0,0,0,'','','',0,'2019-12-18 13:21:03'),
(15,'1','1','CHAIR','BOX-BOX','BOX-BOX','Nos - Numbers','12',0,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',0,'2020-01-22 16:54:42'),
(16,'1','1','MOBILE','BOX-BOX','BOX-BOX','Nos - Numbers','12',0,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',0,'2020-01-02 13:11:58'),
(17,'','','MOBILE','','BOX-BOX','Nos - Numbers','12',0,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',2,'2020-01-22 16:54:04'),
(18,'','','MOBILE','','BOX-BOX','Nos - Numbers','12',0,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',2,'2020-01-22 16:54:12'),
(19,'2','1','QWE','','','','',0,'123','5','','','0001-01-01 00:00:00','0',0,0,0,'0','0','0',2,'2020-01-22 16:53:53'),
(20,'2','1','BAG','','','','',0,'123','5','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0',0,'2020-02-13 17:33:35'),
(21,'1','1','PENCIL','BOX-BOX','BOX-BOX','REAM','70.79',0,'12345','10','500','600','0001-01-01 00:00:00','A',55,450,3025,'0','0','0',0,'2020-02-21 12:40:15');
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


-- Dump completed on 2020-03-03 11:40:00
-- Total time: 0:0:0:1:70 (d:h:m:s:ms)
