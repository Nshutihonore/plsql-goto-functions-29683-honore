-- =====================================================
-- 02_functions/B4_fn_dept_name.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task B4: Return the department name for a department ID
-- =====================================================
CREATE OR REPLACE FUNCTION fn_dept_name (
  p_dept_id IN NUMBER
) RETURN VARCHAR2
IS
  v_name departments.dept_name%TYPE;
BEGIN
  -- Employee with no department assigned
  IF p_dept_id IS NULL THEN
    RETURN 'No Department';
  END IF;

  SELECT dept_name
    INTO v_name
    FROM departments
   WHERE dept_id = p_dept_id;

  RETURN v_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Unknown';
END fn_dept_name;
/

SHOW ERRORS;