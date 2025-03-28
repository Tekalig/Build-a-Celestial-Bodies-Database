# Build-a-Celestial-Bodies-Database

## Project Description
This project involves creating a PostgreSQL database named `universe` to store information about various celestial bodies including asteroids, galaxies, moons, planets, and stars. The database schema and sample data provided here can be used to study and analyze the properties and relationships of these celestial entities.

## Database Schema
The database `universe` contains the following tables:

1. **asteroid**
    - `asteroid_id`: Integer, Primary Key
    - `name`: Varchar(255), Unique, Not Null
    - `diameter_km`: Double Precision
    - `orbital_period_days`: Double Precision
    - `distance_from_sun_au`: Double Precision
    - `discovery_year`: Integer
    - `has_moons`: Boolean
    - `star_id`: Integer, Foreign Key referencing `star(star_id)`

2. **galaxy**
    - `galaxy_id`: Integer, Primary Key
    - `name`: Varchar(255), Unique, Not Null
    - `type`: Text
    - `distance_light_years`: Numeric(15,2)
    - `discovery_year`: Integer
    - `num_of_stars`: Bigint
    - `is_active`: Boolean

3. **moon**
    - `moon_id`: Integer, Primary Key
    - `name`: Varchar(255), Unique, Not Null
    - `planet_id`: Integer, Foreign Key referencing `planet(planet_id)` with Cascade Update/Delete
    - `diameter_km`: Double Precision
    - `orbital_period_days`: Double Precision
    - `distance_from_planet_km`: Double Precision
    - `discovery_year`: Integer

4. **planet**
    - `planet_id`: Integer, Primary Key
    - `name`: Varchar(255), Unique, Not Null
    - `star_id`: Integer, Foreign Key referencing `star(star_id)` with Cascade Update/Delete
    - `type`: Text
    - `mass_earth`: Double Precision
    - `radius_km`: Double Precision
    - `orbital_period_days`: Double Precision
    - `distance_from_star_au`: Double Precision
    - `has_life_potential`: Boolean
    - `discovery_method`: Text
    - `is_habitable`: Boolean

5. **star**
    - `star_id`: Integer, Primary Key
    - `name`: Varchar(255), Unique, Not Null
    - `galaxy_id`: Integer, Foreign Key referencing `galaxy(galaxy_id)` with Cascade Update/Delete
    - `type`: Text
    - `solar_mass`: Double Precision
    - `radius_km`: Double Precision
    - `luminosity`: Double Precision
    - `tempreture_k`: Integer
    - `age_billion_years`: Double Precision

## Sample Data
The database contains sample data for each table. Here are some examples:

### Asteroids
- Ceres
- Pallas
- Vesta
- Juno
- Eros

### Galaxies
- Milky Way
- Andromeda
- Triangulum
- Sombrero
- Whirlpool

### Moons
- Moon (Earth's Moon)
- Phobos
- Deimos
- Io
- Europa

### Planets
- Mercury
- Venus
- Earth
- Mars
- Jupiter

### Stars
- Sun
- Alpha Centauri A
- Alpha Centauri B
- Betelgeuse
- Sirius A

## Installation and Usage
To set up and use the database:

1. Ensure you have PostgreSQL installed on your system.
2. Create the database and tables by running the SQL commands provided in the project.
3. Insert the sample data into the tables.
4. Connect to the database using a PostgreSQL client to query and analyze the data.

## Contribution
If you would like to contribute to this project, please fork the repository and submit a pull request with your changes. Ensure that your code follows the project's coding standards and includes appropriate tests.

## License
This project is licensed under the MIT License.

---

Feel free to customize this content based on your specific needs and preferences for the project.
