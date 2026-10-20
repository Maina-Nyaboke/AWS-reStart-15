-- =============================================================================
-- AWS Data Architecture Lab: Built-in SQL Functions and Data Manipulation
-- Target Database Engine: MySQL / MariaDB Local or Remote Configuration
-- =============================================================================

USE world;

-- Verify baseline data matrix state
SHOW DATABASES;
SELECT * FROM world.country;

-- 1. Executing Mathematical Aggregate Metrics Functions
SELECT 
    SUM(Population) AS "Total Population", 
    AVG(Population) AS "Average Population", 
    MAX(Population) AS "Max Population", 
    MIN(Population) AS "Min Population", 
    COUNT(Population) AS "Total Records Recorded" 
FROM world.country;

-- 2. String Slicing and Token Traversal (SUBSTRING_INDEX)
-- Extracting the first word token from the Region text block where space delimiters occur
SELECT Region, SUBSTRING_INDEX(Region, " ", 1) AS "First Word" 
FROM world.country;

-- 3. Utilizing String Functions inside the Conditional Evaluation Layer (WHERE)
SELECT Name, Region 
FROM world.country 
WHERE SUBSTRING_INDEX(Region, " ", 1) = "Southern";

-- 4. Text Whitespace Sanitization and Length Character Counting (TRIM & LENGTH)
SELECT Region 
FROM world.country 
WHERE LENGTH(TRIM(Region)) < 10;

-- 5. De-duplicating Result Streams via Set Unique Constraints (DISTINCT)
SELECT DISTINCT(Region) 
FROM world.country 
WHERE LENGTH(TRIM(Region)) < 10;


-- Capstone Challenge Resolution: String Dissection Strategy
-- Requirement: Extract 'Micronesian/Caribbean' records and split the text into two distinct columns
SELECT 
    Name,
    Region,
    SUBSTRING_INDEX(Region, '/', 1) AS "Region Name 1",
    SUBSTRING_INDEX(Region, '/', -1) AS "Region Name 2"
FROM world.country 
WHERE Region LIKE "%Micronesian/Caribbean%";
