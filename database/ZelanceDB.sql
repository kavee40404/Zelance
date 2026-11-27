CREATE DATABASE ZelanceDB;
USE ZelanceDB;


CREATE TABLE USERS (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(150) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    role NVARCHAR(20) NOT NULL CHECK (role IN ('CLIENT', 'FREELANCER', 'ADMIN')),
    status NVARCHAR(20) DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'BLOCKED')),
    created_at DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE CLIENTS (
    client_id INT PRIMARY KEY FOREIGN KEY REFERENCES USERS(user_id),
    company_name NVARCHAR(150) NOT NULL,
    industry NVARCHAR(100) NOT NULL,
    company_address NVARCHAR(255) NOT NULL,
    verified_status NVARCHAR(20) DEFAULT 'UNVERIFIED',
    total_spent DECIMAL(10,2) DEFAULT 0.00
);




CREATE TABLE AI_SKILLS (
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name NVARCHAR(100) UNIQUE NOT NULL,
    ai_area NVARCHAR(30) CHECK (ai_area IN ('ML', 'DEEP_LEARNING', 'NLP', 'VISION', 'GENAI', 'DATA_ANALYTICS'))
);

CREATE TABLE AI_SERVICES (
    service_id INT IDENTITY(1,1) PRIMARY KEY,
    service_title NVARCHAR(150) UNIQUE NOT NULL,
    ai_area NVARCHAR(30) NOT NULL,
    description NVARCHAR(MAX),
    base_price DECIMAL(10,2) CHECK (base_price >= 0)
);


INSERT INTO USERS (full_name, email, password_hash, role, status)
VALUES
('Kaveesha Fernando',       'kaveeshafernando@gmail.com',  'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Madusha Sewmina',        'madushasewmina@gmail.com',  'hash_demo_123', 'CLIENT', 'ACTIVE'),
('chamod Perera',  'chamodperera@gmail.com',   'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Sithmi Manthirathna',    'sithmimanthirathna@outlook.com',  'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Tharindu Rajapaksa', 'tharindu@kandyhealthai.lk',  'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Malini Gunasekara',  'malini@gallelogistics.lk',   'hash_demo_123', 'CLIENT', 'ACTIVE'),
('SanjeewaBandara',    'sanjeewa@ceylonretail.lk',   'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Kavindi Senanayake', 'kavindi@islandagritech.lk',  'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Pradeep Fernando',   'pradeep@lankainsure.lk',     'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Ruwan Dissanayake',  'ruwan@colomboporttech.lk',   'hash_demo_123', 'CLIENT', 'ACTIVE'),
('Ishara Fernando',    'ishara@zelance.hotmail.com', 'hash_demo_123', 'FREELANCER', 'ACTIVE'),
('Kasun Wijesinghe',   'kasun@zelance.dev',          'hash_demo_123', 'FREELANCER', 'ACTIVE'),
('Dilani Jayasuriya',  'dilani@zelance.dev',         'hash_demo_123', 'FREELANCER', 'ACTIVE'),
('System Admin',       'admin@zelance.dev',          'hash_demo_123', 'ADMIN', 'ACTIVE');


SELECT * FROM USERS;






















