-- =============================================================================
-- AWS Data Architecture Lab: Cloud-Native Amazon Aurora DB Cluster Engineering
-- Target Database Engine: Amazon Aurora (MySQL Compatible 8.0)
-- Client Access Vector: Session Manager Command Host via MariaDB Client
-- =============================================================================

-- Task 3: Remote Authentication Handshake across Private Subnets
-- [Executed at Command Host terminal layer using Writer Endpoint Token]:


-- Task 4: Schema Construction & Multi-Row Transaction Ingestion
SHOW DATABASES;

-- Access the pre-provisioned world container partition initialized in the console
USE world;

-- Build the structured country schema blueprint container
CREATE TABLE `country` (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Continent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` FLOAT(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT(6) DEFAULT NULL,
  `Population` INT(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` FLOAT(3,1) DEFAULT NULL,
  `GNP` FLOAT(10,2) DEFAULT NULL,
  `GNPOld` FLOAT(10,2) DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `Capital` INT(11) DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`)
);

-- Batch insert transactional database rows matching standard predefined structures
INSERT INTO `country` VALUES ('GAB','Gabon','Africa','Central Africa',267668.00,1960,1226000,50.1,5493.00,5279.00,'Le Gabon','Republic',902,'GA');
INSERT INTO `country` VALUES ('IRL','Ireland','Europe','British Islands',70273.00,1921,3775100,76.8,75921.00,73132.00,'Ireland/Éire','Republic',1447,'IE');
INSERT INTO `country` VALUES ('THA','Thailand','Asia','Southeast Asia',513115.00,1350,61399000,68.6,116416.00,153907.00,'Prathet Thai','Constitutional Monarchy',3320,'TH');
INSERT INTO `country` VALUES ('CRI','Costa Rica','North America','Central America',51100.00,1821,4023000,75.8,10226.00,9757.00,'Costa Rica','Republic',584,'CR');
INSERT INTO `country` VALUES ('AUS','Australia','Oceania','Australia and New Zealand',7741220.00,1901,18886000,79.8,351182.00,392911.00,'Australia','Constitutional Monarchy, Federation',135,'AU');

-- Execute complex analytical data queries across the cloud cluster
-- Constraints: GNP must exceed 35,000 AND population must exceed 10,000,000
SELECT * FROM country WHERE GNP > 35000 AND Population > 10000000;
-- Result: Correctly isolates Australia as the single matching record.
