-- =====================================================
-- 02_functions/B2_fn_years_of_service.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task B2: Return complete years of service from a hire date
-- =====================================================
CREATE OR REPLACE FUNCTION fn_years_of_service (
  p_hire_date IN DATE
) RETURN NUMBER
IS
BEGIN
  -- No hire date, or hire date in the future: no valid service
  IF p_hire_date IS NULL OR p_hire_date > SYSDATE THEN
    RETURN NULL;
  END IF;

  -- MONTHS_BETWEEN gives fractional months; /12 gives years;
  -- TRUNC drops the fraction so only COMPLETE years count
  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);
END fn_years_of_service;
/

SHOW ERRORS;