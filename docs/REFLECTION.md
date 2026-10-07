# Reflection: PL/SQL GOTO Statements and Functions

**Student:** NAYIHIKI Nshuti Honore | **ID:** 29683
**Course:** Database Development with PL/SQL (INSY 8311)

## 1. What GOTO is and why it is discouraged

GOTO is a PL/SQL statement that jumps straight to a label written as `<<label_name>>`. The label must be followed by an executable statement, and the jump must stay within the same block or leave a nested block for an enclosing one.

GOTO is discouraged because it breaks the normal top-to-bottom reading of a program. In A2, I needed five labels and nine jump statements for a simple salary review. If I forgot one `GOTO end_review;`, the code would "fall through" and print several messages. Code with many jumps becomes "spaghetti code", which is hard to read, test, and change.

## 2. What was hard

- **Connecting to Oracle.** My database runs in a virtual machine. SQL Developer gave `ORA-12541: no listener`. The VM answered `ping`, so the network was fine. In Windows Services, the database service was running but the listener service was stopped. After I started the listener, the connection worked. [Add anything else you did.]
- **Seeing output.** My blocks said "PL/SQL procedure successfully completed" but printed nothing. I learned that `DBMS_OUTPUT` needs `SET SERVEROUTPUT ON` and the Dbms Output panel enabled in SQL Developer.
- **Testing every branch.** My first runs tested only one value. I learned that a program is only proven when every branch is tested (positive, negative, zero; low, average, high, invalid, not found).
- **Stray code in a script.** I left a loose `CASE` snippet in a worksheet and got "Unknown Command". A script must contain only complete, runnable statements.

## 3. What the errors taught me

In A3, I put the label `<<bonus_msg>>` inside an `IF` block and put the `GOTO` outside it. Oracle refused to compile it with `PLS-00375: illegal GOTO statement`. I learned that you can jump **out of** an IF to a label in the enclosing block, but never **into** an IF, LOOP, CASE, or nested block. I fixed it by moving the label to the main block. This is a compile-time error, so the block never runs at all.

I also learned from `NO_DATA_FOUND`. A `SELECT ... INTO` that finds no row raises it, and my functions and blocks handle it instead of crashing.

## 4. GOTO versus structured code

In A4, I rewrote the A2 salary review using `IF / ELSIF / ELSE`. The output was identical, but the code needed no labels and no jumps, and it reads from top to bottom. Only one branch of an IF chain runs, so there is no fall-through. Changing a salary band means editing one branch. For these reasons I would use structured control flow in real projects and treat GOTO as a rare exception.

## 5. Why functions are reusable

A stored function is written once, compiled in the database, and can be called from many places. My `fn_dept_name` and `fn_calculate_tax` are used in the SQL query in B5 and again inside `fn_validate_payroll` in C1, without copying any logic. If the tax brackets change, I edit one function and every caller gets the new result.

Functions used in SQL have rules. They must return one value, they can be called once per row in a `SELECT`, they cannot return `BOOLEAN` to SQL (so C1 returns `'VALID'` or an `'ERROR: ...'` text), and they should not change data with `INSERT`, `UPDATE`, or `DELETE`.

## 6. What I would improve

[Write one or two sentences in your own words. Ideas: read the tax brackets from a table instead of hard-coding them, return all validation problems instead of only the first one, or add a primary-key check for duplicate employees.]

## 7. AI assistance

I used an AI assistant (Claude by Anthropic) to explain the concepts and help draft and debug my SQL. I ran and tested everything myself in Oracle SQL Developer and I can explain every file in this repository.