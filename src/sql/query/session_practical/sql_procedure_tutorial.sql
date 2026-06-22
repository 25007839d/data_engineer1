
-- ###########################################################
-- SQL PROCEDURE SCRIPT (FOR ORACLE SQL DEVELOPER)
-- Topic: Stored Procedures in SQL / PL-SQL
-- ###########################################################

-- 1. SIMPLE PROCEDURE WITHOUT PARAMETERS
CREATE OR REPLACE PROCEDURE greet_user
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello from SQL Procedure!');
END;
/
-- EXECUTION
EXEC greet_user;
-- OUTPUT: Hello from SQL Procedure!


-- 2. PROCEDURE WITH INPUT PARAMETER
CREATE OR REPLACE PROCEDURE greet_employee(p_name IN VARCHAR2)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome, ' || p_name || '!');
END;
/
-- EXECUTION
EXEC greet_employee('Ritu');
-- OUTPUT: Welcome, Ritu!


-- 3. PROCEDURE WITH BUSINESS LOGIC
-- Fetch employee salary by ID
CREATE OR REPLACE PROCEDURE get_salary(p_emp_id IN NUMBER)
IS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employees
    WHERE employee_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found for given ID.');
END;
/
-- EXECUTION
EXEC get_salary(101);


-- 4. PROCEDURE WITH OUT PARAMETER
-- Calculate bonus as 10% of salary
CREATE OR REPLACE PROCEDURE calc_bonus(
    p_emp_id IN NUMBER,
    p_bonus OUT NUMBER
)
IS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employees
    WHERE employee_id = p_emp_id;

    p_bonus := v_salary * 0.1;
END;
/
-- EXECUTION USING ANONYMOUS BLOCK
DECLARE
    v_bonus NUMBER;
BEGIN
    calc_bonus(101, v_bonus);
    DBMS_OUTPUT.PUT_LINE('Calculated Bonus: ' || v_bonus);
END;
/
-- OUTPUT: Calculated Bonus: 5200


-- 5. VIEW ALL PROCEDURES IN CURRENT SCHEMA
SELECT object_name, status
FROM user_objects
WHERE object_type = 'PROCEDURE';


-- 6. DROP A PROCEDURE
DROP PROCEDURE greet_employee;


-- ###########################################################
-- END OF FILE
-- ###########################################################
