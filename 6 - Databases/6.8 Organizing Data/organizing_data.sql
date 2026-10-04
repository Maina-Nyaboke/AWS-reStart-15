-- =============================================================================
-- AWS Data Architecture Lab: Advanced Data Organization & Analytical Windowing
-- Target Database Engine: MySQL / MariaDB Local or Remote Configuration
-- =============================================================================

USE world;

-- Verify baseline dataset state
SHOW DATABASES;
SELECT * FROM world.country;

-- 1. Standard Sorting using Explicit Filtering (ORDER BY DESC)
SELECT Region, Name, Population 
FROM world.country 
WHERE Region = 'Australia and New Zealand' 
ORDER BY Population DESC;

-- 2. Categorical Aggregation using Consolidated Grouping Blocks (GROUP BY)
SELECT Region, SUM(Population) 
FROM world.country 
WHERE Region = 'Australia and New Zealand' 
GROUP BY Region 
ORDER BY SUM(Population) DESC;

-- 3. Dynamic Cumulative Data Processing via Windowing Engines (SUM OVER)
SELECT 
    Region, 
    Name, 
    Population, 
    SUM(Population) OVER(PARTITION BY Region ORDER BY Population) AS 'Running Total' 
FROM world.country 
WHERE Region = 'Australia and New Zealand';

-- 4. Analytical Partition Auditing and Sequence Indexes (RANK OVER)
SELECT 
    Region, 
    Name, 
    Population, 
    SUM(Population) OVER(PARTITION BY Region ORDER BY Population) AS 'Running Total', 
    RANK() OVER(PARTITION BY Region ORDER BY Population) AS 'Ranked' 
FROM world.country 
WHERE Region = 'Australia and New Zealand';


-- Capstone Challenge Resolution: Multi-Region Macro Population Rankings
-- Requirement: Rank countries in EACH region by population from largest to smallest (DESC)
SELECT 
    Region,
    Name,
    Population,
    RANK() OVER(PARTITION BY Region ORDER BY Population DESC) AS 'Regional Rank'
FROM world.country;
