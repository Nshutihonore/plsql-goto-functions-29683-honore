-- =====================================================
-- 03_tests/B5_functions_in_select.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task B5: Using the stored functions inside SQL
-- =====================================================
SET LINESIZE 200
SET PAGESIZE 50
COL employee         FORMAT A20
COL department       FORMAT A24

SELECT e.emp_id,
       e.first_name || ' ' || e.last_name  AS employee,
       e.salary                             AS monthly_salary,
       fn_annual_salary(e.salary)           AS annual_salary,
       fn_years_of_service(e.hire_date)     AS years_service,
       fn_calculate_tax(e.salary)           AS monthly_tax,
       fn_dept_name(e.dept_id)              AS department
  FROM employees e
 ORDER BY e.emp_id;