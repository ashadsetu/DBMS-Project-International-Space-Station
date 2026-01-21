# International Space Station Database

A relational database management system (DBMS) project modeling the International Space Station (ISS) operations, including astronauts, missions, spacecraft, modules, experiments, and health data.

## Features

- **Space Agencies & Astronauts**: Track agencies, astronauts, and their details.  
- **Missions & Crew Assignments**: Manage missions, crew assignments, and spacewalks.  
- **Spacecraft & Modules**: Record spacecraft, modules, and docking events.  
- **Experiments & Equipment**: Maintain experiments and research equipment in modules.  
- **Health & Environmental Data**: Track astronaut health records and module environmental parameters.  
- **Communications & Supply Missions**: Log communications systems and cargo supply missions.

## Database Schema

Key tables include:  
- `space_agencies`, `astronauts`, `spacecraft`, `modules`, `mission`  
- `crew_assignments`, `spacewalks`, `docking_events`, `supply_missions`  
- `experiments`, `research_equipment`  
- `health_records`, `doctors`  
- `communications`, `environmental_data`  

## Technologies

- **SQL** (MySQL / MariaDB / any relational DBMS)  
- **Relational Schema Design** with primary and foreign key constraints  

## Usage

1. Clone the repository.  
2. Run the SQL script to create the database and tables.  
3. Start inserting and querying data as needed.

