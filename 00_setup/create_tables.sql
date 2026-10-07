BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employees PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE departments PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
CREATE TABLE departments (
  dept_id    NUMBER(4)     PRIMARY KEY,
  dept_name  VARCHAR2(50)  NOT NULL
);

-- Employees table (salary is MONTHLY)
CREATE TABLE employees (
  emp_id      NUMBER(6)     PRIMARY KEY,
  first_name  VARCHAR2(30)  NOT NULL,
  last_name   VARCHAR2(30)  NOT NULL,
  salary      NUMBER(10,2),
  hire_date   DATE,
  dept_id     NUMBER(4),
  CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
-- Departments data
INSERT INTO departments VALUES (10, 'Human Resources');
INSERT INTO departments VALUES (20, 'Information Technology');
INSERT INTO departments VALUES (30, 'Finance');
INSERT INTO departments VALUES (40, 'Sales');

-- Employees data
INSERT INTO employees VALUES (101, 'Alice',   'Uwase',     150000, TO_DATE('2015-03-15','YYYY-MM-DD'), 10);
INSERT INTO employees VALUES (102, 'Bob',     'Mugisha',   320000, TO_DATE('2018-07-01','YYYY-MM-DD'), 20);
INSERT INTO employees VALUES (103, 'Claire',  'Ineza',     580000, TO_DATE('2012-01-10','YYYY-MM-DD'), 20);
INSERT INTO employees VALUES (104, 'David',   'Habimana',  900000, TO_DATE('2010-09-20','YYYY-MM-DD'), 30);
INSERT INTO employees VALUES (105, 'Eva',     'Mukamana',  250000, TO_DATE('2023-05-05','YYYY-MM-DD'), 40);
INSERT INTO employees VALUES (106, 'Frank',   'Niyonzima', 100000, TO_DATE('2025-11-01','YYYY-MM-DD'), 40);
INSERT INTO employees VALUES (107, 'Grace',   'Uwera',     450000, TO_DATE('2020-02-29','YYYY-MM-DD'), NULL);   -- no department
INSERT INTO employees VALUES (108, 'Henry',   'Bizimana',  NULL,   TO_DATE('2019-06-12','YYYY-MM-DD'), 10);     -- NULL salary
INSERT INTO employees VALUES (109, 'Ivy',     'Kamanzi',   200000, TO_DATE('2030-01-01','YYYY-MM-DD'), 30);     -- future hire date
INSERT INTO employees VALUES (110, 'Jean',    'Ndayisaba', 0,      TO_DATE('2021-08-18','YYYY-MM-DD'), 20);     -- zero salary


SELECT * FROM departments;
SELECT * FROM employees ORDER BY emp_id;




