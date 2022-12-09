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

SELECT * FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Melody Pond';
SELECT * FROM animals JOIN species ON animals.species_id=species.id WHERE species.name='Pokemon';
SELECT * FROM animals RIGHT JOIN owners ON animals.owner_id=owners.id;
SELECT species.name ,COUNT(*) FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.name;
SELECT * FROM ((animals JOIN owners ON animals.owner_id=owners.id) JOIN species ON animals.species_id=species.id)
  WHERE owners.full_name='Jennifer Orwell' AND species.name='Digimon';
SELECT * FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Dean Winchester' AND animals.escape_attempts=0;
SELECT owners.id ,owners.full_name, COUNT(*) FROM animals JOIN owners ON animals.owner_id=owners.id GROUP BY owners.id;

SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='William Tatcher' GROUP BY animals.name, visits.date ORDER BY visits.date DESC LIMIT 1;
SELECT COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Stephanie Mendez';
SELECT vets.name, species.name FROM vets 
  LEFT JOIN specializations ON vets.id=specializations.vet_id 
  LEFT JOIN species ON species.id=specializations.species_id
  GROUP BY vets.name, species.name;
SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Stephanie Mendez' AND visits.date BETWEEN '2020-04-01' AND '2020-08-30' GROUP BY animals.name, visits.date;
SELECT animals.name, COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT animals.name, visits.date FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Maisy Smith'GROUP BY animals.name, visits.date ORDER BY visits.date ASC LIMIT 1;
SELECT * FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  ORDER BY visits.date DESC LIMIT 1;
select COUNT(vets.name)
  from animals join visits on animals.id=visits.animal_id 
                join vets on visits.vet_id=vets.id 
                left join specializations on vets.id=specializations.vet_id
  WHERE (SELECT specializations.species_id FROM specializations 
          WHERE specializations.vet_id=visits.vet_id AND specializations.species_id=animals.species_id) IS NULL;
SELECT animals.species_id, COUNT(*) FROM animals JOIN visits ON animals.id=visits.animal_id JOIN vets ON visits.vet_id=vets.id 
  WHERE vets.name='Maisy Smith'GROUP BY animals.species_id; --Digimon
