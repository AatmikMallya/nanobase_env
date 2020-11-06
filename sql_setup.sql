USE nanobase;

DROP TABLE IF EXISTS `Jobs`;
CREATE TABLE `Jobs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `uuid` varchar(64) DEFAULT NULL,
  `slurmId` varchar(16) DEFAULT NULL,
  `jobType` int(2) DEFAULT 0,
  `simJobId` varchar(64) DEFAULT NULL,
  `creationDate` varchar(32) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(32) NOT NULL DEFAULT '',
  `lastName` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `institution` varchar(32) NOT NULL DEFAULT '', 
  `password` varchar(64) NOT NULL DEFAULT '',
  `creationDate` varchar(32) NOT NULL DEFAULT '',
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `privileged` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `verifycode` varchar(32) NOT NULL DEFAULT '',
  `resetToken` varchar(64) DEFAULT NULL,
  `resetTokenExpiration` int(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Structures`;
CREATE TABLE `Structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `molecule` varchar(32) DEFAULT NULL,
  `application` varchar(255) DEFAULT NULL,
  `modifications` varchar(255) DEFAULT NULL,
  `keywords` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `authors` text(511) DEFAULT NULL,
  `datePublished` date DEFAULT NULL,
  `citation` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `licensing` varchar(32) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `dateUpload` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Tag tables
DROP TABLE IF EXISTS `Application`;
CREATE TABLE `Application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Modifications`;
CREATE TABLE `Modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modification` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Keywords`;
CREATE TABLE `Keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Join tables
DROP TABLE IF EXISTS `ApplicationJoin`;
CREATE TABLE `ApplicationJoin` (
  `structureId` int(11) DEFAULT NULL,
  `appplicationId` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ModificationsJoin`;
CREATE TABLE `ModificationsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `modificationId` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `KeywordsJoin`;
CREATE TABLE `KeywordsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `keywordId` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `AuthorsJoin`;
CREATE TABLE `AuthorsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- File Joins
DROP TABLE IF EXISTS `structureFilesJoin`;
CREATE TABLE `structureFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `structureFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ExpProtocolFilesJoin`;
CREATE TABLE `ExpProtocolFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `expProtocolFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ExpResultsFilesJoin`;
CREATE TABLE `ExpResultsFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `expResultsFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `SimProtocolFilesJoin`;
CREATE TABLE `SimProtocolFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `simProtocolFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `SimResultsFilesJoin`;
CREATE TABLE `SimResultsFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `simResultsFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ImageFilesJoin`;
CREATE TABLE `ImageFilesJoin` (
  `structureId` int(11) DEFAULT NULL,
  `imageFile` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
