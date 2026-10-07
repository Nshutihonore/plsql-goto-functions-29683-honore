-- =====================================================
-- 01_goto/A3_illegal_goto.sql
-- Author: NAYIHIKI Nshuti Honore | ID: 29683
-- Task A3: Illegal GOTO (jump INTO an IF block) and its fix
-- =====================================================
SET SERVEROUTPUT ON;

-- -----------------------------------------------------
-- PART 1: ILLEGAL GOTO (this block FAILS TO COMPILE)
-- Why it is illegal: the label <<bonus_msg>> is INSIDE the
-- IF block, but the GOTO is OUTSIDE it. PL/SQL does not allow
-- jumping into an IF, LOOP, CASE or nested block.
-- Expected error: PLS-00375: illegal GOTO statement
-- -----------------------------------------------------
DECLARE
  v_salary NUMBER := 300000;
BEGIN
  GOTO bonus_msg;                       -- tries to jump INTO the IF

  IF v_salary > 200000 THEN
    <<bonus_msg>>
    DBMS_OUTPUT.PUT_LINE('Bonus approved for salary ' || v_salary);
  END IF;
END;
/

-- -----------------------------------------------------
-- PART 2: FIXED VERSION
-- Fix: the label is moved OUTSIDE the IF block, in the main
-- block. The GOTO is inside the IF, which is legal because
-- jumping OUT of an IF to an enclosing label is allowed.
-- -----------------------------------------------------
DECLARE
  v_salary NUMBER := 300000;
BEGIN
  IF v_salary > 200000 THEN
    GOTO bonus_msg;                     -- jump OUT of the IF: legal
  END IF;

  DBMS_OUTPUT.PUT_LINE('No bonus for salary ' || v_salary);
  GOTO end_program;

  <<bonus_msg>>                         -- label is now in the main block
  DBMS_OUTPUT.PUT_LINE('Bonus approved for salary ' || v_salary);

  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('End of program.');
END;
/