-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-09-05 11:06:15
-- --------------------------------------
-- Server version 10.4.14-MariaDB mariadb.org binary distribution


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'PURCHASE A/C','7','2','PURCHASE A/C','Yes','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(2,'SALES A/C','6','1','SALES A/C','Yes','','','','0','','','0','','','1','','',0,'Credit',0,'2019-12-02 10:53:22'),
(3,'CGST-ITC A/C','5','6','CGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(4,'IGST-ITC A/C','5','6','IGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(5,'SGST-ITC A/C','5','6','SGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22'),
(6,'CASH A/C','5','4','CASH A/C','No','','','','0','','','','','','','','',10000,'Debit',0,'2019-12-02 20:11:52'),
(7,'CREDIT A/C','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-07 03:51:11'),
(8,'DEBIT A/C','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 18:04:21'),
(9,'SALES RETURN A/C','7','2','SALES RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-11 18:43:33'),
(10,'CGST-OTL A/C','3','3','CGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:40:45'),
(11,'SGST-OTL A/C','3','3','SGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:02'),
(12,'IGST-OTL A/C','3','3','IGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:33'),
(13,'PURCHASE RETURN A/C','7','2','PURCHASE RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-18 12:03:17'),
(14,'RB ENTERPRISES','3','2','RB ENTERPRISES','Yes','','','','0','','','','','','','','',15000,'Credit',0,'2020-08-29 23:17:37'),
(15,'COMPUTER TECHNO','3','2','COMPUTER TECHNO','Yes','','','','0','','','','','','','','',27000,'Credit',0,'2020-08-29 23:18:18'),
(16,'JAI MATA DI TELECOM','3','2','JAI MATA DI TELECOM','Yes','','','','0','','','','','','','','',24000,'Credit',0,'2020-08-29 23:20:43'),
(17,'COMPUTER GHAR','3','2','COMPUTER GHAR','Yes','','','','0','','','','','','','','',45000,'Credit',0,'2020-08-29 23:21:25'),
(18,'RAHI ENTERPRISES','3','2','RAHI ENTERPRISES','Yes','','','','0','','','','','','','','',24000,'Credit',0,'2020-08-29 23:22:02'),
(19,'BANK LOAN (1244)','2','1','BANK LOAN (1244)','Yes','','','','0','','','','','','','','',1500000,'Credit',0,'2020-08-29 23:23:20'),
(20,'CAPITAL','1','1','CAPITAL','Yes','','','','0','','','','','','','','',1800000,'Credit',0,'2020-08-29 23:25:52'),
(21,'ABHISEK TELEVISION ','5','3','ABHISEK TELEVISION ','Yes','','','','0','','','','','','','','',12700,'Debit',0,'2020-08-29 23:26:37'),
(22,'TECHINACL JAIN','5','3','TECHINACL JAIN','Yes','','','','0','','','','','','','','',1540,'Debit',0,'2020-08-29 23:27:22'),
(23,'SAI ENTERPRISSES','5','3','SAI ENTERPRISSES','Yes','','','','0','','','','','','','','',1780,'Debit',0,'2020-08-29 23:28:06'),
(24,'PIYUSH KUMAR','5','3','PIYUSH KUMAR','Yes','','','','0','','','','','','','','',12500,'Debit',0,'2020-08-29 23:28:52'),
(25,'GANPATI TRADERS','5','3','GANPATI TRADERS','Yes','','','','0','','','','','','','','',1475,'Debit',0,'2020-08-29 23:29:36'),
(26,'MUKUND M SAHAY& CO.','5','3','MUKUND M SAHAY& CO.','Yes','','','','0','','','','','','','','',425,'Debit',0,'2020-08-29 23:30:26'),
(27,'VIKASH KUMAR','5','3','VIKASH KUMAR','Yes','','','','0','','','','','','','','',855,'Debit',0,'2020-08-29 23:31:32'),
(28,'SAUMYA INFOTECH','5','3','SAUMYA INFOTECH','Yes','','','','0','','','','','','','','',1250,'Debit',0,'2020-08-29 23:32:15'),
(29,'NISHANT RANJAN','5','3','NISHANT RANJAN','Yes','','','','0','','','','','','','','',12540,'Debit',0,'2020-08-29 23:33:01'),
(30,'LAND & BUILDING ','4','8','LAND & BUILDING ','Yes','','','','0','','','','','','','','',1250000,'Debit',0,'2020-08-29 23:33:58'),
(31,'PNB 72010','5','4','PNB 72010','Yes','','','','0','','','','','','','','',481350,'Debit',0,'2020-08-29 23:35:04'),
(32,'MOTORCYCLE','4','8','MOTORCYCLE','Yes','','','','0','','','','','','','','',75935,'Debit',0,'2020-08-29 23:35:57'),
(33,'OP STOCK','5','2','OP STOCK','Yes','','','','0','','','','','','','','',1572650,'Debit',0,'2020-08-30 12:05:25');
/*!40000 ALTER TABLE `pms_account_master` ENABLE KEYS */;

-- 
-- Definition of pms_account_master_main_group
-- 

DROP TABLE IF EXISTS `pms_account_master_main_group`;
CREATE TABLE IF NOT EXISTS `pms_account_master_main_group` (
  `account_master_main_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_group_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 active , 2 remove',
  `date` date NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_ca_tbl
-- 

/*!40000 ALTER TABLE `pms_ca_tbl` DISABLE KEYS */;
INSERT INTO `pms_ca_tbl`(`ca_id`,`ca_name`,`ca_code`,`ca_password`,`status`,`date`,`default_date`) VALUES
(0,'Mukund Sahay','YYY001','admin!@#',0,'2020-09-05 00:00:00','2020-09-05 10:47:47');
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
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_start_date`,`company_end_date`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(2,'BBB002','pms_demo_1','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA','800001','mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','2019-04-01 00:00:00','2020-03-31 00:00:00','','','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','BBB002','BBB002','2019-09-07 03:23:54',0);
/*!40000 ALTER TABLE `pms_company` ENABLE KEYS */;

-- 
-- Definition of pms_company_person_type
-- 

DROP TABLE IF EXISTS `pms_company_person_type`;
CREATE TABLE IF NOT EXISTS `pms_company_person_type` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `exp_tax_value` varchar(20) NOT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `exp_igst_rate` varchar(20) NOT NULL,
  `exp_igst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `exp_cgst_rate` varchar(20) NOT NULL,
  `exp_cgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `exp_sgst_rate` varchar(20) NOT NULL,
  `exp_sgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `exp_total_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `exp_state_code` int(11) NOT NULL DEFAULT 0,
  `exp_supplier_name` varchar(200) NOT NULL,
  `exp_supplier_addr` varchar(1000) NOT NULL,
  `exp_supplier_gstin` varchar(20) NOT NULL,
  `exp_supplier_state` varchar(20) NOT NULL,
  `exp_supplier_state_code` int(11) NOT NULL DEFAULT 0,
  `expenses_head` varchar(100) NOT NULL,
  `total_cost` double(10,2) NOT NULL DEFAULT 0.00,
  `total_gst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_igst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_cgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_sgst` double(10,2) NOT NULL DEFAULT 0.00,
  `company_name` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `expenses_jv_id` int(11) NOT NULL DEFAULT 0,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `debit_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `credit_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`jv_dtl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(4,'BBB002 ',1,'PURCHASE A/C',4665,0,1,0,'2020-09-01 07:29:37'),
(5,'BBB002 ',1,'IGST-ITC A/C',559.8,0,1,0,'2020-09-01 07:29:37'),
(6,'BBB002 ',1,'RB ENTERPRISES',0,5224.8,1,0,'2020-09-01 07:29:37'),
(7,'BBB002 ',2,'SAUMYA INFOTECH',30240,0,1,0,'2020-09-01 07:32:28'),
(8,'BBB002 ',2,'IGST-OTL A/C',0,3240,1,0,'2020-09-01 07:32:28'),
(9,'BBB002 ',2,'SALES A/C',0,27000,1,0,'2020-09-01 07:32:28'),
(10,'BBB002 ',3,'ABHISEK TELEVISION ',3483.2,0,1,0,'2020-09-01 22:28:06'),
(11,'BBB002 ',3,'IGST-OTL A/C',0,373.2,1,0,'2020-09-01 22:28:07'),
(12,'BBB002 ',3,'SALES A/C',0,3110,1,0,'2020-09-01 22:28:07'),
(13,'BBB002 ',4,'CASH A/C',27000,0,1,0,'2020-09-01 22:29:33'),
(14,'BBB002 ',4,'SAUMYA INFOTECH',0,27000,1,0,'2020-09-01 22:29:33'),
(15,'BBB002 ',5,'RB ENTERPRISES',5500,0,1,0,'2020-09-01 22:30:47'),
(16,'BBB002 ',5,'CASH A/C',0,5500,1,0,'2020-09-01 22:30:47'),
(17,'BBB002 ',6,'NISHANT RANJAN',13440,0,1,0,'2020-09-01 22:34:46'),
(18,'BBB002 ',6,'IGST-OTL A/C',0,1440,1,0,'2020-09-01 22:34:46'),
(19,'BBB002 ',6,'SALES A/C',0,12000,1,0,'2020-09-01 22:34:46'),
(20,'BBB002 ',7,'PIYUSH KUMAR',28000,0,1,0,'2020-09-01 22:36:09'),
(21,'BBB002 ',7,'IGST-OTL A/C',0,3000,1,0,'2020-09-01 22:36:09'),
(22,'BBB002 ',7,'SALES A/C',0,25000,1,0,'2020-09-01 22:36:09'),
(23,'BBB002 ',8,'SAUMYA INFOTECH',7840,0,1,0,'2020-09-01 22:37:24'),
(24,'BBB002 ',8,'IGST-OTL A/C',0,840,1,0,'2020-09-01 22:37:24'),
(25,'BBB002 ',8,'SALES A/C',0,7000,1,0,'2020-09-01 22:37:24'),
(26,'BBB002 ',9,'PURCHASE A/C',75000,0,1,0,'2020-09-02 06:50:28'),
(27,'BBB002 ',9,'IGST-ITC A/C',9000,0,1,0,'2020-09-02 06:50:28'),
(28,'BBB002 ',9,'RB ENTERPRISES',0,84000,1,0,'2020-09-02 06:50:28'),
(29,'BBB002 ',10,'PURCHASE A/C',1250,0,1,0,'2020-09-02 06:53:28'),
(30,'BBB002 ',10,'IGST-ITC A/C',150,0,1,0,'2020-09-02 06:53:28'),
(31,'BBB002 ',10,'COMPUTER TECHNO',0,1400,1,0,'2020-09-02 06:53:28'),
(32,'BBB002 ',11,'PURCHASE A/C',78000,0,1,0,'2020-09-02 06:57:44'),
(33,'BBB002 ',11,'IGST-ITC A/C',9360,0,1,0,'2020-09-02 06:57:44'),
(34,'BBB002 ',11,'RAHI ENTERPRISES',0,87360,1,0,'2020-09-02 06:57:44'),
(35,'BBB002 ',12,'PURCHASE A/C',4665,0,1,0,'2020-09-02 07:03:34'),
(36,'BBB002 ',12,'IGST-ITC A/C',559.8,0,1,0,'2020-09-02 07:03:34'),
(37,'BBB002 ',12,'JAI MATA DI TELECOM',0,5224.8,1,0,'2020-09-02 07:03:34'),
(38,'BBB002 ',13,'NISHANT RANJAN',28000,0,1,0,'2020-09-04 13:54:35'),
(39,'BBB002 ',13,'IGST-OTL A/C',0,3000,1,0,'2020-09-04 13:54:35'),
(40,'BBB002 ',13,'SALES A/C',0,25000,1,0,'2020-09-04 13:54:35'),
(41,'BBB002 ',14,'SAUMYA INFOTECH',1904,0,1,0,'2020-09-04 13:56:12'),
(42,'BBB002 ',14,'IGST-OTL A/C',0,204,1,0,'2020-09-04 13:56:12'),
(43,'BBB002 ',14,'SALES A/C',0,1700,1,0,'2020-09-04 13:56:12'),
(44,'BBB002 ',15,'PURCHASE A/C',63000,0,1,0,'2020-09-04 13:59:24'),
(45,'BBB002 ',15,'IGST-ITC A/C',7560,0,1,0,'2020-09-04 13:59:24'),
(46,'BBB002 ',15,'COMPUTER GHAR',0,70560,1,0,'2020-09-04 13:59:24');
/*!40000 ALTER TABLE `pms_journal_entry_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_mst
-- 

DROP TABLE IF EXISTS `pms_journal_entry_mst`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_mst` (
  `comp_name` varchar(100) NOT NULL,
  `manual_id` int(11) NOT NULL DEFAULT 0,
  `journal_id` int(11) NOT NULL AUTO_INCREMENT,
  `jv_date` date NOT NULL,
  `dr_total` double(10,2) NOT NULL DEFAULT 0.00,
  `cr_total` double(10,2) NOT NULL DEFAULT 0.00,
  `note` varchar(500) NOT NULL,
  `master_id` int(11) NOT NULL DEFAULT 0,
  `master_id_type` text NOT NULL,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('BBB002',1,1,'2019-04-01 00:00:00',5224.8,5224.8,'Purchase made on credit',1,'purchase',1,0,'2020-09-01 07:28:09'),
('BBB002',3,2,'2019-04-05 00:00:00',30240,30240,'',1,'sales',1,0,'2020-09-01 07:32:28'),
('BBB002',4,3,'2019-04-06 00:00:00',3483.2,3483.2,'',2,'sales',1,0,'2020-09-01 22:28:06'),
('BBB002',5,4,'2019-05-01 00:00:00',27000,27000,'CASH RECEIPT',0,'journal',1,0,'2020-09-01 22:29:32'),
('BBB002',2,5,'2019-04-04 00:00:00',5500,5500,'CASH PAID TO PURCHASER',0,'journal',1,0,'2020-09-01 22:30:47'),
('BBB002',8,6,'2019-05-12 00:00:00',13440,13440,'',3,'sales',1,0,'2020-09-01 22:34:45'),
('BBB002',9,7,'2019-05-12 00:00:00',28000,28000,'',4,'sales',1,0,'2020-09-01 22:36:09'),
('BBB002',10,8,'2019-05-15 00:00:00',7840,7840,'',5,'sales',1,0,'2020-09-01 22:37:24'),
('BBB002',7,9,'2019-05-05 00:00:00',84000,84000,'',2,'purchase',1,0,'2020-09-02 06:50:27'),
('BBB002',6,10,'2019-05-01 00:00:00',1400,1400,'',3,'purchase',1,0,'2020-09-02 06:53:28'),
('BBB002',15,11,'2019-08-02 00:00:00',87360,87360,'',4,'purchase',1,0,'2020-09-02 06:57:44'),
('BBB002',14,12,'2019-06-05 00:00:00',5224.8,5224.8,'',5,'purchase',1,0,'2020-09-02 07:03:34'),
('BBB002',11,13,'2019-05-17 00:00:00',28000,28000,'Trial',6,'sales',1,0,'2020-09-04 13:54:35'),
('BBB002',12,14,'2019-05-18 00:00:00',1904,1904,'',7,'sales',1,0,'2020-09-04 13:56:12'),
('BBB002',13,15,'2019-06-01 00:00:00',70560,70560,'',6,'purchase',1,0,'2020-09-04 13:59:24');
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
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(1,'invoice','PMS/1920/',8,0,'2020-03-21 09:33:36'),
(2,'debit','DEBIT/1920/',1,0,'2020-03-21 09:33:37'),
(3,'credit','CR/1920/',1,0,'2020-03-21 11:37:42');
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
  `prefix_generate_invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoiceno` varchar(16) NOT NULL,
  `prefix_generate_debit_no` int(11) NOT NULL DEFAULT 0,
  `debitno` varchar(16) NOT NULL,
  `prefix_generate_credit_no` int(11) NOT NULL DEFAULT 0,
  `creditno` varchar(16) NOT NULL,
  `journal_accounting_entry` varchar(3) NOT NULL,
  `extra_information_tax_invoice` varchar(3) NOT NULL,
  `caption_name1` varchar(100) NOT NULL,
  `currency_sign_before_amount` varchar(3) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`master_sett_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;
INSERT INTO `pms_master_settings`(`master_sett_id`,`terms_condition_tax_invoice`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`,`mrp_details`,`mrp_invoice_details`,`sale_price_details`,`sale_price_details_info`,`expiry_monitoring_system`,`expiry_monitoring_system_info`,`expiry_details_tax_invoice`,`batch_wise_details`,`batch_wise_details_info`,`batch_wise_details_tax_invoice`,`stock_out_method`,`stock_valuation_method`,`unit_conversion_method_required`,`prefix_generate_invoice_no`,`invoiceno`,`prefix_generate_debit_no`,`debitno`,`prefix_generate_credit_no`,`creditno`,`journal_accounting_entry`,`extra_information_tax_invoice`,`caption_name1`,`currency_sign_before_amount`,`status`,`default_date`) VALUES
(1,'','','','1','','1','','1','0001-01-01 00:00:00','1','1','','1','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket Price','0',1,'0',1,'0',1,'0','1','0','','1',0,'2020-08-30 12:14:18');
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
  `pms_news_in_out_app` int(11) NOT NULL DEFAULT 0,
  `pms_news_outapp_link` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `invoice_date` date DEFAULT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `rate` double(10,2) NOT NULL DEFAULT 0.00,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `tax_val` double(10,2) NOT NULL DEFAULT 0.00,
  `igst_rate` int(11) NOT NULL,
  `igst_amt` double(10,2) NOT NULL DEFAULT 0.00,
  `cgst_rate` int(11) NOT NULL,
  `cgst_amt` double(10,2) NOT NULL DEFAULT 0.00,
  `sgst_rate` int(11) NOT NULL,
  `sgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `invoice_type` varchar(20) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pur_dtl_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`invoice_date`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(2,1,'P-1','2019-04-01 00:00:00','Hardisk(HP)','','PCS-PIECES','HP347','0001-01-01 00:00:00',3,0,4665,0,4665,12,559.8,0,0,0,0,1,0,'purchase','2020-09-01 07:28:56'),
(3,7,'',NULL,'Laptop(Acer)','','PCS-PIECES','FDS-2356','2018-01-01 00:00:00',20,25000,500000,0,0,0,0,0,0,0,0,1,0,'stock','2020-09-01 14:46:06'),
(4,2,'P-2','2019-05-05 00:00:00','LAPTOP (LENOVE)','','PCS-PIECES','BR-121122','0001-01-01 00:00:00',3,0,75000,0,75000,12,9000,0,0,0,0,1,0,'purchase','2020-09-02 06:50:17'),
(5,3,'CT-1','2019-05-01 00:00:00','MOUSE (ACER)','','PCS-PIECES','AC-1256','0001-01-01 00:00:00',10,0,1250,0,1250,12,150,0,0,0,0,1,0,'purchase','2020-09-02 06:53:20'),
(7,4,'RH-5','2019-08-02 00:00:00','VIVO V5 ','','PCS-PIECES','VV-62050','0001-01-01 00:00:00',10,0,78000,0,78000,12,9360,0,0,0,0,1,0,'purchase','2020-09-02 06:57:33'),
(8,17,'',NULL,'VIVO V5 ','','PCS-PIECES','VV-62050','0001-01-01 00:00:00',0,0,0,0,0,0,0,0,0,0,0,1,0,'stock','2020-09-02 06:58:30'),
(9,5,'JT-18','2019-06-05 00:00:00','Hardisk(HP)','','PCS-PIECES','HP347','0001-01-01 00:00:00',3,0,4665,0,4665,12,559.8,0,0,0,0,1,0,'purchase','2020-09-02 07:02:47'),
(10,6,'CG-12','2019-06-01 00:00:00','Moniter(Acer)','','PCS-PIECES','AC-1578','0001-01-01 00:00:00',3,0,63000,0,63000,12,7560,0,0,0,0,1,0,'purchase','2020-09-04 13:59:18');
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
  `statecode` int(9) DEFAULT 0,
  `seller_name` varchar(100) NOT NULL,
  `Seller_address` varchar(100) DEFAULT NULL,
  `gstin` varchar(50) DEFAULT NULL,
  `s_state` varchar(50) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `total_cost` double(10,2) NOT NULL DEFAULT 0.00,
  `total_gst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_igst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_cgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_sgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `payment_mode` varchar(50) NOT NULL DEFAULT '',
  `payment_status` varchar(50) NOT NULL DEFAULT '',
  `invoice_type` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `purchase_journal_id` int(11) NOT NULL DEFAULT 0,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0 default, 1 Data Send to CA,2 CA Edit, 3 Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pur_mst_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_irn_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`purchase_journal_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'P-1','','2019-04-01 00:00:00','NO','10',10,'RB ENTERPRISES','','','','',5224.8,559.8,559.8,0,0,0,'Cash','Not Paid','purchase','',1,1,0,'2020-09-01 07:27:40'),
(2,'P-2','','2019-05-05 00:00:00','NO','10',10,'RB ENTERPRISES','','','','',84000,9000,9000,0,0,0,'','Not Paid','purchase','',9,1,0,'2020-09-02 06:50:17'),
(3,'CT-1','','2019-05-01 00:00:00','NO','10',10,'COMPUTER TECHNO','','','','',1400,150,150,0,0,0,'','Not Paid','purchase','',10,1,0,'2020-09-02 06:53:20'),
(4,'RH-5','','2019-08-02 00:00:00','NO','10',10,'RAHI ENTERPRISES','','','','',87360,9360,9360,0,0,0,'','Not Paid','purchase','',11,1,0,'2020-09-02 06:57:33'),
(5,'JT-18','','2019-06-05 00:00:00','NO','10',10,'JAI MATA DI TELECOM','','','','',5224.8,559.8,559.8,0,0,0,'','Not Paid','purchase','',12,1,0,'2020-09-02 07:02:47'),
(6,'CG-12','','2019-06-01 00:00:00','NO','10',10,'COMPUTER GHAR','','','','',70560,7560,7560,0,0,0,'','Not Paid','purchase','',15,1,0,'2020-09-04 13:59:17');
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
  `qty` int(100) NOT NULL DEFAULT 0,
  `rate` double(10,2) NOT NULL DEFAULT 0.00,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `tax_val` double(10,2) NOT NULL DEFAULT 0.00,
  `igst_rate` double NOT NULL DEFAULT 0,
  `igst_amt` double(10,2) NOT NULL DEFAULT 0.00,
  `cgst_rate` double NOT NULL DEFAULT 0,
  `cgst_amt` double(10,2) NOT NULL DEFAULT 0.00,
  `sgst_rate` double NOT NULL DEFAULT 0,
  `sgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0,
  `invoice_type` varchar(20) NOT NULL DEFAULT 'sales',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sale_dtl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'PMS/1920/000002','Laptop(Acer)','','PCS-PIECES','0','0001-01-01 00:00:00',1,27000,27000,0,27000,12,3240,0,0,0,0,1,0,'sales','2020-09-01 07:32:15'),
(2,2,'PMS/1920/000003','Hardisk(HP)','','PCS-PIECES','HP347','0001-01-01 00:00:00',2,1555,3110,0,3110,12,373.2,0,0,0,0,1,0,'sales','2020-09-01 22:27:55'),
(3,3,'PMS/1920/000004','Hp printer(1020)','','PCS-PIECES','0','0001-01-01 00:00:00',1,12000,12000,0,12000,12,1440,0,0,0,0,1,0,'sales','2020-09-01 22:34:19'),
(4,4,'PMS/1920/000005','Laptop(Acer)','','PCS-PIECES','0','0001-01-01 00:00:00',1,25000,25000,0,25000,12,3000,0,0,0,0,1,0,'sales','2020-09-01 22:36:01'),
(5,5,'PMS/1920/000006','Moniter(Acer)','','PCS-PIECES','0','0001-01-01 00:00:00',1,7000,7000,0,7000,12,840,0,0,0,0,1,0,'sales','2020-09-01 22:37:16'),
(6,6,'PMS/1920/000007','LAPTOP DELL','','PCS-PIECES','0','0001-01-01 00:00:00',1,25000,25000,0,25000,12,3000,0,0,0,0,1,0,'sales','2020-09-04 13:54:22'),
(7,7,'PMS/1920/000008','Hardisk(HP)','','PCS-PIECES','HP347','0001-01-01 00:00:00',1,1700,1700,0,1700,12,204,0,0,0,0,1,0,'sales','2020-09-04 13:56:05');
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
  `ship_party_state_code` int(11) DEFAULT 0,
  `total_cost` double(10,2) NOT NULL DEFAULT 0.00,
  `total_gst` varchar(20) NOT NULL,
  `total_igst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_cgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_sgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(50) NOT NULL DEFAULT '',
  `bank_ac_no` varchar(50) NOT NULL DEFAULT '',
  `bank_ifsc_code` varchar(50) NOT NULL DEFAULT '',
  `company_name` varchar(100) NOT NULL,
  `terms_and_condition` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `invoice_type` varchar(50) DEFAULT NULL,
  `remark` varchar(1000) NOT NULL,
  `sale_jv_id` int(11) NOT NULL DEFAULT 0,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sale_mst_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'PMS/1920/000002','','Regular','2019-04-05 00:00:00','NO','10',10,'','','2019-04-05 00:00:00','','SAUMYA INFOTECH','','','','','SAUMYA INFOTECH','','','',0,30240,'3240.00',3240,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'',2,1,0,'2020-09-01 07:32:15'),
(2,'PMS/1920/000003','','Regular','2019-04-06 00:00:00','NO','10',10,'','','2019-04-06 00:00:00','','ABHISEK TELEVISION ','','','','','ABHISEK TELEVISION ','','','',0,3483.2,'373.20',373.2,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'',3,1,0,'2020-09-01 22:27:55'),
(3,'PMS/1920/000004','','Regular','2019-05-12 00:00:00','NO','10',10,'','','2019-05-12 00:00:00','','NISHANT RANJAN','','','','','NISHANT RANJAN','','','',0,13440,'1440.00',1440,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'',6,1,0,'2020-09-01 22:34:19'),
(4,'PMS/1920/000005','','Regular','2019-05-12 00:00:00','NO','10',10,'','','2019-05-12 00:00:00','','PIYUSH KUMAR','','','','','PIYUSH KUMAR','','','',0,28000,'3000.00',3000,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'',7,1,0,'2020-09-01 22:36:01'),
(5,'PMS/1920/000006','','Regular','2019-05-15 00:00:00','NO','10',10,'','','2019-05-15 00:00:00','','SAUMYA INFOTECH','','','','','SAUMYA INFOTECH','','','',0,7840,'840.00',840,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'',8,1,0,'2020-09-01 22:37:16'),
(6,'PMS/1920/000007','','Regular','2019-05-17 00:00:00','NO','10',10,'','','2019-05-17 00:00:00','','NISHANT RANJAN','','','','','NISHANT RANJAN','','','',0,28000,'3000.00',3000,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'TRIAL',13,1,0,'2020-09-04 13:54:22'),
(7,'PMS/1920/000008','','Regular','2019-05-18 00:00:00','NO','10',10,'','','2019-05-18 00:00:00','','SAUMYA INFOTECH','','','','','SAUMYA INFOTECH','','','',0,1904,'204.00',204,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','','Not Paid',NULL,'Trial',14,1,0,'2020-09-04 13:56:05');
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
  `stock_chk_default_id` int(11) NOT NULL DEFAULT 0 COMMENT '0-primary uom, 1-secondary uom',
  `stock_hsn_sac_code` varchar(20) NOT NULL,
  `stock_gst_rate` text NOT NULL,
  `stock_mrp` varchar(50) NOT NULL,
  `stock_sale_price_without_gst` varchar(50) NOT NULL,
  `stock_opening_qty` double(10,2) NOT NULL DEFAULT 0.00,
  `stock_purc_price_per_unit` double(10,2) NOT NULL DEFAULT 0.00,
  `stock_opening_amt` double(10,2) NOT NULL DEFAULT 0.00,
  `stock_reorder_level` text NOT NULL,
  `stock_reorder_quantity` text NOT NULL,
  `stock_minimum_stock_reminder` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(1,'1','1','LAPTOP (LENOVE)','PCS-PIECES','PCS-PIECES','','',0,'','12','15000','0.00',10,15000,150000,'0.00','0.00','0.00',0,'2020-08-29 22:45:30'),
(2,'1','1','CPU(PRODOT)','PCS-PIECES','PCS-PIECES','','',0,'','12','7000','0.00',12,7000,84000,'0.00','0.00','0.00',0,'2020-08-29 22:46:13'),
(3,'1','1','Mouse(Rapdo)','PCS-PIECES','PCS-PIECES','','',0,'','12','300','0.00',50,300,15000,'0.00','0.00','0.00',0,'2020-08-29 22:46:56'),
(4,'1','1','Keyboard(hp)','PCS-PIECES','PCS-PIECES','','',0,'','12','355','0.00',45,355,15975,'0.00','0.00','0.00',0,'2020-08-29 22:37:04'),
(5,'1','1','Hardisk(HP)','PCS-PIECES','PCS-PIECES','','',0,'','12','1555','0.00',50,777.5,38875,'0.00','0.00','0.00',0,'2020-08-29 23:09:26'),
(6,'1','1','Moniter(Acer)','PCS-PIECES','PCS-PIECES','','',0,'','12','7000','0.00',15,7000,105000,'0.00','0.00','0.00',0,'2020-08-29 22:49:21'),
(7,'1','1','Laptop(Acer)','PCS-PIECES','PCS-PIECES','','',0,'','12','25000','0.00',20,25000,500000,'0.00','0.00','0.00',0,'2020-08-29 22:50:01'),
(8,'1','1','keyboard (Acer)','PCS-PIECES','PCS-PIECES','','',0,'','12','425','0.00',44,212.5,9350,'0.00','0.00','0.00',0,'2020-08-29 23:10:27'),
(9,'1','1','Hp printer(1020)','PCS-PIECES','PCS-PIECES','','',0,'','12','12000','0.00',17,12000,204000,'0.00','0.00','0.00',0,'2020-08-29 22:52:56'),
(10,'1','1','CANON CAMSCANNER ','PCS-PIECES','PCS-PIECES','','',0,'','12','9000','0.00',16,9000,144000,'0.00','0.00','0.00',0,'2020-08-29 22:54:49'),
(11,'1','1','DATA CABEL','PCS-PIECES','PCS-PIECES','','',0,'','12','170','0.00',25,170,4250,'0.00','0.00','0.00',0,'2020-08-29 22:56:18'),
(12,'1','1','AIRPHONE (HP)','PCS-PIECES','PCS-PIECES','','',0,'','12','425','0.00',15,425,6375,'0.00','0.00','0.00',0,'2020-08-29 22:57:37'),
(13,'1','1','MOUSE (ACER)','PCS-PIECES','PCS-PIECES','','',0,'','12','125','0.00',17,125,2125,'0.00','0.00','0.00',0,'2020-08-29 22:59:57'),
(14,'1','1','CARTEGE','PCS-PIECES','PCS-PIECES','','',0,'','12','900','0.00',18,900,16200,'0.00','0.00','0.00',0,'2020-08-29 23:01:41'),
(15,'1','1','LAPTOP DELL','PCS-PIECES','PCS-PIECES','','',0,'','12','22500','0.00',5,22500,112500,'0.00','0.00','0.00',0,'2020-08-29 23:03:26'),
(16,'1','1','MACBOOK','PCS-PIECES','PCS-PIECES','','',0,'','12','82500','0.00',4,41250,165000,'0.00','0.00','0.00',0,'2020-08-29 23:11:14'),
(17,'1','1','VIVO V5 ','PCS-PIECES','PCS-PIECES','','',0,'','12','7800','0.00',0,0,0,'0.00','0.00','0.00',0,'2020-09-02 06:58:30');
/*!40000 ALTER TABLE `pms_stock` ENABLE KEYS */;

-- 
-- Definition of pms_stock_addgroup
-- 

DROP TABLE IF EXISTS `pms_stock_addgroup`;
CREATE TABLE IF NOT EXISTS `pms_stock_addgroup` (
  `stock_nature_of_opration_id` int(11) NOT NULL,
  `stock_group_id` int(11) NOT NULL,
  `stock_group_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `status` int(11) NOT NULL DEFAULT 0,
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
  `rate` double(10,2) NOT NULL DEFAULT 0.00,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `tax_value` double(10,2) NOT NULL DEFAULT 0.00,
  `igst_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `igst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `cgst_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `cgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `sgst_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `sgst_amount` double(10,2) NOT NULL DEFAULT 0.00,
  `total` double(10,2) NOT NULL DEFAULT 0.00,
  `ca_approved_status` int(1) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `doc_state_code` int(11) NOT NULL DEFAULT 0,
  `against_invoice` varchar(16) NOT NULL,
  `date_of_invoice` date NOT NULL DEFAULT '0001-01-01',
  `bill_party_name` varchar(50) NOT NULL,
  `bill_party_address` varchar(100) NOT NULL,
  `bill_party_gstin` varchar(20) NOT NULL,
  `bill_party_state` varchar(30) NOT NULL,
  `bill_party_state_code` int(11) NOT NULL DEFAULT 0,
  `ship_party_name` varchar(50) NOT NULL,
  `ship_party_address` varchar(100) NOT NULL,
  `ship_party_gstin` varchar(20) NOT NULL,
  `ship_party_state` varchar(30) NOT NULL,
  `ship_party_code` int(11) NOT NULL DEFAULT 0,
  `total_cost` double(10,2) NOT NULL DEFAULT 0.00,
  `total_gst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_igst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_cgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_sgst` double(10,2) NOT NULL DEFAULT 0.00,
  `total_discount` double(10,2) NOT NULL DEFAULT 0.00,
  `note_type` varchar(15) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `dr_cr_jv_id` int(11) NOT NULL DEFAULT 0,
  `ca_approved_status` int(11) NOT NULL DEFAULT 0 COMMENT '0-default, 1-Data Send to CA,2-CA Edit, 3-Entry Approved',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp(),
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


-- Dump completed on 2020-09-05 11:06:16
-- Total time: 0:0:0:0:677 (d:h:m:s:ms)
