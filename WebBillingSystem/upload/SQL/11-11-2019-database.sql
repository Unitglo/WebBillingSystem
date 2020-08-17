-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2019-11-11 20:51:52
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
  `account_opening_balance` int(11) NOT NULL,
  `account_opening_balance_type` text NOT NULL,
  `status` int(1) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(8,'Central Bank of India CA-No.3097643981','5','4','Central Bank of India CA-No.3097643981','','','','','','','','121212','','','','','',195835,'Debit',0,'2019-11-09 13:37:24'),
(9,'IDBI Bank CA-No.0065102000040354','5','4','IDBI Bank CA-No.0065102000040354','','','','','','','','121212','','','','','',50156,'Debit',0,'2019-11-09 13:37:26'),
(10,'State Bank of India CA-No.36073156162','5','4','State Bank of India CA-No.36073156162','','','','','','','','121212','','','','','',11789,'Debit',0,'2019-11-09 13:37:27'),
(11,'Central Bank of India CC-A/c No.3611744809','2','1','Central Bank of India CC-A/c No.3611744809','','','','','','','','121212','','','','','',336165,'Credit',0,'2019-11-09 13:37:28'),
(12,'Accounting Payable','3','3','Accounting Payable','','','','','','','','121212','','','','','',12000,'Credit',0,'2019-11-09 13:37:29'),
(13,'Audit Fee Payable','3','3','Audit Fee Payable','','','','','','','','121212','','','','','',11500,'Credit',0,'2019-11-09 13:37:30'),
(14,'Salary Payable','3','3','Salary Payable','','','','','','','','121212','','','','','',21400,'Credit',0,'2019-11-09 13:37:31'),
(15,'Shop Rent Payable (Ajay Kr Nikhar)','3','3','Shop Rent Payable (Ajay Kr Nikhar)','','','','','','','','121212','','','','','',33488,'Credit',0,'2019-11-09 13:37:34'),
(16,'Electirc Fittings','4','1','','','','','','','','','121212','','','','','',8667,'Debit',0,'2019-11-09 13:37:34'),
(17,'Furniture & Fixture','4','1','','','','','','','','','121212','','','','','',232925,'Debit',0,'2019-11-09 13:37:34'),
(18,'Mobile Phone','4','1','','','','','','','','','121212','','','','','',12696,'Debit',0,'2019-11-09 13:37:34'),
(19,'Plant & Machinery','4','1','','','','','','','','','121212','','','','','',11362,'Debit',0,'2019-11-09 13:37:34'),
(20,'Ravi Ranjan (Prop)','','','Ravi Ranjan (Prop)','','','','','','','','121212','','','','','',2401851,'Credit',0,'2019-11-09 13:37:34'),
(21,'Advance Recoverable','5','6','','','','','','','','','121212','','','','','',499804,'Debit',0,'2019-11-09 13:37:35'),
(22,'Excess Input Vat','5','6','','','','','','','','','121212','','','','','',92,'Debit',0,'2019-11-09 13:37:35'),
(23,'GST Paid 2017-18','5','6','','','','','','','','','121212','','','','','',200,'Debit',0,'2019-11-09 13:37:35'),
(24,'KRISHNA ENTERPRISES','5','6','','','','','','','','','121212','','','','','',0,'',0,'2019-11-09 13:37:35'),
(25,'KUMAR GAURAV','5','6','','','','','','','','','121212','','','','','',0,'',0,'2019-11-09 13:37:35'),
(26,'MAA DURGA MARBEL','5','6','','','','','','','','','121212','','','','','',50000,'Debit',0,'2019-11-09 13:37:35'),
(27,'Rajesh Kumar Ranjan (Relative)','5','6','','','','','','','','','121212','','','','','',0,'',0,'2019-11-09 13:37:35'),
(28,'Shop Advance','5','6','','','','','','','','','121212','','','','','',200000,'Debit',0,'2019-11-09 13:37:35'),
(29,'TDS','5','6','','','','','','','','','121212','','','','','',22208,'Debit',0,'2019-11-09 13:37:35'),
(30,'Cash','5','4','','','','','','','','','121212','','','','','',316183,'Debit',0,'2019-11-09 13:37:35');
/*!40000 ALTER TABLE `pms_account_master` ENABLE KEYS */;

-- 
-- Definition of pms_account_master_main_group
-- 

DROP TABLE IF EXISTS `pms_account_master_main_group`;
CREATE TABLE IF NOT EXISTS `pms_account_master_main_group` (
  `account_master_main_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_group_name` text NOT NULL,
  `status` int(1) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_master_main_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master_main_group
-- 

/*!40000 ALTER TABLE `pms_account_master_main_group` DISABLE KEYS */;
INSERT INTO `pms_account_master_main_group`(`account_master_main_group_id`,`main_group_name`,`status`,`default_date`) VALUES
(1,'Share Holder Fund',0,'2019-06-03 11:40:05'),
(2,'Non-Current Liab',0,'2019-11-01 00:00:00'),
(3,'Current Liab',0,'0001-01-01 00:00:00'),
(4,'Non-current assets',0,'0001-01-01 00:00:00'),
(5,'Current assets',0,'0001-01-01 00:00:00'),
(6,'Revenue',0,'0001-01-01 00:00:00'),
(7,'Expenses',0,'0001-01-01 00:00:00');
/*!40000 ALTER TABLE `pms_account_master_main_group` ENABLE KEYS */;

-- 
-- Definition of pms_account_master_sub_group
-- 

DROP TABLE IF EXISTS `pms_account_master_sub_group`;
CREATE TABLE IF NOT EXISTS `pms_account_master_sub_group` (
  `account_master_main_group_id` int(11) NOT NULL,
  `account_master_sub_group_id` int(11) NOT NULL,
  `account_master_sub_group_name` text NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_master_main_group_id`,`account_master_sub_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master_sub_group
-- 

/*!40000 ALTER TABLE `pms_account_master_sub_group` DISABLE KEYS */;
INSERT INTO `pms_account_master_sub_group`(`account_master_main_group_id`,`account_master_sub_group_id`,`account_master_sub_group_name`,`status`,`default_date`) VALUES
(1,1,'Share Capital',0,'2019-09-07 11:52:56'),
(1,2,'Reserves and surplus',0,'2019-09-07 11:53:05'),
(1,3,'Money received against share warrants',0,'2019-09-07 11:53:01'),
(1,4,'Share Application Money pending allotment',0,'2019-09-07 11:53:13'),
(1,5,'demo',0,'2019-09-11 00:00:00'),
(1,6,'TEST d 1 ',0,'2019-09-07 19:53:37'),
(1,7,'TEST d 2 ',0,'2019-09-07 19:53:50'),
(1,8,'TEST d 3',0,'2019-09-07 19:54:03'),
(2,1,'Long-term borrowings',0,'0001-01-01 00:00:00'),
(2,2,'Deferred tax liabilities (Net)',0,'0001-01-01 00:00:00'),
(2,3,'Other long term liabilities',0,'0001-01-01 00:00:00'),
(2,4,'Long-term provisions',0,'0001-01-01 00:00:00'),
(3,1,'Short-term borrowings',0,'0001-01-01 00:00:00'),
(3,2,'Trade payables / Sundry Creditors',0,'0001-01-01 00:00:00'),
(3,3,'Other current liabilities',0,'0001-01-01 00:00:00'),
(3,4,'Short-term provisions',0,'0001-01-01 00:00:00'),
(3,5,'',0,'2019-11-08 13:56:43'),
(4,1,'Tangible assets',0,'0001-01-01 00:00:00'),
(4,2,'Intangible assets',0,'0001-01-01 00:00:00'),
(4,3,'Capital work-in-Progress',0,'0001-01-01 00:00:00'),
(4,4,'Intangible assets under development',0,'0001-01-01 00:00:00'),
(4,5,'Non-current investments',0,'0001-01-01 00:00:00'),
(4,6,'Deferred tax assets (net)',0,'0001-01-01 00:00:00'),
(4,7,'Long-term loans and advances',0,'0001-01-01 00:00:00'),
(4,8,'Other non-current assets',0,'0001-01-01 00:00:00'),
(5,1,'Current investments',0,'0001-01-01 00:00:00'),
(5,2,'Inventories',0,'0001-01-01 00:00:00'),
(5,3,'Trade receivables',0,'0001-01-01 00:00:00'),
(5,4,'Cash and cash equivalents',0,'0001-01-01 00:00:00'),
(5,5,'Short-term loans and advances',0,'0001-01-01 00:00:00'),
(5,6,'Other current assets',0,'0001-01-01 00:00:00'),
(6,1,'Revenue from operations',0,'0001-01-01 00:00:00'),
(6,2,'Other income',0,'0001-01-01 00:00:00'),
(7,1,'Cost of material Consumed',0,'0001-01-01 00:00:00'),
(7,2,'Purchase of stock-in-trade',0,'0001-01-01 00:00:00'),
(7,3,'Employee benefit expenses',0,'0001-01-01 00:00:00'),
(7,4,'Depreciation and amortization expenses',0,'0001-01-01 00:00:00'),
(7,5,'Other expenses',0,'0001-01-01 00:00:00'),
(7,6,'Direct expenses',0,'0001-01-01 00:00:00'),
(7,7,'abc',0,'2019-11-08 11:27:26');
/*!40000 ALTER TABLE `pms_account_master_sub_group` ENABLE KEYS */;

-- 
-- Definition of pms_account_state
-- 

DROP TABLE IF EXISTS `pms_account_state`;
CREATE TABLE IF NOT EXISTS `pms_account_state` (
  `pms_account_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `pms_account_state_name` text NOT NULL,
  `pms_account_state_code` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_account_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_state
-- 

/*!40000 ALTER TABLE `pms_account_state` DISABLE KEYS */;
INSERT INTO `pms_account_state`(`pms_account_state_id`,`pms_account_state_name`,`pms_account_state_code`,`status`,`default_date`) VALUES
(1,'Jammu and Kashmir',1,0,'0001-01-01 00:00:00'),
(2,'Himachal Pradesh',2,0,'0001-01-01 00:00:00'),
(3,'Punjab',3,0,'0001-01-01 00:00:00'),
(4,'Chandigarh',4,0,'0001-01-01 00:00:00'),
(5,'Uttarakhand',5,0,'0001-01-01 00:00:00'),
(6,'Haryana',6,0,'0001-01-01 00:00:00'),
(7,'Delhi',7,0,'0001-01-01 00:00:00'),
(8,'Rajasthan',8,0,'0001-01-01 00:00:00'),
(9,'Uttar Pradesh',9,0,'0001-01-01 00:00:00'),
(10,'Bihar',10,0,'0001-01-01 00:00:00'),
(11,'Sikkim',11,0,'0001-01-01 00:00:00'),
(12,'Arunachal Pradesh',12,0,'0001-01-01 00:00:00'),
(13,'Nagaland',13,0,'0001-01-01 00:00:00'),
(14,'Manipur',14,0,'0001-01-01 00:00:00'),
(15,'Mizoram',15,0,'0001-01-01 00:00:00'),
(16,'Tripura',16,0,'0001-01-01 00:00:00'),
(17,'Meghalaya',17,0,'0001-01-01 00:00:00'),
(18,'Assam',18,0,'0001-01-01 00:00:00'),
(19,'West Bengal',19,0,'0001-01-01 00:00:00'),
(20,'Jharkhand',8,0,'0001-01-01 00:00:00'),
(21,'Odisha',21,0,'0001-01-01 00:00:00'),
(22,'Chhattisgarh',22,0,'0001-01-01 00:00:00'),
(23,'Madhya Pradesh',23,0,'0001-01-01 00:00:00'),
(24,'Gujrat',24,0,'0001-01-01 00:00:00'),
(25,'Daman and Diu',25,0,'0001-01-01 00:00:00'),
(26,'Dadra and Nagar Haveli',21,0,'0001-01-01 00:00:00'),
(27,'Maharastra',27,0,'2019-09-26 15:52:37'),
(29,'Karnataka',29,0,'2019-09-26 15:52:45'),
(30,'Goa',24,0,'0001-01-01 00:00:00'),
(31,'Lakshdweep',25,0,'0001-01-01 00:00:00'),
(32,'Kerala',32,0,'0001-01-01 00:00:00'),
(33,'Tamil Nadu',33,0,'0001-01-01 00:00:00'),
(34,'PuchuCherry',34,0,'0001-01-01 00:00:00'),
(35,'Andaman and Nicobar Islands',35,0,'0001-01-01 00:00:00'),
(36,'Telangana',36,0,'0001-01-01 00:00:00'),
(37,'Andhra Pradesh',37,0,'0001-01-01 00:00:00'),
(97,'Other Territory',97,0,'0001-01-01 00:00:00');
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
  `status` int(1) NOT NULL COMMENT '0 active , 2 remove',
  `date` date NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_ca_tbl
-- 

/*!40000 ALTER TABLE `pms_ca_tbl` DISABLE KEYS */;
INSERT INTO `pms_ca_tbl`(`ca_id`,`ca_name`,`ca_code`,`ca_password`,`status`,`date`,`default_date`) VALUES
(1,'Mukund','YYY001','admin!@#',0,'2029-09-25 00:00:00','2019-09-25 16:36:53');
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
  `company_pincode` int(11) NOT NULL,
  `company_email` text NOT NULL,
  `company_phone_number` int(11) NOT NULL,
  `company_gst_number` text NOT NULL,
  `company_pan_number` text NOT NULL,
  `company_cin_number` text NOT NULL,
  `company_trade_name` text NOT NULL,
  `company_gst_practitioner_ucid` text NOT NULL,
  `company_ca_ucid` varchar(20) NOT NULL,
  `company_financial_year_start` text NOT NULL,
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
  `status` int(11) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA001','pms_test','Company Public Not Interested','GENIAL POLYMERS PRIVATE LIMITED','','','BEHIND PANCH SHIV MANDIR','KANKARBAGH','','PATNA','10',10,'INDIA',800020,'ca.mukund@gmail.com',941889666,'10AAECG649J1ZL','AAECG649J','U2200BR2012PTC018321','vvv001','ZZZ001','YYY001','2019','genialpolymers','','STATE BANK OF INDIA','KANKARBAGH','987234100064388','SBIN0006321','RIPUNAJAY KUMAR','DIRECTOR','LOHIA NAGAR, KANKARBAGH','ca.mukund@outlook.com','8768544332','Neeraj Kumar','MD','patrakar nagar','ca.neerajkumar2012@gmail,com','8006005004','genialpolymers','','2019-09-06 17:16:47',0),
(2,'AAA002','pms','Firm','MUKUND M SAHAY & CO','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA',800001,'mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','Mmsp@54321@','2019-09-07 14:23:54',0),
(3,'AAA003','pms','Indiusual','TIWARY','KUMAR','SUNIL','C/o Baldeo Singh, East of Khemni Chak,','By-pass Road','','PATNA','10',10,'INDIA',800027,'haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/o Baldeo Singh, East of Khemni Chak,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','','','2019-09-07 14:31:50',0),
(4,'AAA004','db_pms__unitglo_2019_2020','Cooperative Sociaty','unitglo','solutions','pvtltd','chinchwad','STATION','chinchwad','pune','27',27,'india',411019,'asd@gmail.com',1234568851,'27aakcm12121zp','aakcm1212','123','soc','GGG001','ccc001','2019_2020','uspl','uspl@123','indian bank','chinchwad station','6478077545','indian1212','dipak','assistant manager','pune','ds@gmail.com','1235668852','a','b','c','abc@gmail.com','1255555444','uspl','uspl@123','2019-10-01 17:16:38',0);
/*!40000 ALTER TABLE `pms_company` ENABLE KEYS */;

-- 
-- Definition of pms_company_person_type
-- 

DROP TABLE IF EXISTS `pms_company_person_type`;
CREATE TABLE IF NOT EXISTS `pms_company_person_type` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_name` text NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company_person_type
-- 

/*!40000 ALTER TABLE `pms_company_person_type` DISABLE KEYS */;
INSERT INTO `pms_company_person_type`(`person_id`,`person_type_name`,`status`,`default_date`) VALUES
(1,'Individual',0,'2019-10-14 17:39:49'),
(2,'H.U.F.',0,'0001-01-01 00:00:00'),
(3,'Firm',0,'0001-01-01 00:00:00'),
(4,'AOP',0,'0001-01-01 00:00:00'),
(5,'AOP Trust',0,'0001-01-01 00:00:00'),
(6,'Body Of Individual',0,'2019-10-14 17:39:56'),
(7,'Artificial Jurdicial Person',0,'0001-01-01 00:00:00'),
(8,'Cooperative Society',0,'2019-10-14 17:40:24'),
(9,'Company Public Interested',0,'0001-01-01 00:00:00'),
(10,'Company Public Not Interested',0,'0001-01-01 00:00:00'),
(11,'Company Private',0,'0001-01-01 00:00:00'),
(12,'Local Authority',0,'0001-01-01 00:00:00');
/*!40000 ALTER TABLE `pms_company_person_type` ENABLE KEYS */;

-- 
-- Definition of pms_expenses_voucher_dtl
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_dtl`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_voucherno` int(11) NOT NULL,
  `expenses_head` varchar(100) NOT NULL,
  `exp_product_name` varchar(100) NOT NULL,
  `exp_hsn_code` int(11) NOT NULL,
  `exp_tax_value` varchar(20) NOT NULL,
  `exp_igst_rate` varchar(20) NOT NULL,
  `exp_igst_amount` int(11) NOT NULL,
  `exp_cgst_rate` varchar(20) NOT NULL,
  `exp_cgst_amount` int(11) NOT NULL,
  `exp_sgst_rate` varchar(20) NOT NULL,
  `exp_sgst_amount` int(11) NOT NULL,
  `exp_total_amount` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`exp_voucherno`,`exp_product_name`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_voucher_no` int(11) NOT NULL,
  `exp_voucher_date` date NOT NULL,
  `exp_place_of_supply` varchar(50) NOT NULL,
  `exp_reverse_charge` varchar(3) NOT NULL,
  `exp_state` varchar(20) NOT NULL,
  `exp_state_code` int(11) NOT NULL,
  `exp_supplier_name` varchar(200) NOT NULL,
  `exp_supplier_addr` varchar(1000) NOT NULL,
  `exp_supplier_gstin` varchar(20) NOT NULL,
  `exp_supplier_state` varchar(20) NOT NULL,
  `exp_supplier_state_code` int(11) NOT NULL,
  `expenses_head` varchar(100) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `total_gst` int(11) NOT NULL,
  `total_igst` int(11) NOT NULL,
  `total_cgst` int(11) NOT NULL,
  `total_sgst` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `company_name` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`exp_voucher_no`,`exp_supplier_name`)
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
  `comp_name` varchar(50) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `debit_amount` decimal(10,0) NOT NULL,
  `credit_amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`comp_name`,`journal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`) VALUES
('AAA002 ',5,'CGST-ITC A/C',7011,0),
('AAA002 ',5,'SALARY',77900,0),
('AAA002 ',5,'SALES',0,91922),
('AAA002 ',5,'SGST-ITC A/C',7011,0),
('ABC',1,'PRINTING AND STATIONERY',0,900),
('ABC',1,'PURCHASE',0,100),
('ABC',1,'SALARY',1000,0),
('ABC',2,'IGST',3750,0),
('ABC',2,'PURCHASE',21250,0),
('ABC',2,'SELLER',0,25000),
('ABC',3,'IGST-ITC A/C',11124,0),
('ABC',3,'PURCHASE',61800,0),
('ABC',3,'SALES',0,72924),
('ABC',4,'IGST-ITC A/C',9,0),
('ABC',4,'PURCHASE',0,84),
('ABC',4,'SALES',75,0);
/*!40000 ALTER TABLE `pms_journal_entry_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_mst
-- 

DROP TABLE IF EXISTS `pms_journal_entry_mst`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_mst` (
  `comp_name` varchar(100) NOT NULL,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `jv_date` date NOT NULL,
  `dr_total` decimal(10,0) NOT NULL,
  `cr_total` decimal(10,0) NOT NULL,
  `note` varchar(500) NOT NULL,
  PRIMARY KEY (`comp_name`,`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`journal_id`,`jv_date`,`dr_total`,`cr_total`,`note`) VALUES
('ABC',1,'2019-09-16 00:00:00',0,0,'xyz'),
('ABC',2,'2019-09-17 00:00:00',25000,25000,'assd'),
('ABC',3,'2019-09-17 00:00:00',72924,72924,'qwe'),
('ABC',4,'2019-09-17 00:00:00',84,84,'jkl'),
('ABC',5,'2019-10-15 00:00:00',91922,91922,'abc');
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(1,'invoice','invoice/1819/',0,0,'2019-10-22 18:40:25'),
(2,'invoice','invoice/1920/',0,0,'2019-10-22 18:40:25'),
(3,'debit','debit/1819/',0,0,'2019-10-22 18:40:25'),
(4,'debit','debit/1920/',0,0,'2019-10-22 18:40:25'),
(5,'credit','credit/1819/',0,0,'2019-10-22 18:40:25'),
(6,'credit','credit/1920/',0,0,'2019-10-22 18:40:25');
/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` ENABLE KEYS */;

-- 
-- Definition of pms_master_settings
-- 

DROP TABLE IF EXISTS `pms_master_settings`;
CREATE TABLE IF NOT EXISTS `pms_master_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms_condition_tax_invoice` varchar(500) NOT NULL,
  `authorized_signatory_tax_invoice` varchar(50) NOT NULL,
  `authorized_signatory_other_voucher` varchar(50) NOT NULL,
  `mrp_details` varchar(3) NOT NULL,
  `mrp_invoice_details` varchar(100) NOT NULL,
  `sale_price_details` varchar(3) NOT NULL,
  `sale_price_details_info` varchar(100) NOT NULL,
  `expiry_monitoring_system` varchar(3) NOT NULL,
  `expiry_monitoring_system_info` varchar(300) NOT NULL,
  `expiry_details_tax_invoice` varchar(3) NOT NULL,
  `batch_wise_details` varchar(3) NOT NULL,
  `batch_wise_details_info` varchar(500) NOT NULL,
  `batch_wise_details_tax_invoice` varchar(3) NOT NULL,
  `stock_out_method` varchar(30) NOT NULL,
  `stock_valuation_method` varchar(60) NOT NULL,
  `unit_conversion_method_required` varchar(3) NOT NULL,
  `prefix_generate_invoice_no` int(11) NOT NULL,
  `invoiceno` varchar(16) NOT NULL,
  `prefix_generate_debit_no` int(11) NOT NULL,
  `debitno` varchar(16) NOT NULL,
  `prefix_generate_credit_no` int(11) NOT NULL,
  `creditno` varchar(16) NOT NULL,
  `journal_accounting_entry` varchar(3) NOT NULL,
  `extra_information_tax_invoice` varchar(3) NOT NULL,
  `caption_name1` varchar(100) NOT NULL,
  `currency_sign_before_amount` varchar(3) NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;
INSERT INTO `pms_master_settings`(`id`,`terms_condition_tax_invoice`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`,`mrp_details`,`mrp_invoice_details`,`sale_price_details`,`sale_price_details_info`,`expiry_monitoring_system`,`expiry_monitoring_system_info`,`expiry_details_tax_invoice`,`batch_wise_details`,`batch_wise_details_info`,`batch_wise_details_tax_invoice`,`stock_out_method`,`stock_valuation_method`,`unit_conversion_method_required`,`prefix_generate_invoice_no`,`invoiceno`,`prefix_generate_debit_no`,`debitno`,`prefix_generate_credit_no`,`creditno`,`journal_accounting_entry`,`extra_information_tax_invoice`,`caption_name1`,`currency_sign_before_amount`,`status`,`default_date`) VALUES
(1,'abc','NEERAJ KUMAR','MUKUND MOHAN SAHAY','1','xyz','1','asd','1','2019-10-19','0','0','qwe','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket P','0',0,'',0,'',0,'','1','1','poi','0',1,'2019-10-19 00:00:00'),
(20,'1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','Neeraj Kumar','1','abc','1','xyz','1','2019-10-19','0','0','','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket P','0',1,'0',1,'0',1,'0','1','0','','0',1,'2019-10-22 18:40:25'),
(21,'abc','MUKUND MOHAN SAHAY','NEERAJ KUMAR','1','','0','','0','','0','0','','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket P','0',1,'2',1,'2',1,'2','1','1','asdfg','0',0,'2019-11-11 13:03:49');
/*!40000 ALTER TABLE `pms_master_settings` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice` (
  `purchase_invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_invoice_number` int(11) NOT NULL,
  `purchase_invoice_date` date NOT NULL,
  `purchase_invoice_reverse_change` text NOT NULL,
  `purchase_invoice_seller_name` text NOT NULL,
  `purchase_invoice_seller_address` text NOT NULL,
  `purchase_invoice_seller_gstin` text NOT NULL,
  `purchase_invoice_seller_state` text NOT NULL,
  `purchase_invoice_seller_state_code` int(11) NOT NULL,
  `purchase_invoice_item_number` int(11) NOT NULL,
  `purchase_invoice_product_discription` text NOT NULL,
  `purchase_invoice_hsn_code` int(11) NOT NULL,
  `purchase_invoice_uom` text NOT NULL,
  `purchase_invoice_product_qty` int(11) NOT NULL,
  `purchase_invoice_product_rate` int(11) NOT NULL,
  `purchase_invoice_product_amount` int(11) NOT NULL,
  `purchase_invoice_product_discount` int(11) NOT NULL,
  `purchase_invoice_taxable_value` int(11) NOT NULL,
  `purchase_invoice_igst_rate` int(11) NOT NULL,
  `purchase_invoice_igst_amount` int(11) NOT NULL,
  `purchase_invoice_cgst_rate` int(11) NOT NULL,
  `purchase_invoice_cgst_amount` int(11) NOT NULL,
  `purchase_invoice_sgst_rate` int(11) NOT NULL,
  `purchase_invoice_sgst_amount` int(11) NOT NULL,
  `purchase_invoice_product_total_amount` int(11) NOT NULL,
  `purchase_invoice_product_mrp` int(11) NOT NULL,
  `purchase_invoice_product_sale_price` int(11) NOT NULL,
  `purchase_invoice_total_amount_before_tax` int(11) NOT NULL,
  `purchase_invoice_total_igst` int(11) NOT NULL,
  `purchase_invoice_total_cgst` int(11) NOT NULL,
  `purchase_invoice_total_sgst` int(11) NOT NULL,
  `purchase_invoice_total_amount` int(11) NOT NULL,
  `purchase_invoice_total_amount_in_words` text NOT NULL,
  `purchase_invoice_payment_status` text NOT NULL COMMENT '1: paid in cash, 0:  outstanding',
  `status` text NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`purchase_invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice` DISABLE KEYS */;

/*!40000 ALTER TABLE `pms_purchase_invoice` ENABLE KEYS */;

-- 
-- Definition of pms_purchase_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_purchase_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_purchase_invoice_dtl` (
  `pur_dtl_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
  `seller_no` varchar(50) NOT NULL,
  `statecode` int(20) NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` int(100) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `tax_val` decimal(10,0) NOT NULL,
  `igst_rate` int(11) NOT NULL,
  `igst_amt` decimal(10,0) NOT NULL,
  `cgst_rate` int(11) NOT NULL,
  `cgst_amt` decimal(10,0) NOT NULL,
  `sgst_rate` int(11) NOT NULL,
  `sgst_amount` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL,
  `invoice_type` varchar(20) NOT NULL,
  PRIMARY KEY (`pur_dtl_auto_id`,`invoice_no`,`seller_no`,`product_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`invoice_no`,`seller_no`,`statecode`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`status`,`invoice_type`) VALUES
(1,'1','RAKESH KUMAR',10,'Laptop','87052','PCS-PIECES','','0001-01-01 00:00:00',1,18,60000,600,59400,18,10692,0,0,0,0,0,'purchase'),
(2,'2','DEBIT',10,'QUICK HEAL','5548','PCS-PIECES','','0001-01-01 00:00:00',2,18,7000,400,13600,18,2448,0,0,0,0,0,'purchase'),
(3,'2','DEBIT',10,'CANON','9587','PCS-PIECES','','0001-01-01 00:00:00',1,28,6000,200,5800,28,1624,0,0,0,0,0,'purchase');
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
  `total_cost` int(11) NOT NULL,
  `total_gst` varchar(20) NOT NULL,
  `total_igst` int(11) NOT NULL,
  `total_cgst` int(11) NOT NULL,
  `total_sgst` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `invoice_type` varchar(50) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`pur_mst_auto_id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`status`) VALUES
(1,'1','2019-10-24 00:00:00','NO','10',10,'RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27','27',70092,'10692',10692,0,0,600,'Cash','Paid','purchase','ANS',0),
(2,'2','2019-10-01 00:00:00','NO','10',10,'DEBIT','chinchwad','27ABCDEFGHD1AS','27','27',23472,'4072',4072,0,0,600,'Cash','Paid','purchase','Add Quick heal and canon product',0);
/*!40000 ALTER TABLE `pms_purchase_invoice_mst` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_dtl
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_dtl`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(16) NOT NULL,
  `seller_no` varchar(50) NOT NULL,
  `product_desc` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(50) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `qty` int(100) NOT NULL,
  `rate` decimal(10,0) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `tax_val` decimal(10,0) NOT NULL,
  `igst_rate` int(11) NOT NULL,
  `igst_amt` decimal(10,0) NOT NULL,
  `cgst_rate` int(11) NOT NULL,
  `cgst_amt` decimal(10,0) NOT NULL,
  `sgst_rate` int(11) NOT NULL,
  `sgst_amount` decimal(10,0) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`,`invoice_no`,`product_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`id`,`invoice_no`,`seller_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`status`) VALUES
(3,'PAT/1819/3','DEBIT','Laptop','87052','PCS-PIECES','','0001-01-01 00:00:00',1,18,60000,0,60000,18,10800,0,0,0,0,0),
(4,'PAT/1819/5','','QUICK HEAL','5548','PCS-PIECES','','0001-01-01 00:00:00',1,18,70000,7000,63000,0,0,9,5670,9,5670,0),
(5,'PAT/1819/5','','mobile','17017','PCS-PIECES','','0001-01-01 00:00:00',1,18,15000,100,14900,0,0,9,1341,9,1341,0);
/*!40000 ALTER TABLE `pms_sale_invoice_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_sale_invoice_mst
-- 

DROP TABLE IF EXISTS `pms_sale_invoice_mst`;
CREATE TABLE IF NOT EXISTS `pms_sale_invoice_mst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `ship_party_state_code` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `total_gst` varchar(20) NOT NULL,
  `total_igst` int(11) NOT NULL,
  `total_cgst` int(11) NOT NULL,
  `total_sgst` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `bank_ac_no` int(11) NOT NULL,
  `bank_ifsc_code` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `terms_and_condition` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`remark`,`status`) VALUES
(1,'PAT/1819/1','2019-09-19 00:00:00','NO','10',10,'road','mh-12 1314','2019-09-19 00:00:00','pune','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27','27','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27',27,58494,'8919',8919,0,0,500,'STATE BANK OF INDIA',2147483647,'SBIN0006321','GENIAL POLYMERS PRIVATE LIMITED  ','1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','cheque','Paid','abc',0),
(11,'PAT/1819/2','2019-09-19 00:00:00','NO','10',10,'road','mh-12 1314','2019-09-19 00:00:00','pune','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27','27','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27',27,58494,'8919',8919,0,0,500,'STATE BANK OF INDIA',2147483647,'SBIN0006321','GENIAL POLYMERS PRIVATE LIMITED','1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','cheque','Paid','abc',0),
(12,'PAT/1819/3','2019-09-25 00:00:00','NO','10',10,'water','1515','2019-09-25 00:00:00','mumbai','DEBIT','chinchwad','27ABCDEFGHD1AS','27','27','','chinchwad','27ABCDEFGHD1AS','27',27,70800,'10800',10800,0,0,0,'STATE BANK OF INDIA',2147483647,'SBIN0006321','GENIAL POLYMERS PRIVATE LIMITED  ','1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','','Not Paid','asd',0),
(13,'PAT/1819/4','2019-10-15 00:00:00','NO','10',10,'road','mh-14 1234','2019-10-15 00:00:00','pune','','chinchwad','10SSDDDD1ZA','10','10','SALARY','chinchwad','10SSDDDD1ZA','10',10,23954,'0',0,1827,1827,700,'UNION BANK OF INDIA',2147483647,'UBIN000123','MUKUND M SAHAY & CO  ','1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','Cash','Paid','zxcvbnm',0),
(15,'PAT/1819/1','2019-09-19 00:00:00','NO','10',10,'road','mh-12 1314','2019-09-19 00:00:00','pune','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27','27','RAKESH KUMAR','MAYUR TRADE CENTER','10AAVFM2440B1ZS','27',27,58494,'8919',8919,0,0,500,'STATE BANK OF INDIA',2147483647,'SBIN0006321','GENIAL POLYMERS PRIVATE LIMITED','1 E and OE 2. GOOD SOLD CAN NOT BE RETURNED','RIPUNAJAY KUMAR','cheque','Paid','abc',0);
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
  `stock_hsn_sac_code` int(11) NOT NULL,
  `stock_gst_rate` text NOT NULL,
  `stock_mrp` varchar(50) NOT NULL,
  `stock_sale_price_without_gst` varchar(50) NOT NULL,
  `stock_expiry_date` date NOT NULL,
  `stock_batch` varchar(50) NOT NULL,
  `stock_reorder_level` text NOT NULL,
  `stock_reorder_quantity` text NOT NULL,
  `stock_minimum_stock_reminder` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(1,'2','1','Laptop','PCS-PIECES',87052,'18','50000','47000','2019-10-01 00:00:00','B','100','50','100',0,'2019-11-08 13:14:53'),
(2,'2','1','Pen','BAG-BAGS',123,'12','','','0001-01-01 00:00:00','','100','30','100',0,'2019-11-08 13:14:58'),
(3,'1','1','QUICK HEAL','PCS-PIECES',5548,'18','','','0001-01-01 00:00:00','','50','100','20',0,'2019-09-10 15:37:46'),
(4,'1','2','CANON','PCS-PIECES',9587,'28','','','0001-01-01 00:00:00','','20','10','10',0,'2019-11-08 13:15:07'),
(5,'1','3','mobile','PCS-PIECES',17017,'18','','','0001-01-01 00:00:00','','80','10','100',0,'2019-11-08 13:15:16'),
(26,'','','mobile','PCS-PIECES',0,'','','','0001-01-01 00:00:00','','','','',0,'2019-11-09 17:41:49'),
(27,'2','1','headphone','',0,'','','','0001-01-01 00:00:00','','','','',0,'2019-11-11 11:38:22'),
(28,'1','1','charger','',0,'','','','0001-01-01 00:00:00','','','','',0,'2019-11-11 11:47:51');
/*!40000 ALTER TABLE `pms_stock` ENABLE KEYS */;

-- 
-- Definition of pms_stock_addgroup
-- 

DROP TABLE IF EXISTS `pms_stock_addgroup`;
CREATE TABLE IF NOT EXISTS `pms_stock_addgroup` (
  `stock_nature_of_opration_id` int(11) NOT NULL,
  `stock_group_id` int(11) NOT NULL,
  `stock_group_name` text NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_nature_of_opration_id`,`stock_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock_addgroup
-- 

/*!40000 ALTER TABLE `pms_stock_addgroup` DISABLE KEYS */;
INSERT INTO `pms_stock_addgroup`(`stock_nature_of_opration_id`,`stock_group_id`,`stock_group_name`,`status`,`default_date`) VALUES
(1,1,'Goods',0,'2019-09-09 12:12:19'),
(1,2,'antivirus',0,'2019-11-08 12:06:52'),
(1,3,'material',0,'2019-11-08 12:26:02'),
(2,1,'Service',0,'2019-11-08 12:29:35');
/*!40000 ALTER TABLE `pms_stock_addgroup` ENABLE KEYS */;

-- 
-- Definition of pms_stock_nature_of_opration
-- 

DROP TABLE IF EXISTS `pms_stock_nature_of_opration`;
CREATE TABLE IF NOT EXISTS `pms_stock_nature_of_opration` (
  `stock_nature_of_opration_id` int(11) NOT NULL AUTO_INCREMENT,
  `nature_of_opration_name` text NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_nature_of_opration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock_nature_of_opration
-- 

/*!40000 ALTER TABLE `pms_stock_nature_of_opration` DISABLE KEYS */;
INSERT INTO `pms_stock_nature_of_opration`(`stock_nature_of_opration_id`,`nature_of_opration_name`,`status`,`default_date`) VALUES
(1,'Goods',0,'2019-09-09 12:11:04'),
(2,'Service',0,'2019-09-09 12:11:13');
/*!40000 ALTER TABLE `pms_stock_nature_of_opration` ENABLE KEYS */;

-- 
-- Definition of pms_unit_of_measuremt
-- 

DROP TABLE IF EXISTS `pms_unit_of_measuremt`;
CREATE TABLE IF NOT EXISTS `pms_unit_of_measuremt` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_unitof_measuremt_name` text NOT NULL,
  `status` int(11) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_unit_of_measuremt
-- 

/*!40000 ALTER TABLE `pms_unit_of_measuremt` DISABLE KEYS */;
INSERT INTO `pms_unit_of_measuremt`(`unit_id`,`unit_unitof_measuremt_name`,`status`,`default_date`) VALUES
(1,'BAG-BAGS',0,'2019-06-03 15:38:32'),
(2,'BAL-BALE',0,'0001-01-01 00:00:00'),
(3,'BDL-BUNDLES',0,'0001-01-01 00:00:00'),
(4,'BKL-BUCKLES',0,'0001-01-01 00:00:00'),
(5,'BOU-BILLION OF UNITS',0,'0001-01-01 00:00:00'),
(6,'BOX-BOX',0,'0001-01-01 00:00:00'),
(7,'BTL-BOTTLES',0,'0001-01-01 00:00:00'),
(8,'BUN-BUNCHES',0,'0001-01-01 00:00:00'),
(9,'CAN-CANS',0,'0001-01-01 00:00:00'),
(10,'CBM-CUBIC METERS',0,'0001-01-01 00:00:00'),
(11,'CCM-CUBIC CENTIMETERS',0,'0001-01-01 00:00:00'),
(12,'CMS-CENTIMETERS',0,'0001-01-01 00:00:00'),
(13,'CTN-CARTONS',0,'0001-01-01 00:00:00'),
(14,'DOZ-DOZENS',0,'0001-01-01 00:00:00'),
(15,'DRM-DRUMS',0,'0001-01-01 00:00:00'),
(16,'GGK-GREAT GROSS',0,'0001-01-01 00:00:00'),
(17,'GMS-GRAMMES',0,'0001-01-01 00:00:00'),
(18,'GRS-GROSS',0,'0001-01-01 00:00:00'),
(19,'GYD-GROSS YARDS',0,'0001-01-01 00:00:00'),
(20,'KGS-KILOGRAMS',0,'0001-01-01 00:00:00'),
(21,'KLR-KILOLITRE',0,'0001-01-01 00:00:00'),
(22,'KME-KILOMETRE',0,'0001-01-01 00:00:00'),
(23,'MLT-MILILITRE',0,'0001-01-01 00:00:00'),
(24,'MTR-METERS',0,'0001-01-01 00:00:00'),
(25,'MTS-METRIC TON',0,'0001-01-01 00:00:00'),
(26,'NOS-NUMBERS',0,'0001-01-01 00:00:00'),
(27,'PAC-PACKS',0,'0001-01-01 00:00:00'),
(28,'PCS-PIECES',0,'0001-01-01 00:00:00'),
(29,'PRS-PAIRS',0,'0001-01-01 00:00:00'),
(30,'QTL-QUINTAL',0,'0001-01-01 00:00:00'),
(31,'ROL-ROLLS',0,'0001-01-01 00:00:00'),
(32,'SET-SETS',0,'0001-01-01 00:00:00'),
(33,'SQF-SQUARE FEET',0,'0001-01-01 00:00:00'),
(34,'SQM-SQUARE METERS',0,'0001-01-01 00:00:00'),
(35,'SQY-SQUARE YARDS',0,'0001-01-01 00:00:00'),
(36,'TBS-TABLETS',0,'0001-01-01 00:00:00'),
(37,'TGM-TEN GROSS',0,'0001-01-01 00:00:00'),
(38,'THD-THOUSANDS',0,'0001-01-01 00:00:00'),
(39,'TON-TONNES',0,'0001-01-01 00:00:00'),
(40,'TUB-TUBES',0,'0001-01-01 00:00:00'),
(41,'UGS-US GALLONS',0,'0001-01-01 00:00:00'),
(42,'UNT-UNITS',0,'0001-01-01 00:00:00'),
(43,'YDS-YARDS',0,'0001-01-01 00:00:00'),
(44,'OTH-OTHERS',0,'0001-01-01 00:00:00');
/*!40000 ALTER TABLE `pms_unit_of_measuremt` ENABLE KEYS */;

-- 
-- Definition of pms_voucher_dr_cr_note_dtl
-- 

DROP TABLE IF EXISTS `pms_voucher_dr_cr_note_dtl`;
CREATE TABLE IF NOT EXISTS `pms_voucher_dr_cr_note_dtl` (
  `document_no` varchar(16) NOT NULL,
  `againt_invoice` varchar(16) NOT NULL,
  `bill_party_name` varchar(50) NOT NULL,
  `ship_party_name` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `hsn_code` varchar(20) NOT NULL,
  `uom` varchar(20) NOT NULL,
  `batch` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` varchar(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `tax_value` int(11) NOT NULL,
  `igst_rate` varchar(20) NOT NULL,
  `igst_amount` int(11) NOT NULL,
  `cgst_rate` int(11) NOT NULL,
  `cgst_amount` int(11) NOT NULL,
  `sgst_rate` int(11) NOT NULL,
  `sgst_amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_dtl
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_dtl`(`document_no`,`againt_invoice`,`bill_party_name`,`ship_party_name`,`product_name`,`hsn_code`,`uom`,`batch`,`expiry_date`,`quantity`,`rate`,`amount`,`discount`,`tax_value`,`igst_rate`,`igst_amount`,`cgst_rate`,`cgst_amount`,`sgst_rate`,`sgst_amount`,`total`) VALUES
('PCR/1819/2','PAT/1819/1','2','2','CANON','9587','PCS-PIECES','','0001-01-01 00:00:00',2,'28',18000,800,35200,'28%',9856,0,0,0,0,45056),
('PDR/1819/1','PAT/1819/1','4','4','QUICK HEAL','5548','PCS-PIECES','','0001-01-01 00:00:00',2,'18',10000,200,19800,'18%',3564,0,0,0,0,23364);
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_voucher_dr_cr_note_mst
-- 

DROP TABLE IF EXISTS `pms_voucher_dr_cr_note_mst`;
CREATE TABLE IF NOT EXISTS `pms_voucher_dr_cr_note_mst` (
  `document_no` varchar(16) NOT NULL,
  `date_of_issue` date NOT NULL,
  `doc_state` varchar(20) NOT NULL,
  `doc_state_code` int(11) NOT NULL,
  `against_invoice` varchar(16) NOT NULL,
  `date_of_invoice` date NOT NULL,
  `bill_party_name` varchar(50) NOT NULL,
  `bill_party_address` varchar(100) NOT NULL,
  `bill_party_gstin` varchar(20) NOT NULL,
  `bill_party_state` varchar(30) NOT NULL,
  `bill_party_state_code` int(11) NOT NULL,
  `ship_party_name` varchar(50) NOT NULL,
  `ship_party_address` varchar(100) NOT NULL,
  `ship_party_gstin` varchar(20) NOT NULL,
  `ship_party_state` varchar(30) NOT NULL,
  `ship_party_code` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `total_gst` int(11) NOT NULL,
  `total_igst` int(11) NOT NULL,
  `total_cgst` int(11) NOT NULL,
  `total_sgst` int(11) NOT NULL,
  `total_discount` int(11) NOT NULL,
  `note_type` varchar(15) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  PRIMARY KEY (`document_no`,`against_invoice`,`bill_party_name`,`ship_party_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_voucher_dr_cr_note_mst
-- 

/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` DISABLE KEYS */;
INSERT INTO `pms_voucher_dr_cr_note_mst`(`document_no`,`date_of_issue`,`doc_state`,`doc_state_code`,`against_invoice`,`date_of_invoice`,`bill_party_name`,`bill_party_address`,`bill_party_gstin`,`bill_party_state`,`bill_party_state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`note_type`,`remarks`) VALUES
('PCR/1819/2','2019-02-01 00:00:00','10',10,'A/1819/001','2019-02-01 00:00:00','DEMO','abc','11ABCDEFGHD1AS','27',27,'DEMO','','11ABCDEFGHD1AS','27',27,45056,9856,9856,0,0,800,'credit','xyz'),
('PCR/1819/3','2019-02-01 00:00:00','10',10,'A/1819/001','2019-02-01 00:00:00','DEMO','abc','11ABCDEFGHD1AS','27',27,'DEMO','abc','11ABCDEFGHD1AS','27',27,45056,9856,9856,0,0,800,'credit','xyz'),
('PDR/1819/1','2019-02-01 00:00:00','10',10,'1','2019-02-10 00:00:00','MUKUND','chinchwad','27ABCDEFGHD1AS','27',27,'MUKUND','chinchwad','27ABCDEFGHD1AS','27',27,23364,3564,3564,0,0,200,'debit','ABC');
/*!40000 ALTER TABLE `pms_voucher_dr_cr_note_mst` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2019-11-11 20:51:53
-- Total time: 0:0:0:1:134 (d:h:m:s:ms)
