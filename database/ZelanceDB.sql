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




INSERT INTO CLIENTS (client_id, company_name, industry, company_address, verified_status, total_spent)
VALUES
(1,  'Lanka Legal Tech',        'Legal Technology',   'No. 45, Galle Road, Colombo 03',          'VERIFIED',   0.00),
(2,  'Ceylon Tea Exports',      'Agriculture & Export', 'No. 18, Union Place, Colombo 02',       'VERIFIED',   180000.00),
(3,  'Colombo Media Lab',       'Digital Media',      'No. 92, Duplication Road, Colombo 04',    'VERIFIED',   120000.00),
(4,  'Serendib FinTech',        'Financial Services', 'Level 12, World Trade Center, Colombo 01','VERIFIED',   450000.00),
(5,  'Kandy Health AI',         'Healthcare Tech',    'No. 77, Peradeniya Road, Kandy',          'VERIFIED',   210000.00),
(6,  'Galle Logistics Ltd',     'Supply Chain',       'No. 14, Matara Road, Galle',              'UNVERIFIED', 0.00),
(7,  'Ceylon Retail Group',     'E-Commerce',         'No. 210, High Level Road, Nugegoda',      'VERIFIED',   95000.00),
(8,  'Island AgriTech',         'Smart Farming',      'No. 33, Negombo Road, Kurunegala',        'VERIFIED',   75000.00),
(9,  'Lanka Insure Corp',       'Insurance',          'No. 60, Dharmapala Mawatha, Colombo 07',  'VERIFIED',   310000.00),
(10, 'Colombo Port Tech',       'Maritime Systems',   'No. 08, Chaithya Road, Colombo 01',       'UNVERIFIED', 0.00);



SELECT * FROM CLIENTS;


















