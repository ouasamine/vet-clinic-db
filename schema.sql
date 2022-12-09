/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id            	INT GENERATED ALWAYS AS IDENTITY,
  name    			VARCHAR(100),
  date_of_birth 	date,
  escape_attempts   INT,
  neutered     		BOOLEAN,
  weight_kg 		DECIMAL,
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners(
    id          INT GENERATED ALWAYS AS IDENTITY,
    full_name   VARCHAR(100),
    age         INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id          INT GENERATED ALWAYS AS IDENTITY,
    name        VARCHAR(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets(
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                VARCHAR(100),
    age                 INT,
    date_of_graduation  DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    vet_id      INT,
    species_id  INT,
    PRIMARY KEY(vet_id, species_id),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

CREATE TABLE visits(
    vet_id      INT,
    animal_id   INT,
    date        DATE,
    PRIMARY KEY(vet_id, animal_id, date),
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(animal_id) REFERENCES animals(id)
);
