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
  -- Structure info
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  -- Publication info
  `publishDate` date DEFAULT NULL,
  `citation` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `licensing` varchar(32) DEFAULT NULL,
  -- Files
  `structureFiles` varchar(255) DEFAULT NULL,
  `expProtocolFiles` varchar(255) DEFAULT NULL,
  `expResultsFiles` varchar(255) DEFAULT NULL,
  `simProtocolFiles` varchar(255) DEFAULT NULL,
  `simResultsFiles` varchar(255) DEFAULT NULL,
  `imageFiles` varchar(255) DEFAULT NULL,
  `displayImage` varchar(64) DEFAULT NULL,
  -- File Descriptions
  `structureDescriptions` varchar(1010) DEFAULT NULL,
  `expProtocolDescriptions` varchar(1010) DEFAULT NULL,
  `expResultsDescriptions` varchar(1010) DEFAULT NULL,
  `simProtocolDescriptions` varchar(1010) DEFAULT NULL,
  `simResultsDescriptions` varchar(1010) DEFAULT NULL,
  `imageDescriptions` varchar(1010) DEFAULT NULL,
  -- Misc
  `private` tinyint(1) DEFAULT NULL,
  `uploadDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Tag tables
DROP TABLE IF EXISTS `Applications`;
CREATE TABLE `Applications` (
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
DROP TABLE IF EXISTS `ApplicationsJoin`;
CREATE TABLE `ApplicationsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `applicationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ModificationsJoin`;
CREATE TABLE `ModificationsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `modificationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `KeywordsJoin`;
CREATE TABLE `KeywordsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `keywordId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `AuthorsJoin`;
CREATE TABLE `AuthorsJoin` (
  `structureId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';


-- File Joins
-- DROP TABLE IF EXISTS `structureFilesJoin`;
-- CREATE TABLE `structureFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `structureFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP TABLE IF EXISTS `ExpProtocolFilesJoin`;
-- CREATE TABLE `ExpProtocolFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `expProtocolFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP TABLE IF EXISTS `ExpResultsFilesJoin`;
-- CREATE TABLE `ExpResultsFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `expResultsFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP TABLE IF EXISTS `SimProtocolFilesJoin`;
-- CREATE TABLE `SimProtocolFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `simProtocolFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP TABLE IF EXISTS `SimResultsFilesJoin`;
-- CREATE TABLE `SimResultsFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `simResultsFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DROP TABLE IF EXISTS `ImageFilesJoin`;
-- CREATE TABLE `ImageFilesJoin` (
--   `structureId` int(11) DEFAULT NULL,
--   `imageFile` varchar(32) DEFAULT NULL,
--   `description` varchar(300) DEFAULT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
