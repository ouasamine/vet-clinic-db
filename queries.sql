/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '12-12-2019';
SELECT * FROM animals WHERE escape_attempts<3;
SELECT * FROM animals WHERE name NOT IN ('Agumon', 'Pikachu');
SELECT * FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
