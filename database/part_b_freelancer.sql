
USE ZelanceDB;
GO

-- 1. Freelancer profile
CREATE TABLE dbo.FREELANCERS (
    freelancer_id INT PRIMARY KEY,
    headline NVARCHAR(150) NOT NULL,
    bio_summary NVARCHAR(MAX),
    location NVARCHAR(100) NOT NULL,
    university NVARCHAR(150),
    years_experience INT CHECK (years_experience >= 0),
    github_url NVARCHAR(255),
    hourly_rate DECIMAL(10,2) CHECK (hourly_rate >= 10),
    availability NVARCHAR(50) DEFAULT 'Full time',
    total_earned DECIMAL(10,2) DEFAULT 0.00,

    FOREIGN KEY (freelancer_id)
        REFERENCES dbo.USERS(user_id)
);
GO

-- 2. Freelancer skills
CREATE TABLE dbo.FREELANCER_SKILLS (
    freelancer_id INT NOT NULL,
    skill_id INT NOT NULL,
    skill_level NVARCHAR(20)
        CHECK (skill_level IN ('Beginner', 'Intermediate', 'Expert')),
    years_experience INT CHECK (years_experience >= 0),

    CONSTRAINT PK_FREELANCER_SKILLS
        PRIMARY KEY (freelancer_id, skill_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    FOREIGN KEY (skill_id)
        REFERENCES dbo.AI_SKILLS(skill_id)
);
GO

-- 3. Freelancer services
CREATE TABLE dbo.FREELANCER_SERVICES (
    freelancer_id INT NOT NULL,
    service_id INT NOT NULL,
    my_price DECIMAL(10,2) CHECK (my_price >= 0),

    CONSTRAINT PK_FREELANCER_SERVICES
        PRIMARY KEY (freelancer_id, service_id),

    FOREIGN KEY (freelancer_id)
        REFERENCES dbo.FREELANCERS(freelancer_id),

    FOREIGN KEY (service_id)
        REFERENCES dbo.AI_SERVICES(service_id)
);
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
  AND TABLE_NAME LIKE 'FREELANCER%'
ORDER BY TABLE_NAME;