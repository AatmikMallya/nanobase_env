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
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Structures`;

CREATE TABLE `Structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryName` varchar(32) DEFAULT NULL,
  `moleculeType` varchar(32) DEFAULT NULL,
  `applicationType` varchar(32) DEFAULT NULL,
  `modifications` varchar(32) DEFAULT NULL,
  `datePublished` date DEFAULT NULL,
  `dateUploaded` date DEFAULT NULL,
  `uploaderName` varchar(32) DEFAULT NULL,
  `publicationCitation` varchar(32) DEFAULT NULL,
  `publicationAuthors` varchar(32) DEFAULT NULL,
  `univFormatStruct` varchar(32) DEFAULT NULL,
  `licensingInfo` varchar(32) DEFAULT NULL,
  `structSize` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `additionalTags` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `MoleculeType`;

CREATE TABLE `MoleculeType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `molecType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `MoleculeTypeJoin`;

CREATE TABLE `MoleculeTypeJoin` (
  `molecTypeId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ApplicationType`;

CREATE TABLE `ApplicationType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ApplicationTypeJoin`;

CREATE TABLE `ApplicationTypeJoin` (
  `appTypeId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Modifications`;

CREATE TABLE `Modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ModificationsJoin`;

CREATE TABLE `ModificationsJoin` (
  `modId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `PublicationAuthors`;

CREATE TABLE `PublicationAuthors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `PublicationAuthorsJoin`;

CREATE TABLE `PublicationAuthorsJoin` (
  `pubAuthorId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `AdditionalTags`;

CREATE TABLE `AdditionalTags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `AdditionalTagsJoin`;

CREATE TABLE `AdditionalTagsJoin` (
  `tagId` int(11) DEFAULT NULL,
  `entryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;