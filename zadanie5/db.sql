--employees table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position ENUM('EMPLOYEE', 'MANAGER', 'DIRECTOR') NOT NULL,
    email VARCHAR(100) NOT NULL
);

--replacements table
CREATE TABLE replacements (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    employee_id INT NOT NULL,
    deputy_id INT NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    is_active BOOLEAN DEFAULT true,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (deputy_id) REFERENCES employees(id)
);

--documents table
CREATE TABLE documents (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    creation_date DATETIME NOT NULL,
    status ENUM('CREATED', 'MANAGER_APPROVED', 'DIRECTOR_APPROVED') NOT NULL,
    creator_id INT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES employees(id)
);

--approval history table
CREATE TABLE approval_history (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    document_id INT NOT NULL,
    employee_id INT NOT NULL,
    approval_type ENUM('MANAGER_APPROVAL', 'DIRECTOR_APPROVAL') NOT NULL,
    approval_date DATETIME NOT NULL,
    FOREIGN KEY (document_id) REFERENCES documents(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
);