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


