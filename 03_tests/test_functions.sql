-- =====================================================
-- 03_tests/test_functions.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Tests for B1 to B4: normal, boundary, NULL and missing values
-- =====================================================
SET SERVEROUTPUT ON;

DECLARE
  PROCEDURE check_result(p_label VARCHAR2, p_actual VARCHAR2, p_expected VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD(p_label, 38) || ' got=' || RPAD(NVL(p_actual,'NULL'), 24)
      || ' expected=' || RPAD(NVL(p_expected,'NULL'), 24)
      || CASE WHEN NVL(p_actual,'~') = NVL(p_expected,'~') THEN ' PASS' ELSE ' FAIL' END);
  END;
BEGIN
  DBMS_OUTPUT.PUT_LINE('--- B1 fn_annual_salary ---');
  check_result('B1 normal 150000',   TO_CHAR(fn_annual_salary(150000)), '1800000');
  check_result('B1 zero',            TO_CHAR(fn_annual_salary(0)),      '0');
  check_result('B1 NULL',            TO_CHAR(fn_annual_salary(NULL)),   NULL);
  check_result('B1 negative',        TO_CHAR(fn_annual_salary(-5)),     NULL);

  DBMS_OUTPUT.PUT_LINE('--- B2 fn_years_of_service ---');
  check_result('B2 hired 2015-03-15', TO_CHAR(fn_years_of_service(DATE '2015-03-15')), '11');
  check_result('B2 hired today',      TO_CHAR(fn_years_of_service(TRUNC(SYSDATE))),    '0');
  check_result('B2 future date',      TO_CHAR(fn_years_of_service(DATE '2030-01-01')), NULL);
  check_result('B2 NULL',             TO_CHAR(fn_years_of_service(NULL)),              NULL);

  DBMS_OUTPUT.PUT_LINE('--- B3 fn_calculate_tax ---');
  check_result('B3 below limit 50000',  TO_CHAR(fn_calculate_tax(50000)),  '0');
  check_result('B3 boundary 60000',     TO_CHAR(fn_calculate_tax(60000)),  '0');
  check_result('B3 boundary 100000',    TO_CHAR(fn_calculate_tax(100000)), '8000');
  check_result('B3 150000',             TO_CHAR(fn_calculate_tax(150000)), '23000');
  check_result('B3 900000',             TO_CHAR(fn_calculate_tax(900000)), '248000');
  check_result('B3 NULL',               TO_CHAR(fn_calculate_tax(NULL)),   NULL);

  DBMS_OUTPUT.PUT_LINE('--- B4 fn_dept_name ---');
  check_result('B4 dept 10',        fn_dept_name(10),   'Human Resources');
  check_result('B4 dept 20',        fn_dept_name(20),   'Information Technology');
  check_result('B4 missing dept 99', fn_dept_name(99),  'Unknown');
  check_result('B4 NULL',           fn_dept_name(NULL), 'No Department');
END;
/