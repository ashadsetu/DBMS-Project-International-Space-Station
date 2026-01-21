# 🌌 International Space Station Database

The International Space Station (ISS) Database is a comprehensive relational database system designed to capture and organize detailed information about the ISS operations. This project models the various aspects of ISS missions, including astronauts, space agencies, spacecraft, modules, experiments, health records, environmental conditions, and communication systems. The database provides a structured way to manage, track, and analyze ISS operations and research activities, making it useful for educational purposes, research simulation, and mission planning.

# 🚀 Features

The ISS Database includes the following features:  

- **Space Agencies & Astronauts** – Maintain detailed records of space agencies, their directors, countries, and astronauts with personal and professional information including salary, nationality, and date of birth.  
- **Missions & Crew Assignments** – Track mission details such as name, launch and end dates, budget, assigned crew members, and spacewalk activities.  
- **Spacecraft & Modules** – Document spacecraft and modules, including launch dates, status, and docking events. This ensures that all spacecraft movements and module interactions are well-organized.  
- **Experiments & Equipment** – Keep a record of scientific experiments conducted on the ISS and the research equipment assigned to specific modules.  
- **Health & Environmental Data** – Monitor astronauts’ health through detailed records and observations by doctors, along with environmental conditions inside modules such as temperature, pressure, and humidity.  
- **Communications Systems** – Track communication frequencies and bandwidth for each module to ensure operational efficiency.  
- **Supply Missions** – Record cargo supply missions including docking events and cargo descriptions, supporting logistical tracking.

# 🗂 Database Schema

The database consists of multiple interconnected tables designed to maintain data integrity:  

- `space_agencies` – Stores information about international space agencies.  
- `astronauts` – Maintains detailed astronaut profiles.  
- `spacecraft` – Tracks spacecraft information including manufacturer, launch date, and status.  
- `modules` – Contains ISS module details and launch dates.  
- `mission` – Stores mission information including launch and end dates, budgets, and names.  
- `crew_assignments` – Links astronauts to missions.  
- `spacewalks` – Records spacewalk events, duration, purpose, and participants.  
- `docking_events` – Tracks spacecraft docking events with modules.  
- `supply_missions` – Manages supply mission details and cargo information.  
- `experiments` – Contains scientific experiments conducted aboard the ISS.  
- `research_equipment` – Links experiments to modules and tracks equipment used.  
- `health_records` – Monitors astronaut health parameters.  
- `doctors` – Stores observations made by doctors for specific health records.  
- `environmental_data` – Records environmental parameters inside modules.  
- `communications` – Tracks module communication frequencies and bandwidth.

All tables include **primary and foreign key constraints** to ensure relational integrity and maintain accurate, consistent data across the database.

# 🛠 Technologies

- **SQL / MySQL / MariaDB** – The database is implemented using standard SQL in a relational database management system.  
- **Normalized Schema Design** – Ensures minimal redundancy, data integrity, and efficient querying.  
- **Relational Constraints** – Primary keys, foreign keys, and checks are applied to enforce relationships and valid data entries.
