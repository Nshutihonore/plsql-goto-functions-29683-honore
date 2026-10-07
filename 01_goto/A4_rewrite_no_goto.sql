-- =====================================================
-- 01_goto/A4_rewrite_no_goto.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task A4: Salary review rewritten WITHOUT GOTO
-- Same bands and messages as A2, using IF / ELSIF / ELSE
-- =====================================================
SET SERVEROUTPUT ON;

-- Test 1: emp 101 -> LOW
DECLARE
  v_emp_id  employees.emp_id%TYPE := 101;
  v_name    VARCHAR2(70);
  v_salary  employees.salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' (ID ' || v_emp_id || ')');
  DBMS_OUTPUT.PUT_LINE('Monthly salary: ' || NVL(TO_CHAR(v_salary), 'NULL'));

  IF v_salary IS NULL OR v_salary <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Review: INVALID salary data. Check the record.');
  ELSIF v_salary < 200000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: LOW salary. Eligible for a salary increase review.');
  ELSIF v_salary <= 500000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: AVERAGE salary. Maintain, consider a small adjustment.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Review: HIGH salary. No increase this cycle.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('End of salary review.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: no employee with ID ' || v_emp_id);
END;
/

-- Test 2: emp 102 -> AVERAGE
DECLARE
  v_emp_id  employees.emp_id%TYPE := 102;
  v_name    VARCHAR2(70);
  v_salary  employees.salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' (ID ' || v_emp_id || ')');
  DBMS_OUTPUT.PUT_LINE('Monthly salary: ' || NVL(TO_CHAR(v_salary), 'NULL'));

  IF v_salary IS NULL OR v_salary <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Review: INVALID salary data. Check the record.');
  ELSIF v_salary < 200000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: LOW salary. Eligible for a salary increase review.');
  ELSIF v_salary <= 500000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: AVERAGE salary. Maintain, consider a small adjustment.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Review: HIGH salary. No increase this cycle.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('End of salary review.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: no employee with ID ' || v_emp_id);
END;
/

-- Test 3: emp 104 -> HIGH
DECLARE
  v_emp_id  employees.emp_id%TYPE := 104;
  v_name    VARCHAR2(70);
  v_salary  employees.salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' (ID ' || v_emp_id || ')');
  DBMS_OUTPUT.PUT_LINE('Monthly salary: ' || NVL(TO_CHAR(v_salary), 'NULL'));

  IF v_salary IS NULL OR v_salary <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Review: INVALID salary data. Check the record.');
  ELSIF v_salary < 200000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: LOW salary. Eligible for a salary increase review.');
  ELSIF v_salary <= 500000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: AVERAGE salary. Maintain, consider a small adjustment.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Review: HIGH salary. No increase this cycle.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('End of salary review.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: no employee with ID ' || v_emp_id);
END;
/

-- Test 4: emp 108 -> INVALID (NULL salary)
DECLARE
  v_emp_id  employees.emp_id%TYPE := 108;
  v_name    VARCHAR2(70);
  v_salary  employees.salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' (ID ' || v_emp_id || ')');
  DBMS_OUTPUT.PUT_LINE('Monthly salary: ' || NVL(TO_CHAR(v_salary), 'NULL'));

  IF v_salary IS NULL OR v_salary <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Review: INVALID salary data. Check the record.');
  ELSIF v_salary < 200000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: LOW salary. Eligible for a salary increase review.');
  ELSIF v_salary <= 500000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: AVERAGE salary. Maintain, consider a small adjustment.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Review: HIGH salary. No increase this cycle.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('End of salary review.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: no employee with ID ' || v_emp_id);
END;
/

-- Test 5: emp 999 -> not found
DECLARE
  v_emp_id  employees.emp_id%TYPE := 999;
  v_name    VARCHAR2(70);
  v_salary  employees.salary%TYPE;
BEGIN
  SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
   WHERE emp_id = v_emp_id;

  DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name || ' (ID ' || v_emp_id || ')');
  DBMS_OUTPUT.PUT_LINE('Monthly salary: ' || NVL(TO_CHAR(v_salary), 'NULL'));

  IF v_salary IS NULL OR v_salary <= 0 THEN
    DBMS_OUTPUT.PUT_LINE('Review: INVALID salary data. Check the record.');
  ELSIF v_salary < 200000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: LOW salary. Eligible for a salary increase review.');
  ELSIF v_salary <= 500000 THEN
    DBMS_OUTPUT.PUT_LINE('Review: AVERAGE salary. Maintain, consider a small adjustment.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Review: HIGH salary. No increase this cycle.');
  END IF;

  DBMS_OUTPUT.PUT_LINE('End of salary review.');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: no employee with ID ' || v_emp_id);
END;
/