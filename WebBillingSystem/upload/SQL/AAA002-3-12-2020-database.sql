-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-12-03 17:49:12
-- --------------------------------------
-- Server version 10.4.13-MariaDB mariadb.org binary distribution


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
  `rate_of_depreciation` text NOT NULL DEFAULT '\'0\'' COMMENT 'non_current assests sungroup tangiable assets then value will be set',
  `natural_assets` text NOT NULL DEFAULT '\' \'' COMMENT 'noncurrent assets subgroup tangiable assets valuw will be set',
  `UCID` varchar(50) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`,`rate_of_depreciation`,`natural_assets`,`UCID`) VALUES
(1,'PURCHASE A/C','7','2','PURCHASE A/C','Yes','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' ''',''),
(2,'SALES A/C','6','1','SALES A/C','Yes','','','','0','','','0','','','1','','',0,'Credit',0,'2019-12-02 10:53:22','''0''',''' ''',''),
(3,'CGST-ITC A/C','5','6','CGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' ''',''),
(4,'IGST-ITC A/C','5','6','IGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' ''',''),
(5,'SGST-ITC A/C','5','6','SGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' ''',''),
(6,'CASH A/C','5','4','CASH A/C','No','','','','0','','','','','','','','',56896.34,'Debit',0,'2019-12-02 20:11:52','''0''',''' ''',''),
(7,'CREDIT A/C','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-07 03:51:11','''0''',''' ''',''),
(8,'DEBIT A/C','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 18:04:21','''0''',''' ''',''),
(9,'SALES RETURN A/C','7','2','SALES RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-11 18:43:33','''0''',''' ''',''),
(10,'CGST-OTL A/C','3','3','CGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:40:45','''0''',''' ''',''),
(11,'SGST-OTL A/C','3','3','SGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:02','''0''',''' ''',''),
(12,'IGST-OTL A/C','3','3','IGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:33','''0''',''' ''',''),
(13,'PURCHASE RETURN A/C','7','2','PURCHASE RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-18 12:03:17','''0''',''' ''',''),
(14,'UNITGLO BIHAR','1','1','UNITGLO BIHAR','Yes','','','','10','10','','','10AABCU95738R1ZD','AABCU95738R','','','bihar@gmail.com',0,'Debit',0,'2020-11-17 21:06:59','','Furnitures & Fixtures','COMPANY01'),
(15,'UNITGLO MAHARASHTRA','1','1','UNITGLO MAHARASHTRA','Yes','','','','27','27','','','27AABCU95738R1ZD','AABCU95738R','','','maharashtra@gmail.com',0,'Debit',0,'2020-11-17 21:08:21','','Furnitures & Fixtures',''),
(16,'TECH','1','1','TECH','Yes','','','','2','2','','','','','','','',0,'Debit',0,'2020-12-03 16:25:30','','Furnitures & Fixtures','AAAA000086');
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
(1,'Mukund','YYY001','admin!@#',0,'2029-09-25 00:00:00','2019-09-25 05:36:53');
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
(1,'AAA002','pms2','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA','800001','mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2020','2020-04-01 00:00:00','2021-03-31 00:00:00','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','admin','2019-09-07 03:23:54',0),
(2,'AAA003','db_pms___AAA003_2019_2020','Firm','SUNIL KUMAR TIWARI','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PUNE','27',0,'INDIA','411062','mmsgst9@gmail.com',2147483647,'27AABCU95738R1ZD','AABCU95738R','','CA FIRM','','YYY001','2019','0001-01-01 00:00:00','0001-01-01 00:00:00','sunil','admin','','','','','','','','','','','','','','','sunil','admin','2020-12-03 15:08:21',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;
INSERT INTO `pms_expenses_product_name`(`auto_incr_id`,`expe_product_name`,`status`,`default_date`) VALUES
(1,'PEN',0,'2020-03-31 21:10:38'),
(2,'PEN',0,'2020-11-26 12:50:40'),
(3,'PEN',0,'2020-11-26 12:57:55'),
(4,'PEN',0,'2020-11-26 13:06:04'),
(5,'PEN',0,'2020-11-26 16:22:42'),
(6,'PEN',0,'2020-11-26 16:25:34'),
(7,'PEN',0,'2020-11-26 16:29:05'),
(8,'PEN',0,'2020-11-26 16:32:55'),
(9,'PEN',0,'2020-11-26 16:38:15'),
(10,'PEN',0,'2020-11-26 16:39:29'),
(11,'PEN',0,'2020-11-26 16:44:07'),
(12,'PEN',0,'2020-11-26 17:02:37'),
(13,'PEN',0,'2020-11-26 17:17:52'),
(14,'PEN',0,'2020-11-26 17:21:08'),
(15,'PEN',0,'2020-11-26 17:22:01'),
(16,'PEN',0,'2020-11-26 17:32:01'),
(17,'PENCIL',0,'2020-11-26 21:53:36'),
(18,'PENCIL',0,'2020-11-27 17:10:30'),
(19,'PENCIL',0,'2020-11-27 17:10:33'),
(20,'PENCIL',0,'2020-11-28 16:35:12'),
(21,'PEN',0,'2020-11-28 16:36:15'),
(22,'PENCIL',0,'2020-11-28 16:56:24'),
(23,'PENCIL',0,'2020-11-28 16:56:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_dtl`(`exp_dtl_id`,`exp_voucherno`,`expenses_head`,`exp_product_name`,`exp_hsn_code`,`exp_tax_value`,`rate`,`exp_igst_rate`,`exp_igst_amount`,`exp_cgst_rate`,`exp_cgst_amount`,`exp_sgst_rate`,`exp_sgst_amount`,`exp_total_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(13,'12','UNITGLO BIHAR','PEN','0001','20.00',18,'0',0,'9',1.8,'9',1.8,23.6,1,0,'2020-11-26 17:21:08'),
(14,'13','UNITGLO MAHARASHTRA','PEN','0001','10.00',18,'18',1.8,'0',0,'0',0,11.8,1,0,'2020-11-26 17:22:01'),
(20,'15','UNITGLO MAHARASHTRA','PEN','0001','20.00',18,'0',0,'9',1.8,'9',1.8,23.6,1,0,'2020-11-28 16:36:16'),
(21,'16','UNITGLO BIHAR','PENCIL','0002','20.00',18,'18',3.6,'0',0,'0',0,23.6,1,0,'2020-11-28 16:56:27'),
(22,'16','UNITGLO BIHAR','PENCIL','0002','20.00',18,'18',3.6,'0',0,'0',0,23.6,1,0,'2020-11-28 16:56:27');
/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_voucher_mst
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_mst`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_mst` (
  `exp_voucher_no` int(11) NOT NULL AUTO_INCREMENT,
  `exp_invoice_no` varchar(16) NOT NULL,
  `exp_invoice_IRN` varchar(16) NOT NULL,
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
  `manual_id` int(11) NOT NULL,
  PRIMARY KEY (`exp_voucher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_mst`(`exp_voucher_no`,`exp_invoice_no`,`exp_invoice_IRN`,`exp_voucher_date`,`exp_place_of_supply`,`exp_reverse_charge`,`exp_state`,`exp_state_code`,`exp_supplier_name`,`exp_supplier_addr`,`exp_supplier_gstin`,`exp_supplier_state`,`exp_supplier_state_code`,`expenses_head`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`company_name`,`auth_name`,`payment_mode`,`expenses_jv_id`,`ca_approved_status`,`status`,`default_date`,`manual_id`) VALUES
(12,'Inv/19-20/000001','','2020-11-26 00:00:00','','NO','10',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR',23.6,3.6,0,1.8,1.8,'  MADAN MOHAN MISHRA PVT LTD','','Cash',42,1,0,'2020-11-26 17:21:07',1),
(13,'Inv/19-20/000002','','2020-11-26 00:00:00','','NO','10',10,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA',11.8,1.8,1.8,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',43,1,0,'2020-11-26 17:21:59',2),
(15,'Inv/19-20/000005','','2020-11-26 00:00:00','','NO','10',10,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA',23.6,3.6,0,1.8,1.8,'  MADAN MOHAN MISHRA PVT LTD','','Cash',46,1,0,'2020-11-26 21:53:34',3),
(16,'Inv/19-20/000001','','2020-11-28 00:00:00','','NO','10',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR',47.2,7.2,7.2,0,0,'  MADAN MOHAN MISHRA PVT LTD','','Cash',88,1,0,'2020-11-28 16:35:10',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(8,'AAA002 ',8,'PURCHASE A/C',20,0,1,0,'2020-11-18 19:43:39'),
(9,'AAA002 ',8,'CGST-ITC A/C',1.8,0,1,0,'2020-11-18 19:43:39'),
(10,'AAA002 ',8,'SGST-ITC A/C',1.8,0,1,0,'2020-11-18 19:43:39'),
(11,'AAA002 ',8,'UNITGLO BIHAR',0,23.6,1,0,'2020-11-18 19:43:39'),
(18,'AAA002 ',11,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-18 19:58:46'),
(19,'AAA002 ',11,'PURCHASE RETURN A/C',0,23.6,1,0,'2020-11-18 19:58:46'),
(20,'AAA002 ',12,'SALES RETURN A/C',20,0,1,0,'2020-11-20 12:05:50'),
(21,'AAA002 ',12,'IGST-OTL A/C',3.6,0,1,0,'2020-11-20 12:05:50'),
(22,'AAA002 ',12,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-20 12:05:50'),
(23,'AAA002 ',13,'SALES RETURN A/C',20,0,1,0,'2020-11-20 12:26:06'),
(24,'AAA002 ',13,'CGST-OTL A/C',1.8,0,1,0,'2020-11-20 12:26:06'),
(25,'AAA002 ',13,'SGST-OTL A/C',1.8,0,1,0,'2020-11-20 12:26:06'),
(26,'AAA002 ',13,'UNITGLO BIHAR',0,23.6,1,0,'2020-11-20 12:26:06'),
(30,'AAA002 ',15,'PURCHASE A/C',23.6,0,1,0,'2020-11-20 15:36:36'),
(31,'AAA002 ',15,'CGST-OTL A/C',0,1.8,1,0,'2020-11-20 15:36:38'),
(32,'AAA002 ',15,'SGST-OTL A/C',0,1.8,1,0,'2020-11-20 15:36:39'),
(33,'AAA002 ',15,'IGST-OTL A/C',0,3.6,1,0,'2020-11-20 15:36:39'),
(34,'AAA002 ',15,'SALES A/C',0,16.4,1,0,'2020-11-20 15:36:39'),
(35,'AAA002 ',16,'SALES A/C',23.6,0,1,0,'2020-11-20 15:40:56'),
(36,'AAA002 ',16,'CGST-OTL A/C',0,1.8,1,0,'2020-11-20 15:40:57'),
(37,'AAA002 ',16,'SGST-OTL A/C',0,1.8,1,0,'2020-11-20 15:40:59'),
(38,'AAA002 ',16,'IGST-OTL A/C',0,3.6,1,0,'2020-11-20 15:40:59'),
(39,'AAA002 ',16,'SALES A/C',0,16.4,1,0,'2020-11-20 15:41:00'),
(40,'AAA002 ',17,'SALES A/C',23.6,0,1,0,'2020-11-20 16:31:43'),
(41,'AAA002 ',17,'CGST-OTL A/C',0,1.8,1,0,'2020-11-20 16:31:46'),
(42,'AAA002 ',17,'SGST-OTL A/C',0,1.8,1,0,'2020-11-20 16:31:46'),
(43,'AAA002 ',17,'IGST-OTL A/C',0,3.6,1,0,'2020-11-20 16:31:50'),
(44,'AAA002 ',17,'SALES A/C',0,16.4,1,0,'2020-11-20 16:31:54'),
(53,'AAA002 ',18,'UNITGLO MAHARASHTRA',40.8,0,1,0,'2020-11-20 17:09:33'),
(54,'AAA002 ',18,'IGST-OTL A/C',0,5.4,1,0,'2020-11-20 17:09:33'),
(55,'AAA002 ',18,'SALES A/C',0,35.4,1,0,'2020-11-20 17:09:33'),
(56,'AAA002 ',19,'SALES A/C',59,0,1,0,'2020-11-20 19:46:40'),
(57,'AAA002 ',19,'CGST-OTL A/C',0,4.5,1,0,'2020-11-20 19:46:40'),
(58,'AAA002 ',19,'SGST-OTL A/C',0,4.5,1,0,'2020-11-20 19:46:41'),
(59,'AAA002 ',19,'IGST-OTL A/C',0,9,1,0,'2020-11-20 19:46:41'),
(60,'AAA002 ',19,'SALES A/C',0,41,1,0,'2020-11-20 19:46:41'),
(61,'AAA002 ',20,'UNITGLO BIHAR',259.6,0,1,0,'2020-11-20 19:49:44'),
(62,'AAA002 ',20,'CGST-OTL A/C',0,19.8,1,0,'2020-11-20 19:49:44'),
(63,'AAA002 ',20,'SGST-OTL A/C',0,19.8,1,0,'2020-11-20 19:49:44'),
(64,'AAA002 ',20,'IGST-OTL A/C',0,39.6,1,0,'2020-11-20 19:49:44'),
(65,'AAA002 ',20,'SALES A/C',0,180.4,1,0,'2020-11-20 19:49:44'),
(92,'AAA002 ',26,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-25 16:10:34'),
(93,'AAA002 ',26,'CGST-OTL A/C',0,1.8,1,0,'2020-11-25 16:10:34'),
(94,'AAA002 ',26,'SGST-OTL A/C',0,1.8,1,0,'2020-11-25 16:10:34'),
(95,'AAA002 ',26,'SALES A/C',0,20,1,0,'2020-11-25 16:10:34'),
(96,'AAA002 ',9,'PURCHASE A/C',20,0,1,0,'2020-11-25 21:45:49'),
(97,'AAA002 ',9,'IGST-ITC A/C',3.6,0,1,0,'2020-11-25 21:45:49'),
(98,'AAA002 ',9,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-25 21:45:49'),
(112,'AAA002 ',28,'UNITGLO BIHAR',20,0,1,0,'2020-11-26 12:51:13'),
(113,'AAA002 ',28,'CGST-ITC A/C',1.8,0,1,0,'2020-11-26 12:51:13'),
(114,'AAA002 ',28,'SGST-ITC A/C',1.8,0,1,0,'2020-11-26 12:51:13'),
(115,'AAA002 ',28,'CASH A/C',0,23.6,1,0,'2020-11-26 12:51:13'),
(119,'AAA002 ',30,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 13:06:09'),
(120,'AAA002 ',30,'CGST-ITC A/C',1.8,0,1,0,'2020-11-26 13:06:09'),
(121,'AAA002 ',30,'SGST-ITC A/C',1.8,0,1,0,'2020-11-26 13:06:09'),
(122,'AAA002 ',30,'CASH A/C',0,23.6,1,0,'2020-11-26 13:06:09'),
(123,'AAA002 ',6,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-26 14:46:14'),
(124,'AAA002 ',6,'CGST-OTL A/C',0,1.8,1,0,'2020-11-26 14:46:14'),
(125,'AAA002 ',6,'SGST-OTL A/C',0,1.8,1,0,'2020-11-26 14:46:14'),
(126,'AAA002 ',6,'SALES A/C',0,20,1,0,'2020-11-26 14:46:14'),
(127,'AAA002 ',31,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-26 14:52:02'),
(128,'AAA002 ',31,'CGST-OTL A/C',0,0.9,1,0,'2020-11-26 14:52:02'),
(129,'AAA002 ',31,'SGST-OTL A/C',0,0.9,1,0,'2020-11-26 14:52:02'),
(130,'AAA002 ',31,'SALES A/C',0,10,1,0,'2020-11-26 14:52:02'),
(131,'AAA002 ',32,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-26 14:55:05'),
(132,'AAA002 ',32,'CGST-OTL A/C',0,0.9,1,0,'2020-11-26 14:55:05'),
(133,'AAA002 ',32,'SGST-OTL A/C',0,0.9,1,0,'2020-11-26 14:55:06'),
(134,'AAA002 ',32,'SALES A/C',0,10,1,0,'2020-11-26 14:55:06'),
(135,'AAA002 ',33,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-26 15:22:46'),
(136,'AAA002 ',33,'CGST-OTL A/C',0,1.8,1,0,'2020-11-26 15:22:46'),
(137,'AAA002 ',33,'SGST-OTL A/C',0,1.8,1,0,'2020-11-26 15:22:46'),
(138,'AAA002 ',33,'IGST-OTL A/C',0,3.6,1,0,'2020-11-26 15:22:46'),
(139,'AAA002 ',33,'SALES A/C',0,16.4,1,0,'2020-11-26 15:22:46'),
(140,'AAA002 ',34,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 16:23:06'),
(141,'AAA002 ',34,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 16:23:06'),
(142,'AAA002 ',34,'CASH A/C',0,23.6,1,0,'2020-11-26 16:23:06'),
(143,'AAA002 ',29,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 16:25:43'),
(144,'AAA002 ',29,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 16:25:43'),
(145,'AAA002 ',29,'CASH A/C',0,23.6,1,0,'2020-11-26 16:25:43'),
(146,'AAA002 ',35,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 16:29:12'),
(147,'AAA002 ',35,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 16:29:12'),
(148,'AAA002 ',35,'CASH A/C',0,23.6,1,0,'2020-11-26 16:29:12'),
(149,'AAA002 ',36,'UNITGLO MAHARASHTRA',40,0,1,0,'2020-11-26 16:33:03'),
(150,'AAA002 ',36,'IGST-ITC A/C',7.2,0,1,0,'2020-11-26 16:33:03'),
(151,'AAA002 ',36,'CASH A/C',0,47.2,1,0,'2020-11-26 16:33:03'),
(152,'AAA002 ',37,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 16:38:22'),
(153,'AAA002 ',37,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 16:38:22'),
(154,'AAA002 ',37,'CASH A/C',0,23.6,1,0,'2020-11-26 16:38:22'),
(155,'AAA002 ',38,'UNITGLO BIHAR',20,0,1,0,'2020-11-26 16:39:38'),
(156,'AAA002 ',38,'CGST-ITC A/C',1.8,0,1,0,'2020-11-26 16:39:38'),
(157,'AAA002 ',38,'SGST-ITC A/C',1.8,0,1,0,'2020-11-26 16:39:38'),
(158,'AAA002 ',38,'CASH A/C',0,23.6,1,0,'2020-11-26 16:39:38'),
(159,'AAA002 ',39,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 16:44:24'),
(160,'AAA002 ',39,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 16:44:24'),
(161,'AAA002 ',39,'CASH A/C',0,23.6,1,0,'2020-11-26 16:44:24'),
(162,'AAA002 ',40,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 17:02:46'),
(163,'AAA002 ',40,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 17:02:46'),
(164,'AAA002 ',40,'CASH A/C',0,23.6,1,0,'2020-11-26 17:02:46'),
(165,'AAA002 ',41,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-26 17:17:59'),
(166,'AAA002 ',41,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 17:17:59'),
(167,'AAA002 ',41,'CASH A/C',0,23.6,1,0,'2020-11-26 17:17:59'),
(168,'AAA002 ',42,'UNITGLO BIHAR',20,0,1,0,'2020-11-26 17:21:20'),
(169,'AAA002 ',42,'CGST-ITC A/C',1.8,0,1,0,'2020-11-26 17:21:20'),
(170,'AAA002 ',42,'SGST-ITC A/C',1.8,0,1,0,'2020-11-26 17:21:20'),
(171,'AAA002 ',42,'CASH A/C',0,23.6,1,0,'2020-11-26 17:21:20'),
(172,'AAA002 ',43,'UNITGLO MAHARASHTRA',10,0,1,0,'2020-11-26 17:22:07'),
(173,'AAA002 ',43,'IGST-ITC A/C',1.8,0,1,0,'2020-11-26 17:22:07'),
(174,'AAA002 ',43,'CASH A/C',0,11.8,1,0,'2020-11-26 17:22:07'),
(175,'AAA002 ',44,'UNITGLO BIHAR',16.4,0,1,0,'2020-11-26 17:32:09'),
(176,'AAA002 ',44,'CGST-ITC A/C',1.8,0,1,0,'2020-11-26 17:32:09'),
(177,'AAA002 ',44,'SGST-ITC A/C',1.8,0,1,0,'2020-11-26 17:32:10'),
(178,'AAA002 ',44,'IGST-ITC A/C',3.6,0,1,0,'2020-11-26 17:32:10'),
(179,'AAA002 ',44,'CASH A/C',0,23.6,1,0,'2020-11-26 17:32:10'),
(187,'AAA002 ',47,'UNITGLO MAHARASHTRA',35.4,0,1,0,'2020-11-27 11:13:35'),
(188,'AAA002 ',47,'CGST-OTL A/C',0,2.7,1,0,'2020-11-27 11:13:35'),
(189,'AAA002 ',47,'SGST-OTL A/C',0,2.7,1,0,'2020-11-27 11:13:35'),
(190,'AAA002 ',47,'IGST-OTL A/C',0,5.4,1,0,'2020-11-27 11:13:36'),
(191,'AAA002 ',47,'SALES A/C',0,24.6,1,0,'2020-11-27 11:13:36'),
(192,'AAA002 ',48,'UNITGLO MAHARASHTRA',59,0,1,0,'2020-11-27 11:18:19'),
(193,'AAA002 ',48,'CGST-OTL A/C',0,4.5,1,0,'2020-11-27 11:18:19'),
(194,'AAA002 ',48,'SGST-OTL A/C',0,4.5,1,0,'2020-11-27 11:18:19'),
(195,'AAA002 ',48,'IGST-OTL A/C',0,9,1,0,'2020-11-27 11:18:19'),
(196,'AAA002 ',48,'SALES A/C',0,41,1,0,'2020-11-27 11:18:19'),
(197,'AAA002 ',49,'UNITGLO MAHARASHTRA',35.4,0,1,0,'2020-11-27 11:51:20'),
(198,'AAA002 ',49,'IGST-OTL A/C',0,5.4,1,0,'2020-11-27 11:51:20'),
(199,'AAA002 ',49,'SALES A/C',0,30,1,0,'2020-11-27 11:51:20'),
(205,'AAA002 ',50,'UNITGLO MAHARASHTRA',47.2,0,1,0,'2020-11-27 12:24:47'),
(206,'AAA002 ',50,'IGST-OTL A/C',0,7.2,1,0,'2020-11-27 12:24:47'),
(207,'AAA002 ',50,'SALES A/C',0,40,1,0,'2020-11-27 12:24:47'),
(208,'AAA002 ',51,'UNITGLO MAHARASHTRA',35.4,0,1,0,'2020-11-27 12:26:09'),
(209,'AAA002 ',51,'IGST-OTL A/C',0,5.4,1,0,'2020-11-27 12:26:09'),
(210,'AAA002 ',51,'SALES A/C',0,30,1,0,'2020-11-27 12:26:09'),
(224,'AAA002 ',21,'UNITGLO MAHARASHTRA',34.4,0,1,0,'2020-11-27 13:17:42'),
(225,'AAA002 ',21,'IGST-ITC A/C',0,3.6,1,0,'2020-11-27 13:17:42'),
(226,'AAA002 ',21,'PURCHASE RETURN A/C',0,30.8,1,0,'2020-11-27 13:17:42'),
(227,'AAA002 ',10,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-27 13:19:02'),
(228,'AAA002 ',10,'IGST-ITC A/C',0,3.6,1,0,'2020-11-27 13:19:02'),
(229,'AAA002 ',10,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-27 13:19:02'),
(230,'AAA002 ',24,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-27 13:20:25'),
(231,'AAA002 ',24,'CGST-ITC A/C',0,1.8,1,0,'2020-11-27 13:20:25'),
(232,'AAA002 ',24,'CGST-ITC A/C',0,1.8,1,0,'2020-11-27 13:20:25'),
(233,'AAA002 ',24,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-27 13:20:25'),
(249,'AAA002 ',14,'SALES RETURN A/C',23.6,0,1,0,'2020-11-27 13:48:41'),
(250,'AAA002 ',14,'IGST-OTL A/C',3.6,0,1,0,'2020-11-27 13:48:41'),
(251,'AAA002 ',14,'UNITGLO MAHARASHTRA',0,27.2,1,0,'2020-11-27 13:48:41'),
(256,'AAA002 ',22,'SALES RETURN A/C',20,0,1,0,'2020-11-27 13:53:55'),
(257,'AAA002 ',22,'CGST-OTL A/C',1.8,0,1,0,'2020-11-27 13:53:55'),
(258,'AAA002 ',22,'SGST-OTL A/C',1.8,0,1,0,'2020-11-27 13:53:55'),
(259,'AAA002 ',22,'UNITGLO BIHAR',0,23.6,1,0,'2020-11-27 13:53:55'),
(260,'AAA002 ',23,'SALES RETURN A/C',20,0,1,0,'2020-11-27 13:54:56'),
(261,'AAA002 ',23,'IGST-OTL A/C',3.6,0,1,0,'2020-11-27 13:54:56'),
(262,'AAA002 ',23,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-27 13:54:56'),
(274,'AAA002 ',53,'UNITGLO BIHAR',35.4,0,1,0,'2020-11-27 14:44:35'),
(275,'AAA002 ',53,'CGST-OTL A/C',0,2.7,1,0,'2020-11-27 14:44:35'),
(276,'AAA002 ',53,'SGST-OTL A/C',0,2.7,1,0,'2020-11-27 14:44:35'),
(277,'AAA002 ',53,'IGST-OTL A/C',0,5.4,1,0,'2020-11-27 14:44:35'),
(278,'AAA002 ',53,'SALES A/C',0,24.6,1,0,'2020-11-27 14:44:35'),
(285,'AAA002 ',7,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-27 14:51:24'),
(286,'AAA002 ',7,'IGST-OTL A/C',0,3.6,1,0,'2020-11-27 14:51:24'),
(287,'AAA002 ',7,'SALES A/C',0,20,1,0,'2020-11-27 14:51:25'),
(293,'AAA002 ',55,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-27 15:09:53'),
(294,'AAA002 ',55,'CGST-OTL A/C',0,1.8,1,0,'2020-11-27 15:09:53'),
(295,'AAA002 ',55,'SGST-OTL A/C',0,1.8,1,0,'2020-11-27 15:09:54'),
(296,'AAA002 ',55,'IGST-OTL A/C',0,3.6,1,0,'2020-11-27 15:09:54'),
(297,'AAA002 ',55,'SALES A/C',0,16.4,1,0,'2020-11-27 15:09:54'),
(298,'AAA002 ',56,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-27 15:29:43'),
(299,'AAA002 ',56,'CGST-OTL A/C',0,0.9,1,0,'2020-11-27 15:29:43'),
(300,'AAA002 ',56,'SGST-OTL A/C',0,0.9,1,0,'2020-11-27 15:29:43'),
(301,'AAA002 ',56,'IGST-OTL A/C',0,1.8,1,0,'2020-11-27 15:29:43'),
(302,'AAA002 ',56,'SALES A/C',0,8.2,1,0,'2020-11-27 15:29:43'),
(303,'AAA002 ',57,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-27 15:50:10'),
(304,'AAA002 ',57,'CGST-OTL A/C',0,1.8,1,0,'2020-11-27 15:50:10'),
(305,'AAA002 ',57,'SGST-OTL A/C',0,1.8,1,0,'2020-11-27 15:50:10'),
(306,'AAA002 ',57,'IGST-OTL A/C',0,3.6,1,0,'2020-11-27 15:50:10'),
(307,'AAA002 ',57,'SALES A/C',0,16.4,1,0,'2020-11-27 15:50:11'),
(308,'AAA002 ',58,'UNITGLO BIHAR',47.2,0,1,0,'2020-11-27 16:27:37'),
(309,'AAA002 ',58,'CGST-OTL A/C',0,3.6,1,0,'2020-11-27 16:27:37'),
(310,'AAA002 ',58,'SGST-OTL A/C',0,3.6,1,0,'2020-11-27 16:27:38'),
(311,'AAA002 ',58,'IGST-OTL A/C',0,7.2,1,0,'2020-11-27 16:27:38'),
(312,'AAA002 ',58,'SALES A/C',0,32.8,1,0,'2020-11-27 16:27:38'),
(313,'AAA002 ',54,'UNITGLO MAHARASHTRA',91.6,0,1,0,'2020-11-27 16:38:03'),
(314,'AAA002 ',54,'IGST-OTL A/C',0,12.6,1,0,'2020-11-27 16:38:03'),
(315,'AAA002 ',54,'SALES A/C',0,79,1,0,'2020-11-27 16:38:03'),
(324,'AAA002 ',59,'UNITGLO BIHAR',66.2,0,1,0,'2020-11-27 16:50:12'),
(325,'AAA002 ',59,'CGST-OTL A/C',0,0.9,1,0,'2020-11-27 16:50:13'),
(326,'AAA002 ',59,'SGST-OTL A/C',0,0.9,1,0,'2020-11-27 16:50:13'),
(327,'AAA002 ',59,'SALES A/C',0,64.4,1,0,'2020-11-27 16:50:13'),
(332,'AAA002 ',60,'UNITGLO BIHAR',70.8,0,1,0,'2020-11-27 16:56:46'),
(333,'AAA002 ',60,'CGST-OTL A/C',0,5.4,1,0,'2020-11-27 16:56:46'),
(334,'AAA002 ',60,'SGST-OTL A/C',0,5.4,1,0,'2020-11-27 16:56:46'),
(335,'AAA002 ',60,'SALES A/C',0,60,1,0,'2020-11-27 16:56:46'),
(336,'AAA002 ',52,'SALES RETURN A/C',30,0,1,0,'2020-11-27 17:00:09'),
(337,'AAA002 ',52,'CGST-OTL A/C',2.7,0,1,0,'2020-11-27 17:00:09'),
(338,'AAA002 ',52,'SGST-OTL A/C',2.7,0,1,0,'2020-11-27 17:00:09'),
(339,'AAA002 ',52,'UNITGLO BIHAR',0,35.4,1,0,'2020-11-27 17:00:09'),
(340,'AAA002 ',25,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-27 17:04:33'),
(341,'AAA002 ',25,'CGST-ITC A/C',0,1.8,1,0,'2020-11-27 17:04:33'),
(342,'AAA002 ',25,'CGST-ITC A/C',0,1.8,1,0,'2020-11-27 17:04:33'),
(343,'AAA002 ',25,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-27 17:04:33'),
(348,'AAA002 ',61,'SALES RETURN A/C',40,0,1,0,'2020-11-27 17:07:31'),
(349,'AAA002 ',61,'CGST-OTL A/C',3.6,0,1,0,'2020-11-27 17:07:31'),
(350,'AAA002 ',61,'SGST-OTL A/C',3.6,0,1,0,'2020-11-27 17:07:31'),
(351,'AAA002 ',61,'UNITGLO BIHAR',0,47.2,1,0,'2020-11-27 17:07:31'),
(366,'AAA002 ',63,'UNITGLO MAHARASHTRA',47.2,0,1,0,'2020-11-27 17:13:31'),
(367,'AAA002 ',63,'IGST-OTL A/C',0,7.2,1,0,'2020-11-27 17:13:31'),
(368,'AAA002 ',63,'SALES A/C',0,40,1,0,'2020-11-27 17:13:31'),
(377,'AAA002 ',64,'UNITGLO BIHAR',59,0,1,0,'2020-11-27 17:26:34'),
(378,'AAA002 ',64,'CGST-OTL A/C',0,4.5,1,0,'2020-11-27 17:26:34'),
(379,'AAA002 ',64,'SGST-OTL A/C',0,4.5,1,0,'2020-11-27 17:26:34'),
(380,'AAA002 ',64,'IGST-OTL A/C',0,3.6,1,0,'2020-11-27 17:26:34'),
(381,'AAA002 ',64,'SALES A/C',0,46.4,1,0,'2020-11-27 17:26:34'),
(382,'AAA002 ',65,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 11:13:43'),
(383,'AAA002 ',65,'CGST-OTL A/C',0,0.9,1,0,'2020-11-28 11:13:43'),
(384,'AAA002 ',65,'SGST-OTL A/C',0,0.9,1,0,'2020-11-28 11:13:43'),
(385,'AAA002 ',65,'IGST-OTL A/C',0,1.8,1,0,'2020-11-28 11:13:44'),
(386,'AAA002 ',65,'SALES A/C',0,8.2,1,0,'2020-11-28 11:13:44'),
(387,'AAA002 ',66,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-28 11:49:06'),
(388,'AAA002 ',66,'CGST-OTL A/C',0,1.8,1,0,'2020-11-28 11:49:06'),
(389,'AAA002 ',66,'SGST-OTL A/C',0,1.8,1,0,'2020-11-28 11:49:06'),
(390,'AAA002 ',66,'SALES A/C',0,20,1,0,'2020-11-28 11:49:06'),
(391,'AAA002 ',67,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-28 11:57:17'),
(392,'AAA002 ',67,'CGST-OTL A/C',0,1.8,1,0,'2020-11-28 11:57:17'),
(393,'AAA002 ',67,'SGST-OTL A/C',0,1.8,1,0,'2020-11-28 11:57:17'),
(394,'AAA002 ',67,'SALES A/C',0,20,1,0,'2020-11-28 11:57:17'),
(395,'AAA002 ',68,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-28 14:16:52'),
(396,'AAA002 ',68,'CGST-OTL A/C',0,1.8,1,0,'2020-11-28 14:16:52'),
(397,'AAA002 ',68,'SGST-OTL A/C',0,1.8,1,0,'2020-11-28 14:16:52'),
(398,'AAA002 ',68,'IGST-OTL A/C',0,3.6,1,0,'2020-11-28 14:16:52'),
(399,'AAA002 ',68,'SALES A/C',0,16.4,1,0,'2020-11-28 14:16:52'),
(400,'AAA002 ',69,'UNITGLO BIHAR',35.4,0,1,0,'2020-11-28 14:38:44'),
(401,'AAA002 ',69,'CGST-OTL A/C',0,2.7,1,0,'2020-11-28 14:38:44'),
(402,'AAA002 ',69,'SGST-OTL A/C',0,2.7,1,0,'2020-11-28 14:38:44'),
(403,'AAA002 ',69,'IGST-OTL A/C',0,5.4,1,0,'2020-11-28 14:38:45'),
(404,'AAA002 ',69,'SALES A/C',0,24.6,1,0,'2020-11-28 14:38:45'),
(405,'AAA002 ',70,'UNITGLO BIHAR',35.4,0,1,0,'2020-11-28 14:54:42'),
(406,'AAA002 ',70,'IGST-OTL A/C',0,5.4,1,0,'2020-11-28 14:54:42'),
(407,'AAA002 ',70,'SALES A/C',0,30,1,0,'2020-11-28 14:54:42'),
(408,'AAA002 ',71,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 14:56:22'),
(409,'AAA002 ',71,'CGST-OTL A/C',0,0.9,1,0,'2020-11-28 14:56:22'),
(410,'AAA002 ',71,'SGST-OTL A/C',0,0.9,1,0,'2020-11-28 14:56:22'),
(411,'AAA002 ',71,'SALES A/C',0,10,1,0,'2020-11-28 14:56:22'),
(412,'AAA002 ',72,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 14:59:27'),
(413,'AAA002 ',72,'CGST-OTL A/C',0,0.9,1,0,'2020-11-28 14:59:27'),
(414,'AAA002 ',72,'SGST-OTL A/C',0,0.9,1,0,'2020-11-28 14:59:27'),
(415,'AAA002 ',72,'SALES A/C',0,10,1,0,'2020-11-28 14:59:27'),
(416,'AAA002 ',73,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-28 15:11:09'),
(417,'AAA002 ',73,'IGST-OTL A/C',0,3.6,1,0,'2020-11-28 15:11:09'),
(418,'AAA002 ',73,'SALES A/C',0,20,1,0,'2020-11-28 15:11:10'),
(419,'AAA002 ',74,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 15:15:56'),
(420,'AAA002 ',74,'CGST-OTL A/C',0,0.9,1,0,'2020-11-28 15:15:57'),
(421,'AAA002 ',74,'SGST-OTL A/C',0,0.9,1,0,'2020-11-28 15:15:57'),
(422,'AAA002 ',74,'SALES A/C',0,10,1,0,'2020-11-28 15:15:57'),
(423,'AAA002 ',75,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 15:16:54'),
(424,'AAA002 ',75,'IGST-OTL A/C',0,1.8,1,0,'2020-11-28 15:16:54'),
(425,'AAA002 ',75,'SALES A/C',0,10,1,0,'2020-11-28 15:16:54'),
(426,'AAA002 ',76,'UNITGLO MAHARASHTRA',11.8,0,1,0,'2020-11-28 15:19:19'),
(427,'AAA002 ',76,'IGST-OTL A/C',0,1.8,1,0,'2020-11-28 15:19:19'),
(428,'AAA002 ',76,'SALES A/C',0,10,1,0,'2020-11-28 15:19:19'),
(429,'AAA002 ',77,'UNITGLO MAHARASHTRA',11.8,0,1,0,'2020-11-28 15:20:34'),
(430,'AAA002 ',77,'CGST-OTL A/C',0,0.9,1,0,'2020-11-28 15:20:34'),
(431,'AAA002 ',77,'SGST-OTL A/C',0,0.9,1,0,'2020-11-28 15:20:34'),
(432,'AAA002 ',77,'SALES A/C',0,10,1,0,'2020-11-28 15:20:35'),
(433,'AAA002 ',78,'SALES RETURN A/C',10,0,1,0,'2020-11-28 15:42:29'),
(434,'AAA002 ',78,'IGST-OTL A/C',1.8,0,1,0,'2020-11-28 15:42:29'),
(435,'AAA002 ',78,'UNITGLO BIHAR',0,11.8,1,0,'2020-11-28 15:42:30'),
(436,'AAA002 ',79,'SALES RETURN A/C',10,0,1,0,'2020-11-28 15:45:18'),
(437,'AAA002 ',79,'CGST-OTL A/C',0.9,0,1,0,'2020-11-28 15:45:18'),
(438,'AAA002 ',79,'SGST-OTL A/C',0.9,0,1,0,'2020-11-28 15:45:19'),
(439,'AAA002 ',79,'UNITGLO MAHARASHTRA',0,11.8,1,0,'2020-11-28 15:45:19'),
(440,'AAA002 ',80,'SALES RETURN A/C',10,0,1,0,'2020-11-28 15:46:29'),
(441,'AAA002 ',80,'IGST-OTL A/C',1.8,0,1,0,'2020-11-28 15:46:29'),
(442,'AAA002 ',80,'UNITGLO MAHARASHTRA',0,11.8,1,0,'2020-11-28 15:46:30'),
(443,'AAA002 ',62,'UNITGLO MAHARASHTRA',11.8,0,1,0,'2020-11-28 15:58:24'),
(444,'AAA002 ',62,'CGST-ITC A/C',0,0.9,1,0,'2020-11-28 15:58:24'),
(445,'AAA002 ',62,'CGST-ITC A/C',0,0.9,1,0,'2020-11-28 15:58:24'),
(446,'AAA002 ',62,'PURCHASE RETURN A/C',0,10,1,0,'2020-11-28 15:58:24'),
(447,'AAA002 ',81,'UNITGLO BIHAR',11.8,0,1,0,'2020-11-28 15:59:58'),
(448,'AAA002 ',81,'IGST-ITC A/C',0,1.8,1,0,'2020-11-28 15:59:58'),
(449,'AAA002 ',81,'PURCHASE RETURN A/C',0,10,1,0,'2020-11-28 15:59:58'),
(450,'AAA002 ',82,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-28 16:03:00'),
(451,'AAA002 ',82,'CGST-ITC A/C',0,1.8,1,0,'2020-11-28 16:03:00'),
(452,'AAA002 ',82,'CGST-ITC A/C',0,1.8,1,0,'2020-11-28 16:03:00'),
(453,'AAA002 ',82,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-28 16:03:00'),
(458,'AAA002 ',83,'UNITGLO BIHAR',23.6,0,1,0,'2020-11-28 16:10:34'),
(459,'AAA002 ',83,'IGST-ITC A/C',0,3.6,1,0,'2020-11-28 16:10:34'),
(460,'AAA002 ',83,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-28 16:10:34'),
(461,'AAA002 ',84,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-28 16:13:02'),
(462,'AAA002 ',84,'CGST-ITC A/C',0,1.8,1,0,'2020-11-28 16:13:02'),
(463,'AAA002 ',84,'CGST-ITC A/C',0,1.8,1,0,'2020-11-28 16:13:02'),
(464,'AAA002 ',84,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-28 16:13:02'),
(465,'AAA002 ',85,'UNITGLO MAHARASHTRA',23.6,0,1,0,'2020-11-28 16:14:05'),
(466,'AAA002 ',85,'IGST-ITC A/C',0,3.6,1,0,'2020-11-28 16:14:05'),
(467,'AAA002 ',85,'PURCHASE RETURN A/C',0,20,1,0,'2020-11-28 16:14:05'),
(472,'AAA002 ',86,'SALES RETURN A/C',20,0,1,0,'2020-11-28 16:20:37'),
(473,'AAA002 ',86,'IGST-OTL A/C',3.6,0,1,0,'2020-11-28 16:20:37'),
(474,'AAA002 ',86,'UNITGLO BIHAR',0,23.6,1,0,'2020-11-28 16:20:37'),
(478,'AAA002 ',87,'SALES RETURN A/C',20,0,1,0,'2020-11-28 16:22:15'),
(479,'AAA002 ',87,'CGST-OTL A/C',1.8,0,1,0,'2020-11-28 16:22:15'),
(480,'AAA002 ',87,'SGST-OTL A/C',1.8,0,1,0,'2020-11-28 16:22:16'),
(481,'AAA002 ',87,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-28 16:22:16'),
(485,'AAA002 ',46,'UNITGLO MAHARASHTRA',20,0,1,0,'2020-11-28 16:36:23'),
(486,'AAA002 ',46,'CGST-ITC A/C',1.8,0,1,0,'2020-11-28 16:36:23'),
(487,'AAA002 ',46,'SGST-ITC A/C',1.8,0,1,0,'2020-11-28 16:36:23'),
(488,'AAA002 ',46,'CASH A/C',0,23.6,1,0,'2020-11-28 16:36:24'),
(489,'AAA002 ',88,'UNITGLO BIHAR',40,0,1,0,'2020-11-28 16:56:35'),
(490,'AAA002 ',88,'IGST-ITC A/C',7.2,0,1,0,'2020-11-28 16:56:35'),
(491,'AAA002 ',88,'CASH A/C',0,47.2,1,0,'2020-11-28 16:56:35'),
(498,'AAA002 ',45,'PURCHASE A/C',20,0,1,0,'2020-11-28 17:10:36'),
(499,'AAA002 ',45,'CGST-ITC A/C',1.8,0,1,0,'2020-11-28 17:10:36'),
(500,'AAA002 ',45,'SGST-ITC A/C',1.8,0,1,0,'2020-11-28 17:10:36'),
(501,'AAA002 ',45,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-28 17:10:36'),
(502,'AAA002 ',27,'PURCHASE A/C',30,0,1,0,'2020-11-28 17:31:30'),
(503,'AAA002 ',27,'CGST-ITC A/C',2.7,0,1,0,'2020-11-28 17:31:30'),
(504,'AAA002 ',27,'SGST-ITC A/C',2.7,0,1,0,'2020-11-28 17:31:30'),
(505,'AAA002 ',27,'UNITGLO MAHARASHTRA',0,35.4,1,0,'2020-11-28 17:31:30'),
(515,'AAA002 ',89,'PURCHASE A/C',20,0,1,0,'2020-11-30 12:49:11'),
(516,'AAA002 ',89,'IGST-ITC A/C',3.6,0,1,0,'2020-11-30 12:49:11'),
(517,'AAA002 ',89,'UNITGLO BIHAR',0,23.6,1,0,'2020-11-30 12:49:11'),
(518,'AAA002 ',90,'PURCHASE A/C',20,0,1,0,'2020-11-30 12:51:19'),
(519,'AAA002 ',90,'IGST-ITC A/C',3.6,0,1,0,'2020-11-30 12:51:19'),
(520,'AAA002 ',90,'UNITGLO MAHARASHTRA',0,23.6,1,0,'2020-11-30 12:51:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA002',20,6,'2020-11-26 00:00:00',23.6,23.6,'',1,'sales',1,0,'2020-11-17 21:10:53'),
('AAA002',39,7,'2020-11-27 00:00:00',23.6,23.6,'',2,'sales',1,0,'2020-11-17 21:12:41'),
('AAA002',1,8,'2019-11-18 00:00:00',23.6,23.6,'',1,'purchase',1,0,'2020-11-18 19:43:39'),
('AAA002',12,9,'2020-11-25 00:00:00',23.6,23.6,'',2,'purchase',1,0,'2020-11-18 19:44:30'),
('AAA002',11,10,'2020-11-18 00:00:00',23.6,23.6,'',1,'debit',1,0,'2020-11-18 19:57:01'),
('AAA002',2,11,'2019-11-18 00:00:00',23.6,23.6,'',2,'debit',1,0,'2020-11-18 19:58:46'),
('AAA002',3,12,'2019-11-20 00:00:00',23.6,23.6,'',3,'credit',1,0,'2020-11-20 12:05:50'),
('AAA002',4,13,'2019-11-20 00:00:00',23.6,23.6,'',4,'credit',1,0,'2020-11-20 12:26:06'),
('AAA002',40,14,'2020-11-27 00:00:00',27.2,27.2,'',5,'credit',1,0,'2020-11-20 12:55:57'),
('AAA002',5,15,'2019-11-20 00:00:00',23.6,23.6,'',3,'sales',1,0,'2020-11-20 15:36:24'),
('AAA002',6,16,'2019-11-20 00:00:00',23.6,23.6,'',4,'sales',1,0,'2020-11-20 15:40:53'),
('AAA002',7,17,'2019-11-20 00:00:00',23.6,23.6,'',7,'sales',1,0,'2020-11-20 16:31:40'),
('AAA002',8,18,'2019-11-20 00:00:00',40.8,40.8,'',8,'sales',1,0,'2020-11-20 16:43:55'),
('AAA002',9,19,'2019-11-20 00:00:00',59,59,'',9,'sales',1,0,'2020-11-20 19:46:39'),
('AAA002',10,20,'2019-11-20 00:00:00',259.6,259.6,'',10,'sales',1,0,'2020-11-20 19:49:44'),
('AAA002',13,21,'2020-11-25 00:00:00',34.4,34.4,'',6,'debit',1,0,'2020-11-24 13:23:59'),
('AAA002',14,22,'2020-11-25 00:00:00',23.6,23.6,'',7,'credit',1,0,'2020-11-25 12:41:59'),
('AAA002',15,23,'2020-11-25 00:00:00',23.6,23.6,'',8,'credit',1,0,'2020-11-25 12:43:31'),
('AAA002',16,24,'2020-11-25 00:00:00',23.6,23.6,'',9,'debit',1,0,'2020-11-25 13:04:19'),
('AAA002',17,25,'2020-11-25 00:00:00',23.6,23.6,'',10,'debit',1,0,'2020-11-25 13:05:29'),
('AAA002',18,26,'2020-11-25 00:00:00',23.6,23.6,'',16,'sales',1,0,'2020-11-25 16:10:34'),
('AAA002',19,27,'2020-11-25 00:00:00',35.4,35.4,'',3,'purchase',1,0,'2020-11-25 21:46:59'),
('AAA002',21,28,'2020-11-26 00:00:00',23.6,23.6,'',1,'expenses',1,0,'2020-11-26 12:51:13'),
('AAA002',22,29,'2020-11-26 00:00:00',23.6,23.6,'',2,'expenses',1,0,'2020-11-26 12:58:21'),
('AAA002',23,30,'2020-11-26 00:00:00',23.6,23.6,'',3,'expenses',1,0,'2020-11-26 13:06:09'),
('AAA002',24,31,'2020-11-26 00:00:00',11.8,11.8,'',17,'sales',1,0,'2020-11-26 14:52:01'),
('AAA002',25,32,'2020-11-26 00:00:00',11.8,11.8,'',18,'sales',1,0,'2020-11-26 14:55:05'),
('AAA002',26,33,'2020-11-26 00:00:00',23.6,23.6,'',19,'sales',1,0,'2020-11-26 15:22:46'),
('AAA002',27,34,'2020-11-26 00:00:00',23.6,23.6,'',4,'expenses',1,0,'2020-11-26 16:23:06'),
('AAA002',41,35,'2020-11-27 00:00:00',23.6,23.6,'',5,'expenses',1,0,'2020-11-26 16:29:12'),
('AAA002',28,36,'2020-11-26 00:00:00',47.2,47.2,'',6,'expenses',1,0,'2020-11-26 16:33:03'),
('AAA002',29,37,'2020-11-26 00:00:00',23.6,23.6,'',7,'expenses',1,0,'2020-11-26 16:38:22'),
('AAA002',30,38,'2020-11-26 00:00:00',23.6,23.6,'',8,'expenses',1,0,'2020-11-26 16:39:38'),
('AAA002',31,39,'2020-11-26 00:00:00',23.6,23.6,'',9,'expenses',1,0,'2020-11-26 16:44:24'),
('AAA002',32,40,'2020-11-26 00:00:00',23.6,23.6,'',10,'expenses',1,0,'2020-11-26 17:02:46'),
('AAA002',33,41,'2020-11-26 00:00:00',23.6,23.6,'',11,'expenses',1,0,'2020-11-26 17:17:59'),
('AAA002',34,42,'2020-11-26 00:00:00',23.6,23.6,'',12,'expenses',1,0,'2020-11-26 17:21:20'),
('AAA002',35,43,'2020-11-26 00:00:00',11.8,11.8,'',13,'expenses',1,0,'2020-11-26 17:22:07'),
('AAA002',36,44,'2020-11-26 00:00:00',23.6,23.6,'',14,'expenses',1,0,'2020-11-26 17:32:09'),
('AAA002',37,45,'2020-11-26 00:00:00',23.6,23.6,'',4,'purchase',1,0,'2020-11-26 18:00:42'),
('AAA002',38,46,'2020-11-26 00:00:00',23.6,23.6,'',15,'expenses',1,0,'2020-11-26 21:53:44'),
('AAA002',42,47,'2020-11-27 00:00:00',35.4,35.4,'',20,'sales',1,0,'2020-11-27 11:13:35'),
('AAA002',43,48,'2020-11-27 00:00:00',59,59,'',21,'sales',1,0,'2020-11-27 11:18:18'),
('AAA002',44,49,'2020-11-27 00:00:00',35.4,35.4,'',22,'sales',1,0,'2020-11-27 11:51:20'),
('AAA002',45,50,'2020-11-27 00:00:00',47.2,47.2,'',24,'sales',1,0,'2020-11-27 12:23:47'),
('AAA002',46,51,'2020-11-27 00:00:00',35.4,35.4,'',25,'sales',1,0,'2020-11-27 12:26:09'),
('AAA002',47,52,'2020-11-27 00:00:00',35.4,35.4,'',11,'credit',1,0,'2020-11-27 13:50:23'),
('AAA002',48,53,'2020-11-27 00:00:00',35.4,35.4,'',28,'sales',1,0,'2020-11-27 14:00:52'),
('AAA002',49,54,'2020-11-27 00:00:00',91.6,91.6,'',30,'sales',1,0,'2020-11-27 14:54:01'),
('AAA002',50,55,'2020-11-27 00:00:00',23.6,23.6,'',31,'sales',1,0,'2020-11-27 15:09:53'),
('AAA002',51,56,'2020-11-27 00:00:00',11.8,11.8,'',32,'sales',1,0,'2020-11-27 15:29:43'),
('AAA002',52,57,'2020-11-27 00:00:00',23.6,23.6,'',33,'sales',1,0,'2020-11-27 15:50:10'),
('AAA002',53,58,'2020-11-27 00:00:00',47.2,47.2,'',34,'sales',1,0,'2020-11-27 16:27:37'),
('AAA002',54,59,'2020-11-27 00:00:00',66.2,66.2,'',35,'sales',1,0,'2020-11-27 16:40:15'),
('AAA002',55,60,'2020-11-27 00:00:00',70.8,70.8,'',36,'sales',1,0,'2020-11-27 16:54:48'),
('AAA002',56,61,'2020-11-27 00:00:00',47.2,47.2,'',12,'credit',1,0,'2020-11-27 17:07:04'),
('AAA002',57,62,'2020-11-27 00:00:00',11.8,11.8,'',13,'debit',1,0,'2020-11-27 17:09:05'),
('AAA002',58,63,'2020-11-27 00:00:00',47.2,47.2,'',37,'sales',1,0,'2020-11-27 17:12:10'),
('AAA002',59,64,'2020-11-27 00:00:00',59,59,'',38,'sales',1,0,'2020-11-27 17:21:21'),
('AAA002',60,65,'2020-11-28 00:00:00',11.8,11.8,'',39,'sales',1,0,'2020-11-28 11:13:43'),
('AAA002',61,66,'2020-11-28 00:00:00',23.6,23.6,'',40,'sales',1,0,'2020-11-28 11:49:06'),
('AAA002',62,67,'2020-11-28 00:00:00',23.6,23.6,'',41,'sales',1,0,'2020-11-28 11:57:16'),
('AAA002',63,68,'2020-11-28 00:00:00',23.6,23.6,'',42,'sales',1,0,'2020-11-28 14:16:52'),
('AAA002',64,69,'2020-11-28 00:00:00',35.4,35.4,'',43,'sales',1,0,'2020-11-28 14:38:43'),
('AAA002',65,70,'2020-11-28 00:00:00',35.4,35.4,'',45,'sales',1,0,'2020-11-28 14:54:41'),
('AAA002',66,71,'2020-11-28 00:00:00',11.8,11.8,'',46,'sales',1,0,'2020-11-28 14:56:22'),
('AAA002',67,72,'2020-11-28 00:00:00',11.8,11.8,'',47,'sales',1,0,'2020-11-28 14:59:27'),
('AAA002',68,73,'2020-11-28 00:00:00',23.6,23.6,'',48,'sales',1,0,'2020-11-28 15:11:09'),
('AAA002',69,74,'2020-11-28 00:00:00',11.8,11.8,'',49,'sales',1,0,'2020-11-28 15:15:56'),
('AAA002',70,75,'2020-11-28 00:00:00',11.8,11.8,'',50,'sales',1,0,'2020-11-28 15:16:54'),
('AAA002',71,76,'2020-11-28 00:00:00',11.8,11.8,'',51,'sales',1,0,'2020-11-28 15:19:19'),
('AAA002',72,77,'2020-11-28 00:00:00',11.8,11.8,'',52,'sales',1,0,'2020-11-28 15:20:34'),
('AAA002',73,78,'2020-11-28 00:00:00',11.8,11.8,'',14,'credit',1,0,'2020-11-28 15:42:29'),
('AAA002',74,79,'2020-11-28 00:00:00',11.8,11.8,'',15,'credit',1,0,'2020-11-28 15:45:18'),
('AAA002',75,80,'2020-11-28 00:00:00',11.8,11.8,'',16,'credit',1,0,'2020-11-28 15:46:29'),
('AAA002',76,81,'2020-11-28 00:00:00',11.8,11.8,'',17,'debit',1,0,'2020-11-28 15:59:57'),
('AAA002',77,82,'2020-11-28 00:00:00',23.6,23.6,'',18,'debit',1,0,'2020-11-28 16:03:00'),
('AAA002',78,83,'2020-11-28 00:00:00',23.6,23.6,'',19,'debit',1,0,'2020-11-28 16:09:13'),
('AAA002',79,84,'2020-11-28 00:00:00',23.6,23.6,'',20,'debit',1,0,'2020-11-28 16:13:02'),
('AAA002',80,85,'2020-11-28 00:00:00',23.6,23.6,'',21,'debit',1,0,'2020-11-28 16:14:05'),
('AAA002',81,86,'2020-11-28 00:00:00',23.6,23.6,'',22,'credit',1,0,'2020-11-28 16:19:34'),
('AAA002',82,87,'2020-11-28 00:00:00',23.6,23.6,'',23,'credit',1,0,'2020-11-28 16:21:33'),
('AAA002',83,88,'2020-11-28 00:00:00',47.2,47.2,'',16,'expenses',1,0,'2020-11-28 16:35:19'),
('AAA002',84,89,'2020-11-28 00:00:00',23.6,23.6,'',5,'purchase',1,0,'2020-11-28 17:08:08'),
('AAA002',85,90,'2020-11-30 00:00:00',23.6,23.6,'',6,'purchase',1,0,'2020-11-30 12:51:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(2,'debit','DR/19-20/',11,0,'2020-03-06 22:23:47'),
(3,'credit','CR/19-20/',18,0,'2020-03-06 22:23:47'),
(4,'invoice','PMT/19-20/',33,0,'2020-03-08 20:22:15'),
(5,'invoice','Inv/19-20/',17,0,'2020-11-17 20:53:43'),
(6,'debit','DR/19-20',0,0,'2020-11-17 20:53:43'),
(7,'credit','CR/19-20',2,0,'2020-11-17 20:53:43');
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
(1,'','','','1','','0','','0','0001-01-01 00:00:00','0','0','','0','FIFO','Cost or Market Price whichever is lower','0',1,'1',1,'1',1,'1','1','0','','0',0,'2020-11-17 20:53:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_news_and_update
-- 

/*!40000 ALTER TABLE `pms_news_and_update` DISABLE KEYS */;
INSERT INTO `pms_news_and_update`(`auto_id`,`pms_news_title`,`pms_news_description`,`pms_news_validate_from_date`,`pms_news_validate_to_date`,`pms_news_in_out_app`,`pms_news_outapp_link`,`status`,`default_date`) VALUES
(1,'Filing NIL Form CMP-08 statement through SMS on GST Portal','The Goods and Services Tax Network (GSTN) has enabled an SMS filing facility for Composition taxpayers to submit their Nil Form CMP-08 statements. Previously, filing of Form CMP-08 could only be done ','2020-11-24 00:00:00','2020-11-24 00:00:00',1,'',2,'2020-11-24 20:11:03'),
(2,'Filing NIL Form CMP-08 statement through SMS on GST Portal','GSTN issues advisory in respect of filing of NIL Form CMP-08 statement through SMS on GST portal; States that a Composition taxpayer may now file NIL statement in Form GST CMP-08 for a quarter.','2020-11-30 00:00:00','2020-11-30 00:00:00',1,'',0,'2020-11-30 15:51:37'),
(3,'Filing NIL Form CMP-08 statement through SMS on GST Portal','GSTN issues advisory in respect of filing of NIL Form CMP 08 statement through SMS on GST portal States that a Composition taxpayer may now file NIL statement in Form GST CMP 08 for a quarter','2020-12-01 00:00:00','2020-12-01 00:00:00',1,'',2,'2020-12-01 18:49:00'),
(4,'Filing NIL Form CMP-08 statement through SMS on GST Portal','GSTN issues advisory in respect of filing of NIL Form CMP-08 statement through SMS on GST portal; States that a Composition taxpayer may now file NIL statement in Form GST CMP-08 for a quarter.','2020-12-03 00:00:00','2020-12-03 00:00:00',1,'',2,'2020-12-03 13:42:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`invoice_date`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'','0001-01-01 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',100,10,1000,0,0,0,0,0,0,0,0,1,0,'stock','2020-11-17 20:50:17'),
(2,1,'Inv/19-20/000001','2019-11-18 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,20,0,20,0,0,9,1.8,9,1.8,1,0,'purchase','2020-11-18 19:43:34'),
(6,2,'Inv/19-20/000002','2020-11-25 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,20,0,20,18,3.6,0,0,0,0,1,0,'purchase','2020-11-25 21:45:39'),
(18,4,'Inv/19-20/000002','2020-11-26 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,20,0,20,0,0,9,1.8,9,1.8,1,0,'purchase','2020-11-28 17:10:26'),
(19,3,'Inv/19-20/','2020-11-25 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,30,0,30,0,0,9,2.7,9,2.7,1,0,'purchase','2020-11-28 17:31:21'),
(23,5,'Inv/19-20/000001','2020-11-28 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,10,0,10,18,1.8,0,0,0,0,1,0,'purchase','2020-11-30 12:49:07'),
(24,5,'Inv/19-20/000001','2020-11-28 00:00:00','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,0,10,0,10,18,1.8,0,0,0,0,1,0,'purchase','2020-11-30 12:49:07'),
(26,2,'','2020-11-28 00:00:00','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',100,10,1000,0,0,0,0,0,0,0,0,1,0,'stock','2020-11-30 17:05:46');
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
(1,'Inv/19-20/000001','','2019-11-18 00:00:00','NO','10',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10',23.6,3.6,0,1.8,1.8,0,'Cash','Paid','purchase','demo',8,1,0,'2020-11-18 19:43:34'),
(2,'Inv/19-20/000002','','2020-11-25 00:00:00','NO','10',10,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27',23.6,3.6,3.6,0,0,0,'Cash','Paid','purchase','demo',9,1,0,'2020-11-18 19:44:26'),
(3,'Inv/19-20/','','2020-11-25 00:00:00','NO','10',10,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27',35.4,0,0,2.7,2.7,0,'Cash','Paid','purchase','demo mahacgst',27,1,0,'2020-11-25 21:46:50'),
(4,'Inv/19-20/000002','','2020-11-26 00:00:00','NO','10',10,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27',23.6,0,0,1.8,1.8,0,'Cash','Paid','purchase','demo mahacgst',45,1,0,'2020-11-26 18:00:36'),
(5,'Inv/19-20/000001','','2020-11-28 00:00:00','NO','10',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10',23.6,0,3.6,0,0,0,'Cash','Paid','purchase','bihar igst',89,1,0,'2020-11-28 17:08:00');
/*!40000 ALTER TABLE `pms_purchase_invoice_mst` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_dtl` (
  `sale_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) NOT NULL,
  `invoice_no` varchar(16) NOT NULL,
  `invoice_date` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`invoice_date`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'Inv/19-20/000001','2020-11-26 00:00:00','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,1,0,'sales','2020-11-26 15:19:29'),
(11,25,'Inv/19-20/000014','2020-11-27 00:00:00','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,30,30,0,30,18,5.4,0,0,0,0,1,0,'sales','2020-11-27 12:26:02'),
(24,38,'PMT/19-20/000019','2020-11-27 00:00:00','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,1,0,'sales','2020-11-27 17:26:22'),
(25,38,'PMT/19-20/000019','2020-11-27 00:00:00','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,1,0,'sales','2020-11-27 17:26:26'),
(26,38,'PMT/19-20/000019','2020-11-27 00:00:00','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,9,1.8,9,1.8,1,0,'sales','2020-11-27 17:26:27'),
(30,42,'PMT/19-20/000023','2020-11-28 00:00:00','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,18,0,9,1.8,9,1.8,1,0,'sales','2020-11-28 14:16:47'),
(39,49,'PMT/19-20/000030','2020-11-28 00:00:00','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,1,0,'sales','2020-11-28 15:15:38'),
(40,50,'PMT/19-20/000031','2020-11-28 00:00:00','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,18,1.8,0,0,0,0,1,0,'sales','2020-11-28 15:16:43'),
(41,51,'PMT/19-20/000032','2020-11-28 00:00:00','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,18,1.8,0,0,0,0,1,0,'sales','2020-11-28 15:19:10'),
(42,52,'PMT/19-20/000033','2020-11-28 00:00:00','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,1,0,'sales','2020-11-28 15:20:27');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'Inv/19-20/000001','','Regular','2020-11-26 00:00:00','NO','10',10,'ROAD','','2020-12-26 00:00:00','','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,'0.00',0,1.8,1.8,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid',NULL,'bihardemo',6,1,0,'2020-11-17 21:10:38'),
(25,'Inv/19-20/000014','','Regular','2020-11-27 00:00:00','NO','10',10,'','','2020-11-27 00:00:00','','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,35.4,'5.40',5.4,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid',NULL,'',51,1,0,'2020-11-27 12:25:53'),
(38,'PMT/19-20/000019','','Regular','2020-11-27 00:00:00','NO','10',10,'','','2020-11-27 00:00:00','','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,59,'3.60',3.6,4.5,4.5,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','','',64,1,0,'2020-11-27 17:21:13'),
(42,'PMT/19-20/000023','','Regular','2020-11-28 00:00:00','NO','10',10,'','','2020-11-28 00:00:00','','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,'3.60',3.6,1.8,1.8,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','Regular','',68,1,0,'2020-11-28 14:16:47'),
(49,'PMT/19-20/000030','','Regular','2020-11-28 00:00:00','NO','10',10,'','','2020-11-28 00:00:00','','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,11.8,'0.00',0,0.9,0.9,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','Regular','democgst',74,1,0,'2020-11-28 15:15:38'),
(50,'PMT/19-20/000031','','Regular','2020-11-28 00:00:00','NO','10',10,'','','2020-11-28 00:00:00','','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar','10','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,11.8,'1.80',1.8,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','Regular','demoigst',75,1,0,'2020-11-28 15:16:43'),
(51,'PMT/19-20/000032','','Regular','2020-11-28 00:00:00','NO','10',10,'','','2020-11-28 00:00:00','','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,11.8,'1.80',1.8,0,0,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','Regular','demomahaigst',76,1,0,'2020-11-28 15:19:10'),
(52,'PMT/19-20/000033','','Regular','2020-11-28 00:00:00','NO','10',10,'','','2020-11-28 00:00:00','','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra','27','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,11.8,'0.00',0,0.9,0.9,0,'UNION BANK OF INDIA','987654321123','UBIN000123','','','','Cash','Paid','Regular','demomahacgst',77,1,0,'2020-11-28 15:20:26');
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
  `product_valuation_qty` text NOT NULL COMMENT 'reflect from valuation report ',
  `product_valuation_rate` text NOT NULL COMMENT 'reflect from valuation report',
  `product_valuation_amt` text NOT NULL COMMENT 'reflect from valuation report',
  `valuation_close_qty` text NOT NULL COMMENT 'reflect from valuation report',
  `valuation_close_rate` text NOT NULL COMMENT 'reflect from valuation report',
  `valuation_close_amt` text NOT NULL COMMENT 'reflect from valuation report',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0-active, 2-remove',
  `default_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stock_expiry_date` date DEFAULT NULL,
  `stock_batch` varchar(50) NOT NULL,
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`product_valuation_qty`,`product_valuation_rate`,`product_valuation_amt`,`valuation_close_qty`,`valuation_close_rate`,`valuation_close_amt`,`status`,`default_date`,`stock_expiry_date`,`stock_batch`) VALUES
(1,'1','1','PEN','PAC-PACKS','PAC-PACKS','NOS','12',0,'0001','18','10','10.00',100,10,1000,'0.00','0.00','0.00','101','10','1010','101','10','1010',0,'2020-11-30 17:19:35',NULL,''),
(2,'1','1','PENCIL','PAC-PACKS','PAC-PACKS','NOS','12',0,'0002','18','10','10.00',100,10,1000,'0.00','0.00','0.00','95','10','950','95','10','950',0,'2020-11-30 17:08:13',NULL,'');
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
  `invoice_date` date DEFAULT NULL,
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
  `date_of_issue` date NOT NULL,
  PRIMARY KEY (`dtl_dr_cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_dtl`(`dtl_dr_cr_id`,`refrance_id`,`invoice_date`,`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`,`hsn_code`,`uom`,`batch`,`expiry_date`,`quantity`,`rate`,`amount`,`discount`,`tax_value`,`igst_rate`,`igst_amount`,`cgst_rate`,`cgst_amount`,`sgst_rate`,`sgst_amount`,`total`,`ca_approved_status`,`status`,`default_date`,`date_of_issue`) VALUES
(24,6,'2020-11-25 00:00:00','DR/19-20/000003','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,72,3.6,36,0,36,0,34.4,1,0,'2020-11-27 13:17:33','2020-11-25 00:00:00'),
(25,1,'2020-11-18 00:00:00','DR/19-20/000001','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,0,0,0,0,23.6,1,0,'2020-11-27 13:18:55','2020-11-18 00:00:00'),
(26,9,'2020-11-18 00:00:00','DR/19-20/000004','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-27 13:20:15','2020-11-25 00:00:00'),
(30,5,'2020-11-27 00:00:00','CR/19-20/000003','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,36,3.6,18,0,18,0,27.2,1,0,'2020-11-27 13:48:33','2020-11-27 00:00:00'),
(33,7,'2020-11-27 00:00:00','CR/19-20/000004','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-27 13:53:46','2020-11-25 00:00:00'),
(34,8,'2020-11-27 00:00:00','CR/19-20/000005','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,9,0,9,0,23.6,1,0,'2020-11-27 13:54:47','2020-11-25 00:00:00'),
(35,11,'2020-11-27 00:00:00','CR/19-20/000006','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-27 16:59:37','2020-11-27 00:00:00'),
(36,11,'2020-11-27 00:00:00','CR/19-20/000006','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,11.8,1,0,'2020-11-27 16:59:58','2020-11-27 00:00:00'),
(37,10,'2020-11-27 00:00:00','DR/19-20/000005','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,11.8,1,0,'2020-11-27 17:04:24','2020-11-25 00:00:00'),
(38,10,'2020-11-27 00:00:00','DR/19-20/000005','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,11.8,1,0,'2020-11-27 17:04:24','2020-11-25 00:00:00'),
(45,14,'2020-11-26 00:00:00','CR/19-20/000014','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PEN','0001','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,18,1.8,0,0,0,0,11.8,1,0,'2020-11-28 15:42:21','2020-11-28 00:00:00'),
(46,15,'2020-11-27 00:00:00','CR/19-20/000015','Inv/19-20/000014','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,11.8,1,0,'2020-11-28 15:45:12','2020-11-28 00:00:00'),
(47,16,'2020-11-27 00:00:00','CR/19-20/000016','Inv/19-20/000014','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,10,10,0,10,18,1.8,0,0,0,0,11.8,1,0,'2020-11-28 15:46:23','2020-11-28 00:00:00'),
(48,13,'2020-11-25 00:00:00','DR/19-20/000006','Inv/19-20/','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,10,10,0,10,0,0,9,0.9,9,0.9,11.8,1,0,'2020-11-28 15:58:16','2020-11-27 00:00:00'),
(49,17,'2020-11-28 00:00:00','DR/19-20/000007','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PEN','0001','PAC-PACKS','1','0001-01-01 00:00:00',1,10,10,0,10,18,1.8,0,0,0,0,11.8,1,0,'2020-11-28 15:59:50','2020-11-28 00:00:00'),
(50,18,'2020-11-28 00:00:00','DR/19-20/000008','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-28 16:02:47','2020-11-28 00:00:00'),
(52,19,'2020-11-28 00:00:00','DR/19-20/000009','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,0,0,0,0,23.6,1,0,'2020-11-28 16:10:25','2020-11-28 00:00:00'),
(53,20,'2020-11-26 00:00:00','DR/19-20/000010','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-28 16:12:25','2020-11-28 00:00:00'),
(54,21,'2020-11-26 00:00:00','DR/19-20/000011','Inv/19-20/000002','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','1','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,0,0,0,0,23.6,1,0,'2020-11-28 16:13:57','2020-11-28 00:00:00'),
(56,22,'2020-11-26 00:00:00','CR/19-20/000017','Inv/19-20/000001','UNITGLO BIHAR','UNITGLO BIHAR','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,18,3.6,0,0,0,0,23.6,1,0,'2020-11-28 16:20:27','2020-11-28 00:00:00'),
(58,23,'2020-11-27 00:00:00','CR/19-20/000018','Inv/19-20/000014','UNITGLO MAHARASHTRA','UNITGLO MAHARASHTRA','PENCIL','0002','PAC-PACKS','0','0001-01-01 00:00:00',1,20,20,0,20,0,0,9,1.8,9,1.8,23.6,1,0,'2020-11-28 16:22:06','2020-11-28 00:00:00');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_voucher_dr_cr_note_mst
-- 

DROP TABLE IF EXISTS `pms_voucher_dr_cr_note_mst`;
CREATE TABLE IF NOT EXISTS `pms_voucher_dr_cr_note_mst` (
  `dr_cr_Id` int(11) NOT NULL AUTO_INCREMENT,
  `document_no` varchar(16) NOT NULL,
  `invoice_date` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_mst`(`dr_cr_Id`,`document_no`,`invoice_date`,`date_of_issue`,`doc_state`,`doc_state_code`,`against_invoice`,`date_of_invoice`,`bill_party_name`,`bill_party_address`,`bill_party_gstin`,`bill_party_state`,`bill_party_state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`note_type`,`remarks`,`dr_cr_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'DR/19-20/000001','2020-11-18 00:00:00','2020-11-18 00:00:00','10',10,'Inv/19-20/000002','2020-11-18 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,3.6,3.6,0,0,0,'purchaseReturn','demo',10,1,0,'2020-11-18 19:56:47'),
(5,'CR/19-20/000003','2020-11-27 00:00:00','2020-11-27 00:00:00','10',10,'Inv/19-20/000002','2020-11-27 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,27.2,3.6,3.6,0,0,0,'credit','',14,1,0,'2020-11-20 12:55:53'),
(6,'DR/19-20/000003','2020-11-25 00:00:00','2020-11-25 00:00:00','10',10,'Inv/19-20/000002','2020-11-25 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,34.4,3.6,3.6,0,0,0,'debit','',21,1,0,'2020-11-20 14:31:00'),
(7,'CR/19-20/000004','2020-11-27 00:00:00','2020-11-25 00:00:00','10',10,'Inv/19-20/000001','2020-11-27 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,0,1.8,1.8,0,'saleReturn','',22,1,0,'2020-11-25 12:41:48'),
(8,'CR/19-20/000005','2020-11-27 00:00:00','2020-11-25 00:00:00','10',10,'Inv/19-20/000002','2020-11-27 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,3.6,3.6,0,0,0,'saleReturn','',23,1,0,'2020-11-25 12:43:18'),
(9,'DR/19-20/000004','2020-11-18 00:00:00','2020-11-25 00:00:00','10',10,'Inv/19-20/000001','2020-11-18 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,0,1.8,1.8,0,'purchaseReturn','',24,1,0,'2020-11-25 13:04:04'),
(10,'DR/19-20/000005','2020-11-27 00:00:00','2020-11-25 00:00:00','10',10,'Inv/19-20/000001','2020-11-27 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,0,1.8,1.8,0,'debit','',25,1,0,'2020-11-25 13:05:15'),
(11,'CR/19-20/000006','2020-11-27 00:00:00','2020-11-27 00:00:00','10',10,'Inv/19-20/000001','2020-11-27 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,35.4,5.4,0,2.7,2.7,0,'credit','',52,1,0,'2020-11-25 13:11:07'),
(13,'DR/19-20/000006','2020-11-25 00:00:00','2020-11-27 00:00:00','10',10,'Inv/19-20/','2020-11-25 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,11.8,1.8,0,0.9,0.9,0,'purchaseReturn','purchasereturnmahacgst',62,1,0,'2020-11-27 17:08:58'),
(14,'CR/19-20/000014','2020-11-26 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000001','2020-11-26 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,11.8,1.8,1.8,0,0,0,'saleReturn','salereutnbiharigst',78,1,0,'2020-11-28 15:42:17'),
(15,'CR/19-20/000015','2020-11-27 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000014','2020-11-27 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,11.8,1.8,0,0.9,0.9,0,'saleReturn','salereturnmahacgst',79,1,0,'2020-11-28 15:45:09'),
(16,'CR/19-20/000016','2020-11-27 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000014','2020-11-27 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,11.8,1.8,1.8,0,0,0,'saleReturn','salereturnmaha',80,1,0,'2020-11-28 15:46:21'),
(17,'DR/19-20/000007','2020-11-28 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000001','2020-11-28 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,11.8,1.8,1.8,0,0,0,'purchaseReturn','purchasereturnigst',81,1,0,'2020-11-28 15:59:50'),
(18,'DR/19-20/000008','2020-11-28 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000001','2020-11-28 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,0,1.8,1.8,0,'purchaseReturn','',82,1,0,'2020-11-28 16:02:47'),
(19,'DR/19-20/000009','2020-11-28 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000001','2020-11-28 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,3.6,0,0,0,'debit','debitnotebiharigst',83,1,0,'2020-11-28 16:09:04'),
(20,'DR/19-20/000010','2020-11-26 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000002','2020-11-26 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,3.6,0,1.8,1.8,0,'debit','debitmahacgst',84,1,0,'2020-11-28 16:12:25'),
(21,'DR/19-20/000011','2020-11-26 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000002','2020-11-26 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,3.6,3.6,0,0,0,'debit','',85,1,0,'2020-11-28 16:13:56'),
(22,'CR/19-20/000017','2020-11-26 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000001','2020-11-26 00:00:00','UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,'UNITGLO BIHAR','','10AABCU95738R1ZD','Bihar',10,23.6,3.6,3.6,0,0,0,'credit','creditbihar igst',86,1,0,'2020-11-28 16:19:25'),
(23,'CR/19-20/000018','2020-11-27 00:00:00','2020-11-28 00:00:00','10',10,'Inv/19-20/000014','2020-11-27 00:00:00','UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,'UNITGLO MAHARASHTRA','','27AABCU95738R1ZD','Maharastra',27,23.6,3.6,0,1.8,1.8,0,'credit','demomahacgst',87,1,0,'2020-11-28 16:21:24');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-12-03 17:49:13
-- Total time: 0:0:0:0:826 (d:h:m:s:ms)
