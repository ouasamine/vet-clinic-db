/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-12-2019';
SELECT * FROM animals WHERE escape_attempts<3;
SELECT * FROM animals WHERE name NOT IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;

UPDATE animals SET species='unspecified';

ROLLBACK;


BEGIN;

UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon' WHERE species IS NULL;

COMMIT;

SELECT * FROM animals;


BEGIN;

DELETE FROM animals;

ROLLBACK;


BEGIN;

DELETE FROM animals WHERE date_of_birth>'01-01-2022';
SAVEPOINT SP1;
UPDATE animals SET weight_kg=weight_kg*-1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg<0;

COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '01-01-1990' AND '01-01-2000' GROUP BY species;
