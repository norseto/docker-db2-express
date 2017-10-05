# DB2 Linux Express-C
### Predefined environments in this container
1. LICENSE : `accept`
1. DB2INST1_PASSWORD : `<YourStrong!Passw0rd>`

### Installation
`docker pull norseto/db2-express`

### Database creation on startup
Create database creation shell script file and save as `.sh` file.

---
[Sample script file]

    #!/bin/sh

    echo "Creating database Work. This may take a while..."
    db2 create db Work
---
Next, create database initialization sql file and save as `.sql` file.

---
[Sample script file]

    connect to Work;

    CREATE TABLE TEST_TABLE (
      ID int primary key,
      NAME nvarchar(50)
    )
---
Start the container. The container runs .sql or .sh files in the /docker-entrypoint-initdb.d when any database does not exist(`db2 list db directory` returns error).

`docker run -d -p 50000:50000 -v SQL_FILE_DIRECTORY:/docker-entrypoint-initdb.d norseto/db2-express`

Change SQL_FILE_DIRECTORY to the director .sql file exists.    
