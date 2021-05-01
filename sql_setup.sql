USE nanobase;

SET global sql_mode='';

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
  `title` varchar(128) DEFAULT NULL,
  `type` TEXT DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `size` int(32) DEFAULT NULL,
  -- Publication info
  `publishDate` date DEFAULT NULL,
  `citation` TEXT DEFAULT NULL,
  `link` TEXT DEFAULT NULL,
  `licensing` TEXT DEFAULT NULL,
  -- Files (10 files * 128 chars/filename + 10 separators + 2 prefix)
  `structureFiles` TEXT DEFAULT NULL,
  `expProtocolFiles` TEXT DEFAULT NULL,
  `expResultsFiles` TEXT DEFAULT NULL,
  `simProtocolFiles` TEXT DEFAULT NULL,
  `simResultsFiles` TEXT DEFAULT NULL,
  `imageFiles` TEXT DEFAULT NULL,
  `displayImage` TEXT DEFAULT NULL,
  -- File Descriptions (10 descriptions * 128 chars/description + 10 separators + 2 prefix)
  `structureDescriptions` TEXT DEFAULT NULL,
  `expProtocolDescriptions` TEXT DEFAULT NULL,
  `expResultsDescriptions` TEXT DEFAULT NULL,
  `simProtocolDescriptions` TEXT DEFAULT NULL,
  `simResultsDescriptions` TEXT DEFAULT NULL,
  `imageDescriptions` TEXT DEFAULT NULL,
  -- Misc
  `private` tinyint(1) DEFAULT NULL,
  `uploadDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ALTER TABLE Structures MODIFY id int(11) NOT NULL AUTO_INCREMENT;
-- ALTER TABLE Structures MODIFY userId int(11) DEFAULT NULL;
-- ALTER TABLE Structures MODIFY title varchar(128) DEFAULT NULL;
-- ALTER TABLE Structures MODIFY type TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY description TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY size int(32) DEFAULT NULL;
-- ALTER TABLE Structures MODIFY publishDate date DEFAULT NULL;
-- ALTER TABLE Structures MODIFY citation TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY link TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY licensing TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY structureFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY expProtocolFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY expResultsFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY simProtocolFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY simResultsFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY imageFiles TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY displayImage TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY structureDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY expProtocolDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY expResultsDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY simProtocolDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY simResultsDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY imageDescriptions TEXT DEFAULT NULL;
-- ALTER TABLE Structures MODIFY private tinyint(1) DEFAULT NULL;
-- ALTER TABLE Structures MODIFY uploadDate date DEFAULT NULL;


-- Tag tables
DROP TABLE IF EXISTS `Applications`;
CREATE TABLE `Applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Modifications`;
CREATE TABLE `Modifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modification` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Keywords`;
CREATE TABLE `Keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` TEXT DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Authors`;
CREATE TABLE `Authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` TEXT DEFAULT NULL,
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

SET global sql_mode='';


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
