
-- Kaveesha's Part- Part A


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







INSERT INTO AI_SKILLS (skill_name, ai_area)
VALUES
('scikit-learn',              'ML'),
('XGBoost',                   'ML'),
('PyTorch',                   'DEEP_LEARNING'),
('TensorFlow',                'DEEP_LEARNING'),
('Hugging Face Transformers', 'NLP'),
('spaCy',                     'NLP'),
('YOLOv8',                    'VISION'),
('OpenCV',                    'VISION'),
('QLoRA Fine-Tuning',         'GENAI'),
('Pandas & NumPy',            'DATA_ANALYTICS');






INSERT INTO AI_SERVICES (service_title, ai_area, description, base_price)
VALUES
('Custom Predictive ML Model',          'ML',             'Build and train classification or regression models for business forecasting.', 85000.00),
('Customer Churn Prediction',           'ML',             'Predict customer drop-off using historical behavior and scikit-learn pipelines.', 75000.00),
('Deep Neural Network Training',        'DEEP_LEARNING',  'Design and optimize multi-layer PyTorch models on GPU.', 120000.00),
('Time-Series LSTM Forecasting',        'DEEP_LEARNING',  'Sequence modeling for demand, energy, or financial time-series data.', 110000.00),
('Sinhala & English Sentiment Engine',  'NLP',            'Text classification and sentiment analysis using Transformers.', 95000.00),
('Document Named Entity Extraction',    'NLP',            'Automatically extract names, dates, and clauses from PDFs and contracts.', 90000.00),
('YOLOv8 Visual Defect Detection',      'VISION',         'Real-time image and video object detection for quality inspection.', 130000.00),
('OCR & Invoice Scanning Pipeline',     'VISION',         'Extract structured text from scanned receipts and forms.', 80000.00),
('Private LLM Fine-Tuning (Llama 3)',   'GENAI',          'Fine-tune open-source LLMs with QLoRA on custom domain documents.', 160000.00),
('Business Data Cleaning & Dashboard',  'DATA_ANALYTICS', 'Clean raw datasets with Pandas and produce analytical summaries.', 55000.00);

--SELECT * FROM AI_SERVICES

USE ZelanceDB;

--Creating 5% paltform Fee

CREATE FUNCTION fn_calculate_platform_fee (@amount DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @amount * 0.05;
END;

SELECT dbo.fn_calculate_platform_fee(100000.00) AS PlatformFee;










-- =============================================
-- PART B: FREELANCER TABLES
-- =============================================

CREATE TABLE FREELANCERS (
    freelancer_id INT PRIMARY KEY
        FOREIGN KEY REFERENCES USERS(user_id),

    headline NVARCHAR(150),

    bio_summary NVARCHAR(MAX),

    university NVARCHAR(150),

    years_experience INT
        CHECK (years_experience >= 0),

    github_url NVARCHAR(255),

    avg_rating DECIMAL(3,2) DEFAULT 0.00
        CHECK (avg_rating BETWEEN 0 AND 5),

    total_earnings DECIMAL(12,2) DEFAULT 0.00
        CHECK (total_earnings >= 0)
);


CREATE TABLE FREELANCER_SKILLS (
    freelancer_id INT,
    skill_id INT,

    PRIMARY KEY (freelancer_id, skill_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES FREELANCERS(freelancer_id),

    FOREIGN KEY (skill_id)
        REFERENCES AI_SKILLS(skill_id)
);


CREATE TABLE FREELANCER_SERVICES (
    freelancer_id INT,
    service_id INT,

    PRIMARY KEY (freelancer_id, service_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES FREELANCERS(freelancer_id),

    FOREIGN KEY (service_id)
        REFERENCES AI_SERVICES(service_id)
);




USE ZelanceDB;
GO

INSERT INTO USERS
    (full_name, email, password_hash, role, status)
VALUES
('Nethmi Perera', 'nethmi@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Ashan Silva', 'ashan@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Ravindu Jayasuriya', 'ravindu@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Thilini Fernando', 'thilini@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Dinuka Wijesinghe', 'dinuka@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Sahan Bandara', 'sahan@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE'),
('Amaya Senanayake', 'amaya@example.com', 'demo_hash', 'FREELANCER', 'ACTIVE');
GO




USE ZelanceDB;
GO

INSERT INTO FREELANCERS
    (freelancer_id, headline, bio_summary, location,
     university, years_experience, github_url,
     hourly_rate, availability, total_earned)
VALUES
(1, 'Machine Learning Developer',
 'Experienced in building predictive ML models.',
 'Colombo', 'NSBM Green University', 2,
 'https://github.com/nethmi', 2500.00, 'Full time', 25000.00),

(2, 'AI & Deep Learning Engineer',
 'Specialized in neural networks and deep learning.',
 'Kandy', 'University of Colombo', 3,
 'https://github.com/ashan', 3500.00, 'Full time', 45000.00),

(3, 'NLP Developer',
 'Develops text processing and NLP applications.',
 'Galle', 'University of Moratuwa', 2,
 'https://github.com/ravindu', 2000.00, 'Full time', 18000.00),

(4, 'Computer Vision Engineer',
 'Works on image processing and object detection.',
 'Colombo', 'SLIIT', 4,
 'https://github.com/thilini', 4000.00, 'Full time', 60000.00),

(5, 'Data Analyst',
 'Provides data cleaning and analytical solutions.',
 'Kurunegala', 'NSBM Green University', 1,
 'https://github.com/dinuka', 1500.00, 'Full time', 12000.00),

(6, 'Generative AI Developer',
 'Builds AI-powered applications and LLM solutions.',
 'Negombo', 'University of Kelaniya', 3,
 'https://github.com/sahan', 3000.00, 'Full time', 38000.00),

(7, 'AI Research Assistant',
 'Interested in machine learning and AI research.',
 'Matara', 'University of Peradeniya', 2,
 'https://github.com/amaya', 1800.00, 'Full time', 20000.00);
GO






INSERT INTO FREELANCER_SKILLS
(freelancer_id, skill_id, skill_level, years_experience)
VALUES
(1, 1, 'Expert', 4),
(1, 2, 'Intermediate', 2),
(2, 3, 'Expert', 5),
(2, 4, 'Intermediate', 3),
(3, 5, 'Expert', 4),
(3, 6, 'Intermediate', 2),
(4, 7, 'Expert', 3),
(4, 8, 'Intermediate', 2),
(5, 9, 'Expert', 3),
(5, 10, 'Intermediate', 2),
(6, 1, 'Intermediate', 2),
(6, 10, 'Expert', 4),
(7, 3, 'Intermediate', 2),
(7, 5, 'Expert', 3);




INSERT INTO AI_SKILLS (skill_name, ai_area)
VALUES
('scikit-learn', 'ML'),
('XGBoost', 'ML'),
('PyTorch', 'DEEP_LEARNING'),
('TensorFlow', 'DEEP_LEARNING'),
('Hugging Face Transformers', 'NLP'),
('spaCy', 'NLP'),
('YOLOv8', 'VISION'),
('OpenCV', 'VISION'),
('QLoRA Fine-Tuning', 'GENAI'),
('Pandas & NumPy', 'DATA_ANALYTICS');
GO

INSERT INTO AI_SERVICES
(service_title, ai_area, description, base_price)
VALUES
('Machine Learning Model Development',
 'ML',
 'Development of machine learning models for prediction and classification.',
 15000),

('Data Prediction System',
 'ML',
 'Build predictive systems using structured datasets.',
 12000),

('Deep Learning Model Development',
 'DEEP_LEARNING',
 'Development of deep learning models for complex tasks.',
 25000),

('Neural Network Development',
 'DEEP_LEARNING',
 'Design and training of neural network models.',
 20000),

('Natural Language Processing',
 'NLP',
 'Text processing, sentiment analysis and language understanding.',
 15000),

('Chatbot Development',
 'NLP',
 'Development of AI-powered conversational chatbots.',
 18000),

('Computer Vision System',
 'VISION',
 'Image recognition and object detection solutions.',
 20000),

('Image Processing Service',
 'VISION',
 'Image analysis and image processing using AI.',
 12000),

('Generative AI Application',
 'GENAI',
 'Development of applications using generative AI models.',
 25000),

('Data Analytics and Visualization',
 'DATA_ANALYTICS',
 'Data analysis, reporting and visualization services.',
 10000);

 INSERT INTO FREELANCER_SERVICES
(freelancer_id, service_id, my_price)
VALUES
(1, 1, 18000),
(1, 2, 15000),
(2, 3, 28000),
(2, 4, 22000),
(3, 5, 17000),
(3, 6, 20000),
(4, 7, 25000),
(4, 8, 15000),
(5, 9, 30000),
(5, 10, 12000),
(6, 1, 16000),
(6, 10, 11000),
(7, 3, 24000),
(7, 5, 18000);


