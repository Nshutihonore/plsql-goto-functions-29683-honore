-- =====================================================
-- 03_tests/test_validate_payroll.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Tests for fn_validate_payroll (C1)
-- =====================================================
SET LINESIZE 200
COL result FORMAT A55

-- All 10 employees
SELECT emp_id,
       first_name || ' ' || last_name AS employee,
       fn_validate_payroll(emp_id)    AS result
  FROM employees
 ORDER BY emp_id;

-- An employee ID that does not exist
SELECT 999 AS emp_id,
       '(does not exist)' AS employee,
       fn_validate_payroll(999) AS result
  FROM dual;