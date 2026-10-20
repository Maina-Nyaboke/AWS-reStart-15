-- =============================================================================
-- AWS Data Architecture Lab: Advanced Data Retrieval and Projections
-- Target Database Engine: MySQL / MariaDB Local or Remote Configuration
-- =============================================================================

-- Task 2: Multi-Tier Query Projections and Alias Mappings
USE world;

-- Verify baseline database availability
SHOW DATABASES;

-- Complete table extraction scan (Unrestricted Projection)
SELECT * FROM world.country;

-- Aggregate function execution counting total row elements
SELECT COUNT(*) FROM world.country;

-- Audit schema constraints to parse attribute names
SHOW COLUMNS FROM world.country;

-- Granular column subset projection extraction
SELECT Name, Capital, Region, SurfaceArea, Population FROM world.country;

-- Implementing user-friendly data mapping using column aliasing (AS)
SELECT Name, Capital, Region, SurfaceArea AS "Surface Area", Population FROM world.country;

-- Orchestrating default ascending sorted results (ORDER BY)
SELECT Name, Capital, Region, SurfaceArea AS "Surface Area", Population FROM world.country ORDER BY Population;

-- Enforcing inverse state sorting (ORDER BY DESC)
SELECT Name, Capital, Region, SurfaceArea AS "Surface Area", Population FROM world.country ORDER BY Population DESC;


-- Task 3: Filtering States using Conditional Expressions (WHERE)
-- Restricting records to population limits greater than 50 Million
SELECT Name, Capital, Region, SurfaceArea AS "Surface Area", Population FROM world.country WHERE Population > 50000000 ORDER BY Population DESC;

-- Multi-conditional logical evaluation requiring both expressions to evaluate true (AND)
SELECT Name, Capital, Region, SurfaceArea AS "Surface Area", Population FROM world.country WHERE Population > 50000000 AND Population < 100000000 ORDER BY Population DESC;


-- 🎯 Capstone Challenge Resolution: Isolate Southern Europe Infrastructure
-- Query parameters: Region must match 'Southern Europe' and Population must exceed 50 Million
SELECT Name, Region, Population FROM world.country WHERE Region = 'Southern Europe' AND Population > 50000000;
-- Expected Output Winner: Italy
