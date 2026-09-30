--  Initialize Database and Base Country Schema Layout
CREATE DATABASE world;
USE world;

CREATE TABLE world.country (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Conitinent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` FLOAT(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT(6) DEFAULT NULL,
  `Population` INT(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` FLOAT(3,1) DEFAULT NULL,
  `GNP` FLOAT(10,2) DEFAULT NULL,
  `GNPOld` FLOAT(10,2) DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR(60) DEFAULT NULL,
  `Capital` INT(11) DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`)
);

-- Audit initial schema properties to identify layout errors
SHOW COLUMNS FROM world.country;

-- Execute DDL Schema Migration Patch to correct column misspelling typo
ALTER TABLE world.country RENAME COLUMN Conitinent TO Continent;

-- Re-verify schema following structural alter command modification
SHOW COLUMNS FROM world.country;


-- 🎯 Challenge 1: Engineering the Standalone City Table Schema Layout
CREATE TABLE world.city (
  `Name` CHAR(50) NOT NULL DEFAULT '',
  `Region` CHAR(50) NOT NULL DEFAULT ''
);

-- Confirm registration of all tables inside active schema index database tree
SHOW TABLES;


-- Task 3: Infrastructure Teardown & Purging Lifecycle Operations
DROP TABLE world.city;

-- 🎯 Challenge 2: Execute Country Table Purge Drop Command
DROP TABLE world.country;

-- Verify full database index erasure
SHOW TABLES;
DROP DATABASE world;
SHOW DATABASES;
