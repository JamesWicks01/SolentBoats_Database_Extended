## Project Architecture

```
├── README.md         # Project documentation
├── LICENSE           # Eclipse Public License (v 2.0)
└── data/              # (Optional) External data files
    └── ...            # Data files (e.g., CSV, JSON)
└── ddl/                # Data Definition Language scripts
    ├── schemas.sql     # Core database schema definitions
    ├── roles.sql       # User roles and permissions (if applicable)
    ├── views.sql       # Database views (if applicable)
    └── functions.sql   # Stored functions and procedures
└── dml/                # Data Manipulation Language scripts
    ├── inserts.sql     # Scripts for populating database tables
    └── optimisation.sql   # Database performance optimization scripts
└── main.psql          # Script for executing DDL and DML scripts
```

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
