CREATE DATABASE international_space_station_database;
USE international_space_station_database;


CREATE TABLE space_agencies
(
    agency_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) NOT NULL,
    director VARCHAR(255) NOT NULL
);

CREATE TABLE astronauts 
(
    astronaut_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
    salary INT NOT NULL
);

CREATE TABLE spacecraft 
(
    spacecraft_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manufacturer VARCHAR(255) NOT NULL,
    launch_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('Active', 'Inactive', 'Retired'))

);

CREATE TABLE experiments
(
    experiment_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    principal_investigator VARCHAR(255)
);

CREATE TABLE modules
(
    module_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    launch_date DATE
);

CREATE TABLE mission
(
    mission_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE,
    budget INT
);

CREATE TABLE crew_assignments 
(
    mission_id INT,
    astronaut_id INT,
    PRIMARY KEY (mission_id, astronaut_id),
    FOREIGN KEY (mission_id) REFERENCES mission(mission_id),
    FOREIGN KEY (astronaut_id) REFERENCES astronauts(astronaut_id)
);

CREATE TABLE spacewalks 
(
    mission_id INT,
    astronaut_id INT,
    spacewalk_date DATE,
    duration TIME,
    purpose VARCHAR(255),
    PRIMARY KEY (mission_id, astronaut_id),
    FOREIGN KEY (mission_id) REFERENCES mission(mission_id),
    FOREIGN KEY (astronaut_id) REFERENCES astronauts(astronaut_id)
);

CREATE TABLE docking_events 
(
    docking_event_id INT PRIMARY KEY,
    spacecraft_id INT,
    module_id INT,
    docking_date DATETIME,
    FOREIGN KEY (spacecraft_id) REFERENCES spacecraft(spacecraft_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE supply_missions 
(
    supply_mission_id INT PRIMARY KEY,
    launch_date DATE,
    cargo_description TEXT,
    docking_event_id INT,
    FOREIGN KEY (docking_event_id) REFERENCES docking_events(docking_event_id)
);

CREATE TABLE communications 
(
    communication_id INT PRIMARY KEY,
    module_id INT,
    frequency DECIMAL(10,2),
    bandwidth VARCHAR(50),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE research_equipment 
(
    experiment_id INT,
    module_id INT,
    equipment_name VARCHAR(255),
    description TEXT,
    PRIMARY KEY (experiment_id, module_id),
    FOREIGN KEY (experiment_id) REFERENCES experiments(experiment_id),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);

CREATE TABLE health_records
(
    health_record_id INT PRIMARY KEY,
    astronaut_id INT,
    date DATE,
    parameter VARCHAR(255),
    value DECIMAL(10,2),
    FOREIGN KEY (astronaut_id) REFERENCES astronauts(astronaut_id)
);

CREATE TABLE doctors 
(
    name VARCHAR(255) NOT NULL,
    observation TEXT,
    health_record_id INT,
    astronaut_id INT,
    PRIMARY KEY (health_record_id, astronaut_id),
    FOREIGN KEY (health_record_id) REFERENCES health_records(health_record_id),
    FOREIGN KEY (astronaut_id) REFERENCES astronauts(astronaut_id)
);

CREATE TABLE environmental_data 
(
    environment_id INT PRIMARY KEY,
    module_id INT,
    temperature DECIMAL(5,2),
    pressure DECIMAL(10,2),
    humidity DECIMAL(5,2),
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);



➜ Inserting values into the space_agencies table:

INSERT INTO space_agencies (agency_id, name, country, director)
VALUES

    (1, 'NASA', 'United States', 'Jim Bridenstine'),
    (2, 'Roscosmos', 'Russia', 'Dmitry Rogozin'),
    (3, 'ESA', 'Europe', 'Johann-Dietrich Woerner'),
    (4, 'CNSA', 'China', 'Zhang Kejian'),
    (5, 'ISRO', 'India', 'Kailasavadivoo Sivan'),
    (6, 'JAXA', 'Japan', 'Hiroshi Yamakawa'),
    (7, 'CSA', 'Canada', 'Sylvain Laporte'),
    (8, 'SpaceX', 'United States', 'Elon Musk'),
    (9, 'Blue Origin', 'United States', 'Jeff Bezos'),
    (10, 'Virgin Galactic', 'United States', 'Richard Branson');

➜ Inserting values into the astronauts table:

INSERT INTO astronauts (astronaut_id, name, nationality, date_of_birth, gender, salary)
VALUES

    (1, 'John Smith', 'American', '1980-05-15', 'Male', 100000),
    (2, 'Maria Garcia', 'Spanish', '1985-10-22', 'Female', 95000),
    (3, 'Alexei Petrov', 'Russian', '1978-03-30', 'Male', 110000),
    (4, 'Liu Wei', 'Chinese', '1981-07-06', 'Male', 105000),
    (5, 'Priya Patel', 'Indian', '1987-11-18', 'Female', 90000),
    (6, 'Yuki Tanaka', 'Japanese', '1983-09-25', 'Female', 92000),
    (7, 'Miguel Fernandez', 'Mexican', '1975-12-12', 'Male', 98000),
    (8, 'Isabella Rossi', 'Italian', '1988-04-20', 'Other', 94000),
    (9, 'Mohammed Khan', 'Pakistani', '1984-06-08', 'Male', 97000),
    (10, 'Anna Sokolova', 'Russian', '1982-01-14', 'Female', 93000),
    (11, 'Andrea Müller', 'German', '1986-08-07', 'Other', 96000),
    (12, 'Sergei Ivanov', 'Russian', '1979-02-28', 'Male', 102000),
    (13, 'Chen Wei', 'Chinese', '1984-11-10', 'Female', 91000),
    (14, 'Rajesh Patel', 'Indian', '1980-06-25', 'Male', 99000),
    (15, 'Yumi Nakamura', 'Japanese', '1989-03-12', 'Female', 88000),
    (16, 'Carlos González', 'Spanish', '1976-09-03', 'Male', 96000),
    (17, 'Sophia Andrade', 'Brazilian', '1983-12-28', 'Female', 93000),
    (18, 'Anton Petrov', 'Russian', '1987-05-19', 'Male', 95000),
    (19, 'Mei Ling', 'Chinese', '1982-04-15', 'Female', 92000),
    (20, 'Hiroshi Tanaka', 'Japanese', '1981-10-05', 'Male', 98000),
    (21, 'Ravi Singh', 'Indian', '1971-07-31', 'Male', 100000),
    (22, 'Yoko Suzuki', 'Japanese', '1985-02-09', 'Female', 91000),
    (23, 'Luisa Costa', 'Portuguese', '1984-08-17', 'Other', 94000),
    (24, 'Vladimir Ivanov', 'Russian', '1977-03-22', 'Male', 97000),
    (25, 'Xiao Chen', 'Chinese', '1983-06-12', 'Other', 93000);

➜ Inserting values into the spacecraft table:

INSERT INTO spacecraft (spacecraft_id, name, manufacturer, launch_date, status)
VALUES

    (1, 'Space Shuttle', 'NASA', '1981-04-12', 'Retired'),
    (2, 'Soyuz', 'RSC Energia', '1967-11-28', 'Active'),
    (3, 'Ariane 5', 'Arianespace', '1996-10-30', 'Active'),
    (4, 'Shenzhou', 'CASC', '1999-11-19', 'Inactive'),
    (5, 'Chandrayaan', 'ISRO', '2008-10-22', 'Inactive'),
    (6, 'H-IIA', 'Mitsubishi Heavy Industries', '2001-08-29', 'Active'),
    (7, 'Dragon', 'SpaceX', '2010-12-08', 'Active'),
    (8, 'Falcon 9', 'SpaceX', '2010-06-04', 'Active'),
    (9, 'New Shepard', 'Blue Origin', '2015-04-29', 'Active'),
    (10, 'VSS Unity', 'The Spaceship Company', '2018-12-13', 'Active');

➜ Inserting values into the experiments table:

INSERT INTO experiments (experiment_id, name, description, principal_investigator)
VALUES

    (1, 'Microgravity Effects on Human Physiology', 'Study on the effects of microgravity on the human body.', 'Dr. Maria Rodriguez'),
    (2, 'Plant Growth in Space', 'Investigating the growth of plants in a microgravity environment.', 'Dr. Rajesh Kumar'),
    (3, 'Solar Flare Observations', 'Monitoring solar flares and their impact on Earth.', 'Dr. Emily Johnson'),
    (4, 'Space Debris Tracking', 'Tracking space debris to prevent collisions with spacecraft.', 'Dr. Alexei Petrov'),
    (5, 'Radiation Shielding Materials', 'Testing new materials for radiation shielding in space.', 'Dr. Priya Patel'),
    (6, 'Microbial Growth in Space', 'Studying the growth of microbes in microgravity.', 'Dr. Yuki Tanaka'),
    (7, 'Exoplanet Observations', 'Observing exoplanets and their atmospheres from space.', 'Dr. Miguel Fernandez'),
    (8, 'Space Weather Monitoring', 'Monitoring space weather and its effects on Earth.', 'Dr. Isabella Rossi'),
    (9, 'Magnetic Field Measurements', 'Measuring magnetic fields in space and their variations.', 'Dr. Mohammed Khan'),
    (10, 'Atmospheric Reentry Studies', 'Studying the effects of atmospheric reentry on spacecraft.', 'Dr. Anna Sokolova'),
    (11, 'Space Tourism Experience', 'Investigating the experience of space tourism on individuals.', 'Dr. Andrea Müller'),
    (12, 'Space Station Maintenance', 'Developing new techniques for space station maintenance.', 'Dr. Sergei Ivanov'),
    (13, 'Astronaut Health Monitoring', 'Monitoring the health of astronauts in space.', 'Dr. Chen Wei'),
    (14, 'Space Agriculture Research', 'Researching agricultural practices in space environments.', 'Dr. Rajesh Patel'),
    (15, 'Space Debris Cleanup', 'Developing methods for cleaning up space debris.', 'Dr. Yumi Nakamura'),
    (16, 'Lunar Surface Exploration', 'Planning for future lunar surface exploration missions.', 'Dr. Carlos González'),
    (17, 'Mars Sample Return Mission', 'Preparing for a future mission to return samples from Mars.', 'Dr. Sophia Andrade'),
    (18, 'Space Station Habitability Studies', 'Studying the habitability of space stations for long-duration missions.', 'Dr. Anton Petrov'),
    (19, 'Space Weather Forecasting', 'Developing models for forecasting space weather events.', 'Dr. Mei Ling'),
    (20, 'Asteroid Detection and Tracking', 'Detecting and tracking near-Earth asteroids for planetary defense.', 'Dr. Hiroshi Tanaka'),
    (21, 'Satellite Communications Research', 'Researching new technologies for satellite communications.', 'Dr. Ravi Singh'),
    (22, 'Space Tourism Marketing', 'Developing marketing strategies for space tourism companies.', 'Dr. Yoko Suzuki'),
    (23, 'Space Law and Policy Analysis', 'Analyzing legal and policy issues related to space activities.', 'Dr. Luisa Costa'),
    (24, 'Space Debris Risk Assessment', 'Assessing the risks of space debris collisions with spacecraft.', 'Dr. Vladimir Ivanov'),
    (25, 'Mars Habitat Design', 'Designing habitats for future human missions to Mars.', 'Dr. Xiao Chen');

➜ Inserting values into the modules table:

INSERT INTO modules (module_id, name, description, launch_date)
VALUES

    (1, 'Unity Node', 'Central module of the International Space Station.', '1998-12-04'),
    (2, 'Zvezda Service Module', 'Russian module providing living quarters and propulsion.', '2000-07-12'),
    (3, 'Columbus Laboratory', 'European module for scientific research.', '2008-02-07'),
    (4, 'Kibo Laboratory', 'Japanese module for scientific research.', '2008-03-11'),
    (5, 'Destiny Laboratory', 'American module for scientific research.', '2001-02-07'),
    (6, 'Poisk Mini-Research Module', 'Russian module for scientific research.', '2009-11-10'),
    (7, 'Cupola', 'Observation module with panoramic windows.', '2010-02-08'),
    (8, 'Tranquility Node', 'American module with life support systems.', '2010-02-08'),
    (9, 'Harmony Node', 'American module with docking ports.', '2007-10-23'),
    (10, 'Pirs Docking Compartment', 'Russian module with docking ports.', '2001-09-14'),
    (11, 'Leonardo Permanent Multipurpose Module', 'American module for storage and research.', '2011-02-24'),
    (12, 'Rassvet Mini-Research Module', 'Russian module for scientific research.', '2010-05-14'),
    (13, 'Bigelow Expandable Activity Module', 'Experimental inflatable module.', '2016-04-08'),
    (14, 'Nauka Multipurpose Laboratory Module', 'Russian module for scientific research.', '2021-07-21'),
    (15, 'Bartolomeo External Platform', 'European platform for external payloads.', '2020-03-06');

➜ Inserting values into the mission table:

INSERT INTO mission (mission_id, name, launch_date, end_date, budget)
VALUES

    (1, 'ISS Expedition 1', '2000-10-31', '2001-03-21', 50000000),
    (2, 'Space Shuttle Challenger STS-51-L', '1986-01-28', '1986-01-28', 450000000),
    (3, 'SpaceX Mars Colonization Mission', '2026-04-15', NULL, 1000000000),
    (4, 'ESA Gaia Spacecraft Mission', '2013-12-19', '2022-12-31', 1000000000),
    (5, 'Roscosmos Luna 2', '1959-09-12', '1959-09-14', 24000000),
    (6, 'ISRO Chandrayaan-2', '2019-07-22', '2019-09-07', 141000000),
    (7, 'NASA New Horizons', '2006-01-19', '2015-12-31', 700000000),
    (8, 'JAXA Hayabusa2', '2014-12-03', '2019-11-13', 300000000),
    (9, 'CNSA Chang''e 4', '2018-12-07', '2020-05-31', 200000000),
    (10, 'SpaceX Crew-1', '2020-11-15', '2021-05-02', 200000000),
    (11, 'Blue Origin New Shepard NS-16', '2021-07-20', '2021-07-20', 5000000),
    (12, 'Virgin Galactic Unity 22', '2021-07-11', '2021-07-11', 2500000),
    (13, 'NASA Artemis I', '2022-11-01', NULL, 100000000),
    (14, 'ESA Solar Orbiter', '2020-02-09', '2029-12-31', 150000000),
    (15, 'Roscosmos Venera 7', '1970-08-17', '1970-12-15', 12000000),
    (16, 'ISRO Mangalyaan', '2013-11-05', '2014-09-24', 74000000),
    (17, 'NASA Voyager 1', '1977-09-05', '2021-08-31', 250000000),
    (18, 'JAXA Akatsuki', '2010-05-20', '2021-08-31', 300000000),
    (19, 'CNSA Tianwen-1', '2020-07-23', '2021-05-14', 200000000),
    (20, 'SpaceX Inspiration4', '2021-09-15', '2021-09-18', 10000000),
    (21, 'Blue Origin New Shepard NS-18', '2021-12-11', '2021-12-11', 5000000),
    (22, 'Virgin Galactic Unity 23', '2022-02-13', '2022-02-13', 2500000),
    (23, 'NASA Artemis II', '2023-08-01', NULL, 150000000),
    (24, 'ESA Euclid Space Telescope', '2022-06-01', '2032-12-31', 20000000),
    (25, 'Roscosmos Mars 3', '1971-05-28', '1971-08-22', 1500000),
    (26, 'ISRO GSAT-6A', '2018-03-29', '2018-04-01', 50000000),
    (27, 'NASA Mars Science Laboratory', '2011-11-26', '2021-08-31', 25000000),
    (28, 'JAXA Akari', '2006-02-21', '2011-11-24', 10000000),
    (29, 'CNSA Chang''e 5', '2020-11-23', '2020-12-17', 150000000),
    (30, 'SpaceX Starship SN8', '2020-12-09', '2020-12-09', 2000000),
    (31, 'Blue Origin New Shepard NS-19', '2022-01-19', '2022-01-19', 5000000),
    (32, 'Virgin Galactic Unity 24', '2022-03-20', '2022-03-20', 2500000),
    (33, 'NASA Artemis III', '2024-10-01', NULL, 200000000),
    (34, 'ESA ExoMars', '2016-03-14', '2022-12-31', 25000000),
    (35, 'Roscosmos Luna 9', '1966-01-31', '1966-02-06', 18000000),
    (36, 'ISRO GSAT-6', '2015-08-27', '2015-08-27', 60000000),
    (37, 'NASA Mars Reconnaissance Orbiter', '2005-08-12', '2021-08-31', 72000000),
    (38, 'JAXA Hayabusa', '2003-05-09', '2010-06-13', 40000000);

➜ Inserting values into the crew_assignments table:

INSERT INTO crew_assignments (mission_id, astronaut_id)
VALUES

    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 4),
    (2, 5),
    (3, 6),
    (3, 7),
    (3, 8),
    (4, 9),
    (4, 10),
    (4, 11),
    (5, 12),
    (5, 13),
    (5, 14),
    (6, 15),
    (6, 16),
    (6, 17),
    (7, 18),
    (7, 19),
    (7, 20),
    (8, 21),
    (8, 22),
    (8, 23),
    (9, 24),
    (9, 25),
    (9, 1),
    (10, 2),
    (10, 3),
    (10, 4),
    (11, 5),
    (11, 6),
    (11, 7),
    (12, 8),
    (12, 9),
    (12, 10),
    (13, 11),
    (13, 12),
    (13, 13),
    (14, 14),
    (14, 15),
    (14, 16),
    (15, 17),
    (15, 18),
    (15, 19),
    (16, 20),
    (16, 21),
    (16, 22),
    (17, 23),
    (17, 24),
    (17, 25),
    (18, 1),
    (18, 2),
    (18, 3),
    (19, 4),
    (19, 5),
    (19, 6),
    (20, 7),
    (20, 8),
    (20, 9),
    (21, 10),
    (21, 11),
    (21, 12),
    (22, 13),
    (22, 14),
    (22, 15),
    (23, 16),
    (23, 17),
    (23, 18),
    (24, 19),
    (24, 20),
    (24, 21),
    (25, 22),
    (25, 23),
    (25, 24),
    (26, 25),
    (26, 1),
    (26, 2),
    (27, 3),
    (27, 4),
    (27, 5),
    (28, 6),
    (28, 7),
    (28, 8),
    (29, 9),
    (29, 10),
    (29, 11),
    (30, 12),
    (30, 13),
    (30, 14),
    (31, 15),
    (31, 16),
    (31, 17),
    (32, 18),
    (32, 19),
    (32, 20),
    (33, 21),
    (33, 22),
    (33, 23),
    (34, 24),
    (34, 25),
    (34, 1),
    (35, 2),
    (35, 3),
    (35, 4),
    (36, 5),
    (36, 6),
    (36, 7),
    (37, 8),
    (37, 9),
    (37, 10),
    (38, 11),
    (38, 12),
    (38, 13);

➜ Inserting values into the spacewalks table:

INSERT INTO spacewalks (mission_id, astronaut_id, spacewalk_date, duration, purpose)
VALUES

    (1, 1, '2000-11-20', '06:18:00', 'Maintenance of the Unity Node'),
    (1, 2, '2000-11-20', '06:18:00', 'Maintenance of the Unity Node'),
    (1, 3, '2000-11-20', '06:18:00', 'Maintenance of the Unity Node'),
    (2, 1, '1986-01-28', '00:00:00', 'Tragic accident during launch'),
    (2, 4, '1986-01-28', '00:00:00', 'Tragic accident during launch'),
    (2, 5, '1986-01-28', '00:00:00', 'Tragic accident during launch'),
    (3, 6, '2026-04-15', '00:00:00', 'Exploration of Mars'),
    (3, 7, '2026-04-15', '00:00:00', 'Exploration of Mars'),
    (3, 8, '2026-04-15', '00:00:00', 'Exploration of Mars'),
    (4, 9, '2013-12-19', '00:00:00', 'Mapping the Milky Way galaxy'),
    (4, 10, '2013-12-19', '00:00:00', 'Mapping the Milky Way galaxy'),
    (4, 11, '2013-12-19', '00:00:00', 'Mapping the Milky Way galaxy'),
    (5, 12, '1959-09-12', '00:00:00', 'Impact on the Moon'),
    (5, 13, '1959-09-12', '00:00:00', 'Impact on the Moon'),
    (5, 14, '1959-09-12', '00:00:00', 'Impact on the Moon'),
    (6, 15, '2019-07-22', '06:30:00', 'Deployment of the Vikram lander'),
    (6, 16, '2019-07-22', '06:30:00', 'Deployment of the Vikram lander'),
    (6, 17, '2019-07-22', '06:30:00', 'Deployment of the Vikram lander'),
    (7, 18, '2006-01-19', '00:00:00', 'Flyby of Jupiter'),
    (7, 19, '2006-01-19', '00:00:00', 'Flyby of Jupiter'),
    (7, 20, '2006-01-19', '00:00:00', 'Flyby of Jupiter'),
    (8, 21, '2014-12-03', '00:00:00', 'Exploration of asteroid Ryugu'),
    (8, 22, '2014-12-03', '00:00:00', 'Exploration of asteroid Ryugu'),
    (8, 23, '2014-12-03', '00:00:00', 'Exploration of asteroid Ryugu'),
    (9, 24, '2018-12-07', '00:00:00', 'Landing on the far side of the Moon'),
    (9, 25, '2018-12-07', '00:00:00', 'Landing on the far side of the Moon'),
    (9, 1, '2018-12-07', '00:00:00', 'Landing on the far side of the Moon'),
    (10, 2, '2020-11-15', '00:00:00', 'Docking with the International Space Station'),
    (10, 3, '2020-11-15', '00:00:00', 'Docking with the International Space Station'),
    (10, 4, '2020-11-15', '00:00:00', 'Docking with the International Space Station'),
    (11, 5, '2021-07-20', '00:00:00', 'Suborbital flight to the edge of space'),
    (11, 6, '2021-07-20', '00:00:00', 'Suborbital flight to the edge of space'),
    (11, 7, '2021-07-20', '00:00:00', 'Suborbital flight to the edge of space'),
    (12, 8, '2021-07-11', '00:00:00', 'Suborbital flight to the edge of space'),
    (12, 9, '2021-07-11', '00:00:00', 'Suborbital flight to the edge of space'),
    (12, 10, '2021-07-11', '00:00:00', 'Suborbital flight to the edge of space'),
    (13, 11, '2022-11-01', '00:00:00', 'Orbital flight around the Moon'),
    (13, 12, '2022-11-01', '00:00:00', 'Orbital flight around the Moon'),
    (13, 13, '2022-11-01', '00:00:00', 'Orbital flight around the Moon'),
    (14, 14, '2020-02-09', '00:00:00', 'Observation of the Sun'),
    (14, 15, '2020-02-09', '00:00:00', 'Observation of the Sun'),
    (14, 16, '2020-02-09', '00:00:00', 'Observation of the Sun'),
    (15, 17, '1970-08-17', '00:00:00', 'Landing on Venus'),
    (15, 18, '1970-08-17', '00:00:00', 'Landing on Venus'),
    (15, 19, '1970-08-17', '00:00:00', 'Landing on Venus'),
    (16, 20, '2013-11-05', '00:00:00', 'Orbital insertion around Mars'),
    (16, 21, '2013-11-05', '00:00:00', 'Orbital insertion around Mars'),
    (16, 22, '2013-11-05', '00:00:00', 'Orbital insertion around Mars'),
    (17, 23, '1977-09-05', '00:00:00', 'Voyage to interstellar space'),
    (17, 24, '1977-09-05', '00:00:00', 'Voyage to interstellar space'),
    (17, 25, '1977-09-05', '00:00:00', 'Voyage to interstellar space'),
    (18, 1, '2010-05-20', '00:00:00', 'Orbital insertion around Venus'),
    (18, 2, '2010-05-20', '00:00:00', 'Orbital insertion around Venus'),
    (18, 3, '2010-05-20', '00:00:00', 'Orbital insertion around Venus'),
    (19, 4, '2020-07-23', '00:00:00', 'Orbital insertion around Mars'),
    (19, 5, '2020-07-23', '00:00:00', 'Orbital insertion around Mars'),
    (19, 6, '2020-07-23', '00:00:00', 'Orbital insertion around Mars'),
    (20, 7, '2021-09-15', '00:00:00', 'Orbital flight around Earth'),
    (20, 8, '2021-09-15', '00:00:00', 'Orbital flight around Earth'),
    (20, 9, '2021-09-15', '00:00:00', 'Orbital flight around Earth');

➜ Inserting values into the docking_events table:

INSERT INTO docking_events (docking_event_id, spacecraft_id, module_id, docking_date)
VALUES

    (1, 1, 1, '2000-11-02'),
    (2, 2, 2, '2000-11-02'),
    (3, 3, 3, '2000-11-02'),
    (4, 4, 4, '2000-11-02'),
    (5, 5, 5, '2000-11-02'),
    (6, 6, 6, '2000-11-02'),
    (7, 7, 7, '2000-11-02'),
    (8, 8, 8, '2000-11-02'),
    (9, 9, 9, '2000-11-02'),
    (10, 10, 10, '2000-11-02');

➜ Inserting values into the supply_missions table:

INSERT INTO supply_missions (supply_mission_id, launch_date, cargo_description, docking_event_id)
VALUES

    (1, '2000-11-01', 'Food and supplies for the crew', 1),
    (2, '2000-11-01', 'Experiments and equipment for the laboratory', 2),
    (3, '2000-11-01', 'Spare parts and tools for maintenance', 3),
    (4, '2000-11-01', 'New modules and components for expansion', 4),
    (5, '2000-11-01', 'Scientific instruments and research materials', 5),
    (6, '2000-11-01', 'Personal items and gifts for the crew', 6),
    (7, '2000-11-01', 'Communications equipment and antennas', 7),
    (8, '2000-11-01', 'Life support systems and environmental controls', 8),
    (9, '2000-11-01', 'Docking adapters and airlocks for spacecraft', 9),
    (10, '2000-11-01', 'Solar panels and power generation systems', 10);

➜ Inserting values into the communications table:

INSERT INTO communications (communication_id, module_id, frequency, bandwidth)
VALUES

    (1, 1, 145.800, 'VHF'),
    (2, 2, 121.750, 'UHF'),
    (3, 3, 145.825, 'VHF'),
    (4, 4, 437.100, 'UHF'),
    (5, 5, 145.825, 'VHF'),
    (6, 6, 437.550, 'UHF'),
    (7, 7, 145.800, 'VHF'),
    (8, 8, 437.100, 'UHF'),
    (9, 9, 145.825, 'VHF'),
    (10, 10, 437.550, 'UHF'),
    (11, 11, 145.800, 'VHF'),
    (12, 12, 437.100, 'UHF'),
    (13, 13, 145.825, 'VHF'),
    (14, 14, 437.550, 'UHF'),
    (15, 15, 145.800, 'VHF');

➜ Inserting values into the research_equipment table:

INSERT INTO research_equipment (experiment_id, module_id, equipment_name, description)
VALUES

    (1, 1, 'Microgravity Chamber', 'Chamber for studying effects of microgravity on human cells'),
    (2, 2, 'Plant Growth Unit', 'Unit for growing plants in controlled environments'),
    (3, 3, 'Solar Flare Detector', 'Detector for monitoring solar flares and radiation levels'),
    (4, 4, 'Debris Tracking Radar', 'Radar system for tracking space debris in orbit'),
    (5, 5, 'Radiation Shielding Testbed', 'Testbed for evaluating new materials for radiation shielding'),
    (6, 6, 'Microbial Growth Incubator', 'Incubator for studying microbial growth in space'),
    (7, 7, 'Exoplanet Telescope', 'Telescope for observing exoplanets and their atmospheres'),
    (8, 8, 'Space Weather Monitor', 'Monitor for tracking space weather events and solar activity'),
    (9, 9, 'Magnetic Field Sensor', 'Sensor for measuring magnetic fields in space'),
    (10, 10, 'Atmospheric Reentry Simulator', 'Simulator for testing spacecraft reentry conditions'),
    (11, 11, 'Space Tourism Simulator', 'Simulator for training space tourists for spaceflight'),
    (12, 12, 'Maintenance Robot Arm', 'Robot arm for performing maintenance tasks on the ISS'),
    (13, 13, 'Health Monitoring System', 'System for monitoring astronaut health and vital signs'),
    (14, 14, 'Agricultural Growth Chamber', 'Chamber for growing crops and plants in space'),
    (15, 15, 'Debris Collection Net', 'Net for capturing small debris particles in orbit');

➜ Inserting values into the health_records table:

INSERT INTO health_records (health_record_id, astronaut_id, date, parameter, value)
VALUES

    (1, 1, '2000-11-01', 'Heart Rate', 70),
    (2, 2, '2000-11-01', 'Heart Rate', 80),
    (3, 3, '2000-11-01', 'Heart Rate', 90),
    (4, 4, '2000-11-01', 'Heart Rate', 100),
    (5, 5, '2000-11-01', 'Heart Rate', 110),
    (6, 6, '2000-11-01', 'Heart Rate', 120),
    (7, 7, '2000-11-01', 'Heart Rate', 130),
    (8, 8, '2000-11-01', 'Heart Rate', 140),
    (9, 9, '2000-11-01', 'Heart Rate', 150),
    (10, 10, '2000-11-01', 'Heart Rate', 160),
    (11, 11, '2000-11-01', 'Heart Rate', 170),
    (12, 12, '2000-11-01', 'Heart Rate', 180),
    (13, 13, '2000-11-01', 'Heart Rate', 190),
    (14, 14, '2000-11-01', 'Heart Rate', 200),
    (15, 15, '2000-11-01', 'Heart Rate', 210),
    (16, 16, '2000-11-01', 'Heart Rate', 220),
    (17, 17, '2000-11-01', 'Heart Rate', 230),
    (18, 18, '2000-11-01', 'Heart Rate', 240),
    (19, 19, '2000-11-01', 'Heart Rate', 250),
    (20, 20, '2000-11-01', 'Heart Rate', 260),
    (21, 21, '2000-11-01', 'Heart Rate', 270),
    (22, 22, '2000-11-01', 'Heart Rate', 280),
    (23, 23, '2000-11-01', 'Heart Rate', 290),
    (24, 24, '2000-11-01', 'Heart Rate', 300),
    (25, 25, '2000-11-01', 'Heart Rate', 310),
    (26, 1, '2000-11-01', 'Blood Pressure', 120),
    (27, 2, '2000-11-01', 'Blood Pressure', 130),
    (28, 3, '2000-11-01', 'Blood Pressure', 140),
    (29, 4, '2000-11-01', 'Blood Pressure', 150),
    (30, 5, '2000-11-01', 'Blood Pressure', 160),
    (31, 6, '2000-11-01', 'Blood Pressure', 170),
    (32, 7, '2000-11-01', 'Blood Pressure', 180),
    (33, 8, '2000-11-01', 'Blood Pressure', 190),
    (34, 9, '2000-11-01', 'Blood Pressure', 200),
    (35, 10, '2000-11-01', 'Blood Pressure', 210),
    (36, 11, '2000-11-01', 'Blood Pressure', 220),
    (37, 12, '2000-11-01', 'Blood Pressure', 230),
    (38, 13, '2000-11-01', 'Blood Pressure', 240),
    (39, 14, '2000-11-01', 'Blood Pressure', 250),
    (40, 15, '2000-11-01', 'Blood Pressure', 260),
    (41, 16, '2000-11-01', 'Blood Pressure', 270),
    (42, 17, '2000-11-01', 'Blood Pressure', 280),
    (43, 18, '2000-11-01', 'Blood Pressure', 290),
    (44, 19, '2000-11-01', 'Blood Pressure', 300),
    (45, 20, '2000-11-01', 'Blood Pressure', 310),
    (46, 21, '2000-11-01', 'Blood Pressure', 320),
    (47, 22, '2000-11-01', 'Blood Pressure', 330),
    (48, 23, '2000-11-01', 'Blood Pressure', 340),
    (49, 24, '2000-11-01', 'Blood Pressure', 350),
    (50, 25, '2000-11-01', 'Blood Pressure', 360),
    (51, 1, '2000-11-01', 'Oxygen Level', 95),
    (52, 2, '2000-11-01', 'Oxygen Level', 96),
    (53, 3, '2000-11-01', 'Oxygen Level', 97),
    (54, 4, '2000-11-01', 'Oxygen Level', 98),
    (55, 5, '2000-11-01', 'Oxygen Level', 99),
    (56, 6, '2000-11-01', 'Oxygen Level', 100),
    (57, 7, '2000-11-01', 'Oxygen Level', 95),
    (58, 8, '2000-11-01', 'Oxygen Level', 96),
    (59, 9, '2000-11-01', 'Oxygen Level', 97),
    (60, 10, '2000-11-01', 'Oxygen Level', 98),
    (61, 11, '2000-11-01', 'Oxygen Level', 99),
    (62, 12, '2000-11-01', 'Oxygen Level', 100),
    (63, 13, '2000-11-01', 'Oxygen Level', 95),
    (64, 14, '2000-11-01', 'Oxygen Level', 96),
    (65, 15, '2000-11-01', 'Oxygen Level', 97),
    (66, 16, '2000-11-01', 'Oxygen Level', 98),
    (67, 17, '2000-11-01', 'Oxygen Level', 99),
    (68, 18, '2000-11-01', 'Oxygen Level', 100),
    (69, 19, '2000-11-01', 'Oxygen Level', 95),
    (70, 20, '2000-11-01', 'Oxygen Level', 96),
    (71, 21, '2000-11-01', 'Oxygen Level', 97),
    (72, 22, '2000-11-01', 'Oxygen Level', 98),
    (73, 23, '2000-11-01', 'Oxygen Level', 99),
    (74, 24, '2000-11-01', 'Oxygen Level', 100),
    (75, 25, '2000-11-01', 'Oxygen Level', 95),
    (76, 1, '2000-11-01', 'Temperature', 98),
    (77, 2, '2000-11-01', 'Temperature', 99),
    (78, 3, '2000-11-01', 'Temperature', 100),
    (79, 4, '2000-11-01', 'Temperature', 101),
    (80, 5, '2000-11-01', 'Temperature', 102),
    (81, 6, '2000-11-01', 'Temperature', 103),
    (82, 7, '2000-11-01', 'Temperature', 104),
    (83, 8, '2000-11-01', 'Temperature', 105),
    (84, 9, '2000-11-01', 'Temperature', 106),
    (85, 10, '2000-11-01', 'Temperature', 107),
    (86, 11, '2000-11-01', 'Temperature', 108),
    (87, 12, '2000-11-01', 'Temperature', 109),
    (88, 13, '2000-11-01', 'Temperature', 110),
    (89, 14, '2000-11-01', 'Temperature', 111),
    (90, 15, '2000-11-01', 'Temperature', 112),
    (91, 16, '2000-11-01', 'Temperature', 113),
    (92, 17, '2000-11-01', 'Temperature', 114),
    (93, 18, '2000-11-01', 'Temperature', 115),
    (94, 19, '2000-11-01', 'Temperature', 116),
    (95, 20, '2000-11-01', 'Temperature', 117),
    (96, 21, '2000-11-01', 'Temperature', 118),
    (97, 22, '2000-11-01', 'Temperature', 119),
    (98, 23, '2000-11-01', 'Temperature', 120),
    (99, 24, '2000-11-01', 'Temperature', 121),
    (100, 25, '2000-11-01', 'Temperature', 122);

➜ Inserting values into the doctors table:

INSERT INTO doctors (name, observation, health_record_id, astronaut_id)
VALUES

    ('Dr. Smith', 'Normal heart rate and blood pressure', 1, 1),
    ('Dr. Johnson', 'Elevated heart rate and blood pressure', 2, 2),
    ('Dr. Williams', 'Low oxygen level and high temperature', 3, 3),
    ('Dr. Brown', 'High heart rate and blood pressure', 4, 4),
    ('Dr. Davis', 'Normal heart rate and blood pressure', 5, 5),
    ('Dr. Miller', 'Elevated heart rate and blood pressure', 6, 6),
    ('Dr. Wilson', 'Low oxygen level and high temperature', 7, 7),
    ('Dr. Moore', 'High heart rate and blood pressure', 8, 8),
    ('Dr. Taylor', 'Normal heart rate and blood pressure', 9, 9),
    ('Dr. Anderson', 'Elevated heart rate and blood pressure', 10, 10),
    ('Dr. Thomas', 'Low oxygen level and high temperature', 11, 11),
    ('Dr. Jackson', 'High heart rate and blood pressure', 12, 12),
    ('Dr. White', 'Normal heart rate and blood pressure', 13, 13),
    ('Dr. Harris', 'Elevated heart rate and blood pressure', 14, 14),
    ('Dr. Martin', 'Low oxygen level and high temperature', 15, 15),
    ('Dr. Thompson', 'High heart rate and blood pressure', 16, 16),
    ('Dr. Garcia', 'Normal heart rate and blood pressure', 17, 17),
    ('Dr. Martinez', 'Elevated heart rate and blood pressure', 18, 18),
    ('Dr. Robinson', 'Low oxygen level and high temperature', 19, 19),
    ('Dr. Clark', 'High heart rate and blood pressure', 20, 20),
    ('Dr. Rodriguez', 'Normal heart rate and blood pressure', 21, 21),
    ('Dr. Lewis', 'Elevated heart rate and blood pressure', 22, 22),
    ('Dr. Lee', 'Low oxygen level and high temperature', 23, 23),
    ('Dr. Walker', 'High heart rate and blood pressure', 24, 24);

➜ Inserting values into the environmental_data table:

INSERT INTO environmental_data (environment_id, module_id, temperature, pressure, humidity)
VALUES

    (1, 1, 72.5, 1013, 50),
    (2, 2, 73.0, 1014, 51),
    (3, 3, 73.5, 1015, 52),
    (4, 4, 74.0, 1016, 53),
    (5, 5, 74.5, 1017, 54),
    (6, 6, 75.0, 1018, 55),
    (7, 7, 75.5, 1019, 56),
    (8, 8, 76.0, 1020, 57),
    (9, 9, 76.5, 1021, 58),
    (10, 10, 77.0, 1022, 59),
    (11, 11, 77.5, 1023, 60),
    (12, 12, 78.0, 1024, 61),
    (13, 13, 78.5, 1025, 62),
    (14, 14, 79.0, 1026, 63),
    (15, 15, 79.5, 1027, 64);

• Queries:

--- Finds the names and nationalities of astronauts from the RUSSIA.

SELECT name, nationality
FROM astronauts
WHERE nationality = 'Russian';

--- Calculates adjusted annual income of astronauts after monthly tax.

SELECT name, (salary - 1000) * 12 AS annual_income
FROM astronauts;

--- Lists astronauts from either the Indian or Pakistani (no duplicates).

(SELECT name FROM astronauts WHERE nationality = 'Indian') 
						UNION 

(SELECT name FROM astronauts WHERE nationality = 'Pakistani');

--- Joins Astronauts, Spacewalks, Missions, And Modules To Associate Astronauts With Specific Module Names.

SELECT a.name AS astronaut_name, m.name AS module_name
FROM astronauts a
JOIN spacewalks s ON a.astronaut_id = s.astronaut_id
JOIN mission ms ON s.mission_id = ms.mission_id
JOIN docking_events d ON ms.mission_id = d.module_id
JOIN modules m ON d.module_id = m.module_id;

--- Get Names Of Astronauts Who Either Participated In Spacewalks Or Have Health Records.

SELECT name
FROM astronauts
WHERE astronaut_id IN (SELECT astronaut_id FROM spacewalks)

UNION

SELECT name
FROM astronauts
WHERE astronaut_id IN (SELECT astronaut_id FROM health_records);

--- Find astronauts who have both participated in spacewalks and have health records.

SELECT astronaut_id
FROM spacewalks

INTERSECT

SELECT astronaut_id
FROM health_records;


--- Finds astronauts who have health records but have never participated in any spacewalk.

SELECT astronaut_id
FROM health_records

EXCEPT

SELECT astronaut_id
FROM spacewalks;

--- Finds astronauts with birthdates.

SELECT name
FROM astronauts
WHERE date_of_birth = '1983-09-25';

--- Finds the average temperature across all modules.

SELECT AVG(temperature) AS avg_temp
FROM environmental_data;

--- Finds Lists astronauts who have done spacewalks longer than 2 hours.

SELECT name
FROM astronauts
WHERE astronaut_id IN (
    SELECT astronaut_id
    FROM spacewalks
    WHERE duration > '02:00:00'
);

--- Inserts a new ISS module into the database

INSERT INTO modules (module_id, name, description, launch_date)
VALUES (101, 'Harmony', 'Utility module', '2007-10-23');

--- Helps to deletes outdated supply mission records.

DELETE FROM supply_missions
WHERE launch_date < '2015-01-01';

--- Update & Increases temperature by 1 for module with ID 3 (maybe due to recalibration).

UPDATE environmental_data
SET temperature = temperature + 1
WHERE module_id = 3;

--- Finds astronauts whose names starts with "An".

SELECT name
FROM astronauts
WHERE name LIKE 'An%';

--- Find all astronauts whose name starts with "Y" and ends with "A".

SELECT name
FROM astronauts
WHERE name LIKE 'y%a';

--- Find astronauts names ascendingly.

SELECT name, nationality
FROM astronauts
ORDER BY name ASC;

--- Find astronauts who born between 1980 to 1990

SELECT name
FROM astronauts
WHERE date_of_birth BETWEEN '1980-01-01' AND '1990-12-31';


--- Helps to count the astronauts by nationality.

SELECT nationality, COUNT(*) AS total_astronauts
FROM astronauts
GROUP BY nationality;

--- Count how many astronauts are assigned to each mission.

SELECT mission_id, COUNT(astronaut_id) AS astronaut_count
FROM crew_assignments
GROUP BY mission_id;

--- Find nationalities with more than 3 astronauts.

SELECT nationality, COUNT(*) AS total
FROM astronauts
GROUP BY nationality
HAVING COUNT(*) > 3;

--- Find astronauts names who are in mission No. 5

SELECT name
FROM astronauts
WHERE astronaut_id IN 
(
    SELECT astronaut_id
    FROM crew_assignments
    WHERE mission_id = 5
);

--- Finds astronaut names with their respective number of spacewalks

SELECT name,
    (SELECT COUNT(*)
     FROM spacewalks
     WHERE spacewalks.astronaut_id = astronauts.astronaut_id) AS spacewalk_count
FROM astronauts;

--- List all astronauts who have participated in a mission with a budget higher than the average mission budget.
 
 SELECT name
FROM astronauts
WHERE astronaut_id IN
(
    SELECT astronaut_id
    FROM crew_assignments
    WHERE mission_id IN 
	(
        SELECT mission_id
        FROM mission
        WHERE budget > 
		(
            SELECT AVG(CAST(budget AS BIGINT)) FROM mission
        )
    )
);


select * from  space_agencies

select * from  astronauts

select * from  spacecraft

select * from  experiments

select * from  modules

select * from mission

select * from  crew_assignments

select * from  spacewalks

select * from  docking_events

select * from  supply_missions

select * from  communications

select * from  research_equipment

select * from  health_records

select * from  doctors

select * from  environmental_data