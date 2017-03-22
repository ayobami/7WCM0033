-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: propertiesapp
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street1` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `street2` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `plot_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `floor_number` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (18,'No 19, Babalande, Victoria Island','','Lagos',271,161,'100261','',''),(19,'No 5, Sadiku street, Charity','','Lagos',271,161,'100261','',''),(20,'Ebute meta lane, Yaba','','Lagos',271,161,'100261','',''),(21,'No 19 Sadiku street, Afariogun street, Charity, Oshodi','','Lagos',271,161,'100261',NULL,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-02-15 13:39:53','2017-02-15 13:39:53');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `associated_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `audited_changes` text,
  `version` int(11) DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `remote_address` varchar(255) DEFAULT NULL,
  `request_uuid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditable_index` (`auditable_id`,`auditable_type`),
  KEY `associated_index` (`associated_id`,`associated_type`),
  KEY `user_index` (`user_id`,`user_type`),
  KEY `index_audits_on_request_uuid` (`request_uuid`),
  KEY `index_audits_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,17,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: dafasfd\nstreet2: \'\'\ncity: sfsdfddfdsf\nstate: \'265\'\ncountry: 15\nzip_code: \'1234\'\nplot_number: \'89\'\nfloor_number: \'89\'\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(2,10,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 17\ndescription: wewerwer\nproperty_type: 385\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-02 21:47:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-02 21:47:00.000000000 Z\nnumber_of_rooms: 9\narea_size: \'56\'\nper_unit_price: 3466\nproperty_status: 290\nnumber_of_baths: 7\nshort_description: ewewre\nproperty_number: 10DVIUXS\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(3,10,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 10\nper_unit_price: !ruby/object:BigDecimal 18:0.3466E4\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-02 21:47:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-02 21:47:00.000000000 Z\nprice_end_date: \ndown_payment: 233545\nmortgage_term: 12\ninterest_rate: 2\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(4,4,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 75e6ac52-9c43-4fc0-bd09-a9d2b8c481af\nfile_path: \nextension: jpg\ntitle: Tulips.jpg\nsize: \nowner_unique_id: 10DVIUXS\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:29'),(5,18,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 19, Babalande, Victoria Island\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(6,11,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 18\ndescription: \'Quintessential South Boston condo at the top of Old Harbor St near picturesque\n  Thomas Park. Deeded deck & backyard create your own private oasis! Hardwood throughout.\n  Walk into upper level featuring 2 bedrooms w/ample built-out closet space, recessed\n  lights & spacious bathroom. Magnificent lower level basks in light & welcomes you\n  with high ceilings & open layout, perfect for entertaining! Airy living rm takes\n  in spectacular views through double glass doors to your very own 200 sf deck & yard\n  for alfresco dining & relaxing. Open floor plan features kitchen w/granite island,\n  stainless appliances, trash compactor, wine fridge. gas fireplace, & crown moldings.\n  French doors lead to 3rd bedroom that lends itself as a guest bd, dining room, playroom\n  or office area. Central Air. NEST thermostat system. Bonus 7 x 12 storage area in\n  basement. Water heater new in 2016. If you\'\'ve been waiting for the right condo\n  in this charming section of this coveted neighborhood, this is it! Interior just\n  painted!  \'\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:31:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:31:00.000000000 Z\nnumber_of_rooms: 5\narea_size: \'209\'\nper_unit_price: 11000000\nproperty_status: 290\nnumber_of_baths: 3\nshort_description: Private deeded back yard and easy parking on wide street. Steps\n  from Thomas park and the beach.\nproperty_number: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(7,11,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 11\nper_unit_price: !ruby/object:BigDecimal 18:0.11E8\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:31:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:31:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(8,5,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 8b114bcf-2cb8-4500-8d21-901f29fac684\nfile_path: \nextension: jpg\ntitle: 3CE6984300000578-4196454-image-a-3_1486396105907.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(9,6,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: ad279191-3a05-4ba7-921a-fe24c9c968f3\nfile_path: \nextension: jpg\ntitle: 4b85a2e1983c9a9603fd19bcd1be2138.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(10,7,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 698d09ff-6830-4ba1-9dc7-640f1c29c109\nfile_path: \nextension: jpg\ntitle: index1.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(11,19,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 5, Sadiku street, Charity\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(12,12,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 19\ndescription: Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive\n  Escala. Attention to detail is evident--artisan troweled walls, hand painted murals\n  and tiles. Resort oasis w/pool, spa and tennis court overlooking hill country views\n  and distant Austin city skyline.\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:35:00.000000000 Z\nnumber_of_rooms: 5\narea_size: \'209\'\nper_unit_price: 15000000\nproperty_status: 290\nnumber_of_baths: 2\nshort_description: Stunning French Country estate built by Pat Heyl on 4.5 Acres in\n  exclusive Escala.\nproperty_number: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(13,12,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 12\nper_unit_price: !ruby/object:BigDecimal 18:0.15E8\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:35:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(14,8,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: f6649c99-0315-46a9-900b-2e9df9e77607\nfile_path: \nextension: jpg\ntitle: designed_by_expanded_gallery2.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(15,9,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: a414bed6-3c08-415e-9339-23c03d6500fe\nfile_path: \nextension: jpg\ntitle: Tinakilly-house-inside.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(16,10,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 1d2de846-c911-4a59-96cf-970bfb6c5353\nfile_path: \nextension: jpg\ntitle: Sarah-Hogan-house-11nov15_pr_b_639x426.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(17,20,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: Ebute meta lane, Yaba\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(18,13,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 20\ndescription: \'BEAUTIFUL AND COMPLETELY REMODELED! New kitchen has many upgraded features\n  including soft close cabinets and drawers, granite counter tops with tile back splashes\n  and stainless steel appliances. Living and Dining Rooms have an open floor plan\n  with vaulted ceilings. The wood burning fireplace has a tile surround that accents\n  the new wood laminate nicely. Both bathrooms have new tile flooring, cabinets with\n  granite counter tops and tile accents, toilets and fixtures. Pool has new Diamond\n  Brite finish and freshly painted pool deck. Fresh landscaping and an outdoor patio/bbq\n  area. Large laundry room with shelving. Other New features include A/C and ducts,\n  carpet, low energy vinyl windows, interior doors, lighting fixtures, fresh interior\n  and exterior paint, ClosetMaid shelving. \'\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:38:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:38:00.000000000 Z\nnumber_of_rooms: 2\narea_size: \'209\'\nper_unit_price: 9000000\nproperty_status: 290\nnumber_of_baths: 2\nshort_description: \'BEAUTIFUL AND COMPLETELY REMODELED! \'\nproperty_number: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(19,13,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 13\nper_unit_price: !ruby/object:BigDecimal 18:0.9E7\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:38:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:38:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(20,11,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 012d2aff-8419-42ed-a513-1f34640364d1\nfile_path: \nextension: jpg\ntitle: plants-green-interior-design-ideas-31.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(21,12,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: e7e487cb-018b-4aa6-a9a9-ab33be75b04d\nfile_path: \nextension: jpg\ntitle: log-house-10.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(22,13,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 195694e8-4d4c-4bba-8a4c-004fd4e9b3ba\nfile_path: \nextension: jpg\ntitle: 4b85a2e1983c9a9603fd19bcd1be2138.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(23,3,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: ayobami@ayobamiadewole.com\npassword: \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4ePZVCwlRYQAjmKV/utNa/qXYnsDhCMbi\"\ncreated_date: 2017-03-14\nsalt: \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4e\"\n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(24,21,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 19 Sadiku street, Afariogun street, Charity, Oshodi\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(25,4,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Ayobami\nlast_name: Adewole\nmiddle_name: \'\'\ngender: 359\nmarital_status: 366\nreligion: 373\naddress_id: 21\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1988-05-18 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1988-05-18 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-14 15:46:00.000000000 Z\n  zone: *1\n  time: 2017-03-14 15:46:00.000000000 Z\nstatus: 364\nemail_address: ayobami@ayobamiadewole.com\nphone_number: \'08052185012\'\nuser_id: 3\n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(26,1,'PropertySearch',NULL,NULL,NULL,NULL,NULL,'create','---\nnumber_of_rooms: \nnumber_of_baths: 2\nprice_range_start: \nprice_range_end: \nuser_id: 3\nsearch_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-21 13:34:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-21 13:34:00.000000000 Z\naddress_id: \nproperty_number: \nis_interest: \'YES\'\n',1,NULL,'127.0.0.1','74e10f07-78be-4936-81c1-58e572f8d449','2017-03-21 12:34:19'),(27,2,'PropertySearch',NULL,NULL,NULL,NULL,NULL,'create','---\nnumber_of_rooms: 5\nnumber_of_baths: 2\nprice_range_start: \nprice_range_end: \nuser_id: 3\nsearch_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-21 13:34:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-21 13:34:00.000000000 Z\naddress_id: \nproperty_number: \nis_interest: \'NO\'\n',1,NULL,'127.0.0.1','272f1f07-067f-4164-bf92-8fe3eebcde68','2017-03-21 12:34:50'),(28,11,'Property',NULL,NULL,NULL,NULL,NULL,'update','---\nnumber_of_rooms:\n- 5\n- 4\nnumber_of_baths:\n- 3\n- 2\nper_unit_price:\n- 11000000\n- 8000000\n',2,NULL,'127.0.0.1','8aab7841-ee20-4e1c-95d1-de1357383bbe','2017-03-21 15:51:43'),(29,11,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'update','---\nper_unit_price:\n- !ruby/object:BigDecimal 18:0.11E8\n- !ruby/object:BigDecimal 18:0.8E7\n',2,NULL,'127.0.0.1','8aab7841-ee20-4e1c-95d1-de1357383bbe','2017-03-21 15:51:43');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `min_budget` decimal(18,0) DEFAULT NULL,
  `max_budget` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Buyer_Person` (`person_id`) USING BTREE,
  KEY `FK_Buyer_Property` (`property_id`) USING BTREE,
  CONSTRAINT `FK_Buyer_Person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  CONSTRAINT `FK_Buyer_Property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL,
  `label` varchar(250) COLLATE utf8_bin NOT NULL,
  `category` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'Country1','Afghanistan','Country','af',NULL),(2,'Country2','Aland Islands','Country','ax',NULL),(3,'Country3','Albania','Country','al',NULL),(4,'Country4','Algeria','Country','dz',NULL),(5,'Country5','American Samoa','Country','as',NULL),(6,'Country6','Andorra','Country','ad',NULL),(7,'Country7','Angola','Country','ao',NULL),(8,'Country8','Anguilla','Country','ai',NULL),(9,'Country9','Antarctica','Country','aq',NULL),(10,'Country10','Antigua and Barbuda','Country','ag',NULL),(11,'Country11','Argentina','Country','ar',NULL),(12,'Country12','Armenia','Country','am',NULL),(13,'Country13','Aruba','Country','aw',NULL),(14,'Country14','Australia','Country','au',NULL),(15,'Country15','Austria','Country','at',NULL),(16,'Country16','Azerbaijan','Country','az',NULL),(17,'Country17','Bahamas','Country','bs',NULL),(18,'Country18','Bahrain','Country','bh',NULL),(19,'Country19','Bangladesh','Country','bd',NULL),(20,'Country20','Barbados','Country','bb',NULL),(21,'Country21','Belarus','Country','by',NULL),(22,'Country22','Belgium','Country','be',NULL),(23,'Country23','Belize','Country','bz',NULL),(24,'Country24','Benin','Country','bj',NULL),(25,'Country25','Bermuda','Country','bm',NULL),(26,'Country26','Bhutan','Country','bt',NULL),(27,'Country27','Bolivia,Plurinational State Of','Country','bo',NULL),(28,'Country28','Bosnia and Herzegovina','Country','ba',NULL),(29,'Country29','Botswana','Country','bw',NULL),(30,'Country30','Bouvet Island','Country','bv',NULL),(31,'Country31','Brazil','Country','br',NULL),(32,'Country32','British Indian Ocean Territory','Country','io',NULL),(33,'Country33','Brunei Darussalam','Country','bn',NULL),(34,'Country34','Bulgaria','Country','bg',NULL),(35,'Country35','Burkina Faso','Country','bf',NULL),(36,'Country36','Burundi','Country','bi',NULL),(37,'Country37','Cambodia','Country','kh',NULL),(38,'Country38','Cameroon','Country','cm',NULL),(39,'Country39','Canada','Country','ca',NULL),(40,'Country40','Cape Verde','Country','cv',NULL),(41,'Country41','Cayman Islands','Country','ky',NULL),(42,'Country42','Central African Republic','Country','cf',NULL),(43,'Country43','Chad','Country','td',NULL),(44,'Country44','Chile','Country','cl',NULL),(45,'Country45','China','Country','cn',NULL),(46,'Country46','Christmas Island','Country','cx',NULL),(47,'Country47','Cocos (Keeling) Islands','Country','cc',NULL),(48,'Country48','Colombia','Country','co',NULL),(49,'Country49','Comoros','Country','km',NULL),(50,'Country50','Congo,The Democratic Republic of the','Country','cd',NULL),(51,'Country51','Congo','Country','cg',NULL),(52,'Country52','Cook Islands','Country','ck',NULL),(53,'Country53','Costa Rica','Country','cr',NULL),(54,'Country54','Cote d\'Ivoire','Country','ci',NULL),(55,'Country55','Croatia','Country','hr',NULL),(56,'Country56','Cuba','Country','cu',NULL),(57,'Country57','Cyprus','Country','cy',NULL),(58,'Country58','Czech Republic','Country','cz',NULL),(59,'Country59','Denmark','Country','dk',NULL),(60,'Country60','Djibouti','Country','dj',NULL),(61,'Country61','Dominica','Country','dm',NULL),(62,'Country62','Dominican Republic','Country','do',NULL),(63,'Country63','Ecuador','Country','ec',NULL),(64,'Country64','Egypt','Country','eg',NULL),(65,'Country65','El Salvador','Country','sv',NULL),(66,'Country66','Equatorial Guinea','Country','gq',NULL),(67,'Country67','Eritrea','Country','er',NULL),(68,'Country68','Estonia','Country','ee',NULL),(69,'Country69','Ethiopia','Country','et',NULL),(70,'Country70','Falkland Islands (Malvinas)','Country','fk',NULL),(71,'Country71','Faroe Islands','Country','fo',NULL),(72,'Country72','Fiji','Country','fj',NULL),(73,'Country73','Finland','Country','fi',NULL),(74,'Country74','France','Country','fr',NULL),(75,'Country75','French Guiana','Country','gf',NULL),(76,'Country76','French Polynesia','Country','pf',NULL),(77,'Country77','French Southern Territories','Country','tf',NULL),(78,'Country78','Gabon','Country','ga',NULL),(79,'Country79','Gambia','Country','gm',NULL),(80,'Country80','Georgia','Country','ge',NULL),(81,'Country81','Germany','Country','de',NULL),(82,'Country82','Ghana','Country','gh',NULL),(83,'Country83','Gibraltar','Country','gi',NULL),(84,'Country84','Greece','Country','gr',NULL),(85,'Country85','Greenland','Country','gl',NULL),(86,'Country86','Grenada','Country','gd',NULL),(87,'Country87','Guadeloupe','Country','gp',NULL),(88,'Country88','Guam','Country','gu',NULL),(89,'Country89','Guatemala','Country','gt',NULL),(90,'Country90','Guernsey','Country','gg',NULL),(91,'Country91','Guinea','Country','gn',NULL),(92,'Country92','Guinea-Bissau','Country','gw',NULL),(93,'Country93','Guyana','Country','gy',NULL),(94,'Country94','Haiti','Country','ht',NULL),(95,'Country95','Heard Island and McDonald Islands','Country','hm',NULL),(96,'Country96','Holy See (Vatican City)','Country','va',NULL),(97,'Country97','Honduras','Country','hn',NULL),(98,'Country98','Hong Kong','Country','hk',NULL),(99,'Country99','Hungary','Country','hu',NULL),(100,'Country100','Iceland','Country','is',NULL),(101,'Country101','India','Country','in',NULL),(102,'Country102','Indonesia','Country','id',NULL),(103,'Country103','Iran, Islamic Republic of','Country','ir',NULL),(104,'Country104','Iraq','Country','iq',NULL),(105,'Country105','Ireland','Country','ie',NULL),(106,'Country106','Isle of Man','Country','im',NULL),(107,'Country107','Israel','Country','il',NULL),(108,'Country108','Italy','Country','it',NULL),(109,'Country109','Jamaica','Country','jm',NULL),(110,'Country110','Japan','Country','jp',NULL),(111,'Country111','Jersey','Country','je',NULL),(112,'Country112','Jordan','Country','jo',NULL),(113,'Country113','Kazakhstan','Country','kz',NULL),(114,'Country114','Kenya','Country','ke',NULL),(115,'Country115','Kiribati','Country','ki',NULL),(116,'Country116','Korea, Democratic People\'s Republic of','Country','kp',NULL),(117,'Country117','Korea, Republic of','Country','kr',NULL),(118,'Country118','Kuwait','Country','kw',NULL),(119,'Country119','Kyrgyzstan','Country','kg',NULL),(120,'Country120','Lao People\'s Democratic Republic','Country','la',NULL),(121,'Country121','Latvia','Country','lv',NULL),(122,'Country122','Lebanon','Country','lb',NULL),(123,'Country123','Lesotho','Country','ls',NULL),(124,'Country124','Liberia','Country','lr',NULL),(125,'Country125','Libyan Arab Jamahiriya','Country','ly',NULL),(126,'Country126','Liechtenstein','Country','li',NULL),(127,'Country127','Lithuania','Country','lt',NULL),(128,'Country128','Luxembourg','Country','lu',NULL),(129,'Country129','Macao','Country','mo',NULL),(130,'Country130','Macedonia, The Former Yugoslav Republic of','Country','mk',NULL),(131,'Country131','Madagascar','Country','mg',NULL),(132,'Country132','Malawi','Country','mw',NULL),(133,'Country133','Malaysia','Country','my',NULL),(134,'Country134','Maldives','Country','mv',NULL),(135,'Country135','Mali','Country','ml',NULL),(136,'Country136','Malta','Country','mt',NULL),(137,'Country137','Marshall Islands','Country','mh',NULL),(138,'Country138','Martinique','Country','mq',NULL),(139,'Country139','Mauritania','Country','mr',NULL),(140,'Country140','Mauritius','Country','mu',NULL),(141,'Country141','Mayotte','Country','yt',NULL),(142,'Country142','Mexico','Country','mx',NULL),(143,'Country143','Micronesia, Federated States of','Country','fm',NULL),(144,'Country144','Moldova, Republic of','Country','md',NULL),(145,'Country145','Monaco','Country','mc',NULL),(146,'Country146','Mongolia','Country','mn',NULL),(147,'Country147','Montenegro','Country','me',NULL),(148,'Country148','Montserrat','Country','ms',NULL),(149,'Country149','Morocco','Country','ma',NULL),(150,'Country150','Mozambique','Country','mz',NULL),(151,'Country151','Myanmar','Country','mm',NULL),(152,'Country152','Namibia','Country','na',NULL),(153,'Country153','Nauru','Country','nr',NULL),(154,'Country154','Nepal','Country','np',NULL),(155,'Country155','Netherlands','Country','nl',NULL),(156,'Country156','Netherlands Antilles','Country','an',NULL),(157,'Country157','New Caledonia','Country','nc',NULL),(158,'Country158','New Zealand','Country','nz',NULL),(159,'Country159','Nicaragua','Country','ni',NULL),(160,'Country160','Niger','Country','ne',NULL),(161,'Country161','Nigeria','Country','ng',NULL),(162,'Country162','Niue','Country','nu',NULL),(163,'Country163','Norfolk Island','Country','nf',NULL),(164,'Country164','Northern Mariana Islands','Country','mp',NULL),(165,'Country165','Norway','Country','no',NULL),(166,'Country166','Oman','Country','om',NULL),(167,'Country167','Pakistan','Country','pk',NULL),(168,'Country168','Palau','Country','pw',NULL),(169,'Country169','Palestinian Territory, Occuped','Country','ps',NULL),(170,'Country170','Panama','Country','pa',NULL),(171,'Country171','Papua New Guinea','Country','pg',NULL),(172,'Country172','Paraguay','Country','py',NULL),(173,'Country173','Peru','Country','pe',NULL),(174,'Country174','Philippines','Country','ph',NULL),(175,'Country175','Pitcairn','Country','pn',NULL),(176,'Country176','Poland','Country','pl',NULL),(177,'Country177','Portugal','Country','pt',NULL),(178,'Country178','Puerto Rico','Country','pr',NULL),(179,'Country179','Qatar','Country','qa',NULL),(180,'Country180','Reunion','Country','re',NULL),(181,'Country181','Romania','Country','ro',NULL),(182,'Country182','Russian Federation','Country','ru',NULL),(183,'Country183','Rwanda','Country','rw',NULL),(184,'Country184','Saint Barthelemy','Country','bl',NULL),(185,'Country185','Saint Helena,Ascension and Tristan da Cunha','Country','sh',NULL),(186,'Country186','Saint Kitts and Nevis','Country','kn',NULL),(187,'Country187','Saint Lucia','Country','lc',NULL),(188,'Country188','Saint Martin','Country','mf',NULL),(189,'Country189','Saint Pierre and Miquelon','Country','pm',NULL),(190,'Country190','Saint Vincent and the Grenadines','Country','vc',NULL),(191,'Country191','Samoa','Country','ws',NULL),(192,'Country192','San Marino','Country','sm',NULL),(193,'Country193','Sao Tome and Principe','Country','st',NULL),(194,'Country194','Saudi Arabia','Country','sa',NULL),(195,'Country195','Senegal','Country','sn',NULL),(196,'Country196','Serbia','Country','rs',NULL),(197,'Country197','Seychelles','Country','sc',NULL),(198,'Country198','Sierra Leone','Country','sl',NULL),(199,'Country199','Singapore','Country','sg',NULL),(200,'Country200','Slovakia','Country','sk',NULL),(201,'Country201','Slovenia','Country','si',NULL),(202,'Country202','Solomon Islands','Country','sb',NULL),(203,'Country203','Somalia','Country','so',NULL),(204,'Country204','South Africa','Country','za',NULL),(205,'Country205','South Georgia and the South Sandwich Islands','Country','gs',NULL),(206,'Country206','Spain','Country','es',NULL),(207,'Country207','Sri Lanka','Country','lk',NULL),(208,'Country208','Sudan','Country','sd',NULL),(209,'Country209','Suriname','Country','sr',NULL),(210,'Country210','Svalbard and Jan Mayen','Country','sj',NULL),(211,'Country211','Swaziland','Country','sz',NULL),(212,'Country212','Sweden','Country','se',NULL),(213,'Country213','Switzerland','Country','ch',NULL),(214,'Country214','Syrian Arab Republic','Country','sy',NULL),(215,'Country215','Taiwan, Province of China','Country','tw',NULL),(216,'Country216','Tajikistan','Country','tj',NULL),(217,'Country217','Tanzania, United Republic of','Country','tz',NULL),(218,'Country218','Thailand','Country','th',NULL),(219,'Country219','Timor-Leste','Country','tl',NULL),(220,'Country220','Togo','Country','tg',NULL),(221,'Country221','Tokelau','Country','tk',NULL),(222,'Country222','Tonga','Country','to',NULL),(223,'Country223','Trinidad and Tobago','Country','tt',NULL),(224,'Country224','Tunisia','Country','tn',NULL),(225,'Country225','Turkey','Country','tr',NULL),(226,'Country226','Turkmenistan','Country','tm',NULL),(227,'Country227','Turks and Caicos Islands','Country','tc',NULL),(228,'Country228','Tuvalu','Country','tv',NULL),(229,'Country229','Uganda','Country','ug',NULL),(230,'Country230','Ukraine','Country','ua',NULL),(231,'Country231','United Arab Emirates','Country','ae',NULL),(232,'Country232','United Kingdom','Country','gb',NULL),(233,'Country233','United States','Country','us',NULL),(234,'Country234','United States Minor Outlying Islands','Country','um',NULL),(235,'Country235','Uruguay','Country','uy',NULL),(236,'Country236','Uzbekistan','Country','uz',NULL),(237,'Country237','Vanuatu','Country','vu',NULL),(238,'Country238','Venezuela, Bolivarian republic of','Country','ve',NULL),(239,'Country239','Vietnam','Country','vn',NULL),(240,'Country240','Virgin Islands, British','Country','vg',NULL),(241,'Country241','Virgin Islands, U.S.','Country','vi',NULL),(242,'Country242','Wallis and Futuna','Country','wf',NULL),(243,'Country243','Western Sahara','Country','eh',NULL),(244,'Country244','Yemen','Country','ye',NULL),(245,'Country245','Zambia','Country','zm',NULL),(246,'Country246','Zimbabwe','Country','zw',NULL),(247,'N/A','Not Applicable','state','',NULL),(248,'anambra','Anambra','state','',NULL),(249,'enugu','Enugu','state','',NULL),(250,'akwaibom','Akwa Ibom','state','',NULL),(251,'adamawa','Adamawa','state','',NULL),(252,'abia','Abia','state','',NULL),(253,'bauchi','Bauchi','state','',NULL),(254,'bayelsa','Bayelsa','state','',NULL),(255,'benue','Benue','state','',NULL),(256,'borno','Borno','state','',NULL),(257,'crossriver','Cross River','state','',NULL),(258,'delta','Delta','state','',NULL),(259,'ebonyi','Ebonyi','state','',NULL),(260,'edo','Edo','state','',NULL),(261,'ekiti','Ekiti','state','',NULL),(262,'gombe','Gombe','state','',NULL),(263,'imo','Imo','state','',NULL),(264,'jigawa','Jigawa','state','',NULL),(265,'kaduna','Kaduna','state','',NULL),(266,'kano','Kano','state','',NULL),(267,'katsina','Katsina','state','',NULL),(268,'kebbi','Kebbi','state','',NULL),(269,'kogi','Kogi','state','',NULL),(270,'kwara','Kwara','state','',NULL),(271,'lagos','Lagos','state','',NULL),(272,'nasarawa','Nasarawa','state','',NULL),(273,'niger','Niger','state','',NULL),(274,'ogun','Ogun','state','',NULL),(275,'ondo','Ondo','state','',NULL),(276,'osun','Osun','state','',NULL),(277,'oyo','Oyo','state','',NULL),(278,'plateau','Plateau','state','',NULL),(279,'rivers','Rivers','state','',NULL),(280,'sokoto','Sokoto','state','',NULL),(281,'taraba','Taraba','state','',NULL),(282,'yobe','Yobe','state','',NULL),(283,'zamfara','Zamfara','state','',NULL),(284,'active','Active','accountstatus','',NULL),(285,'locked','Locked','accountstatus','',NULL),(286,'inactive','Inactive','accountstatus','',NULL),(287,'pending','Pending','approvalstatus','',NULL),(288,'approved','Approved','approvalstatus','',NULL),(289,'rejected','Rejected','approvalstatus','',NULL),(290,'forSaleOrRent','For Sale or Rent','propertyStatus','',NULL),(291,'outOfOrderProperty','Out of Order','propertyStatus','',NULL),(292,'retiredProperty','Sealed off','propertyStatus','',NULL),(293,'naira','Naira','currency','',NULL),(294,'dollar','Dollar','currency','',NULL),(295,'pound','Pounds','currency','',NULL),(296,'passport','Passport','idDocument','',NULL),(297,'nationalId','National ID Card','idDocument','',NULL),(298,'driverLicense','Driver\'s License','idDocument','',NULL),(299,'salut1','Mr.','salutation','',NULL),(300,'salut2','Miss','salutation','',NULL),(301,'salut3','Mrs.','salutation','',NULL),(302,'salut4','Dr.','salutation','',NULL),(303,'salut5','Rev.','salutation','',NULL),(304,'salut6','Prof.','salutation','',NULL),(305,'salut7','Chief','salutation','',NULL),(306,'salut8','Mallam','salutation','',NULL),(307,'salut9','Alhaji','salutation','',NULL),(308,'salut10','Alhaja','salutation','',NULL),(309,'salut11','Barr.','salutation','',NULL),(310,'salut12','Prophet','salutation','',NULL),(311,'salut13','Pastor','salutation','',NULL),(312,'salut14','Maj.','salutation','',NULL),(313,'salut15','Capt.','salutation','',NULL),(314,'salut16','Sgt.','salutation','',NULL),(315,'salut17','Gen.','salutation','',NULL),(316,'salut18','WG. CDR.','salutation','',NULL),(317,'salut19','Lt.','salutation','',NULL),(318,'salut20','B. Gen.','salutation','',NULL),(319,'salut21','Grp. Capt.','salutation','',NULL),(320,'salut22','Lt. Col.','salutation','',NULL),(321,'salut23','Hon.','salutation','',NULL),(322,'salut24','Justice','salutation','',NULL),(323,'salut25','Air CDR','salutation','',NULL),(324,'salut26','Madam','salutation','',NULL),(325,'salut27','Hajiya','salutation','',NULL),(326,'salut28','Naval Capt.','salutation','',NULL),(327,'salut29','Flt. Lt.','salutation','',NULL),(328,'salut30','Sqn. Ldr.','salutation','',NULL),(329,'salut32','Sgt. Maj.','salutation','',NULL),(330,'salut31','Col.','salutation','',NULL),(331,'salut33','Air Vice Marshal','salutation','',NULL),(332,'salut34','CDR.','salutation','',NULL),(333,'salut35','Deacon','salutation','',NULL),(334,'salut36','Prince','salutation','',NULL),(335,'salut37','Lt. Gen.','salutation','',NULL),(336,'salut38','Insp.','salutation','',NULL),(337,'salut39','SP.','salutation','',NULL),(338,'salut40','Engr.','salutation','',NULL),(339,'salut41','Commodore','salutation','',NULL),(340,'salut42','Maj. Gen.','salutation','',NULL),(341,'salut43','Vice Admiral','salutation','',NULL),(342,'salut44','Ambassedor','salutation','',NULL),(343,'salut45','Ass. Prof.','salutation','',NULL),(344,'salut46','Sen.','salutation','',NULL),(345,'salut47','FG. Officer','salutation','',NULL),(346,'salut48','Rev. Dr.','salutation','',NULL),(347,'salut49','Arch.','salutation','',NULL),(348,'salut50','Bishop','salutation','',NULL),(349,'salut51','Rt. Rev.','salutation','',NULL),(350,'salut52','Miskoom','salutation','',NULL),(351,'salut53','Nde','salutation','',NULL),(352,'salut54','Warrant Officer','salutation','',NULL),(353,'salut55','ASP','salutation','',NULL),(354,'salut56','Chief (Mrs.)','salutation','',NULL),(355,'salut57','Rev. (Mrs.)','salutation','',NULL),(356,'salut58','Sheikh','salutation','',NULL),(357,'salut59','Da','salutation','',NULL),(358,'salut60','Lt. Cdr.','salutation','',NULL),(359,'male','Male','gender','',NULL),(360,'female','Female','gender','',NULL),(361,'paymentstatus1','Not Paid','paymentstatus','',NULL),(362,'paymentstatus2','Paid','paymentstatus','',NULL),(363,'requeststatus1','Not Approved','requeststatus','',NULL),(364,'requeststatus2','Pending','requeststatus','',NULL),(365,'requeststatus2','Approved','requeststatus','',NULL),(366,'maritalstatus1','Single','maritalstatus','',NULL),(367,'maritalstatus2','Married','maritalstatus','',NULL),(368,'maritalstatus3','Divorced','maritalstatus','',NULL),(369,'maritalstatus4','Widowed','maritalstatus','',NULL),(370,'paymentfrequency1','Monthly','paymentfrequency','',NULL),(371,'paymentfrequency2','Yearly','paymentfrequency','',NULL),(372,'paymentfrequency3','None','paymentfrequency','',NULL),(373,'religion1','Christianity','religion','',NULL),(374,'religion2','Islam','religion','',NULL),(375,'religion3','Hinduism','religion','',NULL),(376,'religion4','Buddhism','religion','',NULL),(377,'religion5','Folk religion','religion','',NULL),(378,'religion6','Not Applicable','religion','',NULL),(379,'persontype1','Buyer','persontype','',NULL),(380,'persontype2','Seller','persontype','',NULL),(381,'persontype3','Property Manager','persontype','',NULL),(382,'persontype4','Staff','persontype','',NULL),(383,'status1','Active','status','',NULL),(384,'status2','Retired','status','',NULL),(385,'propertytype1','Lease','propertytype','',NULL),(386,'propertytype2','New','propertytype','',NULL),(387,'activeProperty','Good Condition','propertyStatus',NULL,NULL),(388,'featuredProperty','Featured Property','propertyStatus',NULL,NULL);
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `feature_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `FK_Feature_Property` (`property_id`) USING BTREE,
  CONSTRAINT `FK_Feature_Property` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8_bin NOT NULL,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `owner_unique_id` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'52af44b7-8de7-45e1-a631-a96d67829c77',NULL,'jpg','Desert.jpg',NULL,'10DVIUXS'),(2,'7d697dd7-7e49-452d-9539-fd413fa8753f',NULL,'jpg','Penguins.jpg',NULL,'10FSGMWJ'),(3,'74ecfca3-9e14-4831-9b2e-61a5da8ed20e',NULL,'jpg','Tulips.jpg',NULL,'10ORBOAB'),(4,'75e6ac52-9c43-4fc0-bd09-a9d2b8c481af',NULL,'jpg','Tulips.jpg',NULL,'10IDJTLC'),(5,'8b114bcf-2cb8-4500-8d21-901f29fac684',NULL,'jpg','3CE6984300000578-4196454-image-a-3_1486396105907.jpg',NULL,'10UKXXTW'),(6,'ad279191-3a05-4ba7-921a-fe24c9c968f3',NULL,'jpg','4b85a2e1983c9a9603fd19bcd1be2138.jpg',NULL,'10UKXXTW'),(7,'698d09ff-6830-4ba1-9dc7-640f1c29c109',NULL,'jpg','index1.jpg',NULL,'10UKXXTW'),(8,'f6649c99-0315-46a9-900b-2e9df9e77607',NULL,'jpg','designed_by_expanded_gallery2.jpg',NULL,'10IHMKSB'),(9,'a414bed6-3c08-415e-9339-23c03d6500fe',NULL,'jpg','Tinakilly-house-inside.jpg',NULL,'10IHMKSB'),(10,'1d2de846-c911-4a59-96cf-970bfb6c5353',NULL,'jpg','Sarah-Hogan-house-11nov15_pr_b_639x426.jpg',NULL,'10IHMKSB'),(11,'012d2aff-8419-42ed-a513-1f34640364d1',NULL,'jpg','plants-green-interior-design-ideas-31.jpg',NULL,'10QXWWHK'),(12,'e7e487cb-018b-4aa6-a9a9-ab33be75b04d',NULL,'jpg','log-house-10.jpg',NULL,'10QXWWHK'),(13,'195694e8-4d4c-4bba-8a4c-004fd4e9b3ba',NULL,'jpg','4b85a2e1983c9a9603fd19bcd1be2138.jpg',NULL,'10QXWWHK');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `middle_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `religion` int(11) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `person_type` int(11) NOT NULL,
  `birth_date` datetime DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email_address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Person_Address` (`address_id`) USING BTREE,
  CONSTRAINT `FK_Person_Address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (4,'Ayobami','Adewole','',359,366,373,21,379,'1988-05-18 00:00:00','2017-03-14 15:46:00',364,'ayobami@ayobamiadewole.com','08052185012',3);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_id` bigint(20) NOT NULL,
  `description` text CHARACTER SET utf8,
  `property_type` int(11) DEFAULT NULL,
  `property_date` datetime DEFAULT NULL,
  `number_of_rooms` int(11) DEFAULT NULL,
  `area_size` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `per_unit_price` decimal(18,0) DEFAULT NULL,
  `property_status` int(11) DEFAULT NULL,
  `number_of_baths` int(11) DEFAULT NULL,
  `short_description` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `property_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Property_Address` (`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (11,18,'Quintessential South Boston condo at the top of Old Harbor St near picturesque Thomas Park. Deeded deck & backyard create your own private oasis! Hardwood throughout. Walk into upper level featuring 2 bedrooms w/ample built-out closet space, recessed lights & spacious bathroom. Magnificent lower level basks in light & welcomes you with high ceilings & open layout, perfect for entertaining! Airy living rm takes in spectacular views through double glass doors to your very own 200 sf deck & yard for alfresco dining & relaxing. Open floor plan features kitchen w/granite island, stainless appliances, trash compactor, wine fridge. gas fireplace, & crown moldings. French doors lead to 3rd bedroom that lends itself as a guest bd, dining room, playroom or office area. Central Air. NEST thermostat system. Bonus 7 x 12 storage area in basement. Water heater new in 2016. If you\'ve been waiting for the right condo in this charming section of this coveted neighborhood, this is it! Interior just painted!  ',386,'2017-03-13 15:31:00',4,'209',8000000,290,2,'Private deeded back yard and easy parking on wide street. Steps from Thomas park and the beach.','10UKXXTW'),(12,19,'Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive Escala. Attention to detail is evident--artisan troweled walls, hand painted murals and tiles. Resort oasis w/pool, spa and tennis court overlooking hill country views and distant Austin city skyline.',386,'2017-03-13 15:35:00',5,'209',15000000,290,2,'Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive Escala.','10IHMKSB'),(13,20,'BEAUTIFUL AND COMPLETELY REMODELED! New kitchen has many upgraded features including soft close cabinets and drawers, granite counter tops with tile back splashes and stainless steel appliances. Living and Dining Rooms have an open floor plan with vaulted ceilings. The wood burning fireplace has a tile surround that accents the new wood laminate nicely. Both bathrooms have new tile flooring, cabinets with granite counter tops and tile accents, toilets and fixtures. Pool has new Diamond Brite finish and freshly painted pool deck. Fresh landscaping and an outdoor patio/bbq area. Large laundry room with shelving. Other New features include A/C and ducts, carpet, low energy vinyl windows, interior doors, lighting fixtures, fresh interior and exterior paint, ClosetMaid shelving. ',386,'2017-03-13 15:38:00',2,'209',9000000,290,2,'BEAUTIFUL AND COMPLETELY REMODELED! ','10QXWWHK');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_price`
--

DROP TABLE IF EXISTS `property_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `per_unit_price` decimal(18,2) NOT NULL,
  `price_status` int(11) NOT NULL,
  `price_date` datetime NOT NULL,
  `price_end_date` datetime DEFAULT NULL,
  `down_payment` decimal(10,0) DEFAULT NULL,
  `mortgage_term` int(11) DEFAULT NULL,
  `interest_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_price`
--

LOCK TABLES `property_price` WRITE;
/*!40000 ALTER TABLE `property_price` DISABLE KEYS */;
INSERT INTO `property_price` VALUES (11,11,8000000.00,383,'2017-03-13 15:31:00',NULL,NULL,NULL,NULL),(12,12,15000000.00,383,'2017-03-13 15:35:00',NULL,NULL,NULL,NULL),(13,13,9000000.00,383,'2017-03-13 15:38:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `property_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_rating`
--

DROP TABLE IF EXISTS `property_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `rating_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_rating`
--

LOCK TABLES `property_rating` WRITE;
/*!40000 ALTER TABLE `property_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_search`
--

DROP TABLE IF EXISTS `property_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_of_rooms` int(11) DEFAULT NULL,
  `number_of_baths` int(11) DEFAULT NULL,
  `price_range_start` decimal(10,0) DEFAULT NULL,
  `price_range_end` decimal(10,0) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `search_date` datetime DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `property_number` varchar(45) DEFAULT NULL,
  `is_interest` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_search`
--

LOCK TABLES `property_search` WRITE;
/*!40000 ALTER TABLE `property_search` DISABLE KEYS */;
INSERT INTO `property_search` VALUES (1,NULL,2,NULL,NULL,3,'2017-03-21 13:34:00',NULL,NULL,'YES'),(2,5,2,NULL,NULL,3,'2017-03-21 13:34:00',NULL,NULL,'NO');
/*!40000 ALTER TABLE `property_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_tag`
--

DROP TABLE IF EXISTS `property_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `tag_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_tag`
--

LOCK TABLES `property_tag` WRITE;
/*!40000 ALTER TABLE `property_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_valuation`
--

DROP TABLE IF EXISTS `property_valuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_valuation` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `instructions` varchar(450) DEFAULT NULL,
  `site_area` varchar(45) DEFAULT NULL,
  `zoning` varchar(45) DEFAULT NULL,
  `comments` varchar(450) DEFAULT NULL,
  `terms_of_reference` varchar(1000) DEFAULT NULL,
  `date_of_inspection` datetime DEFAULT NULL,
  `date_of_valuation` datetime DEFAULT NULL,
  `land_value` varchar(45) DEFAULT NULL,
  `improvements` varchar(45) DEFAULT NULL,
  `market_valuation` varchar(250) DEFAULT NULL,
  `registered_proprietor` varchar(150) DEFAULT NULL,
  `land_dimensions` varchar(250) DEFAULT NULL,
  `land_area` varchar(45) DEFAULT NULL,
  `encumberances` varchar(2500) DEFAULT NULL,
  `topography` varchar(250) DEFAULT NULL,
  `services` varchar(250) DEFAULT NULL,
  `environmental_issues` varchar(2500) DEFAULT NULL,
  `location` varchar(2500) DEFAULT NULL,
  `dwelling_description` varchar(450) DEFAULT NULL,
  `construction` varchar(450) DEFAULT NULL,
  `accomodation` varchar(450) DEFAULT NULL,
  `pc_items` varchar(450) DEFAULT NULL,
  `fixtures_features` varchar(450) DEFAULT NULL,
  `other_improvements` varchar(450) DEFAULT NULL,
  `building_areas` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_valuation`
--

LOCK TABLES `property_valuation` WRITE;
/*!40000 ALTER TABLE `property_valuation` DISABLE KEYS */;
/*!40000 ALTER TABLE `property_valuation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) NOT NULL,
  `room_name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `area` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `unique_Id` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_Room_Property` FOREIGN KEY (`id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('0'),('20170215141912'),('20170217221230'),('20170301203425');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `person_id` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Staff_Person` (`person_id`) USING BTREE,
  CONSTRAINT `FK_Staff_Person` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(50) DEFAULT NULL,
  `password` text,
  `created_date` date DEFAULT NULL,
  `salt` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'ayobami@ayobamiadewole.com','$2a$10$3yYWfMKWJ2xgmz7yWPRh4ePZVCwlRYQAjmKV/utNa/qXYnsDhCMbi','2017-03-14','$2a$10$3yYWfMKWJ2xgmz7yWPRh4e');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22 14:30:43
