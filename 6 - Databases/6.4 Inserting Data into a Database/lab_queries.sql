-- =============================================================================
-- AWS Data Architecture Lab: Data Manipulation Language (DML) Operations
-- Target Database Engine: MySQL / MariaDB Local or Remote Configuration
-- =============================================================================

-- Task 2: Executing Granular Ingestion Records (Data Insertion)
USE world;

-- Query baseline to verify clean storage space
SELECT * FROM world.country;

-- Insert targeted country records matching predefined schema parameters
INSERT INTO world.country VALUES ('IRL','Ireland','Europe','British Islands',70273.00,1921,3775100,76.8,75921.00,73132.00,'Ireland/Éire','Republic',1447,'IE');
INSERT INTO world.country VALUES ('AUS','Australia','Oceania','Australia and New Zealand',7741220.00,1901,18886000,79.8,351182.00,392911.00,'Australia','Constitutional Monarchy, Federation',135,'AU');

-- Validate successful insertion using specific identifier filtering limits
SELECT * FROM world.country WHERE Code IN ('IRL', 'AUS');


-- Task 3: Executing Unconditional State Alterations (Data Updates)
-- Reset population column parameter globally across all records
UPDATE world.country SET Population = 0;
SELECT * FROM world.country;

-- Multi-column state modification without conditional WHERE constraints
UPDATE world.country SET Population = 100, SurfaceArea = 100;
SELECT * FROM world.country;


-- Task 4: Destructive State Purging Lifecycle (Data Deletion)
-- Temporarily disable constraint boundaries to clear data records cleanly
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM world.country;

-- Verify complete erasure of records while maintaining structural table container
SELECT * FROM world.country;


-- Task 5: Bulk Data Ingestion and Seeding via Backup Script Execution
-- [Executed at system shell prompt layer]:

-- Re-authenticate to verify structural migration seeding results
USE world;
SHOW TABLES;

-- Query seeded datasets to verify successful database population
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;
