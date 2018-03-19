-- Damon Simpkinson
-- Week 10 Prove: DB Setup

-- Conditionally drop table if exists
DROP TABLE IF EXISTS system_user CASCADE;

-- Create table
CREATE TABLE system_user
( system_user_id        SERIAL         PRIMARY KEY
, system_user_name      VARCHAR(20)    UNIQUE NOT NULL
, first_name            VARCHAR(20)    NOT NULL
, last_name             VARCHAR(20)    NOT NULL);

-- Conditionally drop table if exists
DROP TABLE IF EXISTS themepark CASCADE;

-- Create table
CREATE TABLE themepark
( themepark_id               SERIAL         PRIMARY KEY
, themepark_group            VARCHAR(30)    NOT NULL
, themepark_name             VARCHAR(30)    NOT NULL
, themepark_display          VARCHAR(30)    NOT NULL
, themepark_city             VARCHAR(20)    NOT NULL
, themepark_state_province   VARCHAR(20)    NOT NULL
, themepark_country          VARCHAR(30)    NOT NULL);


-- Conditionally Drop table if exists
DROP TABLE IF EXISTS attraction CASCADE;

-- Create table
CREATE TABLE attraction
( attraction_id         SERIAL         PRIMARY KEY
, attraction_name       VARCHAR(30)    NOT NULL
, attraction_display    VARCHAR(30)    NOT NULL
, attraction_location   INTEGER        NOT NULL REFERENCES themepark(themepark_id));

-- Seed values into system user
INSERT INTO system_user
( system_user_name
, first_name
, last_name)
VALUES
( 'masterUser'
, 'Damon'
, 'Simpkinson');

-- Seed values into themepark
INSERT INTO themepark
( themepark_group
, themepark_name
, themepark_display
, themepark_city
, themepark_state_province
, themepark_country)
VALUES
( 'Walt Disney World'
, 'MAGIC_KINGDOM'
, 'Magic Kingdom'
, 'Orlando'
, 'Florida'
, 'United States')
,
( 'Walt Disney World'
, 'EPCOT'
, 'EPCOT'
, 'Orlando'
, 'Florida'
, 'United States')
,
( 'Walt Disney World'
, 'ANIMAL_KINGDOM'
, 'Animal Kingdom'
, 'Orlando'
, 'Florida'
, 'United States')
,
( 'Walt Disney World'
, 'HOLLYWOOD_STUDIOS'
, 'Hollywood Studios'
, 'Orlando'
, 'Florida'
, 'United States');

-- Seed values into attraction
INSERT INTO attraction
( attraction_name
, attraction_display
, attraction_location)
VALUES
( 'SPACE_MOUNTAIN'
, 'Space Mountain'
, (SELECT themepark_id FROM themepark
  WHERE  themepark_name = 'MAGIC_KINGDOM'))
,
( 'THUNDER_MOUNTAIN'
, 'Big Thunder Mountain Railroad'
, (SELECT themepark_id FROM themepark
  WHERE themepark_name = 'MAGIC_KINGDOM'))
,
( 'TOWER_OF_TERROR'
, 'Tower of Terror'
, (SELECT themepark_id FROM themepark
  WHERE themepark_name = 'HOLLYWOOD_STUDIOS'))
,
( 'JUNGLE_CRUISE'
, 'The Jungle Cruise'
, (SELECT themepark_id FROM themepark
  WHERE themepark_name = 'MAGIC_KINGDOM'));
