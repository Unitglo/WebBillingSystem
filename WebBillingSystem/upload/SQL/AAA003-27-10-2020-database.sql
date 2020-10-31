-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2020-10-27 12:47:54
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
  `UCID` varchar(50) NOT NULL,
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
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`UCID`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`,`rate_of_depreciation`,`natural_assets`) VALUES
(1,'PURCHASE A/C','','7','2','PURCHASE A/C','Yes','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' '''),
(2,'SALES A/C','','6','1','SALES A/C','Yes','','','','0','','','0','','','1','','',0,'Credit',0,'2019-12-02 10:53:22','''0''',''' '''),
(3,'CGST-ITC A/C','','5','6','CGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' '''),
(4,'IGST-ITC A/C','','5','6','IGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' '''),
(5,'SGST-ITC A/C','','5','6','SGST-ITC A/C','No','','','','0','','','0','','','','','',0,'Debit',0,'2019-12-02 10:53:22','''0''',''' '''),
(6,'CASH A/C','','5','4','CASH A/C','No','','','','0','','','','','','','','',56896.34,'Debit',0,'2019-12-02 20:11:52','''0''',''' '''),
(7,'CREDIT A/C','','7','1','CREDIT A/C','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',0,'Credit',0,'2019-09-07 03:51:11','''0''',''' '''),
(8,'DEBIT A/C','','3','2','DEBIT A/C','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',0,'Debit',0,'2019-09-09 18:04:21','''0''',''' '''),
(9,'SALES RETURN A/C','','7','2','SALES RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-11 18:43:33','''0''',''' '''),
(10,'CGST-OTL A/C','','3','3','CGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:40:45','''0''',''' '''),
(11,'SGST-OTL A/C','','3','3','SGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:02','''0''',''' '''),
(12,'IGST-OTL A/C','','3','3','IGST-OTL A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-17 17:43:33','''0''',''' '''),
(13,'PURCHASE RETURN A/C','','7','2','PURCHASE RETURN A/C','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-01-18 12:03:17','''0''',''' '''),
(14,'DEOM','TEST123','4','1','DEOM','Yes','','','','0','','','','','','','','',0,'Debit',0,'2020-10-19 13:09:56','123','Plant & Machinery');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
(7,'Expenses',0,'2019-06-03 10:08:32'),
(8,'Expenses',0,'2020-06-03 10:23:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_start_date`,`company_end_date`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA003','db_pms__Ankita_AAA003_2019_2020','Individual','VANARSE','RAJU','ANKITA','PUNE','','','PUNE','0',0,'INDIA','411062','',0,'','','','','','','2019','2019-01-01 00:00:00','2020-01-01 00:00:00','','','','','','','','','','','','','','','','','','','2020-10-16 14:18:17',0),
(2,'AAA003','db_pms__Ankita_AAA003_2019_2020','Individual','VANARSE','RAJU','ANKITA','PUNE','','','PUNE','0',0,'INDIA','411062','',0,'','','','','','','2019','0001-01-01 00:00:00','0001-01-01 00:00:00','','','','','','','','','','','','','','','','','','','2020-10-16 14:18:21',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_product_name
-- 

/*!40000 ALTER TABLE `pms_expenses_product_name` DISABLE KEYS */;
INSERT INTO `pms_expenses_product_name`(`auto_incr_id`,`expe_product_name`,`status`,`default_date`) VALUES
(1,'bank charge',0,'2020-10-27 12:47:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_dtl
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_dtl`(`exp_dtl_id`,`exp_voucherno`,`expenses_head`,`exp_product_name`,`exp_hsn_code`,`exp_tax_value`,`rate`,`exp_igst_rate`,`exp_igst_amount`,`exp_cgst_rate`,`exp_cgst_amount`,`exp_sgst_rate`,`exp_sgst_amount`,`exp_total_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'17','BANK CHARGES','bank charge','','100.00',100,'0',0,'50',50,'50',50,200,0,0,'2020-10-27 12:47:20');
/*!40000 ALTER TABLE `pms_expenses_voucher_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_voucher_mst
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_mst`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_mst` (
  `exp_voucher_no` int(11) NOT NULL AUTO_INCREMENT,
  `manual_id` int(11) NOT NULL,
  `exp_invoice_no` text NOT NULL,
  `exp_invoice_IRN` text NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_expenses_voucher_mst
-- 

/*!40000 ALTER TABLE `pms_expenses_voucher_mst` DISABLE KEYS */;
INSERT INTO `pms_expenses_voucher_mst`(`exp_voucher_no`,`manual_id`,`exp_invoice_no`,`exp_invoice_IRN`,`exp_voucher_date`,`exp_place_of_supply`,`exp_reverse_charge`,`exp_state`,`exp_state_code`,`exp_supplier_name`,`exp_supplier_addr`,`exp_supplier_gstin`,`exp_supplier_state`,`exp_supplier_state_code`,`expenses_head`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`company_name`,`auth_name`,`payment_mode`,`expenses_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,10,'','','2019-06-01 00:00:00','','NO','10',10,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','PATNA','10AAACC2498P3ZG','Bihar',10,'BANK CHARGES',35.4,5.4,0,2.7,2.7,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',13,1,0,'2020-04-17 19:26:31'),
(2,1,'','','2019-04-13 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',100.3,15.3,0,7.65,7.65,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',50,1,0,'2020-04-18 14:37:32'),
(3,4,'','','2019-05-09 00:00:00','','NO','10',10,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','','10AAACC2498P3ZG','Bihar',10,'BANK CHARGES',30.68,4.68,0,2.34,2.34,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',57,1,0,'2020-04-18 15:58:52'),
(4,5,'','','2019-05-12 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',100.3,15.3,0,7.65,7.65,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',59,1,0,'2020-04-18 16:01:29'),
(5,7,'','','2019-05-17 00:00:00','','NO','10',10,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','','10AAACC2498P3ZG','Bihar',10,'BANK CHARGES',236,36,0,18,18,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',60,1,0,'2020-04-18 16:05:17'),
(6,8,'','','2019-05-22 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',30.68,4.68,0,2.34,2.34,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',61,1,0,'2020-04-18 16:07:40'),
(7,9,'','','2019-05-28 00:00:00','','NO','10',10,'CENTRAL BANK OF INDIA CC-A/C NO.3170157625','','10AAACC2498P3ZG','Bihar',10,'BANK CHARGES',29.5,4.5,0,2.25,2.25,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',62,1,0,'2020-04-18 16:10:23'),
(8,2,'','','2019-04-16 00:00:00','','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',29.5,4.5,0,2.25,2.25,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',65,0,0,'2020-04-18 17:07:37'),
(9,3,'','','2019-04-17 00:00:00','','NO','10',10,'STATE BANK OF INDIA A/C NO.35029039458','','10AAACS8577K2Z3','Bihar',10,'BANK CHARGES',7.08,1.08,0,0.54,0.54,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',69,0,0,'2020-04-18 17:13:00'),
(10,13,'','','2019-07-26 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',737.5,112.5,0,56.25,56.25,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',128,0,0,'2020-04-19 16:40:32'),
(11,6,'','','2019-05-12 00:00:00','','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',29.5,4.5,0,2.25,2.25,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',163,0,0,'2020-04-20 10:10:23'),
(12,11,'','','2019-06-16 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',23.75,3.62,0,1.81,1.81,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',227,0,0,'2020-04-21 01:45:36'),
(13,12,'','','2019-06-16 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',23.75,3.62,0,1.81,1.81,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Outstanding',241,1,0,'2020-04-21 09:15:19'),
(14,14,'','','2019-08-11 00:00:00','','NO','10',10,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','Bihar',10,'BANK CHARGES',59,9,0,4.5,4.5,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',387,1,0,'2020-04-22 07:50:58'),
(15,15,'','','2019-08-27 00:00:00','','NO','10',10,'ORIENTAL INSURANCE','','','Bihar',10,'ORIENTAL INSURANCE',24757.86,3776.62,0,1888.31,1888.31,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',419,1,0,'2020-04-22 08:31:11'),
(16,16,'','','2019-08-31 00:00:00','','NO','10',10,'VITAL SOLUTIONS PTE LTD.','#21-01, ROBINSON 77,','','',0,'VITAL SOLUTIONS PTE LTD.',529877,90,0,45,45,'SUNIL KUMAR TIWARY','SUNIL KUMAR TIWARY','Cash',0,1,0,'2020-04-22 08:42:51'),
(17,17,'','','2020-01-01 00:00:00','','NO','0',0,'AXIS BANK  A/C NO.916020025351806','RAJENDAR NAGAR','10AAACU2414K2ZT','',0,'BANK CHARGES',200,100,0,50,50,'ANKITA RAJU VANARSE','','Cash',0,0,0,'2020-10-27 12:47:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'AAA003 ',6,'PURCHASE A/C',5000,0,0,0,'2020-10-22 17:53:04'),
(2,'AAA003 ',6,'IGST-ITC A/C',600,0,0,0,'2020-10-22 17:53:04'),
(3,'AAA003 ',6,'PURCHASE A/C',0,5600,0,0,'2020-10-22 17:53:04'),
(4,'AAA003 ',7,'PURCHASE A/C',5712,0,0,0,'2020-10-22 17:59:53'),
(5,'AAA003 ',7,'CGST-ITC A/C',0,6,0,0,'2020-10-22 17:59:53'),
(6,'AAA003 ',7,'CGST-ITC A/C',0,6,0,0,'2020-10-22 17:59:53'),
(7,'AAA003 ',7,'PURCHASE RETURN A/C',0,5700,0,0,'2020-10-22 17:59:53'),
(8,'AAA003 ',8,'PURCHASE A/C',5600,0,0,0,'2020-10-23 19:43:23'),
(9,'AAA003 ',8,'PURCHASE RETURN A/C',0,5600,0,0,'2020-10-23 19:43:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`manual_id`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`master_id`,`master_id_type`,`ca_approved_status`,`status`,`default_date`) VALUES
('AAA003',2,6,'2019-12-31 00:00:00',5600,5600,'',1,'purchase',0,0,'2020-10-22 17:53:04'),
('AAA003',3,7,'2020-01-01 00:00:00',5712,5712,'',11,'debit',0,0,'2020-10-22 17:59:53'),
('AAA003',1,8,'2019-10-04 00:00:00',5600,5600,'',12,'debit',0,0,'2020-10-23 19:43:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(2,'debit','DR/19-20/',3,0,'2020-03-06 16:53:47'),
(3,'credit','CR/19-20/',5,0,'2020-03-06 16:53:47'),
(4,'invoice','PMT/19-20/',2,0,'2020-03-08 14:52:15');
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
(1,'TEST','','','1','','0','','0','0001-01-01 00:00:00','0','0','','0','FIFO','Cost or Market Price whichever is lower','0',1,'0',1,'0',1,'0','1','0','','0',0,'2020-10-22 16:09:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`invoice_date`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'5710','2019-12-31 00:00:00','100 GSM 585X910 COATED PAPER GLOSS','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,0,5000,0,5000,12,600,0,0,0,0,0,0,'purchase','2020-10-22 17:52:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_irn_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`purchase_journal_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'5710','','2019-12-31 00:00:00','NO','0',0,'PURCHASE A/C','','','','',5600,600,600,0,0,0,'Cash','Paid','purchase','demo',6,0,0,'2020-10-22 17:52:51');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`invoice_date`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`ca_approved_status`,`status`,`invoice_type`,`default_date`) VALUES
(1,2,'PMT/19-20/000002',NULL,'COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','0','0001-01-01 00:00:00',10,10,100,0,100,12,12,0,0,0,0,0,0,'sales','2020-10-22 16:29:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_irn_no`,`sale_invoice_type`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`sale_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(2,'PMT/19-20/000002','','Regular','0001-01-01 00:00:00','NO','0',0,'ROAD','MH43001','2020-10-22 00:00:00','','PURCHASE A/C','','','','','PURCHASE A/C','','','',0,112,'12.00',12,0,0,0,'','','','','TEST','','Cash','Paid',NULL,'demo',0,0,0,'2020-10-22 16:29:16');
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
  `stock_expiry_date` date DEFAULT NULL,
  `stock_batch` varchar(50) NOT NULL,
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
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_pri_unit_of_measurment`,`stock_sec_unit_of_measurement`,`stock_conversion_factor`,`stock_chk_default_id`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_opening_qty`,`stock_purc_price_per_unit`,`stock_opening_amt`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`product_valuation_qty`,`product_valuation_rate`,`product_valuation_amt`,`valuation_close_qty`,`valuation_close_rate`,`valuation_close_amt`,`status`,`default_date`) VALUES
(1,'1','2','COATED BOARD 300 GSM 584 X 910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0125470514429109',0,'4802','12','5035.70','5036','2022-10-01 00:00:00','AZS/TNB/4321',4782,52.13,249271.6,'0','0','0','10','20','200','10','20','200',0,'2020-10-22 16:10:44'),
(2,'1','2','COATED PAPER 100 GSM 584X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.037593984962406',0,'4802','12','1696.97','1697','2022-10-01 00:00:00','',4681.6,53.87,252208,'','','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(3,'1','2','COATED PAPER 118 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0436681222707424',0,'4802','12','9500','1000','2022-10-01 00:00:00','',4946.4,53.21,263196,'','','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(4,'1','2','COATED PAPER 128 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','105','110','2022-10-01 00:00:00','',2635.68,93.35,246044.2,'','','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(5,'1','2','COATED PAPER 90 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403225806451613',0,'4802','12','55','60','2022-10-01 00:00:00','',5581.44,49.56,276592.32,'5581.44','49.56','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(6,'1','2','COATED PAPER 90 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0418410041841004',0,'4802','12','1550','1560','2022-10-01 00:00:00','',12093.12,67.43,815396.21,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(7,'1','2','COATED PAPER 80 GSM 510X760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0645161290322581',0,'4802','12','55','65','2021-10-01 00:00:00','',6046.56,45.1,272681.76,'','','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(8,'1','2','COATED PAPER 80 GSM 584 X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','70','85','2022-10-01 00:00:00','',13100.88,62.33,816547.16,'','','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(9,'1','3','100 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0375685626267939',0,'4802','12','65','75','0001-01-01 00:00:00','',5163.89,52.58,271518.82,'5163','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(10,'1','3','115 GSM COATED PAPER GLOSS 585X910','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0326690623979092',0,'4802','12','1830.33','1830.33','0001-01-01 00:00:00','',4744.55,52.57,249407.71,'474','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(11,'1','3','120 GSM 510X760 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.042999656002752',0,'4802','12','69','72','0001-01-01 00:00:00','',3581.42,52.89,189420,'3581','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:44'),
(12,'1','3','120 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0313087038196619',0,'4802','12','65','66','0001-01-01 00:00:00','',2874.6,52.57,151131.15,'2874','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(13,'1','3','COATED ART PAPER GLOSS 128 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0403128275417238',0,'4802','12','','','0001-01-01 00:00:00','',4762.75,52.89,251904,'4762','52','','0','0','0','0','0','0',2,'2020-10-22 16:10:45'),
(14,'1','3','128 GSM COATED PAPER GLOSS 58.5X91','PAC-PACKS','PAC-PACKS','KGS','17.035',0,'4802','12','955','970','0001-01-01 00:00:00','',33,901,29733,'33','901','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(15,'1','3','150 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.025046335721084',0,'4802','12','2400','2350','0001-01-01 00:00:00','',2754.89,52.89,145705.92,'2754.89','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(16,'1','3','170 GSM 585X910 COATED PAPER GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0220994475138122',0,'4802','12','62','66','0001-01-01 00:00:00','',769.25,52.89,40685.59,'769.25','52','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(17,'1','3','80 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','85','90','0001-01-01 00:00:00','',4216.21,56.52,238306.16,'','56.52','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(18,'1','3','90 GSM 585X910 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','1550','1550','0001-01-01 00:00:00','',10444.82,54.56,569885.31,'','54','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(19,'1','4','UNCOATED WOODFREE PAPER 120 GSM 58.5X91','PAC-PACKS','PAC-PACKS','KGS','15.97',0,'4802','12','950','975','0001-01-01 00:00:00','',183,879.34,160919.22,'','879.34','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(20,'1','4','UNCOATED WOODFREE PAPER 70 GSM 51X 76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0737136960047177',0,'4802','12','875','900','0001-01-01 00:00:00','',596.9,55.06,32866.24,'','55.06155134863461','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(21,'1','4','UNCOATED WOODFREE PAPER 70 GSM  58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0536711034778875',0,'4802','12','1150','1160','0001-01-01 00:00:00','',1378.77,55.06,75916.6,'','55.06110518795739','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(22,'1','4','UNCOATED WOODFREE PAPER 80 GSM 51 X76','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.064499484004128',0,'4802','12','1000','1010','0001-01-01 00:00:00','',2790.72,55.06,153660.6,'','55','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(23,'1','4','UNCOATED WOODFREE PAPER 80 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469615854231239',0,'4802','12','65','85','0001-01-01 00:00:00','',1192.46,55.06,65658.32,'','55.06123475839861','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(24,'1','4','UNCOATED WOODFREE PAPER 90 GSM 58.5X91','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.041743195859075',0,'4802','12','1500','1550','0001-01-01 00:00:00','',958.24,55.06,52762,'','55.06136249791284','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(25,'1','5','W.PAPER','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0588235294117647',0,'4802','12','3000','3150','0001-01-01 00:00:00','',17,2979.42,50650.2,'','2979.4235294117643','','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(26,'1','1','HARD DISK','BOX-BOX','BOX-BOX','','',0,'','','','0','0001-01-01 00:00:00','',0,0,0,'0','0','0','0','0','0','0','0','0',2,'2020-10-22 16:10:45'),
(29,'1','6','WRITING PAPER-OPTIMA 58 GSM 45X55/7.2','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.13889',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(30,'1','6','WRITING PAPER-OPTIMA 64 GSM 58.5X91/17 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','.058823529',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(31,'1','6','WRITING PAPER-OPTIMA 70 GSM 58.5X91/18.6 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','.053763441',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(32,'2','1','BANK CHARGES','','','','',0,'99','18','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','','','','','','',0,'2020-02-17 17:51:20'),
(33,'1','6','WRITING PAPER-OPTIMA 80 GSM58.5X91/21.3 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(34,'1','6','WRITING PAPER (GRAPHICA)45X55/7.2 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.138888888888889',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(35,'1','6','WRITING PAPER(GRAPHICA)58.5X91/17 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0588235294117647',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(36,'1','6','WRITING PAPER(GRAPHICA)58.5X91/18.6 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.053763440860215',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(37,'1','6','WRITING PAPER (GRAPHICA)58.5X91/21.3 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0469483568075117',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(38,'1','6','WRITING PAPER(GRAPHICA)51X76/15.5 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','Reams','0.0645161290322581',0,'4802','12','','0','0001-01-01 00:00:00','0',0,0,0,'0','0','0','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(39,'1','6','WRITING PAPER -OPTIMA 58 GSM 86CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4802','12','64.5','65','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(40,'1','6','WRITING PAPER- OPTIMA 58GSM 74CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','2019-06-22 00:00:00','0.00',0,58.49,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(41,'1','6','WRITING PAPER -OPTIMA 58 GSM 89CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(42,'1','6','WRITING PAPER -OPTIMA 58GSM 72CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(43,'1','6','WRITING PAPER-GRAFIKA 58 GSM 58.5*91/15.4KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.06493506493',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(44,'1','1','BOARD 250 GSM 51*76 CM 9.7 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(45,'1','1','BOARD OPTICA WHITE 285 GSM 51*76/11 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(46,'1','1','BOARD 230 GSM 58.5*91 CM 12.2 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(47,'1','1','BOARD 250 GSM 58.5*91 CM 13.3 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(48,'1','6','WRITING PAPER -GRAFIKA 70GSM 51*76/13.6KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.073529412',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(49,'1','1','BOARD 320 GSM 58.5*91 CM 17 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(50,'1','1','BOARD 285 GSM 58.5*91 CM 17 KG','PAC-PACKS','PAC-PACKS','','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(51,'1','6','WRITING PAPER ECO BRITE PLUS 54 GSM 72 CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(52,'1','6','WRITING PAPER ECO BRITE PLUS 54 GSM 89 CM ','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(53,'1','6','WRITING PAPER-OPTIMA 58 GSM 86CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4802','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(54,'1','6','WRITING PAPER -OPTTIMA 58 GSM 58.5*91/15.4KG','REAM','KGS-KILOGRAMS','REAM','',1,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',2,'2020-10-22 16:10:45'),
(55,'1','6','WRITING PAPER -OPTIMA 58 GSM 58.5*91/15.4KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.064935',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(56,'1','6','BOARD 230 GSM 51*76 CM 8.9 KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(57,'1','6','BOARD 250 GSM 51*76CM 9.7KG ','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(58,'1','6','BOARD 285 GSM 58.5*91CM 15.2 KG ','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(59,'1','6','BOARD OPTIC WHITE 350 GSM 58.5*91/18.6KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(60,'1','6','BOARD 250 GSM 63.*91.0/14.4KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(61,'1','6','BOARD 285 GSM 63.5 *91.0/16.5KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(62,'1','6','BOARD 285 GSM 66*96/18.1KG','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(63,'1','6','WRITING PAPER GRAFIKA 64 GSM 89 CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(64,'1','6','WRITING PAPER GRAFIKA 60 GSM 585*91/16KG ','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.0625',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(65,'1','7','COATED PAPER-GLOSS 90 GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0416666667',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:45'),
(66,'1','7','COATED ART PAPER GLOSS 100GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.03759398',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(67,'1','7','COATED ART PAPER GLOSS-118GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','31.40',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(68,'1','7','COATED ART PAPER GLOSS 128 GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','34.10',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(69,'1','1','COATED ART PAPER   148GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','39.40',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(70,'1','7','COATED ART PAPER GLOSS 170GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','45.20',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(71,'1','7','COATED ART PAPER GLOSS 148 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','32.90',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(72,'1','7','COATED ART PAPER GLOSS 170 GSM 510*760','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','32.80',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(73,'1','7','COATED ART PAPER GLOSS 200GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','53.20',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(74,'1','7','COATED ART PAPER GLOSS 218 GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(75,'1','7','COATED ART PAPER GLOSS 250 GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(76,'1','1','WRITING PAPER GRAPHICA 58 GSM 45*55.5/7.2','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.1388888',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(77,'1','1','WRITING PAPER GRAFIKA 68 GSM 58.5*91/18.1','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.055524',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(78,'1','1','WRITING PAPER GRAFIKA 78 GSM 45.5*66/11.7','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.08546',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(79,'1','1','WRITING PAPER GRAFIKA 90 GSM 58.5*91/24','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.038',0,'','','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(80,'1','1','WRITING PAPER GRAFIKA 90 GSM 58.5*91/24','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(81,'1','7','COATED ART PAPER-GLOSS 113GSM 585*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0333',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(82,'1','1','WRITING PAPER GRAPHICA 68 GSM 51*76/13.2 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAM','0.1388',0,'','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(83,'1','7','COATED ART PAPER GLOSSS 300GSM 585*910','PAC-PACKS','PAC-PACKS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(84,'1','7','COATED ART PAPER GLOSS 100 GSM 585X910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.037593984962406',0,'4802','12','2000','1990','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(85,'1','6','WRITING PAPER GRAFIKA 64 GSM 64CM','KGS-KILOGRAMS','KGS-KILOGRAMS','','',0,'4782','12','','0.00','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(86,'1','7','WRITING PAPER-GRAFIKA 58 GSM 58.5X91/15.4 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0649350649350649',0,'4802','12','1000','990','0001-01-01 00:00:00','0.00',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(87,'1','1','COATED BOARD 250 GSM 584*910','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0150602',0,'12','12','','0.00','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(88,'1','1','COATED PAPER 118 GSM 584*910','REAMS','KGS-KILOGRAMS','REAMS','0.03184',1,'12','12','','0.00','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(89,'1','1','COATED BOARD 218 GSM 584*910','REAMS','KGS-KILOGRAMS','REAMS','0.029411',1,'4782','12','','0.00','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(90,'1','6','BOARD 250 GSM 51X76 CM 9.7 KG','PCS-PIECES','PCS-PIECES','','',0,'4802','12','470','450','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(91,'1','1','BOARD OPTICA WHITE 285 GSM 51X76/11 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','520','505','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(92,'1','1','BOARD 230 GSM 58.5X91 CM 12.2 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','600','575','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(93,'1','6','BOARD 250 GSM 58.5X91 CM 13.3 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','650','575','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(94,'1','6','BOARD 285 GSM 58.5X91 CM 15.2 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','725','700','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(95,'1','6','BOARD 320 GSM 58.5X91 CM 17 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','800','745','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(96,'1','6','BOARD OPTIC WHITE 350 GSM 58.5X91/18.6 KG','PAC-PACKS','PAC-PACKS','','',0,'4802','12','950','900','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(97,'1','1','WRITING PAPER OPTIMA 60 GSM 58.5X91/16 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0625',0,'4782','12','','0.00','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(98,'1','1','WRITING PAPER OPTIMA 58 GSM 45X55.5/7.2 KG','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.138888',0,'4782','12','','0.00','0001-01-01 00:00:00','',0,0,0,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46'),
(99,'1','3','128 GSM 510X760 COATED PAPER-GLOSS','KGS-KILOGRAMS','KGS-KILOGRAMS','REAMS','0.0403128275417238',0,'4802','12','1550','1580','2024-01-01 00:00:00','AZS/TNB/4399',4762.75,52.89,251901.85,'0.00','0.00','0.00','0','0','0','0','0','0',0,'2020-10-22 16:10:46');
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
  `date_of_issue` date DEFAULT NULL,
  PRIMARY KEY (`dtl_dr_cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_dtl`(`dtl_dr_cr_id`,`refrance_id`,`invoice_date`,`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`,`hsn_code`,`uom`,`batch`,`expiry_date`,`quantity`,`rate`,`amount`,`discount`,`tax_value`,`igst_rate`,`igst_amount`,`cgst_rate`,`cgst_amount`,`sgst_rate`,`sgst_amount`,`total`,`ca_approved_status`,`status`,`default_date`,`date_of_issue`) VALUES
(1,3,NULL,'CR/19-20/000002','PMT/19-20/000001','MANGALAM PAPERS & CARDS','MANGALAM PAPERS & CARDS','COATED PAPER 100 GSM 584X910','4802','KGS-KILOGRAMS','0001-01-01','0001-01-01 00:00:00',1,100000,100000,0,100000,0,0,6,6000,6,6000,112000,0,0,'2020-09-29 13:45:33','2020-09-03 00:00:00'),
(2,5,NULL,'DR/19-20/000002','5710','KHANNA PAPER MILLS LTD','MANGALAM PAPERS & CARDS','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,5000,5000,0,5000,12,600,0,0,0,0,5600,0,0,'2020-09-29 13:49:11','2020-09-28 00:00:00'),
(3,1,NULL,'CR/19-20/000001','PMT/19-20/000001','MANGALAM PAPERS & CARDS','MANGALAM PAPERS & CARDS','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,8000,8000,0,8000,0,0,6,480,6,480,8960,0,2,'2020-09-29 13:53:46','2020-03-04 00:00:00'),
(4,7,NULL,'DR/19-20/000003','5710','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','WRITING PAPER-OPTIMA 58 GSM 45X55/7.2','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',10498,611368.56,611368.56,0,611368.56,12,73364.23,0,0,0,0,684732.79,0,0,'2020-09-29 15:58:39','2020-09-29 00:00:00'),
(5,7,NULL,'DR/19-20/000003','5710','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','WRITING PAPER-OPTIMA 64 GSM 58.5X91/17 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',4080,234720,234720,0,234720,12,28166.4,0,0,0,0,262886.4,0,0,'2020-09-29 15:58:39','2020-09-29 00:00:00'),
(6,7,NULL,'DR/19-20/000003','5710','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','WRITING PAPER-OPTIMA 70 GSM 58.5X91/18.6 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',3794,215581.08,215581.08,0,215581.08,12,25869.73,0,0,0,0,241450.81,0,0,'2020-09-29 15:58:39','2020-09-29 00:00:00'),
(7,7,NULL,'DR/19-20/000003','5710','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','WRITING PAPER-OPTIMA 80 GSM58.5X91/21.3 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',2556,143427.6,143427.6,0,143427.6,12,17211.31,0,0,0,0,160638.91,0,0,'2020-09-29 15:58:39','2020-09-29 00:00:00'),
(8,7,NULL,'DR/19-20/000003','5710','KHANNA PAPER MILLS LTD','KHANNA PAPER MILLS LTD','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,5000,5000,0,5000,12,600,0,0,0,0,5600,0,0,'2020-09-29 15:58:39','2020-09-29 00:00:00'),
(9,8,NULL,'DR/19-20/000004','5710','KHANNA PAPER MILLS LTD','PURCHASE A/C','WRITING PAPER-OPTIMA 58 GSM 45X55/7.2','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',10498,611368.56,611368.56,0,611368.56,12,73364.23,0,0,0,0,684732.79,0,0,'2020-10-03 15:24:48','2020-10-03 00:00:00'),
(10,8,NULL,'DR/19-20/000004','5710','KHANNA PAPER MILLS LTD','PURCHASE A/C','WRITING PAPER-OPTIMA 64 GSM 58.5X91/17 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',4080,234720,234720,0,234720,12,28166.4,0,0,0,0,262886.4,0,0,'2020-10-03 15:24:48','2020-10-03 00:00:00'),
(11,8,NULL,'DR/19-20/000004','5710','KHANNA PAPER MILLS LTD','PURCHASE A/C','WRITING PAPER-OPTIMA 70 GSM 58.5X91/18.6 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',3794,215581.08,215581.08,0,215581.08,12,25869.73,0,0,0,0,241450.81,0,0,'2020-10-03 15:24:48','2020-10-03 00:00:00'),
(12,8,NULL,'DR/19-20/000004','5710','KHANNA PAPER MILLS LTD','PURCHASE A/C','WRITING PAPER-OPTIMA 80 GSM58.5X91/21.3 KG','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',2556,143427.6,143427.6,0,143427.6,12,17211.31,0,0,0,0,160638.91,0,0,'2020-10-03 15:24:48','2020-10-03 00:00:00'),
(14,9,NULL,'CR/19-20/000003','PMT/19-20/000002','SALES A/C','SALES A/C','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','0001-01-01','0001-01-01 00:00:00',1,100,100,0,100,0,0,6,0,6,0,112,0,0,'2020-10-22 17:43:05','2020-10-01 00:00:00'),
(15,10,NULL,'CR/19-20/000004','PMT/19-20/000002','PURCHASE A/C','PURCHASE A/C','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','0001-01-01','0001-01-01 00:00:00',1,100,100,0,100,12,12,0,0,0,0,112,0,0,'2020-10-22 17:55:53','2020-03-04 00:00:00'),
(16,11,NULL,'DR/19-20/000002','5710','PURCHASE A/C','PURCHASE A/C','100 GSM 585X910 COATED PAPER GLOSS','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,5000,5000,0,5000,0,0,6,0,6,0,5600,0,0,'2020-10-22 17:59:35','2020-10-22 00:00:00'),
(17,11,NULL,'DR/19-20/000002','5710','PURCHASE A/C','PURCHASE A/C','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,100,100,0,100,0,0,6,6,6,6,112,0,0,'2020-10-22 17:59:35','2020-10-22 00:00:00'),
(18,12,NULL,'DR/19-20/000003','5710','PURCHASE A/C','PURCHASE A/C','100 GSM 585X910 COATED PAPER GLOSS','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,5000,5000,0,5000,0,0,6,0,6,0,5600,0,0,'2020-10-23 19:42:42','2020-10-23 00:00:00'),
(21,13,NULL,'CR/19-20/000005','PMT/19-20/000002','PURCHASE A/C','PURCHASE A/C','COATED BOARD 300 GSM 584 X 910','4802','KGS-KILOGRAMS','','0001-01-01 00:00:00',1,100,100,0,100,12,12,0,0,0,0,112,0,0,'2020-10-26 16:27:39','2019-02-01 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_mst`(`dr_cr_Id`,`document_no`,`invoice_date`,`date_of_issue`,`doc_state`,`doc_state_code`,`against_invoice`,`date_of_invoice`,`bill_party_name`,`bill_party_address`,`bill_party_gstin`,`bill_party_state`,`bill_party_state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`note_type`,`remarks`,`dr_cr_jv_id`,`ca_approved_status`,`status`,`default_date`) VALUES
(1,'CR/19-20/000001',NULL,'2020-03-04 00:00:00','10',10,'PMT/19-20/000001','2019-04-04 00:00:00','MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,'MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,8960,960,0,480,480,0,'credit','demo',1476,1,2,'2020-09-26 10:58:58'),
(2,'DR/19-20/000001',NULL,'2020-09-26 00:00:00','10',10,'5710','2019-05-18 00:00:00','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,'KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,1349708.91,144611.67,144611.67,0,0,0,'debit','demo',1477,1,0,'2020-09-26 11:00:41'),
(3,'CR/19-20/000002',NULL,'2020-09-03 00:00:00','10',10,'PMT/19-20/000001','2019-04-04 00:00:00','MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,'MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,112000,12000,0,6000,6000,0,'saleReturn','demo',1478,1,0,'2020-09-28 06:49:50'),
(4,'CR/19-20/000003',NULL,'2020-09-28 00:00:00','10',10,'PMT/19-20/000001','2019-04-04 00:00:00','MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,'MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,86800,9300,0,4650,4650,0,'saleReturn','',1479,1,0,'2020-09-28 12:13:12'),
(5,'DR/19-20/000002',NULL,'2020-09-28 00:00:00','10',10,'5710','2019-05-18 00:00:00','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,'MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,5600,600,600,0,0,0,'purchaseReturn','test',1480,1,0,'2020-09-28 12:18:10'),
(6,'CR/19-20/000004',NULL,'2020-09-29 00:00:00','10',10,'PMT/19-20/000001','2019-04-04 00:00:00','MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,'MANGALAM PAPERS & CARDS','AMBEDKAR MARKET COMPLEX','10AEGPV7460M1Z4','Bihar',10,43400,4650,0,2325,2325,0,'saleReturn','TESt',1481,1,0,'2020-09-29 13:38:43'),
(7,'DR/19-20/000003',NULL,'2020-09-29 00:00:00','10',10,'5710','2019-05-18 00:00:00','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,'KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,1355308.91,145211.67,145211.67,0,0,0,'debit','test',1482,0,0,'2020-09-29 15:58:39'),
(8,'DR/19-20/000004',NULL,'2020-10-03 00:00:00','10',10,'5710','2019-05-18 00:00:00','KHANNA PAPER MILLS LTD','NH 3, BY PASS ROAD,','03AAACK1375K1ZP','Punjab',3,'PURCHASE A/C','','','',10,1349708.91,144611.67,144611.67,0,0,0,'debit','demo',1485,0,0,'2020-10-03 15:24:48'),
(9,'CR/19-20/000003',NULL,'2020-10-01 00:00:00','0',0,'PMT/19-20/000002','2020-01-01 00:00:00','SALES A/C','','','',0,'SALES A/C','','10AEGPV7460M1Z4','',0,112,0,0,0,0,0,'saleReturn','',0,2,0,'2020-10-22 17:42:14'),
(10,'CR/19-20/000004',NULL,'2020-03-04 00:00:00','0',0,'PMT/19-20/000002','2020-01-01 00:00:00','PURCHASE A/C','','','',0,'PURCHASE A/C','','','',0,0,0,0,0,0,0,'saleReturn','',0,0,0,'2020-10-22 17:55:53'),
(11,'DR/19-20/000002',NULL,'2020-10-22 00:00:00','0',0,'5710','2019-12-31 00:00:00','PURCHASE A/C','','','',0,'PURCHASE A/C','','','',0,5712,12,0,6,6,0,'debit','',7,0,0,'2020-10-22 17:59:35'),
(12,'DR/19-20/000003',NULL,'2020-10-23 00:00:00','0',0,'5710','2019-12-31 00:00:00','PURCHASE A/C','','','',0,'PURCHASE A/C','','','',0,5600,0,0,0,0,0,'purchaseReturn','',8,0,0,'2020-10-23 19:42:42'),
(13,'CR/19-20/000005',NULL,'2019-02-01 00:00:00','0',0,'PMT/19-20/000002','2020-01-01 00:00:00','PURCHASE A/C','','','',0,'PURCHASE A/C','','','',0,112,12,12,0,0,0,'credit','demo',0,2,0,'2020-10-26 16:21:17');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2020-10-27 12:48:06
-- Total time: 0:0:0:11:989 (d:h:m:s:ms)
