# PL/SQL GOTO Statements and Functions

**Course:** Database Development with PL/SQL (INSY 8311)
**Instructor:** Eric Maniraguha
**Assignment:** Individual Assignment III
**Student:** NAYIHIKI Nshuti Honore | **ID:** 29683
**Repository:** plsql-goto-functions-29683-honore

## Project Description

This project practises PL/SQL GOTO statements, stored functions, exception handling, and using functions inside SQL queries. It works on two sample tables, `departments` and `employees` (salaries are **monthly**), and covers:

- **Part A:** GOTO programs, an illegal GOTO with its fix, and a rewrite without GOTO
- **Part B:** four stored functions and a query that uses them in SQL
- **Part C:** a combined payroll validator function and a written reflection

## Environment

- Oracle Database 21c XE running in a virtual machine
- Oracle SQL Developer (connection: HonoreDB)
- Scripts run with **F5 (Run Script)**; output viewed in Script Output, Dbms Output, and Query Result

## Repository Structure

```
plsql-goto-functions-29683-honore/
├── README.md
├── .gitignore
├── 00_setup/
│   └── create_tables.sql
├── 01_goto/
│   ├── A1_number_classifier.sql
│   ├── A2_salary_review.sql
│   ├── A3_illegal_goto.sql
│   └── A4_rewrite_no_goto.sql
├── 02_functions/
│   ├── B1_fn_annual_salary.sql
│   ├── B2_fn_years_of_service.sql
│   ├── B3_fn_calculate_tax.sql
│   ├── B4_fn_dept_name.sql
│   └── C1_fn_validate_payroll.sql
├── 03_tests/
│   ├── B5_functions_in_select.sql
│   ├── test_functions.sql
│   └── test_validate_payroll.sql
├── screenshots/
│   ├── A1_output.png
│   ├── A2_output.png
│   ├── A3_error_and_fix.png
│   ├── A4_output.png
│   ├── B5_select_output.png
│   └── C1_output.png
└── docs/
    └── REFLECTION.md
```

## How to Run

1. Run `00_setup/create_tables.sql` (creates and fills `departments` and `employees`).
2. Run the functions in `02_functions/` in this order: B1, B2, B3, B4, then C1 (C1 uses B3 and B4).
3. Run the programs in `01_goto/` (A1 to A4).
4. Run the test files in `03_tests/`. Use `SET SERVEROUTPUT ON;` first so `DBMS_OUTPUT` prints.
5. Verify the results against the screenshots in `screenshots/`.

## Task Summary

| Task | File | What it does |
|---|---|---|
| Setup | `create_tables.sql` | Creates 4 departments and 10 employees, including edge cases (NULL salary, zero salary, future hire date, no department) |
| A1 | `A1_number_classifier.sql` | Classifies a number as positive, negative, or zero using GOTO; tested with 15, -7, 0 |
| A2 | `A2_salary_review.sql` | Reads a salary with `SELECT INTO` and jumps by GOTO to a LOW / AVERAGE / HIGH / INVALID review; handles `NO_DATA_FOUND` |
| A3 | `A3_illegal_goto.sql` | Shows a GOTO into an IF block (PLS-00375) and the fix (label moved outside the block) |
| A4 | `A4_rewrite_no_goto.sql` | Rewrites A2 with `IF / ELSIF / ELSE`; same output, no labels |
| B1 | `fn_annual_salary` | Monthly salary x 12; NULL or negative returns NULL |
| B2 | `fn_years_of_service` | Complete years from a hire date using `TRUNC(MONTHS_BETWEEN(...)/12)`; NULL or future date returns NULL |
| B3 | `fn_calculate_tax` | Progressive tax on a monthly salary (brackets below) |
| B4 | `fn_dept_name` | Department name from an id; `Unknown` if not found, `No Department` if NULL |
| B5 | `B5_functions_in_select.sql` | Calls B1 to B4 inside one `SELECT` over all employees |
| C1 | `fn_validate_payroll` | Returns `VALID` or `ERROR: <reason>` for an employee, using B3 and B4 |
| C2 | `docs/REFLECTION.md` | Written reflection |

## Assumptions

The assignment did not specify these values, so I chose them:

**Salary review bands (A2 and A4), monthly salary**

| Salary | Band |
|---|---|
| NULL or 0 or less | INVALID |
| below 200,000 | LOW |
| 200,000 to 500,000 | AVERAGE |
| above 500,000 | HIGH |

**Tax brackets (B3), progressive on monthly salary**

| Slice of salary | Rate |
|---|---|
| 0 to 60,000 | 0% |
| 60,001 to 100,000 | 20% |
| above 100,000 | 30% |

## C1 Validation Checks (in order)

1. Employee exists, otherwise `ERROR: employee not found`
2. Salary is not NULL and greater than 0
3. Hire date is not NULL
4. Hire date is not in the future
5. Department exists (via `fn_dept_name`)
6. Tax does not exceed salary (via `fn_calculate_tax`)

The function returns `VARCHAR2` instead of `BOOLEAN` so it can be used in SQL, and a `WHEN OTHERS` handler returns the Oracle message instead of crashing.

## Sample Results

See `screenshots/` for the output of each task. `B5_select_output.png` shows all 10 employees with annual salary, years of service, tax, and department. `C1_output.png` shows the validator result for every employee.

## Notes

- Years of service depend on `SYSDATE`, so those values change over time. Expected values in the tests are for October 2026.
- **AI usage:** I used an AI assistant (Claude by Anthropic) as a tutor while working on this assignment. It explained the GOTO rules and function concepts, and helped draft and debug the SQL and this README. I ran all code myself in Oracle SQL Developer, checked the outputs, took the screenshots, and I can explain every file in this repository.