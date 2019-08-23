-- MySQL dump 10.13  Distrib 5.6.34, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Current Database: `webtrees`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webtrees` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `webtrees`;

--
-- Table structure for table `wt_block`
--

DROP TABLE IF EXISTS `wt_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_block` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `gedcom_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` enum('main','side') COLLATE utf8_unicode_ci DEFAULT NULL,
  `block_order` int(11) NOT NULL,
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`block_id`),
  KEY `wt_block_fk1` (`gedcom_id`),
  KEY `wt_block_fk2` (`user_id`),
  KEY `wt_block_fk3` (`module_name`),
  CONSTRAINT `wt_block_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`),
  CONSTRAINT `wt_block_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  CONSTRAINT `wt_block_ibfk_3` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_block`
--

LOCK TABLES `wt_block` WRITE;
/*!40000 ALTER TABLE `wt_block` DISABLE KEYS */;
INSERT INTO `wt_block` VALUES (1,NULL,-1,NULL,'main',1,'todays_events'),(2,NULL,-1,NULL,'main',2,'user_messages'),(3,NULL,-1,NULL,'main',3,'user_favorites'),(4,NULL,-1,NULL,'side',1,'user_welcome'),(5,NULL,-1,NULL,'side',2,'random_media'),(6,NULL,-1,NULL,'side',3,'upcoming_events'),(7,NULL,-1,NULL,'side',4,'logged_in'),(8,-1,NULL,NULL,'main',1,'gedcom_stats'),(9,-1,NULL,NULL,'main',2,'gedcom_news'),(10,-1,NULL,NULL,'main',3,'gedcom_favorites'),(11,-1,NULL,NULL,'main',4,'review_changes'),(12,-1,NULL,NULL,'side',1,'gedcom_block'),(13,-1,NULL,NULL,'side',2,'random_media'),(14,-1,NULL,NULL,'side',3,'todays_events'),(15,-1,NULL,NULL,'side',4,'logged_in'),(16,NULL,1,NULL,'main',1,'todays_events'),(17,NULL,1,NULL,'main',2,'user_messages'),(18,NULL,1,NULL,'main',3,'user_favorites'),(19,NULL,1,NULL,'side',1,'user_welcome'),(20,NULL,1,NULL,'side',2,'random_media'),(21,NULL,1,NULL,'side',3,'upcoming_events'),(22,NULL,1,NULL,'side',4,'logged_in');
/*!40000 ALTER TABLE `wt_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_block_setting`
--

DROP TABLE IF EXISTS `wt_block_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_block_setting` (
  `block_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`block_id`,`setting_name`),
  CONSTRAINT `wt_block_setting_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `wt_block` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_block_setting`
--

LOCK TABLES `wt_block_setting` WRITE;
/*!40000 ALTER TABLE `wt_block_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_block_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_change`
--

DROP TABLE IF EXISTS `wt_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_change` (
  `change_id` int(11) NOT NULL AUTO_INCREMENT,
  `change_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('accepted','pending','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `old_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `new_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`change_id`),
  KEY `wt_change_ix1` (`gedcom_id`,`status`,`xref`),
  KEY `wt_change_fk1` (`user_id`),
  CONSTRAINT `wt_change_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  CONSTRAINT `wt_change_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_change`
--

LOCK TABLES `wt_change` WRITE;
/*!40000 ALTER TABLE `wt_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_dates`
--

DROP TABLE IF EXISTS `wt_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_dates` (
  `d_day` tinyint(4) NOT NULL,
  `d_month` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_mon` tinyint(4) NOT NULL,
  `d_year` smallint(6) NOT NULL,
  `d_julianday1` mediumint(9) NOT NULL,
  `d_julianday2` mediumint(9) NOT NULL,
  `d_fact` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `d_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `d_file` int(11) NOT NULL,
  `d_type` enum('@#DGREGORIAN@','@#DJULIAN@','@#DHEBREW@','@#DFRENCH R@','@#DHIJRI@','@#DROMAN@','@#DJALALI@') COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `wt_dates_ix1` (`d_day`),
  KEY `wt_dates_ix2` (`d_month`),
  KEY `wt_dates_ix3` (`d_mon`),
  KEY `wt_dates_ix4` (`d_year`),
  KEY `wt_dates_ix5` (`d_julianday1`),
  KEY `wt_dates_ix6` (`d_julianday2`),
  KEY `wt_dates_ix7` (`d_gid`),
  KEY `wt_dates_ix8` (`d_file`),
  KEY `wt_dates_ix9` (`d_type`),
  KEY `wt_dates_ix10` (`d_fact`,`d_gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_dates`
--

LOCK TABLES `wt_dates` WRITE;
/*!40000 ALTER TABLE `wt_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_default_resn`
--

DROP TABLE IF EXISTS `wt_default_resn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_default_resn` (
  `default_resn_id` int(11) NOT NULL AUTO_INCREMENT,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resn` enum('none','privacy','confidential','hidden') COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`default_resn_id`),
  UNIQUE KEY `wt_default_resn_ix1` (`gedcom_id`,`xref`,`tag_type`),
  CONSTRAINT `wt_default_resn_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_default_resn`
--

LOCK TABLES `wt_default_resn` WRITE;
/*!40000 ALTER TABLE `wt_default_resn` DISABLE KEYS */;
INSERT INTO `wt_default_resn` VALUES (1,-1,NULL,'SSN','confidential',NULL,'2016-10-30 23:05:43'),(2,-1,NULL,'SOUR','privacy',NULL,'2016-10-30 23:05:43'),(3,-1,NULL,'REPO','privacy',NULL,'2016-10-30 23:05:43'),(4,-1,NULL,'SUBM','confidential',NULL,'2016-10-30 23:05:43'),(5,-1,NULL,'SUBN','confidential',NULL,'2016-10-30 23:05:43');
/*!40000 ALTER TABLE `wt_default_resn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_families`
--

DROP TABLE IF EXISTS `wt_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_families` (
  `f_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `f_file` int(11) NOT NULL,
  `f_husb` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_wife` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `f_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `f_numchil` int(11) NOT NULL,
  PRIMARY KEY (`f_id`,`f_file`),
  UNIQUE KEY `wt_families_ix1` (`f_file`,`f_id`),
  KEY `wt_families_ix2` (`f_husb`),
  KEY `wt_families_ix3` (`f_wife`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_families`
--

LOCK TABLES `wt_families` WRITE;
/*!40000 ALTER TABLE `wt_families` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_favorite`
--

DROP TABLE IF EXISTS `wt_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_favorite` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) NOT NULL,
  `xref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favorite_type` enum('INDI','FAM','SOUR','REPO','OBJE','NOTE','URL') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `news_ix1` (`gedcom_id`,`user_id`),
  KEY `favorite_fk1` (`user_id`),
  CONSTRAINT `wt_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `wt_favorite_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_favorite`
--

LOCK TABLES `wt_favorite` WRITE;
/*!40000 ALTER TABLE `wt_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom`
--

DROP TABLE IF EXISTS `wt_gedcom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom` (
  `gedcom_id` int(11) NOT NULL AUTO_INCREMENT,
  `gedcom_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gedcom_id`),
  UNIQUE KEY `wt_gedcom_ix1` (`gedcom_name`),
  KEY `wt_gedcom_ix2` (`sort_order`),
  KEY `ix1` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom`
--

LOCK TABLES `wt_gedcom` WRITE;
/*!40000 ALTER TABLE `wt_gedcom` DISABLE KEYS */;
INSERT INTO `wt_gedcom` VALUES (-1,'DEFAULT_TREE',0);
/*!40000 ALTER TABLE `wt_gedcom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom_chunk`
--

DROP TABLE IF EXISTS `wt_gedcom_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom_chunk` (
  `gedcom_chunk_id` int(11) NOT NULL AUTO_INCREMENT,
  `gedcom_id` int(11) NOT NULL,
  `chunk_data` mediumblob NOT NULL,
  `imported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gedcom_chunk_id`),
  KEY `ix1` (`gedcom_id`,`imported`),
  CONSTRAINT `wt_gedcom_chunk_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom_chunk`
--

LOCK TABLES `wt_gedcom_chunk` WRITE;
/*!40000 ALTER TABLE `wt_gedcom_chunk` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_gedcom_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_gedcom_setting`
--

DROP TABLE IF EXISTS `wt_gedcom_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_gedcom_setting` (
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`gedcom_id`,`setting_name`),
  CONSTRAINT `wt_gedcom_setting_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_gedcom_setting`
--

LOCK TABLES `wt_gedcom_setting` WRITE;
/*!40000 ALTER TABLE `wt_gedcom_setting` DISABLE KEYS */;
INSERT INTO `wt_gedcom_setting` VALUES (-1,'ADVANCED_NAME_FACTS','NICK,_AKA'),(-1,'ADVANCED_PLAC_FACTS',''),(-1,'ALLOW_THEME_DROPDOWN','1'),(-1,'CALENDAR_FORMAT','gregorian'),(-1,'CHART_BOX_TAGS',''),(-1,'COMMON_NAMES_ADD',''),(-1,'COMMON_NAMES_REMOVE',''),(-1,'COMMON_NAMES_THRESHOLD','40'),(-1,'DEFAULT_PEDIGREE_GENERATIONS','4'),(-1,'EXPAND_RELATIVES_EVENTS','0'),(-1,'EXPAND_SOURCES','0'),(-1,'FAM_FACTS_ADD','CENS,MARR,RESI,SLGS,MARR_CIVIL,MARR_RELIGIOUS,MARR_PARTNERS,RESN'),(-1,'FAM_FACTS_QUICK','MARR,DIV,_NMR'),(-1,'FAM_FACTS_UNIQUE','NCHI,MARL,DIV,ANUL,DIVF,ENGA,MARB,MARC,MARS'),(-1,'FAM_ID_PREFIX','F'),(-1,'FORMAT_TEXT','markdown'),(-1,'FULL_SOURCES','0'),(-1,'GEDCOM_ID_PREFIX','I'),(-1,'GEDCOM_MEDIA_PATH',''),(-1,'GENERATE_UIDS','0'),(-1,'HIDE_GEDCOM_ERRORS','1'),(-1,'HIDE_LIVE_PEOPLE','1'),(-1,'INDI_FACTS_ADD','AFN,BIRT,DEAT,BURI,CREM,ADOP,BAPM,BARM,BASM,BLES,CHRA,CONF,FCOM,ORDN,NATU,EMIG,IMMI,CENS,PROB,WILL,GRAD,RETI,DSCR,EDUC,IDNO,NATI,NCHI,NMR,OCCU,PROP,RELI,RESI,SSN,TITL,BAPL,CONL,ENDL,SLGC,_MILI,ASSO,RESN'),(-1,'INDI_FACTS_QUICK','BIRT,BURI,BAPM,CENS,DEAT,OCCU,RESI'),(-1,'INDI_FACTS_UNIQUE',''),(-1,'KEEP_ALIVE_YEARS_BIRTH',''),(-1,'KEEP_ALIVE_YEARS_DEATH',''),(-1,'LANGUAGE','en-US'),(-1,'MAX_ALIVE_AGE','120'),(-1,'MAX_DESCENDANCY_GENERATIONS','15'),(-1,'MAX_PEDIGREE_GENERATIONS','10'),(-1,'MEDIA_DIRECTORY','media/'),(-1,'MEDIA_ID_PREFIX','M'),(-1,'MEDIA_UPLOAD','1'),(-1,'META_DESCRIPTION',''),(-1,'META_TITLE','webtrees'),(-1,'NO_UPDATE_CHAN','0'),(-1,'NOTE_FACTS_ADD','SOUR,RESN'),(-1,'NOTE_FACTS_QUICK',''),(-1,'NOTE_FACTS_UNIQUE',''),(-1,'NOTE_ID_PREFIX','N'),(-1,'PEDIGREE_FULL_DETAILS','1'),(-1,'PEDIGREE_LAYOUT','1'),(-1,'PEDIGREE_ROOT_ID',''),(-1,'PEDIGREE_SHOW_GENDER','0'),(-1,'PREFER_LEVEL2_SOURCES','1'),(-1,'QUICK_REQUIRED_FACTS','BIRT,DEAT'),(-1,'QUICK_REQUIRED_FAMFACTS','MARR'),(-1,'REPO_FACTS_ADD','PHON,EMAIL,FAX,WWW,RESN'),(-1,'REPO_FACTS_QUICK',''),(-1,'REPO_FACTS_UNIQUE','NAME,ADDR'),(-1,'REPO_ID_PREFIX','R'),(-1,'REQUIRE_AUTHENTICATION','0'),(-1,'SAVE_WATERMARK_IMAGE','0'),(-1,'SAVE_WATERMARK_THUMB','0'),(-1,'SHOW_AGE_DIFF','0'),(-1,'SHOW_COUNTER','1'),(-1,'SHOW_DEAD_PEOPLE','2'),(-1,'SHOW_EST_LIST_DATES','0'),(-1,'SHOW_FACT_ICONS','1'),(-1,'SHOW_GEDCOM_RECORD','0'),(-1,'SHOW_HIGHLIGHT_IMAGES','1'),(-1,'SHOW_LDS_AT_GLANCE','0'),(-1,'SHOW_LEVEL2_NOTES','1'),(-1,'SHOW_LIVING_NAMES','1'),(-1,'SHOW_MEDIA_DOWNLOAD','0'),(-1,'SHOW_NO_WATERMARK','1'),(-1,'SHOW_PARENTS_AGE','1'),(-1,'SHOW_PEDIGREE_PLACES','9'),(-1,'SHOW_PEDIGREE_PLACES_SUFFIX','0'),(-1,'SHOW_PRIVATE_RELATIONSHIPS','1'),(-1,'SHOW_RELATIVES_EVENTS','_BIRT_CHIL,_BIRT_SIBL,_MARR_CHIL,_MARR_PARE,_DEAT_CHIL,_DEAT_PARE,_DEAT_GPAR,_DEAT_SIBL,_DEAT_SPOU'),(-1,'SOUR_FACTS_ADD','NOTE,REPO,SHARED_NOTE,RESN'),(-1,'SOUR_FACTS_QUICK','TEXT,NOTE,REPO'),(-1,'SOUR_FACTS_UNIQUE','AUTH,ABBR,TITL,PUBL,TEXT'),(-1,'SOURCE_ID_PREFIX','S'),(-1,'SUBLIST_TRIGGER_I','200'),(-1,'SURNAME_LIST_STYLE','style2'),(-1,'SURNAME_TRADITION','paternal'),(-1,'THUMBNAIL_WIDTH','100'),(-1,'USE_RIN','0'),(-1,'USE_SILHOUETTE','1'),(-1,'WATERMARK_THUMB','0'),(-1,'WEBTREES_EMAIL','webtrees-noreply@localhost'),(-1,'WORD_WRAPPED_NOTES','0');
/*!40000 ALTER TABLE `wt_gedcom_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_hit_counter`
--

DROP TABLE IF EXISTS `wt_hit_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_hit_counter` (
  `gedcom_id` int(11) NOT NULL,
  `page_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `page_parameter` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `page_count` int(11) NOT NULL,
  PRIMARY KEY (`gedcom_id`,`page_name`,`page_parameter`),
  CONSTRAINT `wt_hit_counter_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_hit_counter`
--

LOCK TABLES `wt_hit_counter` WRITE;
/*!40000 ALTER TABLE `wt_hit_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_hit_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_individuals`
--

DROP TABLE IF EXISTS `wt_individuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_individuals` (
  `i_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `i_file` int(11) NOT NULL,
  `i_rin` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `i_sex` enum('U','M','F') COLLATE utf8_unicode_ci NOT NULL,
  `i_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`i_id`,`i_file`),
  UNIQUE KEY `wt_individuals_ix1` (`i_file`,`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_individuals`
--

LOCK TABLES `wt_individuals` WRITE;
/*!40000 ALTER TABLE `wt_individuals` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_individuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_link`
--

DROP TABLE IF EXISTS `wt_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_link` (
  `l_file` int(11) NOT NULL,
  `l_from` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `l_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `l_to` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`l_from`,`l_file`,`l_type`,`l_to`),
  UNIQUE KEY `wt_link_ix1` (`l_to`,`l_file`,`l_type`,`l_from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_link`
--

LOCK TABLES `wt_link` WRITE;
/*!40000 ALTER TABLE `wt_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_log`
--

DROP TABLE IF EXISTS `wt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_type` enum('auth','config','debug','edit','error','media','search') COLLATE utf8_unicode_ci NOT NULL,
  `log_message` text COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `wt_log_ix1` (`log_time`),
  KEY `wt_log_ix2` (`log_type`),
  KEY `wt_log_ix3` (`ip_address`),
  KEY `wt_log_fk1` (`user_id`),
  KEY `wt_log_fk2` (`gedcom_id`),
  CONSTRAINT `wt_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  CONSTRAINT `wt_log_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_log`
--

LOCK TABLES `wt_log` WRITE;
/*!40000 ALTER TABLE `wt_log` DISABLE KEYS */;
INSERT INTO `wt_log` VALUES (1,'2016-10-30 23:05:41','config','Site setting \"INDEX_DIRECTORY\" set to \"data/\"','172.22.0.1',NULL,NULL),(2,'2016-10-30 23:05:41','config','Site setting \"USE_REGISTRATION_MODULE\" set to \"1\"','172.22.0.1',NULL,NULL),(3,'2016-10-30 23:05:41','config','Site setting \"ALLOW_USER_THEMES\" set to \"1\"','172.22.0.1',NULL,NULL),(4,'2016-10-30 23:05:41','config','Site setting \"ALLOW_CHANGE_GEDCOM\" set to \"1\"','172.22.0.1',NULL,NULL),(5,'2016-10-30 23:05:41','config','Site setting \"SESSION_TIME\" set to \"7200\"','172.22.0.1',NULL,NULL),(6,'2016-10-30 23:05:41','config','Site setting \"SMTP_ACTIVE\" set to \"internal\"','172.22.0.1',NULL,NULL),(7,'2016-10-30 23:05:41','config','Site setting \"SMTP_HOST\" set to \"localhost\"','172.22.0.1',NULL,NULL),(8,'2016-10-30 23:05:41','config','Site setting \"SMTP_PORT\" set to \"25\"','172.22.0.1',NULL,NULL),(9,'2016-10-30 23:05:41','config','Site setting \"SMTP_AUTH\" set to \"1\"','172.22.0.1',NULL,NULL),(10,'2016-10-30 23:05:41','config','Site setting \"SMTP_SSL\" set to \"none\"','172.22.0.1',NULL,NULL),(11,'2016-10-30 23:05:41','config','Site setting \"SMTP_HELO\" set to \"localhost\"','172.22.0.1',NULL,NULL),(12,'2016-10-30 23:05:41','config','Site setting \"SMTP_FROM_NAME\" set to \"localhost\"','172.22.0.1',NULL,NULL),(13,'2016-10-30 23:05:41','config','Site setting \"FV_SCHEMA_VERSION\" set to \"1\"','172.22.0.1',NULL,NULL),(14,'2016-10-30 23:05:41','config','Site setting \"FV_SCHEMA_VERSION\" set to \"2\"','172.22.0.1',NULL,NULL),(15,'2016-10-30 23:05:42','config','Site setting \"FV_SCHEMA_VERSION\" set to \"3\"','172.22.0.1',NULL,NULL),(16,'2016-10-30 23:05:42','config','Site setting \"FV_SCHEMA_VERSION\" set to \"4\"','172.22.0.1',NULL,NULL),(17,'2016-10-30 23:05:42','config','Site setting \"NB_SCHEMA_VERSION\" set to \"1\"','172.22.0.1',NULL,NULL),(18,'2016-10-30 23:05:42','config','Site setting \"NB_SCHEMA_VERSION\" set to \"2\"','172.22.0.1',NULL,NULL),(19,'2016-10-30 23:05:42','config','Site setting \"NB_SCHEMA_VERSION\" set to \"3\"','172.22.0.1',NULL,NULL),(20,'2016-10-30 23:05:42','config','Site setting \"WT_SCHEMA_VERSION\" set to \"1\"','172.22.0.1',NULL,NULL),(21,'2016-10-30 23:05:42','config','Site setting \"WT_SCHEMA_VERSION\" set to \"2\"','172.22.0.1',NULL,NULL),(22,'2016-10-30 23:05:42','config','Site setting \"WT_SCHEMA_VERSION\" set to \"3\"','172.22.0.1',NULL,NULL),(23,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"4\"','172.22.0.1',NULL,NULL),(24,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"5\"','172.22.0.1',NULL,NULL),(25,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"6\"','172.22.0.1',NULL,NULL),(26,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"7\"','172.22.0.1',NULL,NULL),(27,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"8\"','172.22.0.1',NULL,NULL),(28,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"9\"','172.22.0.1',NULL,NULL),(29,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"10\"','172.22.0.1',NULL,NULL),(30,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"11\"','172.22.0.1',NULL,NULL),(31,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"12\"','172.22.0.1',NULL,NULL),(32,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"13\"','172.22.0.1',NULL,NULL),(33,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"14\"','172.22.0.1',NULL,NULL),(34,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"15\"','172.22.0.1',NULL,NULL),(35,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"16\"','172.22.0.1',NULL,NULL),(36,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"17\"','172.22.0.1',NULL,NULL),(37,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"18\"','172.22.0.1',NULL,NULL),(38,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"19\"','172.22.0.1',NULL,NULL),(39,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"20\"','172.22.0.1',NULL,NULL),(40,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"21\"','172.22.0.1',NULL,NULL),(41,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"22\"','172.22.0.1',NULL,NULL),(42,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"23\"','172.22.0.1',NULL,NULL),(43,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"24\"','172.22.0.1',NULL,NULL),(44,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"25\"','172.22.0.1',NULL,NULL),(45,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"26\"','172.22.0.1',NULL,NULL),(46,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"27\"','172.22.0.1',NULL,NULL),(47,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"28\"','172.22.0.1',NULL,NULL),(48,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"29\"','172.22.0.1',NULL,NULL),(49,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"30\"','172.22.0.1',NULL,NULL),(50,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"31\"','172.22.0.1',NULL,NULL),(51,'2016-10-30 23:05:43','config','Site setting \"WT_SCHEMA_VERSION\" set to \"32\"','172.22.0.1',NULL,NULL),(52,'2016-10-30 23:05:56','auth','Login: admin/admin','172.22.0.1',1,NULL),(53,'2016-10-30 23:05:57','config','Site setting \"LATEST_WT_VERSION\" set to \"1.7.8|1.0.0|https://launchpad.net/webtrees/1.7/1.7.8/+download/webtrees-1.7.8.zip\"','172.22.0.1',1,NULL),(54,'2016-10-30 23:05:57','config','Site setting \"LATEST_WT_VERSION_TIMESTAMP\" set to \"1477868756\"','172.22.0.1',1,NULL);
/*!40000 ALTER TABLE `wt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_media`
--

DROP TABLE IF EXISTS `wt_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_media` (
  `m_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `m_ext` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `m_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `m_titl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `m_filename` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `m_file` int(11) NOT NULL,
  `m_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`m_file`,`m_id`),
  UNIQUE KEY `wt_media_ix1` (`m_id`,`m_file`),
  KEY `wt_media_ix2` (`m_ext`,`m_type`),
  KEY `wt_media_ix3` (`m_titl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_media`
--

LOCK TABLES `wt_media` WRITE;
/*!40000 ALTER TABLE `wt_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_message`
--

DROP TABLE IF EXISTS `wt_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `wt_message_fk1` (`user_id`),
  CONSTRAINT `wt_message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_message`
--

LOCK TABLES `wt_message` WRITE;
/*!40000 ALTER TABLE `wt_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module`
--

DROP TABLE IF EXISTS `wt_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `tab_order` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `sidebar_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module`
--

LOCK TABLES `wt_module` WRITE;
/*!40000 ALTER TABLE `wt_module` DISABLE KEYS */;
INSERT INTO `wt_module` VALUES ('ahnentafel_report','enabled',NULL,NULL,NULL),('batch_update','enabled',NULL,NULL,NULL),('bdm_report','enabled',NULL,NULL,NULL),('birth_report','enabled',NULL,NULL,NULL),('cemetery_report','enabled',NULL,NULL,NULL),('change_report','enabled',NULL,NULL,NULL),('charts','enabled',NULL,NULL,NULL),('ckeditor','enabled',NULL,NULL,NULL),('clippings','enabled',NULL,20,60),('death_report','enabled',NULL,NULL,NULL),('descendancy','enabled',NULL,NULL,30),('descendancy_report','enabled',NULL,NULL,NULL),('extra_info','enabled',NULL,NULL,10),('fact_sources','enabled',NULL,NULL,NULL),('families','enabled',NULL,NULL,50),('family_group_report','enabled',NULL,NULL,NULL),('family_nav','enabled',NULL,NULL,20),('faq','enabled',NULL,40,NULL),('gedcom_block','enabled',NULL,NULL,NULL),('gedcom_favorites','enabled',NULL,NULL,NULL),('gedcom_news','enabled',NULL,NULL,NULL),('gedcom_stats','enabled',NULL,NULL,NULL),('GEDFact_assistant','enabled',NULL,NULL,NULL),('googlemap','enabled',80,NULL,NULL),('html','enabled',NULL,NULL,NULL),('individual_ext_report','enabled',NULL,NULL,NULL),('individual_report','enabled',NULL,NULL,NULL),('individuals','enabled',NULL,NULL,40),('lightbox','enabled',60,NULL,NULL),('logged_in','enabled',NULL,NULL,NULL),('login_block','enabled',NULL,NULL,NULL),('marriage_report','enabled',NULL,NULL,NULL),('media','enabled',50,NULL,NULL),('missing_facts_report','enabled',NULL,NULL,NULL),('notes','enabled',40,NULL,NULL),('occupation_report','enabled',NULL,NULL,NULL),('page_menu','enabled',NULL,10,NULL),('pedigree_report','enabled',NULL,NULL,NULL),('personal_facts','enabled',10,NULL,NULL),('random_media','enabled',NULL,NULL,NULL),('recent_changes','enabled',NULL,NULL,NULL),('relative_ext_report','enabled',NULL,NULL,NULL),('relatives','enabled',20,NULL,NULL),('review_changes','enabled',NULL,NULL,NULL),('sitemap','enabled',NULL,NULL,NULL),('sources_tab','enabled',30,NULL,NULL),('stories','enabled',55,30,NULL),('theme_select','enabled',NULL,NULL,NULL),('todays_events','enabled',NULL,NULL,NULL),('todo','enabled',NULL,NULL,NULL),('top10_givnnames','enabled',NULL,NULL,NULL),('top10_pageviews','enabled',NULL,NULL,NULL),('top10_surnames','enabled',NULL,NULL,NULL),('tree','enabled',68,NULL,NULL),('upcoming_events','enabled',NULL,NULL,NULL),('user_blog','enabled',NULL,NULL,NULL),('user_favorites','enabled',NULL,NULL,NULL),('user_messages','enabled',NULL,NULL,NULL),('user_welcome','enabled',NULL,NULL,NULL),('yahrzeit','enabled',NULL,NULL,NULL);
/*!40000 ALTER TABLE `wt_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module_privacy`
--

DROP TABLE IF EXISTS `wt_module_privacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module_privacy` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `component` enum('block','chart','menu','report','sidebar','tab','theme') COLLATE utf8_unicode_ci NOT NULL,
  `access_level` tinyint(4) NOT NULL,
  PRIMARY KEY (`module_name`,`gedcom_id`,`component`),
  KEY `wt_module_privacy_fk2` (`gedcom_id`),
  CONSTRAINT `wt_module_privacy_ibfk_1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`),
  CONSTRAINT `wt_module_privacy_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module_privacy`
--

LOCK TABLES `wt_module_privacy` WRITE;
/*!40000 ALTER TABLE `wt_module_privacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_module_privacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_module_setting`
--

DROP TABLE IF EXISTS `wt_module_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_module_setting` (
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`module_name`,`setting_name`),
  CONSTRAINT `wt_module_setting_ibfk_1` FOREIGN KEY (`module_name`) REFERENCES `wt_module` (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_module_setting`
--

LOCK TABLES `wt_module_setting` WRITE;
/*!40000 ALTER TABLE `wt_module_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_module_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_name`
--

DROP TABLE IF EXISTS `wt_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_name` (
  `n_file` int(11) NOT NULL,
  `n_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `n_num` int(11) NOT NULL,
  `n_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `n_sort` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_full` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `n_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_surn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_givn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_givn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_surn_std` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_givn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `n_soundex_surn_dm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`n_id`,`n_file`,`n_num`),
  KEY `wt_name_ix1` (`n_full`,`n_id`,`n_file`),
  KEY `wt_name_ix2` (`n_surn`,`n_file`,`n_type`,`n_id`),
  KEY `wt_name_ix3` (`n_givn`,`n_file`,`n_type`,`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_name`
--

LOCK TABLES `wt_name` WRITE;
/*!40000 ALTER TABLE `wt_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_news`
--

DROP TABLE IF EXISTS `wt_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `gedcom_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`news_id`),
  KEY `news_ix1` (`user_id`,`updated`),
  KEY `news_ix2` (`gedcom_id`,`updated`),
  CONSTRAINT `wt_news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `wt_news_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_news`
--

LOCK TABLES `wt_news` WRITE;
/*!40000 ALTER TABLE `wt_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_next_id`
--

DROP TABLE IF EXISTS `wt_next_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_next_id` (
  `gedcom_id` int(11) NOT NULL,
  `record_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `next_id` decimal(20,0) NOT NULL,
  PRIMARY KEY (`gedcom_id`,`record_type`),
  CONSTRAINT `wt_next_id_ibfk_1` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_next_id`
--

LOCK TABLES `wt_next_id` WRITE;
/*!40000 ALTER TABLE `wt_next_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_next_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_other`
--

DROP TABLE IF EXISTS `wt_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_other` (
  `o_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `o_file` int(11) NOT NULL,
  `o_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `o_gedcom` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`o_id`,`o_file`),
  UNIQUE KEY `wt_other_ix1` (`o_file`,`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_other`
--

LOCK TABLES `wt_other` WRITE;
/*!40000 ALTER TABLE `wt_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_placelinks`
--

DROP TABLE IF EXISTS `wt_placelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_placelinks` (
  `pl_p_id` int(11) NOT NULL,
  `pl_gid` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `pl_file` int(11) NOT NULL,
  PRIMARY KEY (`pl_p_id`,`pl_gid`,`pl_file`),
  KEY `wt_placelinks_ix1` (`pl_p_id`),
  KEY `wt_placelinks_ix2` (`pl_gid`),
  KEY `wt_placelinks_ix3` (`pl_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_placelinks`
--

LOCK TABLES `wt_placelinks` WRITE;
/*!40000 ALTER TABLE `wt_placelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_placelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_places`
--

DROP TABLE IF EXISTS `wt_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_places` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_place` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `p_parent_id` int(11) DEFAULT NULL,
  `p_file` int(11) NOT NULL,
  `p_std_soundex` text COLLATE utf8_unicode_ci,
  `p_dm_soundex` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `wt_places_ix2` (`p_parent_id`,`p_file`,`p_place`),
  KEY `wt_places_ix1` (`p_file`,`p_place`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_places`
--

LOCK TABLES `wt_places` WRITE;
/*!40000 ALTER TABLE `wt_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_session`
--

DROP TABLE IF EXISTS `wt_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_session` (
  `session_id` char(128) COLLATE utf8_unicode_ci NOT NULL,
  `session_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` mediumblob NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `ix1` (`session_time`),
  KEY `ix2` (`user_id`,`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_session`
--

LOCK TABLES `wt_session` WRITE;
/*!40000 ALTER TABLE `wt_session` DISABLE KEYS */;
INSERT INTO `wt_session` VALUES ('71ea17ecb3e226280efb19047104ea1c','2016-10-30 23:05:00',0,'172.22.0.1','initiated|b:1;locale|s:5:\"en-US\";activity_time|i:1477868743;theme_id|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"OdyysuSSDyE8FJwlZQcdhsZ8EoNEj6n3\";'),('b3c94aae2058dae39e042927c6e62318','2016-10-30 23:06:00',1,'172.22.0.1','initiated|b:1;locale|s:2:\"de\";activity_time|i:1477868743;theme_id|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"OdyysuSSDyE8FJwlZQcdhsZ8EoNEj6n3\";wt_user|s:1:\"1\";'),('e8fdb373e1ba41b8df61f0e25c8bb5d4','2016-10-30 23:07:00',0,'172.22.0.1','initiated|b:1;locale|s:5:\"en-US\";activity_time|i:1477868853;theme_id|s:8:\"webtrees\";CSRF_TOKEN|s:32:\"lMf2n7OrSz2E0ThR7YAxIV5FubTDPPWF\";');
/*!40000 ALTER TABLE `wt_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_site_access_rule`
--

DROP TABLE IF EXISTS `wt_site_access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_site_access_rule` (
  `site_access_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address_start` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address_end` int(10) unsigned NOT NULL DEFAULT '4294967295',
  `user_agent_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rule` enum('allow','deny','robot','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_access_rule_id`),
  UNIQUE KEY `wt_site_access_rule_ix1` (`ip_address_end`,`ip_address_start`,`user_agent_pattern`,`rule`),
  KEY `wt_site_access_rule_ix2` (`rule`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_site_access_rule`
--

LOCK TABLES `wt_site_access_rule` WRITE;
/*!40000 ALTER TABLE `wt_site_access_rule` DISABLE KEYS */;
INSERT INTO `wt_site_access_rule` VALUES (1,0,4294967295,'Mozilla/5.0 (%) Gecko/% %/%','allow','Gecko-based browsers','2016-10-30 23:05:43'),(2,0,4294967295,'Mozilla/5.0 (%) AppleWebKit/% (KHTML, like Gecko)%','allow','WebKit-based browsers','2016-10-30 23:05:43'),(3,0,4294967295,'Opera/% (%) Presto/% Version/%','allow','Presto-based browsers','2016-10-30 23:05:43'),(4,0,4294967295,'Mozilla/% (compatible; MSIE %','allow','Trident-based browsers','2016-10-30 23:05:43'),(5,0,4294967295,'Mozilla/5.0 (% Konqueror/%','allow','Konqueror browser','2016-10-30 23:05:43'),(6,0,4294967295,'Mozilla/% (Windows%; Trident%; rv:%) like Gecko','allow','Modern Internet Explorer','2016-10-30 23:05:43');
/*!40000 ALTER TABLE `wt_site_access_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_site_setting`
--

DROP TABLE IF EXISTS `wt_site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_site_setting` (
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_site_setting`
--

LOCK TABLES `wt_site_setting` WRITE;
/*!40000 ALTER TABLE `wt_site_setting` DISABLE KEYS */;
INSERT INTO `wt_site_setting` VALUES ('ALLOW_CHANGE_GEDCOM','1'),('ALLOW_USER_THEMES','1'),('FV_SCHEMA_VERSION','4'),('INDEX_DIRECTORY','data/'),('LATEST_WT_VERSION','1.7.8|1.0.0|https://launchpad.net/webtrees/1.7/1.7.8/+download/webtrees-1.7.8.zip'),('LATEST_WT_VERSION_TIMESTAMP','1477868756'),('NB_SCHEMA_VERSION','3'),('SESSION_TIME','7200'),('SMTP_ACTIVE','internal'),('SMTP_AUTH','1'),('SMTP_FROM_NAME','localhost'),('SMTP_HELO','localhost'),('SMTP_HOST','localhost'),('SMTP_PORT','25'),('SMTP_SSL','none'),('USE_REGISTRATION_MODULE','1'),('WT_SCHEMA_VERSION','32');
/*!40000 ALTER TABLE `wt_site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_sources`
--

DROP TABLE IF EXISTS `wt_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_sources` (
  `s_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `s_file` int(11) NOT NULL,
  `s_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `s_gedcom` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`s_id`,`s_file`),
  UNIQUE KEY `wt_sources_ix1` (`s_file`,`s_id`),
  KEY `wt_sources_ix2` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_sources`
--

LOCK TABLES `wt_sources` WRITE;
/*!40000 ALTER TABLE `wt_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user`
--

DROP TABLE IF EXISTS `wt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `wt_user_ix1` (`user_name`),
  UNIQUE KEY `wt_user_ix2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user`
--

LOCK TABLES `wt_user` WRITE;
/*!40000 ALTER TABLE `wt_user` DISABLE KEYS */;
INSERT INTO `wt_user` VALUES (-1,'DEFAULT_USER','DEFAULT_USER','DEFAULT_USER','DEFAULT_USER'),(1,'admin','admin','admin@change.me','$2y$10$M5PB/Y1yHuNyaKzTlW4Li.twtCiCsK6lyi0T.vHoucW2k5p70wcX2');
/*!40000 ALTER TABLE `wt_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user_gedcom_setting`
--

DROP TABLE IF EXISTS `wt_user_gedcom_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user_gedcom_setting` (
  `user_id` int(11) NOT NULL,
  `gedcom_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`gedcom_id`,`setting_name`),
  KEY `wt_user_gedcom_setting_fk2` (`gedcom_id`),
  CONSTRAINT `wt_user_gedcom_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`),
  CONSTRAINT `wt_user_gedcom_setting_ibfk_2` FOREIGN KEY (`gedcom_id`) REFERENCES `wt_gedcom` (`gedcom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user_gedcom_setting`
--

LOCK TABLES `wt_user_gedcom_setting` WRITE;
/*!40000 ALTER TABLE `wt_user_gedcom_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `wt_user_gedcom_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wt_user_setting`
--

DROP TABLE IF EXISTS `wt_user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wt_user_setting` (
  `user_id` int(11) NOT NULL,
  `setting_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`setting_name`),
  CONSTRAINT `wt_user_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wt_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wt_user_setting`
--

LOCK TABLES `wt_user_setting` WRITE;
/*!40000 ALTER TABLE `wt_user_setting` DISABLE KEYS */;
INSERT INTO `wt_user_setting` VALUES (1,'auto_accept','0'),(1,'canadmin','1'),(1,'language','de'),(1,'verified','1'),(1,'verified_by_admin','1'),(1,'visibleonline','1');
/*!40000 ALTER TABLE `wt_user_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-30 23:08:28
