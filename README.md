## Project Architecture

*   **README.md:** This document, providing a detailed exposition of the project's purpose, structure, and usage.
*   **LICENSE:** Specifies the terms of use and distribution for this project (Eclipse Public License - v 2.0).
*   **data/:** Houses any external data files utilized for populating the database tables.
*   **ddl/:** Contains scripts written in Data Definition Language (DDL) that define the database's structure:
    *   **schemas.sql:** Defines the core database schema, including tables, columns, data types, primary and foreign key constraints, and other integrity rules.
    *   **roles.sql:** Manages user access control by defining specific roles and assigning permissions to those roles.
    *   **views.sql:** Defines virtual tables (views) that provide simplified or customized perspectives on the underlying data.
    *   **functions.sql:** Implements stored functions and procedures to encapsulate reusable database logic and enhance data manipulation capabilities.
*   **dml/:** Contains scripts written in Data Manipulation Language (DML) for managing data within the database:
    *   **inserts.sql:** Scripts for populating the database tables with initial data sets.
    *   **optimisation.sql:** Contains SQL statements and commands designed to enhance database performance, such as creating indexes, optimizing queries, or implementing other performance-enhancing strategies.
*   **main.psql:** A master script that orchestrates the execution of the DDL and DML scripts in the appropriate sequence, ensuring proper database setup and data population.

## Code Ownership and Collaboration

@nordemaen - Functions, Queries, Inserts, Entity Relationship Diagram, and Orchestration
@JamesWicks01 - Design, Optimisation, Reporting, Security, and Normalisation

## Execution Instructions

To deploy and utilize this database project, follow these comprehensive instructions:

1.  **PostgreSQL Installation:** Ensure that PostgreSQL is installed and configured on your system. Download the appropriate version from the official PostgreSQL website: [https://www.postgresql.org/download/](https://www.postgresql.org/download/)

2.  **Database Creation:** Create a new PostgreSQL database instance using the `createdb` command-line utility or a graphical tool like pgAdmin:

    ```bash
    createdb your_database_name
    ```

    Replace `your_database_name` with a suitable name for your database.

3.  **Database Connection:** Establish a connection to the newly created database using the `psql` interactive terminal:

    ```bash
    psql -d your_database_name
    ```

4.  **Script Execution:** Execute the `main.psql` script from within the `psql` prompt to deploy the schema and populate the database:

    ```sql
    \i main.psql
    ```

    Alternatively, for granular control, you can execute the scripts individually in the following order:

    ```sql
    \i ddl/schemas.sql
    \i ddl/roles.sql       -- If applicable
    \i ddl/views.sql       -- If applicable
    \i ddl/functions.sql   -- If applicable
    \i dml/inserts.sql
    \i dml/optimisation.sql -- If applicable
    ```

## Licensing

This project is distributed under the terms of the [Eclipse Public License - v 2.0](LICENSE). A full copy of the license can be found at [https://www.eclipse.org/legal/epl-v20.html](https://www.eclipse.org/legal/epl-v20.html).

## Contact Information

For any inquiries or issues regarding this project, please contact open an issue.