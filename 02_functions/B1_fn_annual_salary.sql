-- =====================================================
-- 02_functions/B1_fn_annual_salary.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task B1: Return the annual salary from a monthly salary
-- =====================================================
CREATE OR REPLACE FUNCTION fn_annual_salary (
  p_monthly_salary IN NUMBER
) RETURN NUMBER
IS
BEGIN
  -- No salary, or an invalid (negative) one: no annual figure
  IF p_monthly_salary IS NULL OR p_monthly_salary < 0 THEN
    RETURN NULL;
  END IF;

  RETURN p_monthly_salary * 12;
END fn_annual_salary;
/

SHOW ERRORS;