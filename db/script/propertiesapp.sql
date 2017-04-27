CREATE DATABASE  IF NOT EXISTS `propertiesapp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `propertiesapp`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: propertiesapp
-- ------------------------------------------------------
-- Server version	5.5.18

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (18,'No 1, Babalande, Victoria Island','','Lagos',271,161,'100261','',''),(19,'No 5, Sadiku street, Charity','','Lagos',271,161,'100261','',''),(20,'Ebute meta lane, Yaba','','Lagos',271,161,'100261','',''),(21,'No 19 Sadiku street, Afariogun street, Charity, Oshodi','','Lagos',271,161,'100261',NULL,NULL),(22,'410, Ebute meta lane, Yaba','','Lagos',271,161,'1002612','55',''),(23,'55, Ebute meta lane, Yaba','','Lagos',271,161,'1002612','55',''),(24,'No 19 Sadiku street, Afariogun street, Charity, Oshodi','','Lagos',271,161,'100261',NULL,NULL),(25,'No 89, Dibon Avenue, Banana Island','','Lagos',271,160,'100249','',''),(26,'No 6, Broad Street','','Lagos',271,161,'100201',NULL,NULL),(27,'Road 7, Fijabi street, Ajah','','Lagos',271,161,'100234',NULL,NULL),(28,'Sawyer avenue, Yaba','','Lagos',271,161,'100201',NULL,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advert`
--

DROP TABLE IF EXISTS `advert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `text` text,
  `advert_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `advert_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advert`
--

LOCK TABLES `advert` WRITE;
/*!40000 ALTER TABLE `advert` DISABLE KEYS */;
INSERT INTO `advert` VALUES (1,'Advert 3','<p>test eteses</p>\r\n','2017-03-29 22:55:00',NULL,NULL,3,NULL),(2,'Advert 2','<p>ghghghghghgh</p>\r\n','2017-03-29 23:09:00','2017-03-29 00:00:00','2017-03-29 00:00:00',3,NULL),(3,'Advert 1','<p>ghghghghghgh</p>\r\n','2017-03-29 23:15:00','2017-03-29 00:00:00','2017-03-29 00:00:00',3,NULL),(4,'Get Professional Advice on Landed Properties','<p>Advert rich content goes here</p>\r\n','2017-04-25 21:30:00','2017-04-25 00:00:00','2017-04-25 00:00:00',3,NULL);
/*!40000 ALTER TABLE `advert` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,17,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: dafasfd\nstreet2: \'\'\ncity: sfsdfddfdsf\nstate: \'265\'\ncountry: 15\nzip_code: \'1234\'\nplot_number: \'89\'\nfloor_number: \'89\'\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(2,10,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 17\ndescription: wewerwer\nproperty_type: 385\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-02 21:47:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-02 21:47:00.000000000 Z\nnumber_of_rooms: 9\narea_size: \'56\'\nper_unit_price: 3466\nproperty_status: 290\nnumber_of_baths: 7\nshort_description: ewewre\nproperty_number: 10DVIUXS\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(3,10,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 10\nper_unit_price: !ruby/object:BigDecimal 18:0.3466E4\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-02 21:47:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-02 21:47:00.000000000 Z\nprice_end_date: \ndown_payment: 233545\nmortgage_term: 12\ninterest_rate: 2\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:28'),(4,4,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 75e6ac52-9c43-4fc0-bd09-a9d2b8c481af\nfile_path: \nextension: jpg\ntitle: Tulips.jpg\nsize: \nowner_unique_id: 10DVIUXS\n',1,NULL,'127.0.0.1','0214f753-b88f-4e78-b611-e9e9d5ca6aed','2017-03-02 20:47:29'),(5,18,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 19, Babalande, Victoria Island\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(6,11,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 18\ndescription: \'Quintessential South Boston condo at the top of Old Harbor St near picturesque\n  Thomas Park. Deeded deck & backyard create your own private oasis! Hardwood throughout.\n  Walk into upper level featuring 2 bedrooms w/ample built-out closet space, recessed\n  lights & spacious bathroom. Magnificent lower level basks in light & welcomes you\n  with high ceilings & open layout, perfect for entertaining! Airy living rm takes\n  in spectacular views through double glass doors to your very own 200 sf deck & yard\n  for alfresco dining & relaxing. Open floor plan features kitchen w/granite island,\n  stainless appliances, trash compactor, wine fridge. gas fireplace, & crown moldings.\n  French doors lead to 3rd bedroom that lends itself as a guest bd, dining room, playroom\n  or office area. Central Air. NEST thermostat system. Bonus 7 x 12 storage area in\n  basement. Water heater new in 2016. If you\'\'ve been waiting for the right condo\n  in this charming section of this coveted neighborhood, this is it! Interior just\n  painted!  \'\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:31:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:31:00.000000000 Z\nnumber_of_rooms: 5\narea_size: \'209\'\nper_unit_price: 11000000\nproperty_status: 290\nnumber_of_baths: 3\nshort_description: Private deeded back yard and easy parking on wide street. Steps\n  from Thomas park and the beach.\nproperty_number: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(7,11,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 11\nper_unit_price: !ruby/object:BigDecimal 18:0.11E8\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:31:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:31:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(8,5,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 8b114bcf-2cb8-4500-8d21-901f29fac684\nfile_path: \nextension: jpg\ntitle: 3CE6984300000578-4196454-image-a-3_1486396105907.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(9,6,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: ad279191-3a05-4ba7-921a-fe24c9c968f3\nfile_path: \nextension: jpg\ntitle: 4b85a2e1983c9a9603fd19bcd1be2138.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(10,7,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 698d09ff-6830-4ba1-9dc7-640f1c29c109\nfile_path: \nextension: jpg\ntitle: index1.jpg\nsize: \nowner_unique_id: 10UKXXTW\n',1,NULL,'127.0.0.1','76c38e6b-8b81-4373-b2ff-0aded95cdaa5','2017-03-13 14:31:20'),(11,19,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 5, Sadiku street, Charity\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(12,12,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 19\ndescription: Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive\n  Escala. Attention to detail is evident--artisan troweled walls, hand painted murals\n  and tiles. Resort oasis w/pool, spa and tennis court overlooking hill country views\n  and distant Austin city skyline.\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:35:00.000000000 Z\nnumber_of_rooms: 5\narea_size: \'209\'\nper_unit_price: 15000000\nproperty_status: 290\nnumber_of_baths: 2\nshort_description: Stunning French Country estate built by Pat Heyl on 4.5 Acres in\n  exclusive Escala.\nproperty_number: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(13,12,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 12\nper_unit_price: !ruby/object:BigDecimal 18:0.15E8\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:35:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(14,8,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: f6649c99-0315-46a9-900b-2e9df9e77607\nfile_path: \nextension: jpg\ntitle: designed_by_expanded_gallery2.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(15,9,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: a414bed6-3c08-415e-9339-23c03d6500fe\nfile_path: \nextension: jpg\ntitle: Tinakilly-house-inside.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(16,10,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 1d2de846-c911-4a59-96cf-970bfb6c5353\nfile_path: \nextension: jpg\ntitle: Sarah-Hogan-house-11nov15_pr_b_639x426.jpg\nsize: \nowner_unique_id: 10IHMKSB\n',1,NULL,'127.0.0.1','02c55a68-fe06-4559-ae49-3af440cbd40b','2017-03-13 14:35:13'),(17,20,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: Ebute meta lane, Yaba\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(18,13,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 20\ndescription: \'BEAUTIFUL AND COMPLETELY REMODELED! New kitchen has many upgraded features\n  including soft close cabinets and drawers, granite counter tops with tile back splashes\n  and stainless steel appliances. Living and Dining Rooms have an open floor plan\n  with vaulted ceilings. The wood burning fireplace has a tile surround that accents\n  the new wood laminate nicely. Both bathrooms have new tile flooring, cabinets with\n  granite counter tops and tile accents, toilets and fixtures. Pool has new Diamond\n  Brite finish and freshly painted pool deck. Fresh landscaping and an outdoor patio/bbq\n  area. Large laundry room with shelving. Other New features include A/C and ducts,\n  carpet, low energy vinyl windows, interior doors, lighting fixtures, fresh interior\n  and exterior paint, ClosetMaid shelving. \'\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:38:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:38:00.000000000 Z\nnumber_of_rooms: 2\narea_size: \'209\'\nper_unit_price: 9000000\nproperty_status: 290\nnumber_of_baths: 2\nshort_description: \'BEAUTIFUL AND COMPLETELY REMODELED! \'\nproperty_number: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(19,13,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 13\nper_unit_price: !ruby/object:BigDecimal 18:0.9E7\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-13 15:38:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-13 15:38:00.000000000 Z\nprice_end_date: \ndown_payment: \nmortgage_term: \ninterest_rate: \n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(20,11,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 012d2aff-8419-42ed-a513-1f34640364d1\nfile_path: \nextension: jpg\ntitle: plants-green-interior-design-ideas-31.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(21,12,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: e7e487cb-018b-4aa6-a9a9-ab33be75b04d\nfile_path: \nextension: jpg\ntitle: log-house-10.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(22,13,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 195694e8-4d4c-4bba-8a4c-004fd4e9b3ba\nfile_path: \nextension: jpg\ntitle: 4b85a2e1983c9a9603fd19bcd1be2138.jpg\nsize: \nowner_unique_id: 10QXWWHK\n',1,NULL,'127.0.0.1','a7af04d1-d51a-4d53-852b-99731e677c91','2017-03-13 14:38:10'),(23,3,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: ayobami@ayobamiadewole.com\npassword: \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4ePZVCwlRYQAjmKV/utNa/qXYnsDhCMbi\"\ncreated_date: 2017-03-14\nsalt: \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4e\"\n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(24,21,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 19 Sadiku street, Afariogun street, Charity, Oshodi\nstreet2: \'\'\ncity: Lagos\nstate: \'271\'\ncountry: 161\nzip_code: \'100261\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(25,4,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Ayobami\nlast_name: Adewole\nmiddle_name: \'\'\ngender: 359\nmarital_status: 366\nreligion: 373\naddress_id: 21\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1988-05-18 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1988-05-18 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-14 15:46:00.000000000 Z\n  zone: *1\n  time: 2017-03-14 15:46:00.000000000 Z\nstatus: 364\nemail_address: ayobami@ayobamiadewole.com\nphone_number: \'08052185012\'\nuser_id: 3\n',1,NULL,'127.0.0.1','6b278d2b-7004-4f07-b4c4-41b7899bf0bc','2017-03-14 14:46:11'),(26,1,'PropertySearch',NULL,NULL,NULL,NULL,NULL,'create','---\nnumber_of_rooms: \nnumber_of_baths: 2\nprice_range_start: \nprice_range_end: \nuser_id: 3\nsearch_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-21 13:34:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-21 13:34:00.000000000 Z\naddress_id: \nproperty_number: \nis_interest: \'YES\'\n',1,NULL,'127.0.0.1','74e10f07-78be-4936-81c1-58e572f8d449','2017-03-21 12:34:19'),(27,2,'PropertySearch',NULL,NULL,NULL,NULL,NULL,'create','---\nnumber_of_rooms: 5\nnumber_of_baths: 2\nprice_range_start: \nprice_range_end: \nuser_id: 3\nsearch_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-21 13:34:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-21 13:34:00.000000000 Z\naddress_id: \nproperty_number: \nis_interest: \'NO\'\n',1,NULL,'127.0.0.1','272f1f07-067f-4164-bf92-8fe3eebcde68','2017-03-21 12:34:50'),(28,11,'Property',NULL,NULL,NULL,NULL,NULL,'update','---\nnumber_of_rooms:\n- 5\n- 4\nnumber_of_baths:\n- 3\n- 2\nper_unit_price:\n- 11000000\n- 8000000\n',2,NULL,'127.0.0.1','8aab7841-ee20-4e1c-95d1-de1357383bbe','2017-03-21 15:51:43'),(29,11,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'update','---\nper_unit_price:\n- !ruby/object:BigDecimal 18:0.11E8\n- !ruby/object:BigDecimal 18:0.8E7\n',2,NULL,'127.0.0.1','8aab7841-ee20-4e1c-95d1-de1357383bbe','2017-03-21 15:51:43'),(30,1,'PropertyEvaluation',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 11\ninstructions: \"This valuation has been prepared in response to a instruction dated\n  18th March 2017, from:\\r\\nValuation Exchange and RP Domestic Hub - Long Form.\"\nsite_area: 405m²\nzoning: Character Residential Area\ncomments: High quality dwelling in a popular inner city location.\nterms_of_reference: \'\'\ndate_of_inspection: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-26 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-26 00:00:00.000000000 Z\ndate_of_valuation: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-26 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-26 00:00:00.000000000 Z\nland_value: \'500000\'\nimprovements: \'\'\nmarket_valuation: \'1000000\'\nregistered_proprietor: ABCDEF Pty Ltd\nland_dimensions: Regular in shape, 10m frontage x 40.5 metre depth approx\nland_area: Approximately 405m²\nencumberances: \"The subject Title was not made available and not searched.\\r\\nThis\n  valuation is therefore made subject to the land and Title\\r\\nbeing free of any restrictive\n  encumbrances, covenants,\\r\\neasements or other planning restrictions which might\n  otherwise\\r\\ndetrimentally affect the value of the land, and secondly that\\r\\nthe\n  improvements are correctly located.\"\ntopography: \"The subject site is regular in shape. It is situated above road height\n  and has a steep slope that falls from\\r\\nthe rear boundary to the road frontage.\n  The rear section of the land with the pool has been levelled.\"\nservices: \'The following services are connected to the property: Mains water, sewerage,\n  gas, telephone and electricity\'\nenvironmental_issues: \'\'\nlocation: Paddington is an inner city suburb, some 4km north west of the Brisbane\n  CBD. Local shops and schools are situated within 500 metres. Bus services are close\n  by.\ndwelling_description: \"Currently improving the land is a fully refurbished and extended\n  part four level timber dwelling erected\\r\\non a 405m2 allotment. The dwelling has\n  high quality fixtures and fittings and an in-ground pool at the rear\"\nconstruction: \'\'\naccomodation: \npc_items: \'\'\nfixtures_features: \nother_improvements: \'\'\nbuilding_areas: \'\'\n',1,NULL,'127.0.0.1','652cd0aa-fffd-41f7-8a7b-801a48dd4d44','2017-03-26 14:21:25'),(31,1,'Contact',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: fffff\nfirst_name: rewr@dsfdf.gh\nemail_address: rewr@dsfdf.gh\nmessage: dddddddddddddddddddddddd\nmessage_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-26 22:43:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-26 22:43:00.000000000 Z\n',1,NULL,'127.0.0.1','23d5aefd-276a-407a-aacb-9c385262e8ab','2017-03-26 21:43:27'),(32,1,'News',NULL,NULL,NULL,NULL,NULL,'create','---\ntext: \"<p>sdffsadsafdsd</p>\\r\\n\"\nnews_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 20:12:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 20:12:00.000000000 Z\nexpiry_date: \nuser_id: 3\ntitle: test\n',1,NULL,'127.0.0.1','7d358bac-a298-452a-8676-3a0dbfa856b4','2017-03-29 19:12:28'),(33,1,'News',NULL,NULL,NULL,NULL,NULL,'destroy','---\ntext: \"<p>sdffsadsafdsd</p>\\r\\n\"\nnews_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 20:12:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 20:12:00.000000000 Z\nexpiry_date: \nuser_id: 3\ntitle: test\n',2,NULL,'127.0.0.1','3d37fe27-54fd-440c-950e-0d4d4964c843','2017-03-29 19:16:35'),(34,2,'News',NULL,NULL,NULL,NULL,NULL,'create','---\ntext: \"<p>dsfdsdf dsfdsdfsdfdsdf dsdfsd</p>\\r\\n\"\nnews_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 20:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 20:35:00.000000000 Z\nexpiry_date: \nuser_id: 3\ntitle: test\n',1,NULL,'127.0.0.1','5321c5eb-c339-4a8b-823c-145e8c6b2f5c','2017-03-29 19:35:26'),(35,2,'News',NULL,NULL,NULL,NULL,NULL,'update','---\ntitle:\n- test\n- test rfutf\ntext:\n- \"<p>dsfdsdf dsfdsdfsdfdsdf dsdfsd</p>\\r\\n\"\n- \"<p>dsfdsdf dsfdsdfsdfdsdf dsdfsd fsdfgdsgfdgf</p>\\r\\n\"\n',2,NULL,'127.0.0.1','af9e1942-f5dd-428e-aa8e-f39cece26352','2017-03-29 19:58:27'),(36,1,'Advert',NULL,NULL,NULL,NULL,NULL,'create','---\ntitle: test\ntext: \"<p>test eteses</p>\\r\\n\"\nadvert_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 22:55:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 22:55:00.000000000 Z\nstart_date: \nend_date: \nuser_id: 3\nadvert_number: \n',1,NULL,'127.0.0.1','3e3f8d05-cb16-4dcf-a5d9-d9950245b56a','2017-03-29 21:55:52'),(37,2,'Advert',NULL,NULL,NULL,NULL,NULL,'create','---\ntitle: ffhhghghhgg\ntext: \"<p>ghghghghghgh</p>\\r\\n\"\nadvert_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 23:09:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 23:09:00.000000000 Z\nstart_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-29 00:00:00.000000000 Z\nend_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-29 00:00:00.000000000 Z\nuser_id: 3\nadvert_number: \n',1,NULL,'127.0.0.1','83958d70-aa18-4282-8666-bf2a7919314a','2017-03-29 22:09:42'),(38,3,'Advert',NULL,NULL,NULL,NULL,NULL,'create','---\ntitle: ffhhghghhgg\ntext: \"<p>ghghghghghgh</p>\\r\\n\"\nadvert_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 23:15:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-29 23:15:00.000000000 Z\nstart_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-29 00:00:00.000000000 Z\nend_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-29 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-29 00:00:00.000000000 Z\nuser_id: 3\nadvert_number: \n',1,NULL,'127.0.0.1','3e32609f-0641-4151-953d-ac3f34b5131f','2017-03-29 22:15:52'),(39,1,'Mortgage',NULL,NULL,NULL,NULL,NULL,'create','---\ncustomer_number1: \'738494\'\ncustomer_number2: \'\'\ncustomer_number3: \'\'\nhouse_hold_income: 5636534653\nhouse_hold_debt: \nproperty_number: 10QXWWHK\nhome_value: 3131234143\ninterest_rate: 10\nloan_amount: \nloan_term: 40\nstart_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-08 00:00:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-08 00:00:00.000000000 Z\nproperty_tax: 5\npmi: 45\nhome_ins: 2542542\nmonthly_hoa: 43245\nmortgage_number: MJEHJMY\n',1,NULL,'127.0.0.1','f8708088-359f-4a3d-9209-3fcc762f97f2','2017-04-08 22:11:21'),(40,13,'Property',NULL,NULL,NULL,NULL,NULL,'update','---\nproperty_status:\n- 290\n- 390\n',2,NULL,'127.0.0.1','f8708088-359f-4a3d-9209-3fcc762f97f2','2017-04-08 22:11:21'),(41,22,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: 55, Ebute meta lane, Yaba\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'1002612\'\nplot_number: \'55\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','3ed8356e-9157-4864-8a20-8e623fbb6282','2017-04-09 16:43:37'),(42,23,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: 55, Ebute meta lane, Yaba\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'1002612\'\nplot_number: \'55\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:35'),(43,14,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 23\ndescription: \'CUSTOM ESTATE WITH AMAZING TROPICAL OASIS BACKYARD AND STUNNING CITY\n  LIGHTS VIEWS! This sprawling estate boasts a 52,272 sq. ft. lot on a beautiful Cul-De-Sac\n  street. The stunning water features and bridge make for a great first impression\n  as you walk up to the front entrance. The new upgraded home opens onto the formal\n  living room and dining room plus a first floor office with a open concept perfect\n  for entertaining. Six bedrooms plus a bonus/game room, office, detached one bedroom\n  guest house w/ gated RV parking as well as a 12 foot RV garage & pool complete the\n  package and provide the perfect setting to entertain and live in style. The lot\n  fits 10 cars easily if not more behind the electric operated RV gate. Don\'\'t miss\n  the huge gourmet kitchen w/ built-ins, island breakfast bar, granite counter tops\n  & stone backsplash or the main floor bedroom. Breathtaking views from almost every\n  room. The parklike oasis backyard was designed for further enjoyment with an oversized\n  tropical pebble-tech heated pool and spa, a rock waterslide, above-ground fire pit,\n  BBQ island area, plantable hillside for fruit trees or vineyard, concrete walking\n  trail around rear yard perfect for daily exercise walks in the comfort of your own\n  backyard. Plenty of room to spread out and relax in style.  \'\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-09 17:44:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-09 17:44:00.000000000 Z\nnumber_of_rooms: 5\narea_size: \'2500\'\nper_unit_price: 8000000\nproperty_status: 290\nnumber_of_baths: 3\nshort_description: CUSTOM ESTATE WITH AMAZING TROPICAL OASIS BACKYARD AND STUNNING\n  CITY LIGHTS VIEWS! This sprawling estate boasts a 52,272 sq. ft. lot on a beautiful\n  Cul-De-Sac street. The stunning water features and bridge make for a great first\n  impression as you walk up to the front entrance\nproperty_number: 10IOXNEK\ncustomer_number: \n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:36'),(44,14,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 14\nper_unit_price: !ruby/object:BigDecimal 18:0.8E7\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-09 17:44:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-09 17:44:00.000000000 Z\nprice_end_date: \ndown_payment: 1000000\nmortgage_term: 7\ninterest_rate: 5\n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:36'),(45,14,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 233b2f7a-3585-4699-88e8-f503086dc123\nfile_path: \nextension: jpg\ntitle: external-picture.jpg\nsize: \nowner_unique_id: 10IOXNEK\n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:36'),(46,15,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 3a9e4de4-fb97-4def-b43c-18ff08348b7c\nfile_path: \nextension: jpg\ntitle: interior-1.jpg\nsize: \nowner_unique_id: 10IOXNEK\n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:36'),(47,16,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 4128319a-8edc-43dc-8082-128fbfd167cb\nfile_path: \nextension: jpg\ntitle: interior-2.jpg\nsize: \nowner_unique_id: 10IOXNEK\n',1,NULL,'127.0.0.1','cd7fd85a-4a87-4038-af34-e5a46c51a907','2017-04-09 16:44:36'),(48,1,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\n',1,NULL,'127.0.0.1','3c29afa8-c0bb-415e-b445-19b451a57b6f','2017-04-10 10:33:42'),(49,2,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 1e6f585f-d6bc-48fc-a60e-eda9cebe5ad9\nstatus: idle\n',1,NULL,'127.0.0.1','aee6b353-08c7-4fd8-9c63-4c0d78f5ee9a','2017-04-10 14:12:01'),(50,2,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- idle\n- busy\n',2,NULL,'127.0.0.1','a13fe678-f831-4712-803d-02ced0de8bc0','2017-04-10 14:12:31'),(51,3,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: cf8ee742-139a-4f90-baba-a7729ce7b0ce\nstatus: idle\n',1,NULL,'127.0.0.1','28174cbb-bb36-4b23-bc34-4d340a03e256','2017-04-14 15:37:55'),(52,3,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- idle\n- busy\n',2,NULL,'127.0.0.1','bcbc1765-8b47-4c8f-98ff-cd5a17e72465','2017-04-14 17:18:00'),(53,1,'ChatRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: aaaaaaa@aa.com\nfull_name: Ayobami\nuser_id: \nchat_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-15 17:35:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-15 17:35:00.000000000 Z\nchat_id: 3c7d851b-a7aa-4d67-a1eb-9bf0fd5b844b\n',1,NULL,'127.0.0.1','f8f7dd36-5ff3-4a4d-99ee-f2ca282db16c','2017-04-15 16:35:00'),(54,2,'ChatRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: aa@aa.uk\nfull_name: aaaaaaaa\nuser_id: \nchat_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-15 21:27:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-15 21:27:00.000000000 Z\nchat_id: 81509164-3122-498b-83e3-448b80ef7c6a\nagent_id: \n',1,NULL,'127.0.0.1','2ccbe710-9f3a-42cf-a8a6-fa4fa1b55247','2017-04-15 20:27:56'),(55,3,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 284\n- 285\npassword:\n- \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4ePZVCwlRYQAjmKV/utNa/qXYnsDhCMbi\"\n- \"$2a$10$5EVB8PNcceWz9vOz0Y6J/uhRTxyxYg46ngUXnW0Y80YVCVvxmk.LK\"\nsalt:\n- \"$2a$10$3yYWfMKWJ2xgmz7yWPRh4e\"\n- \"$2a$10$5EVB8PNcceWz9vOz0Y6J/u\"\n',2,NULL,'127.0.0.1','96d864c0-1846-431e-ad3a-432e2d722611','2017-04-15 20:39:55'),(56,3,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 285\n- 284\npassword:\n- \"$2a$10$5EVB8PNcceWz9vOz0Y6J/uhRTxyxYg46ngUXnW0Y80YVCVvxmk.LK\"\n- \"$2a$10$gs9GkaWCQ7Xwt4eBeyXXVeFc99xMUQfUaPbLWY35Lafa9/7Jlyhm2\"\nsalt:\n- \"$2a$10$5EVB8PNcceWz9vOz0Y6J/u\"\n- \"$2a$10$gs9GkaWCQ7Xwt4eBeyXXVe\"\n',3,NULL,'127.0.0.1','25533bfc-0785-487d-adb5-3aafd2a93240','2017-04-15 20:40:51'),(57,1,'ShowRoom',NULL,NULL,NULL,NULL,NULL,'update','---\ntext_colour:\n- red\n- blue\nno_of_properties:\n- 10\n- 20\n',1,NULL,'127.0.0.1','482a6ad7-d54a-4c0a-b4b4-b200b2295aa0','2017-04-16 08:28:53'),(58,4,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: ayobami.adewole@gmail.com\npassword: \"$2a$10$x5aQK68Fw/AQu4hReUxOLutA72b24vpr2DpPy2gdWgHQmqVCEFS3q\"\ncreated_date: 2017-04-18\nsalt: \"$2a$10$x5aQK68Fw/AQu4hReUxOLu\"\nrole: user\nstatus: 284\n',1,NULL,'127.0.0.1','3f2d607d-4deb-419e-8a53-fdaa4e33b6df','2017-04-18 15:09:26'),(59,24,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 19 Sadiku street, Afariogun street, Charity, Oshodi\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'100261\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','3f2d607d-4deb-419e-8a53-fdaa4e33b6df','2017-04-18 15:09:26'),(60,5,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Sawyer\nlast_name: Dekunl\nmiddle_name: \'\'\ngender: 360\nmarital_status: 366\nreligion: 376\naddress_id: 24\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1990-04-14 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1990-04-14 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-18 16:09:00.000000000 Z\n  zone: *1\n  time: 2017-04-18 16:09:00.000000000 Z\nstatus: 364\nemail_address: ayobami.adewole@gmail.com\nphone_number: \'08052185012\'\nuser_id: 4\nperson_number: \n',1,NULL,'127.0.0.1','3f2d607d-4deb-419e-8a53-fdaa4e33b6df','2017-04-18 15:09:26'),(61,4,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 139bd20d-e3f0-4ce8-8a9a-a1997eb2217c\nstatus: idle\n',1,NULL,'127.0.0.1','1ddb432b-c92c-429e-9677-81647f497a13','2017-04-18 15:42:40'),(62,25,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 89, Dibon Avenue, Banana Island\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 160\nzip_code: \'100249\'\nplot_number: \'\'\nfloor_number: \'\'\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(63,15,'Property',NULL,NULL,NULL,NULL,NULL,'create','---\naddress_id: 25\ndescription: ew hardwood floors, bed room/office with an attached full bath downstairs.\n  Very well taken care with good back yard. Huge kitchen with granite island and a\n  new dishwasher. Close to Windward and easy access to 400 and new Brandy Wine elementary,\n  DeSana middle and soon to start new high school. Lawn and trash are taken care by\n  HOA. Very good amenities with large pool with mushroom and slide, four tennis courts\n  and huge play area for kids and a club house.\nproperty_type: 386\nproperty_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-18 19:13:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-18 19:13:00.000000000 Z\nnumber_of_rooms: 7\narea_size: \'\'\nper_unit_price: 13000000\nproperty_status: 290\nnumber_of_baths: 4\nshort_description: Impeccably maintained 6BR / 4.5BA home in popular Hanover Place\n  - great amenities, top schools, & convenient location. HOA includes front/back yard\n  care, swim & tennis, clubhouse access & trash pickup. You\'ll love the curb appeal\n  w/professional landscaping, spacious yard & patio. Inside you\'ll find a 2-story\n  foyer, beautiful hardwood floors & gourmet kitchen. Huge master suite w/trey ceilings\n  & walk-in closet.\nproperty_number: 10PXRGKM\ncustomer_number: \'738495\'\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(64,15,'PropertyPrice',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 15\nper_unit_price: !ruby/object:BigDecimal 18:0.13E8\nprice_status: 383\nprice_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-18 19:13:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-18 19:13:00.000000000 Z\nprice_end_date: \ndown_payment: 1000000\nmortgage_term: 11\ninterest_rate: 2\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(65,17,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 7d122ef3-9cc1-45a3-819b-02c24818411c\nfile_path: \nextension: jpg\ntitle: AHC_-_16_-_5.2mill.jpg\nsize: \nowner_unique_id: 10PXRGKM\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(66,18,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 65695bc3-a692-4237-8cf5-45dcd2715847\nfile_path: \nextension: jpg\ntitle: purewhite09.jpg\nsize: \nowner_unique_id: 10PXRGKM\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(67,19,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 2561a373-8a26-4bc2-8092-77f41028025b\nfile_path: \nextension: jpg\ntitle: purewhite17.jpg\nsize: \nowner_unique_id: 10PXRGKM\n',1,NULL,'127.0.0.1','fda52c44-54be-4ff1-af46-93cd770b7f64','2017-04-18 18:13:23'),(68,5,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 23747c36-27de-41cc-b8c8-f0f99093d03e\nstatus: idle\n',1,NULL,'127.0.0.1','6140f0a2-9c31-486c-a231-7f1414b83307','2017-04-19 13:01:13'),(69,2,'PropertyEvaluation',NULL,NULL,NULL,NULL,NULL,'create','---\nproperty_id: 15\ninstructions: \"This valuation has been prepared in response to a instruction dated\n  18th March 2017, from:\\r\\n Valuation Exchange and RP Domestic Hub - Long Form.\"\nsite_area: 405m²\nzoning: Character Residential Area\ncomments: \"This valuation has been prepared in response to a instruction dated 18th\n  March 2017, from:\\r\\n Valuation Exchange and RP Domestic Hub - Long Form.\"\nterms_of_reference: \'\'\ndate_of_inspection: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-19 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-03-19 00:00:00.000000000 Z\ndate_of_valuation: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-03-19 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-03-19 00:00:00.000000000 Z\nland_value: \'500000\'\nimprovements: \'\'\nmarket_valuation: \'1000000\'\nregistered_proprietor: ABCDEF Pty Ltd\nland_dimensions: Regular in shape, 10m frontage x 40.5 metre depth approx\nland_area: Approximately 405m²\nencumberances: \"The subject Title was not made available and not searched.\\r\\n This\n  valuation is therefore made subject to the land and Title\\r\\n being free of any\n  restrictive encumbrances, covenants,\\r\\n easements or other planning restrictions\n  which might otherwise\\r\\n detrimentally affect the value of the land, and secondly\n  that\\r\\n the improvements are correctly located.\"\ntopography: \"The subject site is regular in shape. It is situated above road height\n  and has a steep slope that falls from\\r\\n the rear boundary to the road frontage.\n  The rear section of the land with the pool has been levelled.\"\nservices: \'\'\nenvironmental_issues: \'\'\nlocation: Paddington is an inner city suburb, some 4km north west of the Brisbane\n  CBD. Local shops and schools are situated within 500 metres. Bus services are close\n  by.\ndwelling_description: \"Currently improving the land is a fully refurbished and extended\n  part four level timber dwelling erected\\r\\n on a 405m2 allotment. The dwelling has\n  high quality fixtures and fittings and an in-ground pool at the rear\"\nconstruction: \'\'\naccomodation: \npc_items: \'\'\nfixtures_features: \nother_improvements: \'\'\nbuilding_areas: \'\'\n',1,NULL,'127.0.0.1','3ada088d-854f-49e2-b54e-3867445a9907','2017-04-20 19:20:52'),(70,6,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 423da6e6-6f63-4b2b-a730-6a43371f767a\nstatus: idle\n',1,NULL,'127.0.0.1','6a26c822-f36b-4c10-8982-8182115658e1','2017-04-20 19:31:50'),(71,2,'Mortgage',NULL,NULL,NULL,NULL,NULL,'create','---\ncustomer_number1: \'738495\'\ncustomer_number2: \'\'\ncustomer_number3: \'\'\nhouse_hold_income: 3000000\nhouse_hold_debt: \nproperty_number: 10PXRGKM\nhome_value: 13000000\ninterest_rate: 7\nloan_amount: \nloan_term: 10\nstart_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-20 00:00:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-20 00:00:00.000000000 Z\nproperty_tax: 5\npmi: 45\nhome_ins: 200000\nmonthly_hoa: 5000\nmortgage_number: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:10'),(72,15,'Property',NULL,NULL,NULL,NULL,NULL,'update','---\nproperty_status:\n- 290\n- 390\n',2,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:10'),(73,20,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 9a4a0091-ff52-473b-9dbf-0c607be8a3a4\nfile_path: \nextension: pdf\ntitle: Ayobami_Adewole.pdf\nsize: \nowner_unique_id: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:11'),(74,21,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 66ef3e7c-e52a-4cf7-a2ba-7a424acce1e2\nfile_path: \nextension: txt\ntitle: FCMB_Update.txt\nsize: \nowner_unique_id: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:11'),(75,22,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 0d327ecc-d7fc-46e0-ad1d-4fe8315f2bfc\nfile_path: \nextension: doc\ntitle: Application-Letter-Final.doc\nsize: \nowner_unique_id: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:11'),(76,23,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: ad3d1fd5-0e6f-421f-be09-a35bd7ab2562\nfile_path: \nextension: png\ntitle: Untitled.png\nsize: \nowner_unique_id: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:11'),(77,24,'FileModel',NULL,NULL,NULL,NULL,NULL,'create','---\nfile_name: 6b766159-bb77-469b-86dd-6c00cade5903\nfile_path: \nextension: doc\ntitle: Cover-Letter_Optiver.doc\nsize: \nowner_unique_id: MHECJBF\n',1,NULL,'127.0.0.1','b8345646-b2cf-4c06-9716-fb0b5714127e','2017-04-20 19:46:11'),(78,7,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 4bc1977e-55af-47a8-b9fe-d3336d633230\nstatus: idle\n',1,NULL,'127.0.0.1','64d1d4ad-0c7e-4ed0-8918-68916e4e8466','2017-04-20 19:59:31'),(79,2,'News',NULL,NULL,NULL,NULL,NULL,'update','---\ntitle:\n- test rfutf\n- New built Estate with amazing properties\ntext:\n- \"<p>dsfdsdf dsfdsdfsdfdsdf dsdfsd fsdfgdsgfdgf</p>\\r\\n\"\n- \"<p>New built Estate with amazing properties</p>\\r\\n\"\n',3,NULL,'127.0.0.1','360a4a7d-007e-482c-a939-85f9f824e946','2017-04-20 20:14:31'),(80,3,'News',NULL,NULL,NULL,NULL,NULL,'create','---\ntext: \"<p>New built Estate with amazing properties</p>\\r\\n\"\nnews_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-20 21:22:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-20 21:22:00.000000000 Z\nexpiry_date: \nuser_id: 3\ntitle: New built Estate with amazing properties\n',1,NULL,'127.0.0.1','bc53f6c5-4466-4951-8296-dbe81d5550e8','2017-04-20 20:22:18'),(81,2,'News',NULL,NULL,NULL,NULL,NULL,'update','---\ntitle:\n- New built Estate with amazing properties\n- lLimited Mortgage Offers\n',4,NULL,'127.0.0.1','de53244e-303b-462d-95d0-cef1ce4a1b8f','2017-04-20 20:23:31'),(82,2,'News',NULL,NULL,NULL,NULL,NULL,'update','---\ntitle:\n- lLimited Mortgage Offers\n- Limited Mortgage Offers\n',5,NULL,'127.0.0.1','17f1255c-7b86-40fb-af68-def2897e8d21','2017-04-20 20:23:51'),(83,8,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 645c8f90-fb20-4541-a59f-221c1ba173b4\nstatus: idle\n',1,NULL,'127.0.0.1','695648a2-110a-4543-97ce-4b2fd4622f24','2017-04-23 16:34:12'),(84,4,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 284\n- 285\npassword:\n- \"$2a$10$x5aQK68Fw/AQu4hReUxOLutA72b24vpr2DpPy2gdWgHQmqVCEFS3q\"\n- \"$2a$10$xRMIA/ix2aRDOoUkVm.ZtutgaMJvQfEaA.G5ngozCxOUY5r8UzM5W\"\nsalt:\n- \"$2a$10$x5aQK68Fw/AQu4hReUxOLu\"\n- \"$2a$10$xRMIA/ix2aRDOoUkVm.Ztu\"\n',2,NULL,'127.0.0.1','bf29fae4-5d4e-4e71-8a6f-908fcd593c74','2017-04-23 16:35:07'),(85,4,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 285\n- 284\npassword:\n- \"$2a$10$xRMIA/ix2aRDOoUkVm.ZtutgaMJvQfEaA.G5ngozCxOUY5r8UzM5W\"\n- \"$2a$10$NUjgUrO6dI491YPFzky6AO0QMUZJT0jXJSueIxwJgNHQmKFCgEKf2\"\nsalt:\n- \"$2a$10$xRMIA/ix2aRDOoUkVm.Ztu\"\n- \"$2a$10$NUjgUrO6dI491YPFzky6AO\"\n',3,NULL,'127.0.0.1','72b26a99-a088-4e10-a29a-e7aa022d08d2','2017-04-23 17:32:50'),(86,4,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 284\n- 285\npassword:\n- \"$2a$10$NUjgUrO6dI491YPFzky6AO0QMUZJT0jXJSueIxwJgNHQmKFCgEKf2\"\n- \"$2a$10$7qxDbSJtXpUjp8zFN2FSkOz39jlhp8.0WbJSymV8biij.OvXVVlQW\"\nsalt:\n- \"$2a$10$NUjgUrO6dI491YPFzky6AO\"\n- \"$2a$10$7qxDbSJtXpUjp8zFN2FSkO\"\n',4,NULL,'127.0.0.1','05a80605-5747-4dac-b970-7ca796c0e239','2017-04-23 17:34:18'),(87,4,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 285\n- 284\npassword:\n- \"$2a$10$7qxDbSJtXpUjp8zFN2FSkOz39jlhp8.0WbJSymV8biij.OvXVVlQW\"\n- \"$2a$10$Di8xtJsDnwwvmOdr9pXqeeY.FpL2dxHQ/yn2IRhhnKNSMa4DWnWbi\"\nsalt:\n- \"$2a$10$7qxDbSJtXpUjp8zFN2FSkO\"\n- \"$2a$10$Di8xtJsDnwwvmOdr9pXqee\"\n',5,NULL,'127.0.0.1','c5d1063e-60f0-4149-8ffb-978c8690f022','2017-04-23 19:21:22'),(88,4,'Advert',NULL,NULL,NULL,NULL,NULL,'create','---\ntitle: Get Professional Advice on Landed Properties\ntext: \"<p>Advert rich content goes here</p>\\r\\n\"\nadvert_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-25 21:30:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-25 21:30:00.000000000 Z\nstart_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-25 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-04-25 00:00:00.000000000 Z\nend_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-25 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-04-25 00:00:00.000000000 Z\nuser_id: \nadvert_number: \n',1,NULL,'127.0.0.1','27afe9bc-842d-4667-a01f-89fd984b49fd','2017-04-25 20:30:57'),(89,1,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 7b1807f9-5150-4750-8e08-3024b1b6149c\nstatus: idle\n',2,NULL,'127.0.0.1','5993d9ec-cada-476a-bf2e-359e5e9798da','2017-04-26 13:22:42'),(90,2,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 64349229-7e04-4d9e-8c58-3f6a376982e1\nstatus: idle\n',3,NULL,'127.0.0.1','7b9b2b68-6652-441f-aa98-94f384d89745','2017-04-26 13:52:23'),(91,5,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: oghenemano@gmail.com\npassword: \"$2a$10$C3CnvDM.Z8wNY00iQ3D6A.9Wz1LjGf.zUhquOXEXGB.BMgqiV.GFe\"\ncreated_date: 2017-04-26\nsalt: \"$2a$10$C3CnvDM.Z8wNY00iQ3D6A.\"\nrole: user\nstatus: 284\n',1,NULL,'127.0.0.1','d13fc066-a839-4f31-b8d3-489959317010','2017-04-26 14:34:34'),(92,26,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: No 6, Broad Street\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'100201\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','d13fc066-a839-4f31-b8d3-489959317010','2017-04-26 14:34:34'),(93,6,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Manobua\nlast_name: Oghene\nmiddle_name: M\ngender: 360\nmarital_status: 367\nreligion: 373\naddress_id: 26\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1980-04-26 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1980-04-26 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-26 15:34:00.000000000 Z\n  zone: *1\n  time: 2017-04-26 15:34:00.000000000 Z\nstatus: 364\nemail_address: oghenemano@gmail.com\nphone_number: \'087965555\'\nuser_id: 5\nperson_number: \n',1,NULL,'127.0.0.1','d13fc066-a839-4f31-b8d3-489959317010','2017-04-26 14:34:34'),(94,3,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 0fb90200-474f-4d38-ba39-4a17a4c1bd19\nstatus: idle\n',3,NULL,'127.0.0.1','a2595682-36b3-42d8-8cc1-1fd116e9b294','2017-04-26 14:36:41'),(95,2,'Contact',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Segun\nfirst_name: Adegbite\nemail_address: segun.adegbite@gmail.com\nmessage: I will like to book appointment for the said date, so that we can discuss\n  the property I want to buy\nmessage_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-26 16:56:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-26 16:56:00.000000000 Z\nappointment_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-28 00:00:00.000000000 Z\n  zone: *1\n  time: 2017-04-28 00:00:00.000000000 Z\n',1,NULL,'127.0.0.1','7af9adda-61df-4205-9c1a-76c703f6e8ee','2017-04-26 15:56:15'),(96,4,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 64fbbc9d-ea84-40ef-aab5-345608220ef0\nstatus: idle\n',2,NULL,'127.0.0.1','7880aa01-9418-47df-b8a7-463489b453d5','2017-04-26 15:58:55'),(97,3,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nsalt:\n- \"$2a$10$x5aQK68Fw/AQu4hReUxOLu\"\n- \"$2a$10$uIZai6x.Ke8VKuekMKrTvu\"\npassword:\n- \"$2a$10$x5aQK68Fw/AQu4hReUxOLutA72b24vpr2DpPy2gdWgHQmqVCEFS3q\"\n- \"$2a$10$uIZai6x.Ke8VKuekMKrTvu9e7yU4dcgDjzlLv8.rsBOE2pyNLTDKC\"\n',4,NULL,'127.0.0.1','44e5b9ff-8c0c-47bf-a498-fcb284fa32b0','2017-04-26 15:59:12'),(98,6,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: okonkwochidinmaruth@gmail.com\npassword: \"$2a$10$S7ijKNljOO/NhZLK/aZTl.PNFIozGuUoOoaOgb.bI4O0eJ8/C79Z.\"\ncreated_date: 2017-04-26\nsalt: \"$2a$10$S7ijKNljOO/NhZLK/aZTl.\"\nrole: user\nstatus: 284\n',1,NULL,'127.0.0.1','109ab0b4-f6d6-44b4-8d41-a669addda523','2017-04-26 17:48:23'),(99,27,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: Road 7, Fijabi street, Ajah\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'100234\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','109ab0b4-f6d6-44b4-8d41-a669addda523','2017-04-26 17:48:23'),(100,7,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Okonkwo\nlast_name: Chidinma\nmiddle_name: \'\'\ngender: 359\nmarital_status: 367\nreligion: 374\naddress_id: 27\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1993-11-26 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1993-11-26 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-26 18:48:00.000000000 Z\n  zone: *1\n  time: 2017-04-26 18:48:00.000000000 Z\nstatus: 364\nemail_address: okonkwochidinmaruth@gmail.com\nphone_number: \'07061693457\'\nuser_id: 6\nperson_number: \n',1,NULL,'127.0.0.1','109ab0b4-f6d6-44b4-8d41-a669addda523','2017-04-26 17:48:23'),(101,3,'ChatRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: ayobami@ayobamiadewole.com\nfull_name: Adewole Ayobami\nuser_id: 3\nchat_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-26 20:49:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-26 20:49:00.000000000 Z\nchat_id: 2d970450-ec46-4033-a499-3010d6413c6f\nagent_id: \n',1,NULL,'127.0.0.1','6b971f1a-1662-4b4e-ac5a-547ce3d856f7','2017-04-26 19:49:45'),(102,4,'ChatRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: ayobami@programmer.net\nfull_name: ayobami\nuser_id: \nchat_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 07:27:00.000000000 Z\n  zone: !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-04-27 07:27:00.000000000 Z\nchat_id: 7be04042-b002-494e-b2f7-04307fd2e991\nagent_id: \n',1,NULL,'127.0.0.1','0542b6d0-186a-41b8-93ee-ff5c79f64d7e','2017-04-27 06:27:05'),(103,3,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Julius\nfirst_name: Agwu\nemail_address: juliusagwu@gmail.com\nphone_number: \'08032655522\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 15\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 15:50:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 15:50:00.000000000 Z\n',1,NULL,'127.0.0.1','fccd4a86-b28d-4cce-8304-27072c843c59','2017-04-27 14:50:54'),(104,4,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Julius\nfirst_name: Agwu\nemail_address: juliusagwu@gmail.com\nphone_number: \'08032655522\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 15\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 15:52:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 15:52:00.000000000 Z\n',1,NULL,'127.0.0.1','f5fcd47a-7fac-4394-99e5-762019bd12c6','2017-04-27 14:52:01'),(105,5,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Julius\nfirst_name: Agwu\nemail_address: juliusagwu@gmail.com\nphone_number: \'08032655522\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 15\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 15:52:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 15:52:00.000000000 Z\n',1,NULL,'127.0.0.1','228d347d-42cb-43a7-a6dc-ba66742815c6','2017-04-27 14:52:11'),(106,6,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Julius\nfirst_name: Agwu\nemail_address: juliusagwu@gmail.com\nphone_number: \'08032655522\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 15\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 15:56:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 15:56:00.000000000 Z\n',1,NULL,'127.0.0.1','13e2bcfc-1401-46c7-b0b4-460413eb08cf','2017-04-27 14:56:53'),(107,7,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Julius\nfirst_name: Agwu\nemail_address: juliusagwu@gmail.com\nphone_number: \'08032655522\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2017-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 15\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 15:57:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 15:57:00.000000000 Z\n',1,NULL,'127.0.0.1','b90559ae-29a4-4c5d-8693-606726497692','2017-04-27 14:57:48'),(108,4,'User',NULL,NULL,NULL,NULL,NULL,'update','---\nstatus:\n- 284\n- 285\npassword:\n- \"$2a$10$Di8xtJsDnwwvmOdr9pXqeeY.FpL2dxHQ/yn2IRhhnKNSMa4DWnWbi\"\n- \"$2a$10$cmYYjoRbDK4sb3gP8Troh.LH9wbUj9fTFlyRbohF7ZQvoWSb9S7XK\"\nsalt:\n- \"$2a$10$Di8xtJsDnwwvmOdr9pXqee\"\n- \"$2a$10$cmYYjoRbDK4sb3gP8Troh.\"\n',6,NULL,'127.0.0.1','9c012fb9-e457-40ad-9097-91de85884714','2017-04-27 20:49:37'),(109,8,'PaymentRequest',NULL,NULL,NULL,NULL,NULL,'create','---\nsurname: Ebele\nfirst_name: Chukwudi\nemail_address: ebele@gmail.com\nphone_number: \'0803265552\'\nexpected_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2018-05-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 2018-05-27 00:00:00.000000000 Z\nuser_id: \nproperty_id: 14\ncomment: \ncreate_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 23:12:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 23:12:00.000000000 Z\n',1,NULL,'127.0.0.1','a8ed21bc-4e15-433b-ba21-45af20deade3','2017-04-27 22:12:45'),(110,7,'User',NULL,NULL,NULL,NULL,NULL,'create','---\nemail_address: josephsawyer@yahoo.com\npassword: \"$2a$10$5aN3we48giQ.xCPyJ3HRE.nzuVGhPC39musXYGMa3.5kzGVJLspje\"\ncreated_date: 2017-04-27\nsalt: \"$2a$10$5aN3we48giQ.xCPyJ3HRE.\"\nrole: user\nstatus: 284\n',1,NULL,'127.0.0.1','c128616e-9618-483b-bbed-f0b0866a1d85','2017-04-27 22:31:57'),(111,28,'Address',NULL,NULL,NULL,NULL,NULL,'create','---\nstreet1: Sawyer avenue, Yaba\nstreet2: \'\'\ncity: Lagos\nstate: 271\ncountry: 161\nzip_code: \'100201\'\nplot_number: \nfloor_number: \n',1,NULL,'127.0.0.1','c128616e-9618-483b-bbed-f0b0866a1d85','2017-04-27 22:31:57'),(112,8,'Person',NULL,NULL,NULL,NULL,NULL,'create','---\nfirst_name: Oladele\nlast_name: Joseph\nmiddle_name: \'\'\ngender: 359\nmarital_status: 367\nreligion: 373\naddress_id: 28\nperson_type: 379\nbirth_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 1997-04-27 00:00:00.000000000 Z\n  zone: &1 !ruby/object:ActiveSupport::TimeZone\n    name: Etc/UTC\n  time: 1997-04-27 00:00:00.000000000 Z\nregistration_date: !ruby/object:ActiveSupport::TimeWithZone\n  utc: 2017-04-27 23:31:00.000000000 Z\n  zone: *1\n  time: 2017-04-27 23:31:00.000000000 Z\nstatus: 364\nemail_address: josephsawyer@yahoo.com\nphone_number: \'01235888\'\nuser_id: 7\nperson_number: \n',1,NULL,'127.0.0.1','c128616e-9618-483b-bbed-f0b0866a1d85','2017-04-27 22:31:57'),(113,5,'LoggedInAgent',NULL,NULL,NULL,NULL,NULL,'create','---\nuser_id: 3\nchat_id: 9a79a3ba-8f88-42a7-8648-6f6bbf0ea518\nstatus: idle\n',2,NULL,'127.0.0.1','86e626d0-8d4e-489f-bb2a-2d05fc6e0f0e','2017-04-27 22:38:33');
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
-- Table structure for table `chat_request`
--

DROP TABLE IF EXISTS `chat_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_address` varchar(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chat_date` datetime DEFAULT NULL,
  `chat_id` varchar(100) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_request`
--

LOCK TABLES `chat_request` WRITE;
/*!40000 ALTER TABLE `chat_request` DISABLE KEYS */;
INSERT INTO `chat_request` VALUES (1,'aaaaaaa@aa.com','John Adebayo',NULL,'2017-04-15 17:35:00','3c7d851b-a7aa-4d67-a1eb-9bf0fd5b844b',NULL),(2,'aa@aa.uk','Suliat Babarinde',NULL,'2017-04-15 21:27:00','81509164-3122-498b-83e3-448b80ef7c6a',NULL),(3,'ayobami@ayobamiadewole.com','Koleoso Omoniyi',3,'2017-04-26 20:49:00','2d970450-ec46-4033-a499-3010d6413c6f',NULL),(4,'ayobami@programmer.net','ayobami',NULL,'2017-04-27 07:27:00','7be04042-b002-494e-b2f7-04307fd2e991',NULL);
/*!40000 ALTER TABLE `chat_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `data_fingerprint` varchar(255) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ckeditor_assets_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
INSERT INTO `ckeditor_assets` VALUES (1,'win_20160223_11_49_32_pro.jpg','image/jpeg',105936,'90195ded5bce9c84158046d451cbbb86','Ckeditor::Picture',1280,720,'2017-03-30 21:49:20','2017-03-30 21:49:20');
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `message_date` datetime DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (2,'Segun','Adegbite','segun.adegbite@gmail.com','I will like to book appointment for the said date, so that we can discuss the property I want to buy','2017-04-26 16:56:00','2017-04-28 00:00:00');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'Country1','Afghanistan','Country','af',NULL),(2,'Country2','Aland Islands','Country','ax',NULL),(3,'Country3','Albania','Country','al',NULL),(4,'Country4','Algeria','Country','dz',NULL),(5,'Country5','American Samoa','Country','as',NULL),(6,'Country6','Andorra','Country','ad',NULL),(7,'Country7','Angola','Country','ao',NULL),(8,'Country8','Anguilla','Country','ai',NULL),(9,'Country9','Antarctica','Country','aq',NULL),(10,'Country10','Antigua and Barbuda','Country','ag',NULL),(11,'Country11','Argentina','Country','ar',NULL),(12,'Country12','Armenia','Country','am',NULL),(13,'Country13','Aruba','Country','aw',NULL),(14,'Country14','Australia','Country','au',NULL),(15,'Country15','Austria','Country','at',NULL),(16,'Country16','Azerbaijan','Country','az',NULL),(17,'Country17','Bahamas','Country','bs',NULL),(18,'Country18','Bahrain','Country','bh',NULL),(19,'Country19','Bangladesh','Country','bd',NULL),(20,'Country20','Barbados','Country','bb',NULL),(21,'Country21','Belarus','Country','by',NULL),(22,'Country22','Belgium','Country','be',NULL),(23,'Country23','Belize','Country','bz',NULL),(24,'Country24','Benin','Country','bj',NULL),(25,'Country25','Bermuda','Country','bm',NULL),(26,'Country26','Bhutan','Country','bt',NULL),(27,'Country27','Bolivia,Plurinational State Of','Country','bo',NULL),(28,'Country28','Bosnia and Herzegovina','Country','ba',NULL),(29,'Country29','Botswana','Country','bw',NULL),(30,'Country30','Bouvet Island','Country','bv',NULL),(31,'Country31','Brazil','Country','br',NULL),(32,'Country32','British Indian Ocean Territory','Country','io',NULL),(33,'Country33','Brunei Darussalam','Country','bn',NULL),(34,'Country34','Bulgaria','Country','bg',NULL),(35,'Country35','Burkina Faso','Country','bf',NULL),(36,'Country36','Burundi','Country','bi',NULL),(37,'Country37','Cambodia','Country','kh',NULL),(38,'Country38','Cameroon','Country','cm',NULL),(39,'Country39','Canada','Country','ca',NULL),(40,'Country40','Cape Verde','Country','cv',NULL),(41,'Country41','Cayman Islands','Country','ky',NULL),(42,'Country42','Central African Republic','Country','cf',NULL),(43,'Country43','Chad','Country','td',NULL),(44,'Country44','Chile','Country','cl',NULL),(45,'Country45','China','Country','cn',NULL),(46,'Country46','Christmas Island','Country','cx',NULL),(47,'Country47','Cocos (Keeling) Islands','Country','cc',NULL),(48,'Country48','Colombia','Country','co',NULL),(49,'Country49','Comoros','Country','km',NULL),(50,'Country50','Congo,The Democratic Republic of the','Country','cd',NULL),(51,'Country51','Congo','Country','cg',NULL),(52,'Country52','Cook Islands','Country','ck',NULL),(53,'Country53','Costa Rica','Country','cr',NULL),(54,'Country54','Cote d\'Ivoire','Country','ci',NULL),(55,'Country55','Croatia','Country','hr',NULL),(56,'Country56','Cuba','Country','cu',NULL),(57,'Country57','Cyprus','Country','cy',NULL),(58,'Country58','Czech Republic','Country','cz',NULL),(59,'Country59','Denmark','Country','dk',NULL),(60,'Country60','Djibouti','Country','dj',NULL),(61,'Country61','Dominica','Country','dm',NULL),(62,'Country62','Dominican Republic','Country','do',NULL),(63,'Country63','Ecuador','Country','ec',NULL),(64,'Country64','Egypt','Country','eg',NULL),(65,'Country65','El Salvador','Country','sv',NULL),(66,'Country66','Equatorial Guinea','Country','gq',NULL),(67,'Country67','Eritrea','Country','er',NULL),(68,'Country68','Estonia','Country','ee',NULL),(69,'Country69','Ethiopia','Country','et',NULL),(70,'Country70','Falkland Islands (Malvinas)','Country','fk',NULL),(71,'Country71','Faroe Islands','Country','fo',NULL),(72,'Country72','Fiji','Country','fj',NULL),(73,'Country73','Finland','Country','fi',NULL),(74,'Country74','France','Country','fr',NULL),(75,'Country75','French Guiana','Country','gf',NULL),(76,'Country76','French Polynesia','Country','pf',NULL),(77,'Country77','French Southern Territories','Country','tf',NULL),(78,'Country78','Gabon','Country','ga',NULL),(79,'Country79','Gambia','Country','gm',NULL),(80,'Country80','Georgia','Country','ge',NULL),(81,'Country81','Germany','Country','de',NULL),(82,'Country82','Ghana','Country','gh',NULL),(83,'Country83','Gibraltar','Country','gi',NULL),(84,'Country84','Greece','Country','gr',NULL),(85,'Country85','Greenland','Country','gl',NULL),(86,'Country86','Grenada','Country','gd',NULL),(87,'Country87','Guadeloupe','Country','gp',NULL),(88,'Country88','Guam','Country','gu',NULL),(89,'Country89','Guatemala','Country','gt',NULL),(90,'Country90','Guernsey','Country','gg',NULL),(91,'Country91','Guinea','Country','gn',NULL),(92,'Country92','Guinea-Bissau','Country','gw',NULL),(93,'Country93','Guyana','Country','gy',NULL),(94,'Country94','Haiti','Country','ht',NULL),(95,'Country95','Heard Island and McDonald Islands','Country','hm',NULL),(96,'Country96','Holy See (Vatican City)','Country','va',NULL),(97,'Country97','Honduras','Country','hn',NULL),(98,'Country98','Hong Kong','Country','hk',NULL),(99,'Country99','Hungary','Country','hu',NULL),(100,'Country100','Iceland','Country','is',NULL),(101,'Country101','India','Country','in',NULL),(102,'Country102','Indonesia','Country','id',NULL),(103,'Country103','Iran, Islamic Republic of','Country','ir',NULL),(104,'Country104','Iraq','Country','iq',NULL),(105,'Country105','Ireland','Country','ie',NULL),(106,'Country106','Isle of Man','Country','im',NULL),(107,'Country107','Israel','Country','il',NULL),(108,'Country108','Italy','Country','it',NULL),(109,'Country109','Jamaica','Country','jm',NULL),(110,'Country110','Japan','Country','jp',NULL),(111,'Country111','Jersey','Country','je',NULL),(112,'Country112','Jordan','Country','jo',NULL),(113,'Country113','Kazakhstan','Country','kz',NULL),(114,'Country114','Kenya','Country','ke',NULL),(115,'Country115','Kiribati','Country','ki',NULL),(116,'Country116','Korea, Democratic People\'s Republic of','Country','kp',NULL),(117,'Country117','Korea, Republic of','Country','kr',NULL),(118,'Country118','Kuwait','Country','kw',NULL),(119,'Country119','Kyrgyzstan','Country','kg',NULL),(120,'Country120','Lao People\'s Democratic Republic','Country','la',NULL),(121,'Country121','Latvia','Country','lv',NULL),(122,'Country122','Lebanon','Country','lb',NULL),(123,'Country123','Lesotho','Country','ls',NULL),(124,'Country124','Liberia','Country','lr',NULL),(125,'Country125','Libyan Arab Jamahiriya','Country','ly',NULL),(126,'Country126','Liechtenstein','Country','li',NULL),(127,'Country127','Lithuania','Country','lt',NULL),(128,'Country128','Luxembourg','Country','lu',NULL),(129,'Country129','Macao','Country','mo',NULL),(130,'Country130','Macedonia, The Former Yugoslav Republic of','Country','mk',NULL),(131,'Country131','Madagascar','Country','mg',NULL),(132,'Country132','Malawi','Country','mw',NULL),(133,'Country133','Malaysia','Country','my',NULL),(134,'Country134','Maldives','Country','mv',NULL),(135,'Country135','Mali','Country','ml',NULL),(136,'Country136','Malta','Country','mt',NULL),(137,'Country137','Marshall Islands','Country','mh',NULL),(138,'Country138','Martinique','Country','mq',NULL),(139,'Country139','Mauritania','Country','mr',NULL),(140,'Country140','Mauritius','Country','mu',NULL),(141,'Country141','Mayotte','Country','yt',NULL),(142,'Country142','Mexico','Country','mx',NULL),(143,'Country143','Micronesia, Federated States of','Country','fm',NULL),(144,'Country144','Moldova, Republic of','Country','md',NULL),(145,'Country145','Monaco','Country','mc',NULL),(146,'Country146','Mongolia','Country','mn',NULL),(147,'Country147','Montenegro','Country','me',NULL),(148,'Country148','Montserrat','Country','ms',NULL),(149,'Country149','Morocco','Country','ma',NULL),(150,'Country150','Mozambique','Country','mz',NULL),(151,'Country151','Myanmar','Country','mm',NULL),(152,'Country152','Namibia','Country','na',NULL),(153,'Country153','Nauru','Country','nr',NULL),(154,'Country154','Nepal','Country','np',NULL),(155,'Country155','Netherlands','Country','nl',NULL),(156,'Country156','Netherlands Antilles','Country','an',NULL),(157,'Country157','New Caledonia','Country','nc',NULL),(158,'Country158','New Zealand','Country','nz',NULL),(159,'Country159','Nicaragua','Country','ni',NULL),(160,'Country160','Niger','Country','ne',NULL),(161,'Country161','Nigeria','Country','ng',NULL),(162,'Country162','Niue','Country','nu',NULL),(163,'Country163','Norfolk Island','Country','nf',NULL),(164,'Country164','Northern Mariana Islands','Country','mp',NULL),(165,'Country165','Norway','Country','no',NULL),(166,'Country166','Oman','Country','om',NULL),(167,'Country167','Pakistan','Country','pk',NULL),(168,'Country168','Palau','Country','pw',NULL),(169,'Country169','Palestinian Territory, Occuped','Country','ps',NULL),(170,'Country170','Panama','Country','pa',NULL),(171,'Country171','Papua New Guinea','Country','pg',NULL),(172,'Country172','Paraguay','Country','py',NULL),(173,'Country173','Peru','Country','pe',NULL),(174,'Country174','Philippines','Country','ph',NULL),(175,'Country175','Pitcairn','Country','pn',NULL),(176,'Country176','Poland','Country','pl',NULL),(177,'Country177','Portugal','Country','pt',NULL),(178,'Country178','Puerto Rico','Country','pr',NULL),(179,'Country179','Qatar','Country','qa',NULL),(180,'Country180','Reunion','Country','re',NULL),(181,'Country181','Romania','Country','ro',NULL),(182,'Country182','Russian Federation','Country','ru',NULL),(183,'Country183','Rwanda','Country','rw',NULL),(184,'Country184','Saint Barthelemy','Country','bl',NULL),(185,'Country185','Saint Helena,Ascension and Tristan da Cunha','Country','sh',NULL),(186,'Country186','Saint Kitts and Nevis','Country','kn',NULL),(187,'Country187','Saint Lucia','Country','lc',NULL),(188,'Country188','Saint Martin','Country','mf',NULL),(189,'Country189','Saint Pierre and Miquelon','Country','pm',NULL),(190,'Country190','Saint Vincent and the Grenadines','Country','vc',NULL),(191,'Country191','Samoa','Country','ws',NULL),(192,'Country192','San Marino','Country','sm',NULL),(193,'Country193','Sao Tome and Principe','Country','st',NULL),(194,'Country194','Saudi Arabia','Country','sa',NULL),(195,'Country195','Senegal','Country','sn',NULL),(196,'Country196','Serbia','Country','rs',NULL),(197,'Country197','Seychelles','Country','sc',NULL),(198,'Country198','Sierra Leone','Country','sl',NULL),(199,'Country199','Singapore','Country','sg',NULL),(200,'Country200','Slovakia','Country','sk',NULL),(201,'Country201','Slovenia','Country','si',NULL),(202,'Country202','Solomon Islands','Country','sb',NULL),(203,'Country203','Somalia','Country','so',NULL),(204,'Country204','South Africa','Country','za',NULL),(205,'Country205','South Georgia and the South Sandwich Islands','Country','gs',NULL),(206,'Country206','Spain','Country','es',NULL),(207,'Country207','Sri Lanka','Country','lk',NULL),(208,'Country208','Sudan','Country','sd',NULL),(209,'Country209','Suriname','Country','sr',NULL),(210,'Country210','Svalbard and Jan Mayen','Country','sj',NULL),(211,'Country211','Swaziland','Country','sz',NULL),(212,'Country212','Sweden','Country','se',NULL),(213,'Country213','Switzerland','Country','ch',NULL),(214,'Country214','Syrian Arab Republic','Country','sy',NULL),(215,'Country215','Taiwan, Province of China','Country','tw',NULL),(216,'Country216','Tajikistan','Country','tj',NULL),(217,'Country217','Tanzania, United Republic of','Country','tz',NULL),(218,'Country218','Thailand','Country','th',NULL),(219,'Country219','Timor-Leste','Country','tl',NULL),(220,'Country220','Togo','Country','tg',NULL),(221,'Country221','Tokelau','Country','tk',NULL),(222,'Country222','Tonga','Country','to',NULL),(223,'Country223','Trinidad and Tobago','Country','tt',NULL),(224,'Country224','Tunisia','Country','tn',NULL),(225,'Country225','Turkey','Country','tr',NULL),(226,'Country226','Turkmenistan','Country','tm',NULL),(227,'Country227','Turks and Caicos Islands','Country','tc',NULL),(228,'Country228','Tuvalu','Country','tv',NULL),(229,'Country229','Uganda','Country','ug',NULL),(230,'Country230','Ukraine','Country','ua',NULL),(231,'Country231','United Arab Emirates','Country','ae',NULL),(232,'Country232','United Kingdom','Country','gb',NULL),(233,'Country233','United States','Country','us',NULL),(234,'Country234','United States Minor Outlying Islands','Country','um',NULL),(235,'Country235','Uruguay','Country','uy',NULL),(236,'Country236','Uzbekistan','Country','uz',NULL),(237,'Country237','Vanuatu','Country','vu',NULL),(238,'Country238','Venezuela, Bolivarian republic of','Country','ve',NULL),(239,'Country239','Vietnam','Country','vn',NULL),(240,'Country240','Virgin Islands, British','Country','vg',NULL),(241,'Country241','Virgin Islands, U.S.','Country','vi',NULL),(242,'Country242','Wallis and Futuna','Country','wf',NULL),(243,'Country243','Western Sahara','Country','eh',NULL),(244,'Country244','Yemen','Country','ye',NULL),(245,'Country245','Zambia','Country','zm',NULL),(246,'Country246','Zimbabwe','Country','zw',NULL),(247,'N/A','Not Applicable','state','',NULL),(248,'anambra','Anambra','state','',NULL),(249,'enugu','Enugu','state','',NULL),(250,'akwaibom','Akwa Ibom','state','',NULL),(251,'adamawa','Adamawa','state','',NULL),(252,'abia','Abia','state','',NULL),(253,'bauchi','Bauchi','state','',NULL),(254,'bayelsa','Bayelsa','state','',NULL),(255,'benue','Benue','state','',NULL),(256,'borno','Borno','state','',NULL),(257,'crossriver','Cross River','state','',NULL),(258,'delta','Delta','state','',NULL),(259,'ebonyi','Ebonyi','state','',NULL),(260,'edo','Edo','state','',NULL),(261,'ekiti','Ekiti','state','',NULL),(262,'gombe','Gombe','state','',NULL),(263,'imo','Imo','state','',NULL),(264,'jigawa','Jigawa','state','',NULL),(265,'kaduna','Kaduna','state','',NULL),(266,'kano','Kano','state','',NULL),(267,'katsina','Katsina','state','',NULL),(268,'kebbi','Kebbi','state','',NULL),(269,'kogi','Kogi','state','',NULL),(270,'kwara','Kwara','state','',NULL),(271,'lagos','Lagos','state','',NULL),(272,'nasarawa','Nasarawa','state','',NULL),(273,'niger','Niger','state','',NULL),(274,'ogun','Ogun','state','',NULL),(275,'ondo','Ondo','state','',NULL),(276,'osun','Osun','state','',NULL),(277,'oyo','Oyo','state','',NULL),(278,'plateau','Plateau','state','',NULL),(279,'rivers','Rivers','state','',NULL),(280,'sokoto','Sokoto','state','',NULL),(281,'taraba','Taraba','state','',NULL),(282,'yobe','Yobe','state','',NULL),(283,'zamfara','Zamfara','state','',NULL),(284,'active','Active','accountstatus','',NULL),(285,'locked','Locked','accountstatus','',NULL),(286,'inactive','Inactive','accountstatus','',NULL),(287,'pending','Pending','approvalstatus','',NULL),(288,'approved','Approved','approvalstatus','',NULL),(289,'rejected','Rejected','approvalstatus','',NULL),(290,'forSaleOrRent','For Sale or Rent','propertyStatus','',NULL),(291,'outOfOrderProperty','Out of Order','propertyStatus','',NULL),(292,'retiredProperty','Sealed off','propertyStatus','',NULL),(293,'naira','Naira','currency','',NULL),(294,'dollar','Dollar','currency','',NULL),(295,'pound','Pounds','currency','',NULL),(296,'passport','Passport','idDocument','',NULL),(297,'nationalId','National ID Card','idDocument','',NULL),(298,'driverLicense','Driver\'s License','idDocument','',NULL),(299,'salut1','Mr.','salutation','',NULL),(300,'salut2','Miss','salutation','',NULL),(301,'salut3','Mrs.','salutation','',NULL),(302,'salut4','Dr.','salutation','',NULL),(303,'salut5','Rev.','salutation','',NULL),(304,'salut6','Prof.','salutation','',NULL),(305,'salut7','Chief','salutation','',NULL),(306,'salut8','Mallam','salutation','',NULL),(307,'salut9','Alhaji','salutation','',NULL),(308,'salut10','Alhaja','salutation','',NULL),(309,'salut11','Barr.','salutation','',NULL),(310,'salut12','Prophet','salutation','',NULL),(311,'salut13','Pastor','salutation','',NULL),(312,'salut14','Maj.','salutation','',NULL),(313,'salut15','Capt.','salutation','',NULL),(314,'salut16','Sgt.','salutation','',NULL),(315,'salut17','Gen.','salutation','',NULL),(316,'salut18','WG. CDR.','salutation','',NULL),(317,'salut19','Lt.','salutation','',NULL),(318,'salut20','B. Gen.','salutation','',NULL),(319,'salut21','Grp. Capt.','salutation','',NULL),(320,'salut22','Lt. Col.','salutation','',NULL),(321,'salut23','Hon.','salutation','',NULL),(322,'salut24','Justice','salutation','',NULL),(323,'salut25','Air CDR','salutation','',NULL),(324,'salut26','Madam','salutation','',NULL),(325,'salut27','Hajiya','salutation','',NULL),(326,'salut28','Naval Capt.','salutation','',NULL),(327,'salut29','Flt. Lt.','salutation','',NULL),(328,'salut30','Sqn. Ldr.','salutation','',NULL),(329,'salut32','Sgt. Maj.','salutation','',NULL),(330,'salut31','Col.','salutation','',NULL),(331,'salut33','Air Vice Marshal','salutation','',NULL),(332,'salut34','CDR.','salutation','',NULL),(333,'salut35','Deacon','salutation','',NULL),(334,'salut36','Prince','salutation','',NULL),(335,'salut37','Lt. Gen.','salutation','',NULL),(336,'salut38','Insp.','salutation','',NULL),(337,'salut39','SP.','salutation','',NULL),(338,'salut40','Engr.','salutation','',NULL),(339,'salut41','Commodore','salutation','',NULL),(340,'salut42','Maj. Gen.','salutation','',NULL),(341,'salut43','Vice Admiral','salutation','',NULL),(342,'salut44','Ambassedor','salutation','',NULL),(343,'salut45','Ass. Prof.','salutation','',NULL),(344,'salut46','Sen.','salutation','',NULL),(345,'salut47','FG. Officer','salutation','',NULL),(346,'salut48','Rev. Dr.','salutation','',NULL),(347,'salut49','Arch.','salutation','',NULL),(348,'salut50','Bishop','salutation','',NULL),(349,'salut51','Rt. Rev.','salutation','',NULL),(350,'salut52','Miskoom','salutation','',NULL),(351,'salut53','Nde','salutation','',NULL),(352,'salut54','Warrant Officer','salutation','',NULL),(353,'salut55','ASP','salutation','',NULL),(354,'salut56','Chief (Mrs.)','salutation','',NULL),(355,'salut57','Rev. (Mrs.)','salutation','',NULL),(356,'salut58','Sheikh','salutation','',NULL),(357,'salut59','Da','salutation','',NULL),(358,'salut60','Lt. Cdr.','salutation','',NULL),(359,'male','Male','gender','',NULL),(360,'female','Female','gender','',NULL),(361,'paymentstatus1','Not Paid','paymentstatus','',NULL),(362,'paymentstatus2','Paid','paymentstatus','',NULL),(363,'requeststatus1','Not Approved','requeststatus','',NULL),(364,'requeststatus2','Pending','requeststatus','',NULL),(365,'requeststatus2','Approved','requeststatus','',NULL),(366,'maritalstatus1','Single','maritalstatus','',NULL),(367,'maritalstatus2','Married','maritalstatus','',NULL),(368,'maritalstatus3','Divorced','maritalstatus','',NULL),(369,'maritalstatus4','Widowed','maritalstatus','',NULL),(370,'paymentfrequency1','Monthly','paymentfrequency','',NULL),(371,'paymentfrequency2','Yearly','paymentfrequency','',NULL),(372,'paymentfrequency3','None','paymentfrequency','',NULL),(373,'religion1','Christianity','religion','',NULL),(374,'religion2','Islam','religion','',NULL),(375,'religion3','Hinduism','religion','',NULL),(376,'religion4','Buddhism','religion','',NULL),(377,'religion5','Folk religion','religion','',NULL),(378,'religion6','Not Applicable','religion','',NULL),(379,'persontype1','Buyer','persontype','',NULL),(380,'persontype2','Seller','persontype','',NULL),(381,'persontype3','Property Manager','persontype','',NULL),(382,'persontype4','Staff','persontype','',NULL),(383,'status1','Active','status','',NULL),(384,'status2','Retired','status','',NULL),(385,'propertytype1','Lease','propertytype','',NULL),(386,'propertytype2','New','propertytype','',NULL),(387,'activeProperty','Good Condition','propertyStatus',NULL,NULL),(388,'featuredProperty','Featured Property','propertyStatus',NULL,NULL),(389,'underMortgage','Mortgage','propertyStatus','',NULL),(390,'mortgageinProcess','Mortgage in Process','propertyStatus','',NULL);
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `description` text,
  `event_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'Property Exhibition','Property Exhibition','2017-04-09 17:44:00','2017-04-09 17:44:00',3),(2,'Property Conference','Property Conference','2017-04-14 16:44:00','2017-04-14 16:44:00',3),(3,'Mortage Best Practices Seminar','<p>Mortage Best Practices Seminar</p>\r\n','2017-04-20 21:28:00','2017-04-20 21:28:00',3);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (1,'52af44b7-8de7-45e1-a631-a96d67829c77',NULL,'jpg','Desert.jpg',NULL,'10DVIUXS'),(2,'7d697dd7-7e49-452d-9539-fd413fa8753f',NULL,'jpg','Penguins.jpg',NULL,'10FSGMWJ'),(3,'74ecfca3-9e14-4831-9b2e-61a5da8ed20e',NULL,'jpg','Tulips.jpg',NULL,'10ORBOAB'),(4,'75e6ac52-9c43-4fc0-bd09-a9d2b8c481af',NULL,'jpg','Tulips.jpg',NULL,'10IDJTLC'),(5,'8b114bcf-2cb8-4500-8d21-901f29fac684',NULL,'jpg','3CE6984300000578-4196454-image-a-3_1486396105907.jpg',NULL,'10UKXXTW'),(6,'ad279191-3a05-4ba7-921a-fe24c9c968f3',NULL,'jpg','4b85a2e1983c9a9603fd19bcd1be2138.jpg',NULL,'10UKXXTW'),(7,'698d09ff-6830-4ba1-9dc7-640f1c29c109',NULL,'jpg','index1.jpg',NULL,'10UKXXTW'),(8,'f6649c99-0315-46a9-900b-2e9df9e77607',NULL,'jpg','designed_by_expanded_gallery2.jpg',NULL,'10IHMKSB'),(9,'a414bed6-3c08-415e-9339-23c03d6500fe',NULL,'jpg','Tinakilly-house-inside.jpg',NULL,'10IHMKSB'),(10,'1d2de846-c911-4a59-96cf-970bfb6c5353',NULL,'jpg','Sarah-Hogan-house-11nov15_pr_b_639x426.jpg',NULL,'10IHMKSB'),(11,'012d2aff-8419-42ed-a513-1f34640364d1',NULL,'jpg','plants-green-interior-design-ideas-31.jpg',NULL,'10QXWWHK'),(12,'e7e487cb-018b-4aa6-a9a9-ab33be75b04d',NULL,'jpg','log-house-10.jpg',NULL,'10QXWWHK'),(13,'195694e8-4d4c-4bba-8a4c-004fd4e9b3ba',NULL,'jpg','4b85a2e1983c9a9603fd19bcd1be2138.jpg',NULL,'10QXWWHK'),(14,'233b2f7a-3585-4699-88e8-f503086dc123',NULL,'jpg','external-picture.jpg',NULL,'10IOXNEK'),(15,'3a9e4de4-fb97-4def-b43c-18ff08348b7c',NULL,'jpg','interior-1.jpg',NULL,'10IOXNEK'),(16,'4128319a-8edc-43dc-8082-128fbfd167cb',NULL,'jpg','interior-2.jpg',NULL,'10IOXNEK'),(17,'7d122ef3-9cc1-45a3-819b-02c24818411c',NULL,'jpg','AHC_-_16_-_5.2mill.jpg',NULL,'10PXRGKM'),(18,'65695bc3-a692-4237-8cf5-45dcd2715847',NULL,'jpg','purewhite09.jpg',NULL,'10PXRGKM'),(19,'2561a373-8a26-4bc2-8092-77f41028025b',NULL,'jpg','purewhite17.jpg',NULL,'10PXRGKM'),(20,'9a4a0091-ff52-473b-9dbf-0c607be8a3a4',NULL,'pdf','Ayobami_Adewole.pdf',NULL,'MHECJBF'),(21,'66ef3e7c-e52a-4cf7-a2ba-7a424acce1e2',NULL,'txt','FCMB_Update.txt',NULL,'MHECJBF'),(22,'0d327ecc-d7fc-46e0-ad1d-4fe8315f2bfc',NULL,'doc','Application-Letter-Final.doc',NULL,'MHECJBF'),(23,'ad3d1fd5-0e6f-421f-be09-a35bd7ab2562',NULL,'png','Untitled.png',NULL,'MHECJBF'),(24,'6b766159-bb77-469b-86dd-6c00cade5903',NULL,'doc','Cover-Letter_Optiver.doc',NULL,'MHECJBF');
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
-- Table structure for table `loggedinagent`
--

DROP TABLE IF EXISTS `loggedinagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loggedinagent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `chat_id` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loggedinagent`
--

LOCK TABLES `loggedinagent` WRITE;
/*!40000 ALTER TABLE `loggedinagent` DISABLE KEYS */;
/*!40000 ALTER TABLE `loggedinagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `message_date` datetime DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `chat_id` varchar(100) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `chat_request_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mortgage`
--

DROP TABLE IF EXISTS `mortgage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mortgage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_number1` varchar(45) DEFAULT NULL,
  `customer_number2` varchar(45) DEFAULT NULL,
  `customer_number3` varchar(45) DEFAULT NULL,
  `house_hold_income` decimal(10,0) DEFAULT NULL,
  `house_hold_debt` decimal(10,0) DEFAULT NULL,
  `property_number` varchar(45) DEFAULT NULL,
  `home_value` decimal(10,0) DEFAULT NULL,
  `interest_rate` decimal(10,0) DEFAULT NULL,
  `loan_amount` decimal(10,0) DEFAULT NULL,
  `loan_term` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `property_tax` decimal(10,0) DEFAULT NULL,
  `pmi` decimal(10,0) DEFAULT NULL,
  `home_ins` decimal(10,0) DEFAULT NULL,
  `monthly_hoa` decimal(10,0) DEFAULT NULL,
  `mortgage_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mortgage`
--

LOCK TABLES `mortgage` WRITE;
/*!40000 ALTER TABLE `mortgage` DISABLE KEYS */;
INSERT INTO `mortgage` VALUES (1,'738494','','',1000000,NULL,'10QXWWHK',3131234143,10,4550222,40,'2017-04-08 00:00:00',5,45,2542542,43245,'MJEHJMY'),(2,'738495','','',3000000,NULL,'10PXRGKM',13000000,7,NULL,10,'2017-04-20 00:00:00',5,45,200000,5000,'MHECJBF');
/*!40000 ALTER TABLE `mortgage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `news_date` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,'<p>New built Estate with amazing properties</p>\r\n','2017-03-29 20:35:00',NULL,3,'Limited Mortgage Offers'),(3,'<p>New built Estate with amazing properties</p>\r\n','2017-04-20 21:22:00',NULL,3,'New built Estate with amazing properties');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `amount` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `financial_institution` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  `details` varchar(450) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'10IOXNEK','2017-04-27 00:00:00',6,'One of Payment was done','1000000','Access Bank ','Neft Payment Transfer');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_request`
--

DROP TABLE IF EXISTS `payment_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `expected_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_request`
--

LOCK TABLES `payment_request` WRITE;
/*!40000 ALTER TABLE `payment_request` DISABLE KEYS */;
INSERT INTO `payment_request` VALUES (7,'Julius','Agwu','juliusagwu@gmail.com','08032655522','2017-05-27 00:00:00',NULL,15,NULL,'2017-04-27 15:57:00'),(8,'Ebele','Chukwudi','ebele@gmail.com','0803265552','2018-05-27 00:00:00',NULL,14,NULL,'2017-04-27 23:12:00');
/*!40000 ALTER TABLE `payment_request` ENABLE KEYS */;
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
  `person_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Person_Address` (`address_id`) USING BTREE,
  CONSTRAINT `FK_Person_Address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (4,'Ayobami','Adewole','',359,366,373,21,382,'1988-05-18 00:00:00','2017-03-14 15:46:00',364,'ayobami@ayobamiadewole.com','08052185012',3,'738494'),(5,'Sawyer','Dekunl','',360,366,376,24,380,'1990-04-14 00:00:00','2017-04-18 16:09:00',364,'ayobami.adewole@gmail.com','01234569',4,'738495'),(6,'Manobua','Oghene','M',360,367,373,26,380,'1980-04-26 00:00:00','2017-04-26 15:34:00',364,'oghenemano@gmail.com','087965555',5,'738496'),(7,'Okonkwo','Chidinma','',359,367,374,27,379,'1993-11-26 00:00:00','2017-04-26 18:48:00',364,'okonkwochidinmaruth@gmail.com','07061693457',6,'738497'),(8,'Oladele','Joseph','',359,367,373,28,379,'1997-04-27 00:00:00','2017-04-27 23:31:00',364,'josephsawyer@yahoo.com','01235888',7,NULL);
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
  `short_description` text COLLATE utf8_bin,
  `property_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `customer_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Property_Address` (`address_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (11,18,'Quintessential South Boston condo at the top of Old Harbor St near picturesque Thomas Park. Deeded deck & backyard create your own private oasis! Hardwood throughout. Walk into upper level featuring 2 bedrooms w/ample built-out closet space, recessed lights & spacious bathroom. Magnificent lower level basks in light & welcomes you with high ceilings & open layout, perfect for entertaining! Airy living rm takes in spectacular views through double glass doors to your very own 200 sf deck & yard for alfresco dining & relaxing. Open floor plan features kitchen w/granite island, stainless appliances, trash compactor, wine fridge. gas fireplace, & crown moldings. French doors lead to 3rd bedroom that lends itself as a guest bd, dining room, playroom or office area. Central Air. NEST thermostat system. Bonus 7 x 12 storage area in basement. Water heater new in 2016. If you\'ve been waiting for the right condo in this charming section of this coveted neighborhood, this is it! Interior just painted!  ',386,'2017-03-13 15:31:00',4,'209',8000000,290,2,'Private deeded back yard and easy parking on wide street. Steps from Thomas park and the beach.','10UKXXTW','738495'),(12,19,'Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive Escala. Attention to detail is evident--artisan troweled walls, hand painted murals and tiles. Resort oasis w/pool, spa and tennis court overlooking hill country views and distant Austin city skyline.',386,'2017-03-13 15:35:00',5,'209',15000000,290,2,'Stunning French Country estate built by Pat Heyl on 4.5 Acres in exclusive Escala.','10IHMKSB','738496'),(13,20,'BEAUTIFUL AND COMPLETELY REMODELED! New kitchen has many upgraded features including soft close cabinets and drawers, granite counter tops with tile back splashes and stainless steel appliances. Living and Dining Rooms have an open floor plan with vaulted ceilings. The wood burning fireplace has a tile surround that accents the new wood laminate nicely. Both bathrooms have new tile flooring, cabinets with granite counter tops and tile accents, toilets and fixtures. Pool has new Diamond Brite finish and freshly painted pool deck. Fresh landscaping and an outdoor patio/bbq area. Large laundry room with shelving. Other New features include A/C and ducts, carpet, low energy vinyl windows, interior doors, lighting fixtures, fresh interior and exterior paint, ClosetMaid shelving. ',386,'2017-03-13 15:38:00',2,'209',9000000,390,2,'BEAUTIFUL AND COMPLETELY REMODELED! ','10QXWWHK','738495'),(14,23,'CUSTOM ESTATE WITH AMAZING TROPICAL OASIS BACKYARD AND STUNNING CITY LIGHTS VIEWS! This sprawling estate boasts a 52,272 sq. ft. lot on a beautiful Cul-De-Sac street. The stunning water features and bridge make for a great first impression as you walk up to the front entrance. The new upgraded home opens onto the formal living room and dining room plus a first floor office with a open concept perfect for entertaining. Six bedrooms plus a bonus/game room, office, detached one bedroom guest house w/ gated RV parking as well as a 12 foot RV garage & pool complete the package and provide the perfect setting to entertain and live in style. The lot fits 10 cars easily if not more behind the electric operated RV gate. Don\'t miss the huge gourmet kitchen w/ built-ins, island breakfast bar, granite counter tops & stone backsplash or the main floor bedroom. Breathtaking views from almost every room. The parklike oasis backyard was designed for further enjoyment with an oversized tropical pebble-tech heated pool and spa, a rock waterslide, above-ground fire pit, BBQ island area, plantable hillside for fruit trees or vineyard, concrete walking trail around rear yard perfect for daily exercise walks in the comfort of your own backyard. Plenty of room to spread out and relax in style.  ',386,'2017-04-09 17:44:00',5,'2500',8000000,290,3,'CUSTOM ESTATE WITH AMAZING TROPICAL OASIS BACKYARD AND STUNNING CITY LIGHTS VIEWS! This sprawling estate boasts a 52,272 sq. ft. lot on a beautiful Cul-De-Sac street. The stunning water features and bridge make for a great first impression as you walk up to the front entrance','10IOXNEK','738496'),(15,25,'ew hardwood floors, bed room/office with an attached full bath downstairs. Very well taken care with good back yard. Huge kitchen with granite island and a new dishwasher. Close to Windward and easy access to 400 and new Brandy Wine elementary, DeSana middle and soon to start new high school. Lawn and trash are taken care by HOA. Very good amenities with large pool with mushroom and slide, four tennis courts and huge play area for kids and a club house.',386,'2017-04-18 19:13:00',7,'',13000000,390,4,'Impeccably maintained 6BR / 4.5BA home in popular Hanover Place - great amenities, top schools, & convenient location. HOA includes front/back yard care, swim & tennis, clubhouse access & trash pickup. You\'ll love the curb appeal w/professional landscaping, spacious yard & patio. Inside you\'ll find a 2-story foyer, beautiful hardwood floors & gourmet kitchen. Huge master suite w/trey ceilings & walk-in closet.','10PXRGKM','738495');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_price`
--

LOCK TABLES `property_price` WRITE;
/*!40000 ALTER TABLE `property_price` DISABLE KEYS */;
INSERT INTO `property_price` VALUES (11,11,8000000.00,383,'2017-03-13 15:31:00',NULL,NULL,NULL,NULL),(12,12,15000000.00,383,'2017-03-13 15:35:00',NULL,NULL,NULL,NULL),(13,13,9000000.00,383,'2017-03-13 15:38:00',NULL,NULL,NULL,NULL),(14,14,8000000.00,383,'2017-04-09 17:44:00',NULL,1000000,7,5),(15,15,13000000.00,383,'2017-04-18 19:13:00',NULL,1000000,11,2);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_valuation`
--

LOCK TABLES `property_valuation` WRITE;
/*!40000 ALTER TABLE `property_valuation` DISABLE KEYS */;
INSERT INTO `property_valuation` VALUES (1,11,'This valuation has been prepared in response to a instruction dated 18th March 2017, from:\r\nValuation Exchange and RP Domestic Hub - Long Form.','405m²','Character Residential Area','High quality dwelling in a popular inner city location.','','2017-03-26 00:00:00','2017-03-26 00:00:00','500000','','1000000','ABCDEF Pty Ltd','Regular in shape, 10m frontage x 40.5 metre depth approx','Approximately 405m²','The subject Title was not made available and not searched.\r\nThis valuation is therefore made subject to the land and Title\r\nbeing free of any restrictive encumbrances, covenants,\r\neasements or other planning restrictions which might otherwise\r\ndetrimentally affect the value of the land, and secondly that\r\nthe improvements are correctly located.','The subject site is regular in shape. It is situated above road height and has a steep slope that falls from\r\nthe rear boundary to the road frontage. The rear section of the land with the pool has been levelled.','The following services are connected to the property: Mains water, sewerage, gas, telephone and electricity','','Paddington is an inner city suburb, some 4km north west of the Brisbane CBD. Local shops and schools are situated within 500 metres. Bus services are close by.','Currently improving the land is a fully refurbished and extended part four level timber dwelling erected\r\non a 405m2 allotment. The dwelling has high quality fixtures and fittings and an in-ground pool at the rear','',NULL,'',NULL,'',''),(2,15,'This valuation has been prepared in response to a instruction dated 18th March 2017, from:\r\n Valuation Exchange and RP Domestic Hub - Long Form.','405m²','Character Residential Area','This valuation has been prepared in response to a instruction dated 18th March 2017, from:\r\n Valuation Exchange and RP Domestic Hub - Long Form.','','2017-03-19 00:00:00','2017-03-19 00:00:00','500000','','1000000','ABCDEF Pty Ltd','Regular in shape, 10m frontage x 40.5 metre depth approx','Approximately 405m²','The subject Title was not made available and not searched.\r\n This valuation is therefore made subject to the land and Title\r\n being free of any restrictive encumbrances, covenants,\r\n easements or other planning restrictions which might otherwise\r\n detrimentally affect the value of the land, and secondly that\r\n the improvements are correctly located.','The subject site is regular in shape. It is situated above road height and has a steep slope that falls from\r\n the rear boundary to the road frontage. The rear section of the land with the pool has been levelled.','','','Paddington is an inner city suburb, some 4km north west of the Brisbane CBD. Local shops and schools are situated within 500 metres. Bus services are close by.','Currently improving the land is a fully refurbished and extended part four level timber dwelling erected\r\n on a 405m2 allotment. The dwelling has high quality fixtures and fittings and an in-ground pool at the rear','',NULL,'',NULL,'','');
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
INSERT INTO `schema_migrations` VALUES ('0'),('20170215141912'),('20170217221230'),('20170301203425'),('20170329211312');
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
-- Table structure for table `show_room`
--

DROP TABLE IF EXISTS `show_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `show_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colour` varchar(45) DEFAULT NULL,
  `no_of_properties` int(11) DEFAULT NULL,
  `slide_show_duration_seconds` int(11) DEFAULT NULL,
  `interval_between_properties_seconds` int(11) DEFAULT NULL,
  `text_colour` varchar(45) DEFAULT NULL,
  `no_of_images` int(11) DEFAULT NULL,
  `can_show_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_room`
--

LOCK TABLES `show_room` WRITE;
/*!40000 ALTER TABLE `show_room` DISABLE KEYS */;
INSERT INTO `show_room` VALUES (1,'black',20,2,2,'blue',3,NULL);
/*!40000 ALTER TABLE `show_room` ENABLE KEYS */;
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
  `role` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'ayobami@ayobamiadewole.com','$2a$10$5aN3we48giQ.xCPyJ3HRE.nzuVGhPC39musXYGMa3.5kzGVJLspje','2017-03-14','$2a$10$5aN3we48giQ.xCPyJ3HRE.','admin',284),(4,'ayobami.adewole@gmail.com','$2a$10$cmYYjoRbDK4sb3gP8Troh.LH9wbUj9fTFlyRbohF7ZQvoWSb9S7XK','2017-04-18','$2a$10$cmYYjoRbDK4sb3gP8Troh.','user',285),(5,'oghenemano@gmail.com','$2a$10$C3CnvDM.Z8wNY00iQ3D6A.9Wz1LjGf.zUhquOXEXGB.BMgqiV.GFe','2017-04-26','$2a$10$C3CnvDM.Z8wNY00iQ3D6A.','user',284),(6,'okonkwochidinmaruth@gmail.com','$2a$10$S7ijKNljOO/NhZLK/aZTl.PNFIozGuUoOoaOgb.bI4O0eJ8/C79Z.','2017-04-26','$2a$10$S7ijKNljOO/NhZLK/aZTl.','user',284),(7,'josephsawyer@yahoo.com','$2a$10$5aN3we48giQ.xCPyJ3HRE.nzuVGhPC39musXYGMa3.5kzGVJLspje','2017-04-27','$2a$10$5aN3we48giQ.xCPyJ3HRE.','user',284);
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

-- Dump completed on 2017-04-28  0:20:31
