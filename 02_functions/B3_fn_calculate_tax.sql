-- =====================================================
-- 02_functions/B3_fn_calculate_tax.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task B3: Progressive tax on a monthly salary
-- Brackets: 0-60,000 @ 0% | 60,001-100,000 @ 20% | above 100,000 @ 30%
-- =====================================================
CREATE OR REPLACE FUNCTION fn_calculate_tax (
  p_salary IN NUMBER
) RETURN NUMBER
IS
  c_limit_1 CONSTANT NUMBER := 60000;    -- end of 0% bracket
  c_limit_2 CONSTANT NUMBER := 100000;   -- end of 20% bracket
  c_rate_2  CONSTANT NUMBER := 0.20;
  c_rate_3  CONSTANT NUMBER := 0.30;
  v_tax     NUMBER;
BEGIN
  -- Missing or invalid salary: no tax figure
  IF p_salary IS NULL OR p_salary < 0 THEN
    RETURN NULL;
  END IF;

  IF p_salary <= c_limit_1 THEN
    v_tax := 0;
  ELSIF p_salary <= c_limit_2 THEN
    v_tax := (p_salary - c_limit_1) * c_rate_2;
  ELSE
    v_tax := (c_limit_2 - c_limit_1) * c_rate_2
           + (p_salary - c_limit_2) * c_rate_3;
  END IF;

  RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/

SHOW ERRORS;