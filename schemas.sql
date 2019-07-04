-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/WWEJJF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
----drop the table if exist
DROP TABLE IF EXISTS employees,department,dept_manager,titles,salaries;
-- create tables
CREATE TABLE "employees" (
    "employee_no" int   NOT NULL,
    "birthdate" Date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(12)   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "salaries" (
    "employee_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "dept_manager" (
    "employee_no" int   NOT NULL,
    "department_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "employee_no","department_no"
     )
);

CREATE TABLE "department" (
    "department_no" varchar(5)   NOT NULL,
    "department_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "department_no"
     )
);

CREATE TABLE "titles" (
    "employee_no" int   NOT NULL,
    "title" varchar(30)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "dept_emp" (
    "employee_no" int   NOT NULL,
    "department_no" varchar(5)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "employee_no","department_no"
     )
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_department_no" FOREIGN KEY("department_no")
REFERENCES "department" ("department_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_employee_no" FOREIGN KEY("employee_no")
REFERENCES "employees" ("employee_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_department_no" FOREIGN KEY("department_no")
REFERENCES "department" ("department_no");

