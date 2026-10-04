-- =============================================================================
-- AWS Data Architecture Lab: Performing Conditional Searches & String Matching
-- Target Database Engine: MySQL / MariaDB Local or Remote Configuration
-- =============================================================================

USE world;

-- Verify baseline infrastructure state and tables
SHOW DATABASES;
SELECT * FROM world.country;

-- 1. Range Filtering using Traditional Comparison Operators (>= AND <=)
SELECT Name, Capital, Region, SurfaceArea, Population 
FROM world.country 
WHERE Population >= 50000000 AND Population <= 100000000;

-- 2. Optimizing Code Readability via Inclusive Range Syntax (BETWEEN)
SELECT Name, Capital, Region, SurfaceArea, Population 
FROM world.country 
WHERE Population BETWEEN 50000000 AND 100000000;

-- 3. Pattern Matching and Value Aggregation (LIKE Wildcard with SUM)
SELECT sum(Population) 
FROM world.country 
WHERE Region LIKE "%Europe%";

-- 4. Polishing Output Presentation Layouts using Column Aliasing (AS)
SELECT sum(population) as "Europe Population Total" 
FROM world.country 
WHERE region LIKE "%Europe%";

-- 5. Case-Insensitive Hardening via Lower-Case String Conversion Functions
SELECT Name, Capital, Region, SurfaceArea, Population 
FROM world.country 
WHERE LOWER(Region) LIKE "%central%";


-- Capstone Challenge Resolution: Aggregate North America Infrastructure Metrics
-- Consolidating both SUM calculations into a single query with descriptive column headers
SELECT 
    SUM(SurfaceArea) AS "North America Total Surface Area", 
    SUM(Population) AS "North America Total Population" 
FROM world.country 
WHERE Continent = 'North America';
