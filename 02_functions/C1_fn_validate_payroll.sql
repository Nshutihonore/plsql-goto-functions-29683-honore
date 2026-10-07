-- =====================================================
-- 02_functions/C1_fn_validate_payroll.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task C1: Validate an employee's payroll record
-- Uses: fn_dept_name (B4) and fn_calculate_tax (B3)
-- Returns 'VALID' or 'ERROR: <reason>' (VARCHAR2, so usable in SQL)
-- =====================================================
CREATE OR REPLACE FUNCTION fn_validate_payroll (
  p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
  v_salary    employees.salary%TYPE;
  v_hire_date employees.hire_date%TYPE;
  v_dept_id   employees.dept_id%TYPE;
  v_dept_name VARCHAR2(50);
  v_tax       NUMBER;
BEGIN
  -- Check 1: the employee must exist (NO_DATA_FOUND handled below)
  SELECT salary, hire_date, dept_id
    INTO v_salary, v_hire_date, v_dept_id
    FROM employees
   WHERE emp_id = p_emp_id;

  -- Check 2: salary must be present and positive
  IF v_salary IS NULL OR v_salary <= 0 THEN
    RETURN 'ERROR: salary is missing or not positive';
  END IF;

  -- Checks 3 and 4: hire date must exist and not be in the future
  IF v_hire_date IS NULL THEN
    RETURN 'ERROR: hire date is missing';
  ELSIF v_hire_date > SYSDATE THEN
    RETURN 'ERROR: hire date is in the future';
  END IF;

  -- Check 5: department must exist (uses B4)
  v_dept_name := fn_dept_name(v_dept_id);
  IF v_dept_name IN ('No Department', 'Unknown') THEN
    RETURN 'ERROR: no valid department (' || v_dept_name || ')';
  END IF;

  -- Check 6: tax must not exceed salary (uses B3)
  v_tax := fn_calculate_tax(v_salary);
  IF v_tax > v_salary THEN
    RETURN 'ERROR: tax exceeds salary';
  END IF;

  RETURN 'VALID';
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'ERROR: employee not found';
  WHEN OTHERS THEN
    RETURN 'ERROR: unexpected - ' || SQLERRM;
END fn_validate_payroll;
/

SHOW ERRORS;