PRAGMA foreign_keys = OFF;

CREATE TABLE company(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT,
    address TEXT,
    icon BLOB
);

CREATE TABLE roles(
    id SMALLINT PRIMARY KEY,
    code VARCHAR(4) UNIQUE NOT NULL,
    name VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    roleId INTEGER NOT NULL,
    username VARCHAR(25) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL,
    FOREIGN KEY (roleId) REFERENCES roles(id)
);

CREATE TABLE countries(
    id INTEGER PRIMARY KEY,
    code VARCHAR(2) UNIQUE NOT NULL,
    name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE cities(
    id INTEGER PRIMARY KEY,
    countryId INTEGER NOT NULL,
    name VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (countryId) REFERENCES countries(id)
);

CREATE TABLE locations(
    id INTEGER PRIMARY KEY,
    cityId INTEGER NOT NULL,
    streetAddress VARCHAR(150) NOT NULL,
    postalCode VARCHAR(15),
    FOREIGN KEY (cityId) REFERENCES cities(id)
);

CREATE TABLE jobs(
    id INTEGER PRIMARY KEY,
    title VARCHAR(100) UNIQUE NOT NULL,
    minSalary NUMERIC(19, 5) NOT NULL,
    maxSalary NUMERIC(19, 5) NOT NULL
);

CREATE TABLE employees(
    id INTEGER PRIMARY KEY,
    jobId INTEGER NOT NULL,
    departmentId INTEGER,
    managerId INTEGER,
    userId INTEGER,
    idCard VARCHAR(25) UNIQUE,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK(gender IN ('M', 'F')),
    birthdate DATE,
    email VARCHAR(50) UNIQUE,
    phoneNumber VARCHAR(15) UNIQUE,
    hireDate DATE NOT NULL,
    salary NUMERIC(19, 5) NOT NULL,
    FOREIGN KEY (jobId) REFERENCES jobs(id),
    FOREIGN KEY (departmentId) REFERENCES departments(id),
    FOREIGN KEY (managerId) REFERENCES employees(id),
    FOREIGN KEY (userId) REFERENCES users(id)
);

CREATE TABLE departments(
    id INTEGER PRIMARY KEY,
    name VARCHAR(150) UNIQUE NOT NULL,
    managerId INTEGER,
    locationId INTEGER NOT NULL,
    FOREIGN KEY (managerId) REFERENCES employees(id),
    FOREIGN KEY (locationId) REFERENCES locations(id)
);

CREATE TABLE job_history(
    id INTEGER PRIMARY KEY,
    departmentId INTEGER NOT NULL,
    employeeId INTEGER NOT NULL,
    jobId INTEGER NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL
);

CREATE TABLE memberships(
    id INTEGER PRIMARY KEY,
    name VARCHAR(15) UNIQUE NOT NULL,
    description VARCHAR(150),
    price NUMERIC(19, 5) NOT NULL,
    duration SMALLINT NOT NULL,
    durationType CHAR(1) NOT NULL CHECK(durationType IN ('D', 'M', 'Y'))
);

CREATE TABLE customers(
    id INTEGER PRIMARY KEY,
    membershipId INTEGER NOT NULL,
    userId INTEGER,
    idCard VARCHAR(25) UNIQUE,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK(gender IN ('M', 'F')),
    birthdate DATE,
    email VARCHAR(50) UNIQUE,
    phoneNumber VARCHAR(15) UNIQUE,
    joiningDate DATE NOT NULL,
    endDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (membershipId) REFERENCES memberships(id)
);

PRAGMA foreign_keys = ON;

INSERT INTO
    roles(id, code, name)
VALUES
    (1, 'ADMR', 'ADMIN'),
    (2, 'MNGR', 'MANAGER'),
    (3, 'EMPL', 'EMPLOYEE'),
    (4, 'CUST', 'CUSTOMER');

INSERT INTO
    users(id, roleId, username, password)
VALUES
    (
        1,
        1,
        'admin',
        '$2a$10$ZfTA12S04CUU7kSvGbgYou/oH4XavsKlJ7vsHdmzZpomRDpRDk.92'
    );