/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','03-02-2020',0,True,10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','15-11-2018',2,True,8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu','07-01-2021',1,False,15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon','12-05-2017',5,True,11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander','08-02-2020',0,False,-11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon','15-11-2021',5,True,-5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle','02-04-1993',5,False,1-12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon','12-06-2005',5,True,-45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon','07-06-2005',5,True,20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom','13-10-1998',5,True,17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto','14-05-2022',5,True,22);

INSERT INTO owners (full_name, age) 
VALUES('Sam Smith', 34),
      ('Jennifer Orwell', 19), 
      ('Bob', 45),
      ('Melody Pond', 77),
      ('Dean Winchester', 14),
      ('Jodie Whittaker', 38),
      ('Jodie Whittaker', 38);

INSERT INTO species (name) 
VALUES('Pokemon'),
      ('Digimon');

UPDATE animals SET species_id=(SELECT id FROM species WHERE species.name='Digimon') WHERE animals.name LIKE '%mon';
UPDATE animals SET species_id=(SELECT id FROM species WHERE species.name='Pokemon') WHERE animals.species_id IS NULL;

UPDATE animals SET owner_id=(SELECT id FROM owners WHERE owners.full_name='Sam Smith') WHERE animals.name='Agumon';
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE owners.full_name='Jennifer Orwell') WHERE animals.name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE owners.full_name='Bob') WHERE animals.name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE owners.full_name='Melody Pond') WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id=(SELECT id FROM owners WHERE owners.full_name='Dean Winchester') WHERE animals.name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation) 
VALUES  ('William Tatcher', 45, '23-04-2000'),
        ('Maisy Smith', 26, '17-01-2019'),
        ('Stephanie Mendez', 64, '04-05-1981'),
        ('Jack Harkness', 38, '08-06-2008');

INSERT INTO specializations (vet_id, species_id) 
VALUES ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from species WHERE species.name='Pokemon')),
       ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from species WHERE species.name='Digimon')),
       ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from species WHERE species.name='Pokemon')),
       ((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from species WHERE species.name='Digimon'));

INSERT INTO visits(vet_id, animal_id, date) 
VALUES  ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Agumon'), '24-05-2020'),
        ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Agumon'), '22-07-2020'),
        ((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Gabumon'), '02-02-2021'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '05-01-2020'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '08-03-2020'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Pikachu'), '14-05-2020'),
        ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Devimon'), '14-05-2021'),
        ((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Charmander'), '24-02-2021'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Plantmon'), '21-12-2019'),
        ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Plantmon'), '10-08-2020'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Plantmon'), '07-04-2021'),
        ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Squirtle'), '29-09-2019'),
        ((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Angemon'), '03-10-2020'),
        ((SELECT id from vets WHERE vets.name='Jack Harkness'), (SELECT id from animals WHERE animals.name='Angemon'), '04-11-2020'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '24-01-2019'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '15-05-2019'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '27-02-2020'),
        ((SELECT id from vets WHERE vets.name='Maisy Smith'), (SELECT id from animals WHERE animals.name='Boarmon'), '03-08-2020'),
        ((SELECT id from vets WHERE vets.name='Stephanie Mendez'), (SELECT id from animals WHERE animals.name='Blossom'), '24-05-2020'),
        ((SELECT id from vets WHERE vets.name='William Tatcher'), (SELECT id from animals WHERE animals.name='Blossom'), '11-01-2021');
