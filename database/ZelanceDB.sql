
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


USE ZelanceDB;
GO

-- =============================================
-- TABLE 1: FREELANCERS
-- =============================================

CREATE TABLE dbo.FREELANCERS
(
    freelancer_id INT NOT NULL,
    headline NVARCHAR(150) NOT NULL,
    bio_summary NVARCHAR(MAX) NULL,
    location NVARCHAR(100) NOT NULL,
    university NVARCHAR(150) NULL,
    years_experience INT NULL,
    github_url NVARCHAR(255) NULL,
    hourly_rate DECIMAL(10,2) NULL,
    availability NVARCHAR(50)
        DEFAULT 'Full time',
    total_earned DECIMAL(10,2)
        DEFAULT 0.00,

    CONSTRAINT PK_FREELANCERS
        PRIMARY KEY (freelancer_id),

    CONSTRAINT FK_FREELANCERS_USERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.USERS(user_id),

    CONSTRAINT CK_FREELANCERS_YEARS
        CHECK (years_experience >= 0),

    CONSTRAINT CK_FREELANCERS_RATE
        CHECK (hourly_rate >= 10)
);
GO


-- =============================================
-- TABLE 2: FREELANCER_SKILLS
-- =============================================

CREATE TABLE dbo.FREELANCER_SKILLS
(
    freelancer_id INT NOT NULL,
    skill_id INT NOT NULL,
    skill_level NVARCHAR(20) NULL,
    years_experience INT NULL,

    CONSTRAINT PK_FREELANCER_SKILLS
        PRIMARY KEY (freelancer_id, skill_id),

    CONSTRAINT FK_FREELANCER_SKILLS_FREELANCERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    CONSTRAINT FK_FREELANCER_SKILLS_AI_SKILLS
        FOREIGN KEY (skill_id)
        REFERENCES dbo.AI_SKILLS(skill_id),

    CONSTRAINT CK_FREELANCER_SKILLS_LEVEL
        CHECK (skill_level IN
        ('Beginner', 'Intermediate', 'Expert')),

    CONSTRAINT CK_FREELANCER_SKILLS_YEARS
        CHECK (years_experience >= 0)
);
GO


-- =============================================
-- TABLE 3: FREELANCER_SERVICES
-- =============================================

CREATE TABLE dbo.FREELANCER_SERVICES
(
    freelancer_id INT NOT NULL,
    service_id INT NOT NULL,
    my_price DECIMAL(10,2) NULL,

    CONSTRAINT PK_FREELANCER_SERVICES
        PRIMARY KEY (freelancer_id, service_id),

    CONSTRAINT FK_FREELANCER_SERVICES_FREELANCERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    CONSTRAINT FK_FREELANCER_SERVICES_AI_SERVICES
        FOREIGN KEY (service_id)
        REFERENCES dbo.AI_SERVICES(service_id),

    CONSTRAINT CK_FREELANCER_SERVICES_PRICE
        CHECK (my_price >= 0)
);
GO

PRINT 'Part B tables created successfully.';
GO

USE ZelanceDB;
GO

CREATE TABLE dbo.FREELANCERS
(
    freelancer_id INT NOT NULL,
    headline NVARCHAR(150) NOT NULL,
    bio_summary NVARCHAR(MAX) NULL,
    location NVARCHAR(100) NOT NULL,
    university NVARCHAR(150) NULL,
    years_experience INT NULL,
    github_url NVARCHAR(255) NULL,
    hourly_rate DECIMAL(10,2) NULL,
    availability NVARCHAR(50)
        DEFAULT 'Full time',
    total_earned DECIMAL(10,2)
        DEFAULT 0.00,

    CONSTRAINT PK_FREELANCERS
        PRIMARY KEY (freelancer_id),

    CONSTRAINT FK_FREELANCERS_USERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.USERS(user_id),

    CONSTRAINT CK_FREELANCERS_YEARS
        CHECK (years_experience >= 0),

    CONSTRAINT CK_FREELANCERS_RATE
        CHECK (hourly_rate >= 10)
);
GO

CREATE TABLE dbo.FREELANCER_SKILLS
(
    freelancer_id INT NOT NULL,
    skill_id INT NOT NULL,
    skill_level NVARCHAR(20) NULL,
    years_experience INT NULL,

    CONSTRAINT PK_FREELANCER_SKILLS
        PRIMARY KEY (freelancer_id, skill_id),

    CONSTRAINT FK_FREELANCER_SKILLS_FREELANCERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    CONSTRAINT FK_FREELANCER_SKILLS_AI_SKILLS
        FOREIGN KEY (skill_id)
        REFERENCES dbo.AI_SKILLS(skill_id),

    CONSTRAINT CK_FREELANCER_SKILLS_LEVEL
        CHECK (skill_level IN
        ('Beginner', 'Intermediate', 'Expert')),

    CONSTRAINT CK_FREELANCER_SKILLS_YEARS
        CHECK (years_experience >= 0)
);
GO


CREATE TABLE dbo.FREELANCER_SERVICES
(
    freelancer_id INT NOT NULL,
    service_id INT NOT NULL,
    my_price DECIMAL(10,2) NULL,

    CONSTRAINT PK_FREELANCER_SERVICES
        PRIMARY KEY (freelancer_id, service_id),

    CONSTRAINT FK_FREELANCER_SERVICES_FREELANCERS
        FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    CONSTRAINT FK_FREELANCER_SERVICES_AI_SERVICES
        FOREIGN KEY (service_id)
        REFERENCES dbo.AI_SERVICES(service_id),

    CONSTRAINT CK_FREELANCER_SERVICES_PRICE
        CHECK (my_price >= 0)
);
GO




USE ZelanceDB;
GO

SELECT user_id, full_name, role
FROM USERS
ORDER BY user_id;
GO


USE ZelanceDB;
GO

INSERT INTO dbo.FREELANCERS
(
    freelancer_id,
    headline,
    bio_summary,
    location,
    university,
    years_experience,
    github_url,
    hourly_rate,
    availability
)
VALUES
(1, 'Machine Learning Engineer',
 'Experienced in building predictive models and machine learning solutions.',
 'Colombo, Sri Lanka', 'NSBM Green University',
 2, 'https://github.com/sample-freelancer1', 35.00, 'Full time'),

(2, 'Deep Learning Specialist',
 'Develops neural networks and deep learning applications.',
 'Kandy, Sri Lanka', 'University of Peradeniya',
 3, 'https://github.com/sample-freelancer2', 45.00, 'Part time'),

(3, 'NLP Engineer',
 'Works on text processing, chatbots and natural language applications.',
 'Galle, Sri Lanka', 'University of Moratuwa',
 2, 'https://github.com/sample-freelancer3', 40.00, 'Full time'),

(4, 'Computer Vision Developer',
 'Builds image recognition and computer vision systems.',
 'Negombo, Sri Lanka', 'NSBM Green University',
 4, 'https://github.com/sample-freelancer4', 50.00, 'Full time'),

(5, 'Generative AI Developer',
 'Creates AI-powered applications using generative AI technologies.',
 'Kurunegala, Sri Lanka', 'SLIIT',
 2, 'https://github.com/sample-freelancer5', 55.00, 'Part time'),

(6, 'Data Analytics Specialist',
 'Provides data analysis, visualization and business insights.',
 'Matara, Sri Lanka', 'University of Ruhuna',
 3, 'https://github.com/sample-freelancer6', 30.00, 'Full time'),

(7, 'AI Research Assistant',
 'Supports AI research, experimentation and model evaluation.',
 'Colombo, Sri Lanka', 'University of Colombo',
 1, 'https://github.com/sample-freelancer7', 25.00, 'Part time'),

(8, 'AI Automation Developer',
 'Develops automation solutions using AI and machine learning.',
 'Ja-Ela, Sri Lanka', 'NSBM Green University',
 3, 'https://github.com/sample-freelancer8', 42.00, 'Full time'),

(9, 'AI Model Deployment Engineer',
 'Deploys and maintains machine learning models in production.',
 'Panadura, Sri Lanka', 'SLIIT',
 4, 'https://github.com/sample-freelancer9', 60.00, 'Full time'),

(10, 'AI Data Scientist',
 'Builds data-driven models and performs statistical analysis.',
 'Nuwara Eliya, Sri Lanka', 'University of Peradeniya',
 2, 'https://github.com/sample-freelancer10', 38.00, 'Part time');
GO


USE ZelanceDB;
GO

INSERT INTO dbo.FREELANCER_SKILLS
(
    freelancer_id,
    skill_id,
    skill_level,
    years_experience
)
VALUES
(1, 1, 'Expert', 2),
(1, 2, 'Intermediate', 1),
(2, 3, 'Expert', 3),
(2, 4, 'Intermediate', 2),
(3, 5, 'Expert', 2),
(3, 6, 'Intermediate', 1),
(4, 7, 'Expert', 4),
(4, 8, 'Intermediate', 2),
(5, 9, 'Expert', 2),
(6, 10, 'Expert', 3),
(7, 1, 'Beginner', 1),
(7, 5, 'Intermediate', 1),
(8, 2, 'Expert', 3),
(8, 9, 'Intermediate', 2),
(9, 3, 'Expert', 4),
(9, 7, 'Intermediate', 2),
(10, 6, 'Expert', 2),
(10, 10, 'Intermediate', 1);
GO

SELECT *
FROM dbo.FREELANCER_SKILLS
ORDER BY freelancer_id, skill_id;
GO


INSERT INTO dbo.FREELANCER_SERVICES
(
    freelancer_id,
    service_id,
    my_price
)
VALUES
(1, 1, 18000.00),
(1, 2, 14000.00),
(2, 3, 28000.00),
(2, 4, 22000.00),
(3, 5, 17000.00),
(3, 6, 19000.00),
(4, 7, 23000.00),
(4, 8, 13000.00),
(5, 9, 27000.00),
(6, 10, 12000.00),
(7, 1, 16000.00),
(7, 5, 15000.00),
(8, 2, 13500.00),
(8, 9, 24000.00),
(9, 3, 30000.00),
(9, 7, 21000.00),
(10, 6, 18500.00),
(10, 10, 11000.00);
GO

SELECT *
FROM dbo.FREELANCER_SERVICES
ORDER BY freelancer_id, service_id;
GO



-- PART C: CLIENT PROJECTS TABLES


CREATE TABLE dbo.PROJECTS
(
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT NOT NULL
        CONSTRAINT FK_PROJECTS_CLIENTS FOREIGN KEY REFERENCES dbo.CLIENTS(client_id),
    project_title NVARCHAR(200) NOT NULL,
    description NVARCHAR(MAX) NOT NULL,
    ai_area NVARCHAR(30) NOT NULL
        CONSTRAINT CK_PROJECTS_AI_AREA CHECK (ai_area IN ('ML', 'DEEP_LEARNING', 'NLP', 'VISION', 'GENAI', 'DATA_ANALYTICS')),
    budget DECIMAL(10,2) NOT NULL
        CONSTRAINT CK_PROJECTS_BUDGET CHECK (budget >= 50.00),
    deadline_date DATE NOT NULL,
    project_status NVARCHAR(20) NOT NULL DEFAULT 'OPEN'
        CONSTRAINT CK_PROJECTS_STATUS CHECK (project_status IN ('OPEN', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),
    posted_date DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO

CREATE TABLE dbo.PROJECT_REQUIREMENTS
(
    requirement_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id INT NOT NULL
        CONSTRAINT FK_REQ_PROJECTS FOREIGN KEY REFERENCES dbo.PROJECTS(project_id),
    skill_id INT NOT NULL
        CONSTRAINT FK_REQ_SKILLS FOREIGN KEY REFERENCES dbo.AI_SKILLS(skill_id),
    requirement_note NVARCHAR(255) NULL
);
GO

CREATE TABLE dbo.PROPOSALS
(
    proposal_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id INT NOT NULL
        CONSTRAINT FK_PROPOSALS_PROJECTS FOREIGN KEY REFERENCES dbo.PROJECTS(project_id),
    freelancer_id INT NOT NULL
        CONSTRAINT FK_PROPOSALS_FREELANCERS FOREIGN KEY REFERENCES dbo.FREELANCERS(freelancer_id),
    bid_amount DECIMAL(10,2) NOT NULL
        CONSTRAINT CK_PROPOSALS_BID CHECK (bid_amount >= 10.00),
    delivery_days INT NOT NULL
        CONSTRAINT CK_PROPOSALS_DAYS CHECK (delivery_days >= 1),
    message NVARCHAR(MAX) NOT NULL,
    proposal_status NVARCHAR(20) NOT NULL DEFAULT 'PENDING'
        CONSTRAINT CK_PROPOSALS_STATUS CHECK (proposal_status IN ('PENDING', 'ACCEPTED', 'REJECTED')),
    submitted_date DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT UQ_PROPOSALS_PROJECT_FREELANCER UNIQUE (project_id, freelancer_id)
);
GO


-- PART C: SAMPLE DATA (10+ ROWS PER TABLE)


INSERT INTO dbo.PROJECTS (client_id, project_title, description, ai_area, budget, deadline_date, project_status)
VALUES
(1,  'Fine-tune Llama 3 for Legal Contracts',    'Fine-tune open LLM with QLoRA for contract clause review and extraction.', 'GENAI',          3500.00, '2026-12-20', 'OPEN'),
(2,  'Detect Defects on Tea Leaves with YOLOv8',  'Real-time defect detection on tea leaves from conveyor camera feeds.',     'VISION',         1800.00, '2026-12-22', 'OPEN'),
(3,  'Sinhala Sentiment Analysis',                'Classify sentiment across Sinhala news and social media posts.',            'NLP',            1200.00, '2026-12-18', 'OPEN'),
(4,  'Credit Risk Scoring Model',                 'Build gradient boosted credit risk model for loan applicants.',             'ML',             2400.00, '2026-12-25', 'OPEN'),
(5,  'Clinical Triage Time-Series Forecast',      'Forecast patient arrival spikes using sequence deep learning models.',     'DEEP_LEARNING',  2900.00, '2026-12-28', 'OPEN'),
(6,  'Container Route Delay Predictor',           'Predict port-to-warehouse shipment delays using historical transit logs.', 'ML',             1500.00, '2026-12-19', 'OPEN'),
(7,  'Customer Churn Early Warning',              'Identify at-risk retail customers from purchase frequency and returns.',   'ML',             1100.00, '2026-12-17', 'OPEN'),
(8,  'Crop Yield & Rainfall Analytics',           'Clean regional weather and harvest data and build summary dashboards.',  'DATA_ANALYTICS',  950.00, '2026-12-16', 'OPEN'),
(9,  'Claim Document Entity Extractor',           'Extract policy numbers, dates, and claim amounts from PDF forms.',       'NLP',            1750.00, '2026-12-24', 'OPEN'),
(10, 'Vessel Berthing Vision Monitor',            'Detect berth occupancy and crane activity from harbor video streams.',    'VISION',         2600.00, '2026-12-30', 'OPEN');
GO

INSERT INTO dbo.PROJECT_REQUIREMENTS (project_id, skill_id, requirement_note)
VALUES
(1,  9,  'QLoRA fine-tuning on legal contract dataset'),
(1,  5,  'Transformer evaluation and prompt tuning'),
(2,  7,  'YOLOv8 training and export for edge inference'),
(2,  8,  'Image preprocessing and augmentation pipeline'),
(3,  5,  'Multilingual Transformer fine-tuning'),
(4,  2,  'XGBoost model training and SHAP explainability'),
(5,  3,  'PyTorch sequence model training'),
(6,  1,  'Scikit-learn baseline and feature pipeline'),
(7,  1,  'Churn classification model'),
(8,  10, 'Pandas cleaning and summary reporting'),
(9,  6,  'spaCy entity extraction pipeline'),
(10, 7,  'YOLOv8 object detection for port cameras');
GO

INSERT INTO dbo.PROPOSALS (project_id, freelancer_id, bid_amount, delivery_days, message, proposal_status)
VALUES
(1, 1,  3200.00, 14, 'Experienced in QLoRA fine-tuning and legal NLP pipelines; 14-day delivery.', 'PENDING'),
(1, 2,  3400.00, 12, 'Can deliver quantized fine-tuned model and evaluation benchmark in 12 days.', 'PENDING'),
(1, 3,  3000.00, 18, 'Strong NLP background with transformer text extraction pipelines.', 'PENDING'),
(2, 4,  1750.00, 10, 'Built YOLOv8 inspection models for industrial visual quality checks.', 'PENDING'),
(3, 3,  1150.00, 8,  'Experienced with transformer classification on low-resource text.', 'PENDING'),
(4, 1,  2300.00, 12, 'Strong experience with tabular ML and feature engineering.', 'PENDING'),
(5, 2,  2800.00, 15, 'Experienced in PyTorch deep learning training and tuning.', 'PENDING'),
(6, 6,  1450.00, 9,  'Can analyze transit logs and build predictive features.', 'PENDING'),
(7, 8,  1050.00, 7,  'Ready to deliver churn scoring pipeline with clear metrics.', 'PENDING'),
(8, 6,  900.00,  6,  'Will clean raw CSVs in Pandas and summarize key trends.', 'PENDING'),
(9, 10, 1700.00, 10, 'Experienced with spaCy custom entity extraction workflows.', 'PENDING');
GO


-- PART C: STORED PROCEDURE


CREATE PROCEDURE dbo.sp_register_project
    @client_id INT,
    @project_title NVARCHAR(200),
    @description NVARCHAR(MAX),
    @ai_area NVARCHAR(30),
    @budget DECIMAL(10,2),
    @deadline_date DATE,
    @skill_id INT,
    @requirement_note NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO dbo.PROJECTS
            (client_id, project_title, description, ai_area, budget, deadline_date, project_status)
        VALUES
            (@client_id, @project_title, @description, @ai_area, @budget, @deadline_date, 'OPEN');

        DECLARE @new_project_id INT = SCOPE_IDENTITY();

        INSERT INTO dbo.PROJECT_REQUIREMENTS
            (project_id, skill_id, requirement_note)
        VALUES
            (@new_project_id, @skill_id, @requirement_note);

        COMMIT TRANSACTION;

        SELECT @new_project_id AS created_project_id;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO



















