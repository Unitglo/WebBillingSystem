-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2019-12-14 16:16:25
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE','7','2','PURCHASE','','','','','','','','0','','','','','',5000,'Debit',0,'2019-12-02 10:51:48'),
(2,'ADARSH POLYMERS','5','3','RAJESH KUMAR','No','','','PATNA','10','10','INDIA','0','10BDQPK7517J1ZE','BDQPK7517J','','','',1012316.09,'Debit',0,'2019-12-02 10:51:48'),
(3,'SALES','6','1','SALES','','','','','','','','0','','','1','','',2000,'Credit',0,'2019-12-02 10:51:48'),
(4,'A F ENTERPRISES','5','3','A F ENTERPRISES','No','','','','10','10','','0','10ABBFA7750K1ZO','ABBFA7750K','','','',1751900.35,'Debit',0,'2019-12-02 10:51:48'),
(5,'CGST-ITC A/C','1','2','CGST-ITC A/C','','','','','','','','0','','','','','',5000,'Debit',0,'2019-12-02 10:51:48'),
(6,'IGST-ITC A/C','1','1','IGST-ITC A/C','','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:51:48'),
(7,'SGST-ITC A/C','6','2','SGST-ITC A/C','','','','','','','','0','','','','','',0,'Debit',0,'2019-12-02 10:51:48'),
(8,'ANIL KUMAR MISHRA','5','3','ANIL KUMAR MISHRA','No','','','','9','9','','','09AJJPM9628A2Z0','AJJPM9628A','','','',19635,'Debit',0,'2019-12-04 07:25:48'),
(9,'ANS PET','5','1','ANS PET','No','','','','10','10','INDIA','','','','','','',240492.9,'Debit',0,'2019-12-04 07:30:53'),
(10,' APEX PET PRODUCTS PRIVATE LIMITED','5','1',' APEX PET PRODUCTS PRIVATE LIMITED','Yes','','','','10','10','INDIA','','10AALCA6381J1ZN','AALCA6381J','','','',4284693.18,'Debit',0,'2019-12-04 07:53:00'),
(11,'AQUA R.O FRESH','5','1','RAJU KUMAR','No','','','JEHANABAD','10','10','INDIA','','10DITPK4798B1Z2','DITPK4798B','','','',18499.46,'Debit',0,'2019-12-04 07:59:10'),
(12,'ARSH ENTERPRISES','5','1','ARSH ENTERPRISES','Yes','','','','10','10','INDIA','','','','','','',432914.86,'Debit',0,'2019-12-04 08:01:58'),
(13,'A S PET','5','1','POONAM KESHRI','No','','','PATNA','10','10','INDIA','','10AENPK6359M2Z3','AENPK6359M','','','',313038.14,'Debit',0,'2019-12-04 08:06:16'),
(14,'AUSH ENGINEERING','5','1','RAM KRISHNA CHOUDHARY','No','','','','10','10','','','10BJSPC1681F1ZJ','BJSPC1681F','','','',328657.14,'Debit',0,'2019-12-04 08:17:28'),
(15,'AWADH LAXMI MULTI SERVICES','5','1','AWADH LAXMI MULTI SERVICES','No','','','','10','10','INDIA','','','','','','',36924.85,'Debit',0,'2019-12-04 08:31:18'),
(16,'BALAJEE ENTERPRISES','5','1','BALAJEE ENTERPRISES','No','','','BEGUSARAI','10','10','INDIA','','10AALFB4388D1ZQ','AALFB4388D','','','',7243079.1,'Debit',0,'2019-12-04 08:34:32'),
(17,'B H M K AQUA TECH','5','1','B H M K AQUA TECH','No','','','','10','10','INDIA','','','','','','',1119031.47,'Debit',0,'2019-12-04 08:36:13'),
(18,'CITY PLASTIC','5','1','CITY PLASTIC','No','','','','10','10','INDIA','','10AIVPA63251Z7','AIVPA6325','','','',1693737.65,'Debit',0,'2019-12-04 08:40:38'),
(19,'DILIP ENTERPRISES','5','1','DILIP ENTERPRISES','No','','','','10','10','INDIA','','','','','','',357104.02,'Debit',0,'2019-12-04 08:42:14'),
(20,'D R POLYMAR','3','1','RABINDRA PRASAD SINGH','No','','','HAJIPUR','10','10','INDIA','','10AYZPS5231J1Z0','AYZPS5231J','','','',750929.64,'Debit',0,'2019-12-04 08:52:48'),
(21,'H20 TREATMENT SOLUTION','5','1','H20 TREATMENT SOLUTION','No','','','','10','10','INDIA','','10ACUPH3220P1Z','ACUPH3220','','','',333928.8,'Debit',0,'2019-12-04 08:57:42'),
(22,'HARSHIT PET','5','1','HARSHIT PET','No','','','','10','10','INDIA','','','','','','',165001.76,'Debit',0,'2019-12-04 08:59:27'),
(23,'HK CONTAINERS','5','1','HK CONTAINERS','No','KANKARBAGH','','PATNA','10','10','INDIA','','10AAGHS9988F1ZQ','AAGHS9988F','','','',83924.04,'Debit',0,'2019-12-04 09:29:50'),
(24,'HK POLYMERS','5','1','KANISHK','No','HAJIPUR','','HAJIPUR','10','10','INDIA','','10ALJPK6447R1ZM','ALJPK6447R','','','',1161568.45,'Debit',0,'2019-12-04 09:34:05'),
(25,'IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','3','1','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','No','','','TAMLUK','19','19','','','19AAFCD5214M1ZG','AAFCD5214M','','','',4532633,'Debit',0,'2019-12-04 09:41:28'),
(26,'JAGAT PLASTIC','5','1','AMARESH KUMAR','No','MUZAFFARPUR','','MUZAFFARPUR','10','10','INDIA','','10CKVPK6492D1ZY','CKVPK6492D','','','',1411036.28,'Debit',0,'2019-12-04 09:46:09'),
(27,'JAGNANI MINARAL WATER','5','1','JAGNANI MINARAL WATER','No','','','','10','10','INDIA','','','','','','',155226.64,'Debit',0,'2019-12-04 09:54:22'),
(28,'JAI MATA DI ROAD CONSTRUCTION PRIVATE LIMITED','3','1','JAI MATA DI ROAD CONSTRUCTION PVT. LTD.','No','KANKARBAGH ','','PATNA','10','10','INDIA','','10AABCM9484G2ZH','AABCM9484G','','','',29949.45,'Debit',0,'2019-12-04 10:48:22'),
(29,'JEEWAN DHARA','5','1','JEEWAN DHARA','No','','','','10','10','INDIA','','','','','','',834302.27,'Debit',0,'2019-12-04 10:53:24'),
(30,'J J AQUA INDUSTRIES','5','1','J J AQUA INDUSTRIES','No','','','','10','10','INDIA','','','','','','',835759.76,'Debit',0,'2019-12-04 11:31:27'),
(31,'KANHAIYA ENTERPRISES','5','1','KANHAIYA ENTERPRISES','No','','','','10','10','INDIA','','10AAOFK6723A1T','AAOFK6723','','','',1302012.28,'Debit',0,'2019-12-04 11:34:18'),
(32,'K.K.ENTERPRISES.','5','1','KAMLESH KUMAR ARYA','No','PURNEA','','PURNEA','10','10','INDIA','','10ACEPA5991Q1ZF','ACEPA5991Q','','','',290000.28,'Debit',0,'2019-12-04 11:40:51'),
(33,'K S PET','5','1','K S PET','No','','','','10','10','INDIA','','','','','','',630384.32,'Debit',0,'2019-12-04 11:42:16'),
(34,'KUMOD ENTERPRISES','5','1','KUMOD ENTERPRISES','No','HAJIPUR','','HAJIPUR','10','10','INDIA','','10BAAPK2348J1Z5','BAAPK2348J','','','',895501.36,'Debit',0,'2019-12-04 11:45:37'),
(35,'LAXMI ENTERPRISES','5','1','LAXMI ENTERPRISES','No','','','','10','10','INDIA','','','','','','',2379165.62,'Debit',0,'2019-12-04 11:47:58'),
(36,'LAXMI PACKAGING SOLUTION','5','1','LAXMI PACKAGING SOLUTION','No','SARAIDHELA ','','DHANBAD','10','10','INDIA','','20AAFFL9391J1Z3','AAFFL9391J','','','',70125.94,'Debit',0,'2019-12-04 11:52:25'),
(37,'MAGADH PET INDUSTRIES','5','1','ANUJ KUMAR','No','GAYA ','GAYA ','GAYA ','10','10','INDIA','','10AUGPK4859H1ZO','AUGPK4859H','','','',365642.52,'Debit',0,'2019-12-04 11:56:00'),
(38,'MANAS ENTERPRISES','5','1','ABHIRAM KUMAR','No','PATNA CITY ','PATNA CITY ','PATNA CITY WEST ','10','10','INDIA','','10AVWPK4090R1ZU','AVWPK4090R','','','',7832612.11,'Debit',0,'2019-12-04 11:59:24'),
(39,'MANASH BEVERAGE','5','1','RITU RAJ','No','MUZAFFARPUR','MUZAFFARPUR','MUZAFFARPUR EAST','10','10','INDIA','','10AWGPR6556A1ZT','AWGPR6556A','','','',83123.63,'Debit',0,'2019-12-04 12:11:55'),
(40,'MANISHA ENTERPRISES','5','1','MANISHA ENTERPRISES','No','','','','10','10','INDIA','','','','','','',812127.94,'Debit',0,'2019-12-04 12:14:09'),
(41,'MANISH KUMAR','5','1','MANISH KUMAR','No','','','','10','10','INDIA','','','','','','',221944.42,'Debit',0,'2019-12-04 12:16:01'),
(42,'MANSI ENTERPRISES','5','1','MANSI ENTERPRISES','No','','','','10','10','INDIA','','','','','','',1485915.62,'Debit',0,'2019-12-04 12:21:04'),
(43,'MARKEM - IMAJE INDIA PRIVATE LIMITED','3','1','M/S MARKEM - IMAJE INDIA PVT.LTD','No','NOIDA SECTOR-10','','','9','9','','','09AAACI2979R1ZP','AAACI2979R','','','',187122.94,'Credit',0,'2019-12-05 07:53:34'),
(44,'METRO BEVERAGES PRIVATE LIMITED','5','1','M/S METRO BEVERAGES PVT LTD.','No','DHANBAD ','DHANBAD ','DHANBAD','20','20','INDIA','','20AAHCM1113C1ZH','AAHCM1113C','','','',130797.1,'Debit',0,'2019-12-05 08:17:44'),
(45,'M.G. MOULD SYSTEMS PRIVATE LIMITED','3','1','M.G. MOULD SYSTEMS PRIVATE LIMITED','No','GURGAON','GURGAON','','6','6','INDIA','','06AAMCM1558J1Z6','AAMCM1558J','','','',45372.18,'Debit',0,'2019-12-05 08:23:36'),
(46,'MOHAN SAW','5','1','MOHAN SAW','No','','','','10','10','INDIA','','','','','','',177221.26,'Debit',0,'2019-12-05 08:26:34'),
(47,'M S ENTERPISES','5','1','M. S. ENTERPRISES','No','PURNEA','PURNEA','PURNEA','10','10','INDIA','','10AAXFM3957D1Z6','AAXFM3957D','','','',18447.83,'Debit',0,'2019-12-05 08:32:03'),
(48,'MUKESH KUMAR SAW','5','1','MUKESH KUMAR SAW','No','','','','10','10','INDIA','','','','','','',100000,'Debit',0,'2019-12-05 08:50:45'),
(49,'MUSKAN PET INDUSTRIES','5','1','MUSKAN PET INDUSTRIES','No','','','','10','10','INDIA','','10AFDPG8563NIZE','AFDPG8563N','','','',37500.4,'Debit',0,'2019-12-05 08:54:51'),
(50,'NEW MANGLAM FOOD & BEVERGE','5','1','NEW MANGLAM FOOD & BEVERGE','No','','','','10','10','INDIA','','','','','','',251251.5,'Debit',0,'2019-12-05 09:12:13'),
(51,'OM NIRMAL WATER PT LTD','5','1','OM NIRMAL WATER PT LTD','No','','','','10','10','INDIA','','','','','','',37500.4,'Debit',0,'2019-12-05 10:22:49'),
(52,'PAPPU ENTERPRISES','5','1','PAPPU ENTERPRISES','No','','','','10','10','INDIA','','','','','','',329912.07,'Debit',0,'2019-12-05 10:24:14'),
(53,'PAVISHA POLYMERS','5','1','PAVISHA POLYMERS','No','','','','10','10','INDIA','','','','','','',85063.26,'Debit',0,'2019-12-05 10:28:16'),
(54,'PRAYERS ENTERPRISES','5','1','PRAYERS ENTERPRISES','No','','','','10','10','INDIA','','','','','','',1639317.07,'Debit',0,'2019-12-05 10:30:32'),
(55,'PURE & SAFE AQUA INDUSTRIES','5','1','PURE & SAFE AQUA INDUSTRIES','No','HAJIPUR RANGE','HAJIPUR RANGE','HAJIPUR','10','10','INDIA','','10AAJFP0989J2Z1','AAJFP0989J','','','',280999.3,'Debit',0,'2019-12-06 09:22:06'),
(56,'QUAIS WATER AND BEVERAGE','5','1','MOHAMMAD QUAISER','No','PURNEA','PURNEA','PURNEA','10','10','INDIA','','10AADPQ4586G1ZS','AADPQ4586G','','','',1380173.46,'Debit',0,'2019-12-06 09:25:36'),
(57,'RAHUL ENTERPRISES','5','1','RAHUL ENTERPRISES','No','','','','10','10','INDIA','','','','','','',185455.29,'Debit',0,'2019-12-06 09:27:50'),
(58,'RAJ CONTAINER','5','1','SALENDRA KUMAR','No','PATNA CITY','PATNA CITY','PATNA CITY','10','10','INDIA','','10CNVPK9808G1ZO','CNVPK9808G','','','',44538.81,'Debit',0,'2019-12-06 09:33:16'),
(59,'RAJEEV ENTERPRISES','5','1','RASHMI JAISHWAL','No','CHHAPRA','CHHAPRA','SARAN ','10','10','INDIA','','10AFSPJ9013R1ZZ','AFSPJ9013R','','','',1662080.16,'Debit',0,'2019-12-06 09:39:41'),
(60,'M/S RAJU FOOD PRODUCTS','5','1','RAJU FOOD PRODUCTS','No','PURNEA','PURNEA','PURNEA','10','10','INDIA','','10AAIFR1904L1ZG','AAIFR1904L','','','',499589.98,'Debit',0,'2019-12-06 09:46:34'),
(61,'CREDIT','7','1','CREDIT','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',1000,'Credit',0,'2019-09-07 09:21:11'),
(62,'DEBIT','3','2','DEBIT','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',6000,'Debit',0,'2019-09-09 23:34:21'),
(63,'ADF','1','1','ADF','Yes','','','','27','27','','','','','','','',100,'Debit',0,'2019-12-12 17:52:10'),
(64,'AAA','1','1','AAA','Yes','','','','27','27','','','','','','','',0,'Debit',0,'2019-12-14 16:13:34');
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
(3,'AAA003','pms_test','Individual','TIWARY','KUMAR','SUNIL','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,','BY-PASS ROAD','','PATNA','10',10,'INDIA','800027','haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','0001-01-01 00:00:00','0001-01-01 00:00:00','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','priyankas9','Mmsp@12334','2019-09-07 09:01:50',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
(7,'laptop',0,'2019-12-10 13:47:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_dtl`(`exp_dtl_id`,`exp_voucherno`,`expenses_head`,`exp_product_name`,`exp_hsn_code`,`rate`,`exp_tax_value`,`exp_igst_rate`,`exp_igst_amount`,`exp_cgst_rate`,`exp_cgst_amount`,`exp_sgst_rate`,`exp_sgst_amount`,`exp_total_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(7,'3','print and script','laptop','0',18,'50000','18',9000,'0',0,'0',0,59000,0,1,'2019-12-03 11:46:55'),
(8,'3','print and script','pen','pen123',5,'60','5',3,'0',0,'0',0,63,0,1,'2019-12-03 11:46:59'),
(10,'2','print','lunch with guests','0',5,'500','5',25,'0',0,'0',0,525,0,0,'2019-12-10 13:46:58'),
(11,'2','print','laptop','123',0,'50000','0',0,'0',0,'0',0,50000,0,0,'2019-12-10 13:47:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_mst`(`exp_voucher_no`,`exp_voucher_date`,`exp_place_of_supply`,`exp_reverse_charge`,`exp_state`,`exp_state_code`,`exp_supplier_name`,`exp_supplier_addr`,`exp_supplier_gstin`,`exp_supplier_state`,`exp_supplier_state_code`,`expenses_head`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`company_name`,`auth_name`,`payment_mode`,`ca_approved_status`,`status`,`default_date`) VALUES
(2,'2019-12-10 00:00:00','pune','NO','10',10,'ASD','','','27',27,'print',50525,25,25,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',0,0,'2019-12-02 18:59:00'),
(3,'2019-12-03 00:00:00','mumbai','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','',0,'print and script',59063,9003,9003,0,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',0,1,'2019-12-03 11:03:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(24,'AAA002 ',1,'ASD',1000,0,0,0,'2019-11-30 12:13:23'),
(25,'AAA002 ',1,'ASD',0,1000,0,0,'2019-11-30 12:13:23'),
(30,'AAA002 ',1,'ASD',1000,0,0,0,'2019-11-30 12:24:44'),
(31,'AAA002 ',1,'ASD',0,1000,0,0,'2019-11-30 12:24:44'),
(39,'AAA002 ',2,'ASD',200,0,0,0,'2019-12-10 13:49:47'),
(40,'AAA002 ',2,'ASD',2000,0,0,0,'2019-12-10 13:49:50'),
(41,'AAA002 ',2,'ASD',800,0,0,0,'2019-12-10 13:49:52'),
(42,'AAA002 ',2,'ASD',1000,0,0,0,'2019-12-10 13:49:53'),
(43,'AAA002 ',2,'ASD',0,1000,0,0,'2019-12-10 13:49:54'),
(44,'AAA002 ',2,'ASD',0,1000,0,0,'2019-12-10 13:49:55'),
(45,'AAA002 ',2,'ASD',0,2000,0,0,'2019-12-10 13:49:55'),
(46,'AAA002 ',5,'DEBIT',40,0,0,0,'2019-12-10 18:26:00'),
(47,'AAA002 ',5,'IGST-ITC A/C',2,0,0,0,'2019-12-10 18:26:01'),
(48,'AAA002 ',5,'CREDIT',0,42,0,0,'2019-12-10 18:26:02'),
(51,'AAA002 ',6,'ADARSH POLYMERS',5000,0,0,0,'2019-12-11 18:31:59'),
(52,'AAA002 ',6,'ANIL KUMAR MISHRA',0,5000,0,0,'2019-12-11 18:32:01'),
(53,'AAA002 ',7,'ANIL KUMAR MISHRA',3000,0,0,0,'2019-12-13 17:50:49'),
(54,'AAA002 ',7,'AWADH LAXMI MULTI SERVICES',0,3000,0,0,'2019-12-13 17:50:53'),
(55,'AAA002 ',8,'ADARSH POLYMERS',2000,0,0,0,'2019-12-13 17:54:20'),
(56,'AAA002 ',8,'B H M K AQUA TECH',0,1000,0,0,'2019-12-13 17:54:21'),
(57,'AAA002 ',8,'AWADH LAXMI MULTI SERVICES',0,1000,0,0,'2019-12-13 17:54:21'),
(58,'AAA002 ',10,'IGST-ITC A/C',1000,0,0,0,'2019-12-14 15:56:34'),
(59,'AAA002 ',10,' APEX PET PRODUCTS PRIVATE LIMITED',0,1000,0,0,'2019-12-14 15:56:35');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA002',9,1,'2019-11-30 00:00:00',1000,1000,'asdf',0,0,'2019-11-30 12:13:22'),
('AAA002',7,2,'2019-11-29 00:00:00',4000,4000,'asdf',0,0,'2019-11-30 12:14:15'),
('AAA002',8,3,'2019-11-29 00:00:00',2000,2000,'asdf',0,0,'2019-11-30 12:20:05'),
('AAA002',10,4,'0001-01-01 00:00:00',0,0,'fghasdf',0,0,'2019-11-30 12:24:44'),
('AAA002',11,5,'2019-12-10 00:00:00',42,42,'asd',0,0,'2019-12-10 18:25:58'),
('AAA002',6,6,'2019-10-11 00:00:00',5000,5000,'asd',0,0,'2019-12-11 18:03:43'),
('AAA002',3,7,'2012-11-13 00:00:00',3000,3000,'asdf',0,0,'2019-12-13 17:50:47'),
('AAA002',4,8,'2018-12-13 00:00:00',2000,2000,'ASD',0,0,'2019-12-13 17:54:19'),
('AAA002',1,9,'0001-01-01 00:00:00',0,0,'asd',0,0,'2019-12-14 13:34:25'),
('AAA002',2,10,'0001-01-01 00:00:00',0,0,'',0,0,'2019-12-14 15:54:51'),
('AAA002',5,11,'2018-12-14 00:00:00',1000,1000,'asd',0,0,'2019-12-14 15:56:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`seller_no`,`statecode`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(14,14,'1','Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)',10,'LAPTOP','','PAC-PACKS','','0001-01-01 00:00:00',1,18,48000,0,48000,18,8640,0,0,0,0,0,1,'purchase','2019-12-03 13:43:26'),
(15,15,'3','IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED',10,'LAPTOP','','ream','','0001-01-01 00:00:00',1,18,50000,500,49500,18,8910,0,0,0,0,0,0,'purchase','2019-12-10 18:30:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`ca_approved_status`,`status`,`default_date`) VALUES
(14,'1','2019-12-03 00:00:00','NO','10',10,'Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)','','','','',56640,8640,8640,0,0,0,'Cash','Paid','purchase','ASD',0,0,'2019-12-03 13:43:24'),
(15,'3','2019-12-10 00:00:00','NO','10',10,'IVL DHUNSERI PETROCHEM INDUSTRIES PRIVATE LIMITED','','19AAFCD5214M1ZG','19','19',58410,8910,8910,0,0,500,'Cash','Paid','purchase','asd',0,0,'2019-12-10 18:30:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(7,'1','1','LAPTOP','ream','PAC-PACKS','ream','70.70',1,'','18','50000','52000','2019-10-01 00:00:00','A',5,48000,240000,'10','10','10',0,'2019-12-09 15:05:15'),
(8,'2','1','BOTTLE','BTL-BOTTLES','','','',0,'','5','50','60','2019-10-01 00:00:00','A',0,0,0,'10','40','',0,'2019-12-05 17:04:56'),
(9,'1','1','CABLE','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'123','18','6000','7000','2026-01-01 00:00:00','A',10,5000,50000,'0','0','0',0,'2019-12-09 11:34:44'),
(10,'1','1','CHARGER','KGS-KILOGRAMS','KGS-KILOGRAMS','ream','79.70',0,'12345','10','3000','3500','2020-02-05 00:00:00','B',6.5,3000.6,19503.9,'0','0','0',0,'2019-12-13 11:36:09');
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


-- Dump completed on 2019-12-14 16:16:27
-- Total time: 0:0:0:2:299 (d:h:m:s:ms)
