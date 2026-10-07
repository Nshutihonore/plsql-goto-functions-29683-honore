SET SERVEROUTPUT ON;

-- Test 1: positive
DECLARE
  v_number NUMBER := 15;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Number tested: ' || v_number);
  IF v_number > 0 THEN
    GOTO positive_number;
  ELSIF v_number < 0 THEN
    GOTO negative_number;
  ELSE
    GOTO zero_number;
  END IF;

  <<positive_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is POSITIVE.');
  GOTO end_program;
  <<negative_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is NEGATIVE.');
  GOTO end_program;
  <<zero_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is ZERO.');
  GOTO end_program;
  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('End of program.');
END;
/

-- Test 2: negative
DECLARE
  v_number NUMBER := -7;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Number tested: ' || v_number);
  IF v_number > 0 THEN
    GOTO positive_number;
  ELSIF v_number < 0 THEN
    GOTO negative_number;
  ELSE
    GOTO zero_number;
  END IF;

  <<positive_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is POSITIVE.');
  GOTO end_program;
  <<negative_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is NEGATIVE.');
  GOTO end_program;
  <<zero_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is ZERO.');
  GOTO end_program;
  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('End of program.');
END;
/

-- Test 3: zero
DECLARE
  v_number NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Number tested: ' || v_number);
  IF v_number > 0 THEN
    GOTO positive_number;
  ELSIF v_number < 0 THEN
    GOTO negative_number;
  ELSE
    GOTO zero_number;
  END IF;

  <<positive_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is POSITIVE.');
  GOTO end_program;
  <<negative_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is NEGATIVE.');
  GOTO end_program;
  <<zero_number>>
  DBMS_OUTPUT.PUT_LINE('Result: The number is ZERO.');
  GOTO end_program;
  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('End of program.');
END;
/