-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2019-11-21 18:56:51
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_account_master
-- 

/*!40000 ALTER TABLE `pms_account_master` DISABLE KEYS */;
INSERT INTO `pms_account_master`(`account_id`,`account_head`,`account_main_group`,`account_sub_group`,`account_party_name`,`account_inventory_value_affected`,`account_add_one`,`account_add_two`,`account_district`,`account_state`,`account_state_code`,`account_country`,`account_pin_code`,`account_gst_number`,`account_pan_number`,`account_cin_number`,`account_phone_number`,`account_email`,`account_opening_balance`,`account_opening_balance_type`,`status`,`default_date`) VALUES
(1,'Rajiv Ranjan (Prop)','','','Rajiv Ranjan (Prop)','No','','','','','','','','','','','','',6189945,'Credit',0,'2019-11-09 22:32:19'),
(2,'AXIS BANK LTD (OD AC-917030074838374)','5','4','AXIS BANK LTD (OD AC-917030074838374)','No','','','','','','','','','','','','',296723,'Debit',0,'2019-11-09 22:32:19'),
(3,'Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)','5','4','Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)','No','','','','','','','','','','','','',1101867,'Debit',0,'2019-11-09 22:32:19'),
(4,'Central Bank of India CC-A/c No.3170157625','5','4','Central Bank of India CC-A/c No.3170157625','No','','','','','','','','','','','','',427750,'Debit',0,'2019-11-09 22:32:19'),
(5,'Magma Fincorp Ltd.','5','4','Magma Fincorp Ltd.','No','','','','','','','','','','','','',133484,'Debit',0,'2019-11-09 22:32:19'),
(6,'Excess GST Paid','5','6','Excess GST Paid','No','','','','0','','','','','','','','',553674.01,'Debit',0,'2019-11-09 22:32:19'),
(7,'Accounting Payable','3','3','Accounting Payable','No','','','','','','','','','','','','',12000,'Credit',0,'2019-11-09 22:32:19'),
(8,'Audit Fee Payable','3','3','Audit Fee Payable','No','','','','','','','','','','','','',11000,'Credit',0,'2019-11-09 22:32:19'),
(9,'Office Rent Payable','3','3','Office Rent Payable','No','','','','','','','','','','','','',12000,'Credit',0,'2019-11-09 22:32:19'),
(10,'Salary Payable','3','3','Salary Payable','No','','','','','','','','','','','','',18600,'Credit',0,'2019-11-09 22:32:19'),
(11,'Air Condition & Steblizer','5','1','Air Condition & Steblizer','No','','','','','','','','','','','','',45421,'Debit',0,'2019-11-09 22:32:19'),
(12,'Auto Ace','5','1','Auto Ace','No','','','','','','','','','','','','',78220,'Debit',0,'2019-11-09 22:32:19'),
(13,'Equipment','5','1','Equipment','No','','','','','','','','','','','','',3586,'Debit',0,'2019-11-09 22:32:19'),
(14,'Furniture & Fixture','5','1','Furniture & Fixture','No','','','','','','','','','','','','',9976,'Debit',0,'2019-11-09 22:32:19'),
(15,'Indica Car','5','1','Indica Car','No','','','','','','','','','','','','',66268,'Debit',0,'2019-11-09 22:32:19'),
(16,'Mobile Phone','5','1','Mobile Phone','No','','','','','','','','','','','','',14365,'Debit',0,'2019-11-09 22:32:19'),
(17,'Printing Machine','5','1','Printing Machine','No','','','','','','','','','','','','',64008,'Debit',0,'2019-11-09 22:32:19'),
(18,'Scuty (Hero)','5','1','Scuty (Hero)','No','','','','','','','','','','','','',40800,'Debit',0,'2019-11-09 22:32:19'),
(19,'Gold East Trading(Hong Kong) Company','3','2','Gold East Trading(Hong Kong) Company','Yes','','','','','','','','','','','','',750084,'Credit',0,'2019-11-09 22:32:19'),
(20,'ORIENT LINKS CO.(L.L.C)','3','2','ORIENT LINKS CO.(L.L.C)','Yes','','','','','','','','','','','','',209696,'Credit',0,'2019-11-09 22:32:19'),
(21,'VITAL SOLUTIONS PTE LTD.','3','2','VITAL SOLUTIONS PTE LTD.','Yes','','','','','','','','','','','','',445921,'Credit',0,'2019-11-09 22:32:19'),
(22,'OTHER CURRENT ASSETS','5','6','OTHER CURRENT ASSETS','No','','','','','','','','','','','','',318163,'Debit',0,'2019-11-09 22:32:19'),
(23,'Axis Bank  A/c No.916020025351806','5','4','Axis Bank  A/c No.916020025351806','No','','','','','','','','','','','','',14355,'Debit',0,'2019-11-09 22:32:19'),
(24,'Central Bank of India S/B A/c No.3307952543','5','4','Central Bank of India S/B A/c No.3307952543','No','','','','','','','','','','','','',1942,'Debit',0,'2019-11-09 22:32:19'),
(25,'HDFC BANK  LTD. (A/c No- 50200026260502','5','4','HDFC BANK  LTD. (A/c No- 50200026260502','No','','','','','','','','','','','','',552,'Debit',0,'2019-11-09 22:32:19'),
(26,'Post Office (RD A/c)No.12478','5','4','Post Office (RD A/c)No.12478','No','','','','','','','','','','','','',115500,'Debit',0,'2019-11-09 22:32:19'),
(27,'Post Office R/D A/c No.385957145','5','4','Post Office R/D A/c No.385957145','No','','','','','','','','','','','','',14000,'Debit',0,'2019-11-09 22:32:19'),
(28,'Post Office S/B A/c 3849213945','5','4','Post Office S/B A/c 3849213945','No','','','','','','','','','','','','',158,'Debit',0,'2019-11-09 22:32:19'),
(29,'State Bank of India A/c No.35029039458','5','4','State Bank of India A/c No.35029039458','No','','','','','','','','','','','','',140207,'Debit',0,'2019-11-09 22:32:19'),
(30,'United Bank of India  S/B A/c No.0474010056707','5','4','United Bank of India  S/B A/c No.0474010056707','No','','','','','','','','','','','','',6069,'Debit',0,'2019-11-09 22:32:19'),
(31,'Cash in Hand','5','4','Cash in Hand','No','','','','','','','','','','','','',59896,'Debit',0,'2019-11-09 22:32:19'),
(32,'Sundry Debtors OP','5','3','Sundry Debtors OP','No','','','','','','','','','','','','',2142837,'Debit',0,'2019-11-09 22:32:19'),
(33,'ICICI BANK','1','1','ICICI BANK','','','','','0','','','','','','','','',1000,'Credit',0,'2019-11-11 16:53:17'),
(34,'PURCHASE','7','2','RAKESH KUMAR','Yes','MAYUR TRADE CENTER','','PUNE','27','27','INDIA','414019','10AAVFM2440B1ZS','','','879456321000000000','',5000,'Debit',0,'2019-09-07 06:22:00'),
(35,'CREDIT','7','1','CREDIT','Yes','chinchwad','','Pune','27','27','IN','411019','11ABCDEFGHD1AS','ABCDEFGHD','123','1234567899','s@gmail.com',1000,'Credit',0,'2019-09-07 09:21:11'),
(36,'SALES','6','1','SALES','Yes','chinchwad','','c','27','27','india','414019','','','1','1234567890','',2000,'Credit',0,'2019-09-09 00:34:48'),
(37,'DEBIT','3','2','DEBIT','Yes','chinchwad','pune','pune','27','27','india','414019','27ABCDEFGHD1AS','ABCDEFGHD','','1234567890','',6000,'Debit',0,'2019-09-09 23:34:21'),
(38,'CGST-ITC A/C','1','2','CGST-ITC A/C','Yes','chinchwad','','','27','27','INDIA','411019','27AAVFM2440B1BS','AAVFM2440B','12222223','1203456789','abc@gmail.com',5000,'Debit',0,'2019-09-17 02:24:22'),
(39,'IGST-ITC A/C','3','1','IGST-ITC A/C','Yes','chinchwad','','','27','27','india','414123','27AAVFM2440B1CS','AAVFM2440B','','','',0,'Debit',0,'2019-09-17 02:26:43'),
(40,'SGST-ITC A/C','6','2','SGST-ITC A/C','Yes','chinchwad','','','27','27','india','414111','27AABB123D1DS','AABB123D','123','1234567890','',0,'Debit',0,'2019-09-17 02:28:51');
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
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_company
-- 

/*!40000 ALTER TABLE `pms_company` DISABLE KEYS */;
INSERT INTO `pms_company`(`company_id`,`company_ucid`,`company_db`,`company_person_type`,`company_surname`,`company_middle_name`,`company_first_name`,`company_address_one`,`company_address_two`,`company_address_three`,`company_district`,`company_state`,`company_state_code`,`company_country`,`company_pincode`,`company_email`,`company_phone_number`,`company_gst_number`,`company_pan_number`,`company_cin_number`,`company_trade_name`,`company_gst_practitioner_ucid`,`company_ca_ucid`,`company_financial_year_start`,`company_gst_id`,`company_gst_password`,`company_bank_name`,`company_bank_branch_name`,`company_bank_account_number`,`company_bank_ifsc_code`,`company_primary_sign_name`,`company_primary_sign_designation`,`company_primary_sign_address`,`company_primary_sign_email`,`company_primapry_sign_phone`,`company_secondery_sign_name`,`company_secondery_sign_designation`,`company_secondery_sign_address`,`company_secondery_sign_email`,`company_secondery_sign_phone`,`username`,`password`,`default_date`,`status`) VALUES
(1,'AAA001','pms','Company Public Not Interested','GENIAL POLYMERS PRIVATE LIMITED','','','BEHIND PANCH SHIV MANDIR','KANKARBAGH','a','PATNA','10',10,'INDIA',800020,'ca.mukund@gmail.com',941889666,'10AAECG649J1ZL','AAECG649J','U2200BR2012PTC018321','123','ZZZ001','YYY001','2019','genialpolymers','123','STATE BANK OF INDIA','KANKARBAGH','987234100064388','SBIN0006321','RIPUNAJAY KUMAR','DIRECTOR','LOHIA NAGAR, KANKARBAGH','ca.mukund@outlook.com','8768544332','Neeraj Kumar','MD','patrakar nagar','ca.neerajkumar2012@gmail,com','8006005004','genialpolymers','123','2019-09-06 11:46:47',0),
(2,'AAA002','pms','Firm','MADAN MOHAN MISHRA PVT LTD','','','85, 8TH FLOOR','VAIBHAV APPARTMENT','BUDH MARG','PATNA','10',10,'INDIA',800001,'mmsgst9@gmail.com',2147483647,'10AAVFM2440N1ZS','AAVFM2440N','','CA FIRM','ZZZ001','YYY001','2019','mmsp0306','Mmsp@54321@','UNION BANK OF INDIA','BHUTHNATH MARG','987654321123','UBIN000123','MUKUND MOHAN SAHAY','PARTNER','RAJIV NAGAR','ca.mukund@yahoo.co.in','9471889666','NEERAJ KUMAR','PARTNER','LOHIA NAGAR','ca.neerajkumar2012@gmail.com','8709523331','mmsp0306','Mmsp@54321@','2019-09-07 08:53:54',0),
(3,'AAA003','pms_test','Individual','TIWARY','KUMAR','SUNIL','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,','BY-PASS ROAD','','PATNA','10',10,'INDIA',800027,'haritechenterprises@gmail.com',2147483647,'10AENPT7588P1ZG','AENPT7588P','','HARITECH ENTERPRISES','ZZZ001','YYY001','2019','priyankas9','Mmsp@12334','UNITED BANK OF INDIA','PATNA','9658745632145','UTBI000548','SUNIL KUMAR TIWARY','PROPREITOR','C/O BALDEO SINGH, EAST OF KHEMNI CHAK,, PATNA','haritechenterprises@gmail.com','9304980933','','','','','','priyankas9','Mmsp@12334','2019-09-07 09:01:50',0),
(4,'AAA004','db_aaa004','Cooperative Sociaty','unitglo','solutions','pvtltd','chinchwad','STATION','chinchwad','pune','27',27,'india',411019,'asd@gmail.com',1234568851,'27aakcm12121zp','aakcm1212','123','soc','GGG001','ccc001','2019_2020','uspl','uspl@123','indian bank','chinchwad station','6478077545','indian1212','dipak','assistant manager','pune','ds@gmail.com','1235668852','a','b','c','abc@gmail.com','1255555444','uspl','uspl@123','2019-10-01 11:46:38',0);
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
-- Definition of pms_expenses_voucher_dtl
-- 

DROP TABLE IF EXISTS `pms_expenses_voucher_dtl`;
CREATE TABLE IF NOT EXISTS `pms_expenses_voucher_dtl` (
  `exp_dtl_id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_voucherno` varchar(20) NOT NULL,
  `expenses_head` varchar(100) NOT NULL,
  `exp_product_name` varchar(100) NOT NULL,
  `exp_hsn_code` int(11) NOT NULL,
  `exp_tax_value` varchar(20) NOT NULL,
  `exp_igst_rate` varchar(20) NOT NULL,
  `exp_igst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_cgst_rate` varchar(20) NOT NULL,
  `exp_cgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_sgst_rate` varchar(20) NOT NULL,
  `exp_sgst_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `exp_total_amount` double(10,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exp_dtl_id`,`exp_voucherno`,`exp_product_name`)
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
  `exp_state_code` int(11) NOT NULL,
  `exp_supplier_name` varchar(200) NOT NULL,
  `exp_supplier_addr` varchar(1000) NOT NULL,
  `exp_supplier_gstin` varchar(20) NOT NULL,
  `exp_supplier_state` varchar(20) NOT NULL,
  `exp_supplier_state_code` int(11) NOT NULL,
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
  `status` int(11) NOT NULL DEFAULT '0',
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`jv_dtl_id`,`comp_name`,`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_dtl
-- 

/*!40000 ALTER TABLE `pms_journal_entry_dtl` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_dtl`(`jv_dtl_id`,`comp_name`,`journal_id`,`name`,`debit_amount`,`credit_amount`,`status`,`default_date`) VALUES
(1,'AAA002 ',1,'Bajaj Finanance LTD.(A/C NO- 4L6BFR54786687)',1000,0,0,'2019-11-15 15:14:10'),
(2,'AAA002 ',1,'Central Bank of India CC-A/c No.3170157625',0,1000,0,'2019-11-15 15:14:10'),
(3,'AAA002 ',1,'Magma Fincorp Ltd.',5940,0,0,'2019-11-21 15:45:49'),
(4,'AAA002 ',1,'IGST-ITC A/C',0,0,0,'2019-11-21 15:45:50'),
(5,'AAA002 ',1,'SALES',0,5940,0,'2019-11-21 15:45:51'),
(6,'AAA002 ',2,'Magma Fincorp Ltd.',5940,0,0,'2019-11-21 15:46:34'),
(7,'AAA002 ',2,'IGST-ITC A/C',0,0,0,'2019-11-21 15:46:34'),
(8,'AAA002 ',2,'SALES',0,5940,0,'2019-11-21 15:46:34'),
(9,'AAA002 ',3,'Audit Fee Payable',4561,0,0,'2019-11-21 15:52:31'),
(10,'AAA002 ',3,'IGST-ITC A/C',0,0,0,'2019-11-21 15:52:31'),
(11,'AAA002 ',3,'SALES',0,4561,0,'2019-11-21 15:52:31');
/*!40000 ALTER TABLE `pms_journal_entry_dtl` ENABLE KEYS */;

-- 
-- Definition of pms_journal_entry_mst
-- 

DROP TABLE IF EXISTS `pms_journal_entry_mst`;
CREATE TABLE IF NOT EXISTS `pms_journal_entry_mst` (
  `comp_name` varchar(100) NOT NULL,
  `journal_id` int(11) NOT NULL,
  `manual_id` int(11) NOT NULL,
  `jv_date` date NOT NULL,
  `dr_total` double(10,2) NOT NULL DEFAULT '0.00',
  `cr_total` double(10,2) NOT NULL DEFAULT '0.00',
  `note` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comp_name`,`journal_id`,`manual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_journal_entry_mst
-- 

/*!40000 ALTER TABLE `pms_journal_entry_mst` DISABLE KEYS */;
INSERT INTO `pms_journal_entry_mst`(`comp_name`,`journal_id`,`manual_id`,`jv_date`,`dr_total`,`cr_total`,`note`,`status`,`default_date`) VALUES
('AAA002',1,1,'2019-11-21 00:00:00',5940,5940,'abc',0,'2019-11-21 15:45:47'),
('AAA002',2,2,'2019-11-21 00:00:00',5940,5940,'abc',0,'2019-11-21 15:46:34'),
('AAA002',3,3,'2019-11-21 00:00:00',4561,4561,'lasd',0,'2019-11-21 15:52:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_setting_all_prefix_series_number
-- 

/*!40000 ALTER TABLE `pms_master_setting_all_prefix_series_number` DISABLE KEYS */;
INSERT INTO `pms_master_setting_all_prefix_series_number`(`id`,`generated_no`,`series_no`,`count`,`status`,`default_date`) VALUES
(9,'invoice','INVOICE/1819/',2,0,'2019-11-21 12:16:52'),
(10,'invoice','INVOICE/1920/',0,0,'2019-11-21 12:16:52'),
(11,'debit','DEBIT/1819/',0,0,'2019-11-21 12:16:52'),
(12,'debit','DEBIT/1920/',0,0,'2019-11-21 12:16:53'),
(13,'credit','CREDIT/1819/',0,0,'2019-11-21 12:16:53'),
(14,'credit','CREDIT/1920/',0,0,'2019-11-21 12:16:53');
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`master_sett_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_master_settings
-- 

/*!40000 ALTER TABLE `pms_master_settings` DISABLE KEYS */;
INSERT INTO `pms_master_settings`(`master_sett_id`,`terms_condition_tax_invoice`,`authorized_signatory_tax_invoice`,`authorized_signatory_other_voucher`,`mrp_details`,`mrp_invoice_details`,`sale_price_details`,`sale_price_details_info`,`expiry_monitoring_system`,`expiry_monitoring_system_info`,`expiry_details_tax_invoice`,`batch_wise_details`,`batch_wise_details_info`,`batch_wise_details_tax_invoice`,`stock_out_method`,`stock_valuation_method`,`unit_conversion_method_required`,`prefix_generate_invoice_no`,`invoiceno`,`prefix_generate_debit_no`,`debitno`,`prefix_generate_credit_no`,`creditno`,`journal_accounting_entry`,`extra_information_tax_invoice`,`caption_name1`,`currency_sign_before_amount`,`status`,`default_date`) VALUES
(3,'abc abc','MUKUND MOHAN SAHAY','NEERAJ KUMAR','1','100','1','100','1','2019-02-01 00:00:00','0','1','A','0','FIFO','\tCost or Market Price whichever is lower\tCost Price\tMarket Price\tAverage Cost Price','0',1,'0',1,'0',1,'0','1','1','CAPTION1','0',0,'2019-11-21 12:16:52');
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
  `status` int(11) NOT NULL DEFAULT '0',
  `invoice_type` varchar(20) NOT NULL,
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pur_dtl_auto_id`,`reference_id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_dtl`(`pur_dtl_auto_id`,`reference_id`,`invoice_no`,`seller_no`,`statecode`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`status`,`invoice_type`,`default_date`) VALUES
(1,1,'AXIS BANK LTD (O','10',0,'','PCS-PIECES','A','0010-01-01','0001-01-01 00:00:00',0,44000,400,43600,0,0,0,0,0,0,0,0,'DONE','2019-11-18 17:46:49'),
(2,2,'AXIS BANK LTD (O','10',0,'','PCS-PIECES','','','0001-01-01 00:00:00',0,10000,100,9900,0,0,0,0,0,0,0,0,'DONE','2019-11-18 18:22:17'),
(3,4,'4','AXIS BANK LTD (OD AC-917030074838374)',10,'Laptop','','PCS-PIECES','','0001-01-01 00:00:00',1,0,5000,5,-5,0,0,0,0,0,0,0,'purchase','2019-11-18 18:45:19'),
(4,5,'5','Audit Fee Payable',10,'Laptop','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,6000,600,5400,0,0,0,0,0,0,0,'purchase','2019-11-21 13:00:26'),
(5,6,'6','Office Rent Payable',10,'QUICK HEAL','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,5222,0,5222,0,0,0,0,0,0,0,'purchase','2019-11-21 13:02:34'),
(6,7,'7','Excess GST Paid',10,'mobile','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,15000,2000,13000,0,0,0,0,0,0,0,'purchase','2019-11-21 13:09:24'),
(7,8,'8','Magma Fincorp Ltd.',10,'CANON','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,50000,500,49500,0,0,0,0,0,0,0,'purchase','2019-11-21 13:18:23'),
(8,9,'8','Magma Fincorp Ltd.',10,'CANON','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,50000,500,49500,0,0,0,0,0,0,0,'purchase','2019-11-21 13:19:09'),
(9,10,'9','AXIS BANK LTD (OD AC-917030074838374)',10,'CABLE','','','A','2019-02-01 00:00:00',1,0,3000,200,2800,0,0,0,0,0,0,0,'purchase','2019-11-21 13:23:27'),
(10,11,'9','AXIS BANK LTD (OD AC-917030074838374)',10,'CABLE','','','A','2019-02-01 00:00:00',1,0,3000,200,2800,0,0,0,0,0,0,0,'purchase','2019-11-21 13:24:25'),
(11,12,'8','Equipment',10,'CABLE','','','A','2019-02-01 00:00:00',1,0,9000,900,8100,0,0,0,0,0,0,0,'purchase','2019-11-21 15:49:10'),
(12,12,'8','Equipment',10,'QUICK HEAL','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,6000,600,5400,0,0,0,0,0,0,0,'purchase','2019-11-21 15:49:10'),
(13,13,'9','Audit Fee Payable',10,'QUICK HEAL','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,4561,0,4561,0,0,0,0,0,0,0,'purchase','2019-11-21 15:51:43');
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
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `invoice_type` varchar(50) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pur_mst_auto_id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_purchase_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_purchase_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_purchase_invoice_mst`(`pur_mst_auto_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`status`,`default_date`) VALUES
(1,'1','2019-11-18 00:00:00','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','','',0,0,0,0,0,400,'Cash','Paid','purchase','asd',0,'2019-11-18 17:46:49'),
(2,'2','2019-11-18 00:00:00','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','','',0,0,0,0,0,100,'Cash','Paid','purchase','aasd',0,'2019-11-18 18:22:17'),
(3,'3','2019-11-18 00:00:00','NO','10',10,'Rajiv Ranjan (Prop)','','','','',4355,0,0,0,0,200,'Cash','Paid','purchase','asd',0,'2019-11-18 18:39:18'),
(4,'4','2019-11-18 00:00:00','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','','',-5,0,0,0,0,5,'Cash','Paid','purchase','asd',0,'2019-11-18 18:44:34'),
(5,'5','2019-11-21 00:00:00','NO','10',10,'Audit Fee Payable','','','','',5400,0,0,0,0,600,'Cash','Paid','purchase','Purchase add ',0,'2019-11-21 13:00:22'),
(6,'6','2019-11-21 00:00:00','NO','10',10,'Office Rent Payable','','','','',5222,0,0,0,0,0,'Cash','Paid','purchase','Purchase add ',0,'2019-11-21 13:02:34'),
(7,'7','2019-11-21 00:00:00','NO','10',10,'Excess GST Paid','','','0','',13000,0,0,0,0,2000,'Cash','Paid','purchase','asdfgg',0,'2019-11-21 13:09:24'),
(8,'8','2019-11-21 00:00:00','NO','10',10,'Magma Fincorp Ltd.','','','','',49500,0,0,0,0,500,'Cash','Paid','purchase','zvvbbnmm',0,'2019-11-21 13:18:23'),
(9,'8','2019-11-21 00:00:00','NO','10',10,'Magma Fincorp Ltd.','','','','',49500,0,0,0,0,500,'Cash','Paid','purchase','zvvbbnmm',0,'2019-11-21 13:19:09'),
(10,'9','2019-11-21 00:00:00','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','','',2800,0,0,0,0,200,'Cash','Paid','purchase','lmkk',0,'2019-11-21 13:23:26'),
(11,'9','2019-11-21 00:00:00','NO','10',10,'AXIS BANK LTD (OD AC-917030074838374)','','','','',2800,0,0,0,0,200,'Cash','Paid','purchase','lmkk',0,'2019-11-21 13:24:25'),
(12,'8','2019-11-21 00:00:00','NO','10',10,'Equipment','','','','',13500,0,0,0,0,1500,'Cash','Paid','purchase','asd',0,'2019-11-21 15:49:10'),
(13,'9','2019-11-21 00:00:00','NO','10',10,'Audit Fee Payable','','','','',4561,0,0,0,0,0,'Cash','Paid','purchase','ghj',0,'2019-11-21 15:51:43');
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
  `status` int(11) NOT NULL DEFAULT '0',
  `invoice_type` varchar(20) NOT NULL DEFAULT 'sales',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_dtl_id`,`reference_id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_dtl
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_dtl` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_dtl`(`sale_dtl_id`,`reference_id`,`invoice_no`,`seller_no`,`product_desc`,`hsn_code`,`uom`,`batch`,`expiry_date`,`qty`,`rate`,`amount`,`discount`,`tax_val`,`igst_rate`,`igst_amt`,`cgst_rate`,`cgst_amt`,`sgst_rate`,`sgst_amount`,`status`,`invoice_type`,`default_date`) VALUES
(4,4,'INVOICE/1819/1','Audit Fee Payable','Laptop','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,70000,700,69300,0,0,0,0,0,0,0,'sales','2019-11-21 15:27:10'),
(5,5,'INVOICE/1819/2','Audit Fee Payable','CANON','','PCS-PIECES','A','2019-02-01 00:00:00',1,0,6000,60,5940,0,0,0,0,0,0,0,'sales','2019-11-21 15:28:56');
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
  `ship_party_state_code` int(11) NOT NULL,
  `total_cost` double(10,2) NOT NULL DEFAULT '0.00',
  `total_gst` varchar(20) NOT NULL,
  `total_igst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_cgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_sgst` double(10,2) NOT NULL DEFAULT '0.00',
  `total_discount` double(10,2) NOT NULL DEFAULT '0.00',
  `bank_name` varchar(50) NOT NULL,
  `bank_ac_no` int(11) NOT NULL,
  `bank_ifsc_code` varchar(50) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `terms_and_condition` varchar(1000) NOT NULL,
  `auth_name` varchar(100) NOT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `invoice_type` varchar(50) NOT NULL,
  `remark` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sale_mst_id`,`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_sale_invoice_mst
-- 

/*!40000 ALTER TABLE `pms_sale_invoice_mst` DISABLE KEYS */;
INSERT INTO `pms_sale_invoice_mst`(`sale_mst_id`,`invoice_no`,`invoice_date`,`reverse_charge`,`i_state`,`statecode`,`transport_mode`,`vehicle_no`,`date_of_supply`,`place_of_supply`,`seller_name`,`Seller_address`,`gstin`,`s_state`,`state_code`,`ship_party_name`,`ship_party_address`,`ship_party_gstin`,`ship_party_state`,`ship_party_state_code`,`total_cost`,`total_gst`,`total_igst`,`total_cgst`,`total_sgst`,`total_discount`,`bank_name`,`bank_ac_no`,`bank_ifsc_code`,`company_name`,`terms_and_condition`,`auth_name`,`payment_mode`,`payment_status`,`invoice_type`,`remark`,`status`,`default_date`) VALUES
(2,'2','2019-11-18 00:00:00','NO','10',10,'road','mh-12 1231','2019-11-18 00:00:00','pune','AXIS BANK LTD (OD AC-917030074838374)','','','','','Rajiv Ranjan (Prop)','','','',0,9900,'0',0,0,0,100,'UNION BANK OF INDIA',2147483647,'UBIN000123','MADAN MOHAN MISHRA PVT LTD  ','','','Cash','Paid','','asd',0,'2019-11-18 17:29:37'),
(4,'INVOICE/1819/','2019-11-21 00:00:00','NO','10',10,'road','mh-12 1233','2019-11-21 00:00:00','pune','Audit Fee Payable','','','','','Select Supplier','','','',0,69300,'0',0,0,0,700,'UNION BANK OF INDIA',2147483647,'UBIN000123','MADAN MOHAN MISHRA PVT LTD  ','abc abc','MUKUND MOHAN SAHAY','Cash','Paid','','sss',0,'2019-11-21 15:27:10'),
(5,'INVOICE/1819/','2019-11-21 00:00:00','NO','10',10,'road','mh-12 1233','2019-11-21 00:00:00','pune','Audit Fee Payable','','','','','Magma Fincorp Ltd.','','','',0,5940,'0',0,0,0,60,'UNION BANK OF INDIA',2147483647,'UBIN000123','MADAN MOHAN MISHRA PVT LTD  ','abc abc','MUKUND MOHAN SAHAY','Cash','Paid','','ps',0,'2019-11-21 15:28:56');
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
  `stock_hsn_sac_code` varchar(20) NOT NULL,
  `stock_gst_rate` text NOT NULL,
  `stock_mrp` varchar(50) NOT NULL,
  `stock_sale_price_without_gst` varchar(50) NOT NULL,
  `stock_expiry_date` date DEFAULT NULL,
  `stock_batch` varchar(50) NOT NULL,
  `stock_reorder_level` text NOT NULL,
  `stock_reorder_quantity` text NOT NULL,
  `stock_minimum_stock_reminder` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pms_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table pms_stock
-- 

/*!40000 ALTER TABLE `pms_stock` DISABLE KEYS */;
INSERT INTO `pms_stock`(`pms_stock_id`,`stock_nature_of_opration`,`stock_group`,`stock_product_name`,`stock_unit_of_measurment`,`stock_hsn_sac_code`,`stock_gst_rate`,`stock_mrp`,`stock_sale_price_without_gst`,`stock_expiry_date`,`stock_batch`,`stock_reorder_level`,`stock_reorder_quantity`,`stock_minimum_stock_reminder`,`status`,`default_date`) VALUES
(1,'2','1','Laptop','PCS-PIECES','','','','0.00','2019-10-01 00:00:00','','','','',0,'2019-11-15 16:31:17'),
(2,'2','1','Pen','BAG-BAGS','','','','','2019-10-01 00:00:00','','','','',0,'2019-11-11 16:37:54'),
(3,'','','QUICK HEAL','PCS-PIECES','','','','','2019-10-01 00:00:00','','','','',0,'2019-11-11 16:37:55'),
(4,'','','CANON','PCS-PIECES','','','','','2019-10-01 00:00:00','','','','',0,'2019-11-11 16:37:55'),
(5,'1','1','mobile','PCS-PIECES','','','','','2019-10-01 00:00:00','','','','',0,'2019-11-15 18:12:06'),
(6,'1','1','CABLE','','','','','','0001-01-01 00:00:00','','','','',0,'2019-11-15 18:11:43');
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dtl_dr_cr_id`,`refrance_id`,`document_no`)
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
  `document_no` varchar(16) NOT NULL,
  `dr_cr_Id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` int(11) NOT NULL DEFAULT '0',
  `default_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dr_cr_Id`,`against_invoice`,`bill_party_name`,`ship_party_name`)
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


-- Dump completed on 2019-11-21 18:56:52
-- Total time: 0:0:0:0:940 (d:h:m:s:ms)
