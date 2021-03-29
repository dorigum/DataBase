    /*
        <���� ����>
        
        1. �� �μ��� ��� �������� ���� ���Ϻμ� �ٹ�������� LAST_NAME, ����, �μ���ȣ �� �ش� �μ��� ��� ���� ��ȸ.����� �μ��� ������ �������� ����
        2. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ
        3. ���� ID �� SA_MAN �� ������� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ
        4. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ
        5. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID ��ȸ
        6. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ
        7. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ
        8. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME ��ȸ
        9. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME ��ȸ
        10. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥ ��ȸ. ��������� Zlotkey�� ����
        11. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ���� ��ȸ. ��� ������ �Ҽ��� 2 �ڸ������� ǥ��
        12. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ���� ��ȸ. �Ŵ����� ���� ������� ����. �ּ� ������ 6000 �̸��� ��� ����. ���� ���� �������� ��ȸ.
        13. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ
        14. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.
        15. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.
        16. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE ��ȸ
        17. �þ�Ʋ�� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���ø� ��ȸ
        18. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID ��ȸ
        19. 1994�⵵�� ���� ��� ������� LAST_NAME �� ����� ��ȸ
        20. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� LAST_NAME �� ���� ��ȸ
        
    */
        SELECT * FROM DEPARTMENTS;
        SELECT * FROM EMPLOYEES;
        
        SELECT E.lastname, E.salary, (SELECT department_name
                                                            FROM departments
                                                            WHERE client.department_id = departments.department_id)
                                                            AVG(E.salary)
        FROM EMPLOYEES
        
    -- 2. ���� �̸��� T �� �����ϴ� ������ ��� ������� ���, LAST_NAME �� �μ� ��ȣ�� ��ȸ
    -- 3. ���� ID �� SA_MAN �� ������� �ִ� ���� ���� ���� �޴� ������� LAST_NAME, JOB_ID �� ������ ��ȸ
    -- 4. Ŀ�̼��� ���� ������� �μ��� ������ ������ ������� LAST_NAME, �μ� ��ȣ �� ������ ��ȸ
        SELECT LAST_NAME, DEPARTMENT_ID, AVG(SALARY)
        FROM EMPLOYEES
        WHERE COMMISSION_PCT IS NOT NULL;
        
    -- 5. ������ ������ ������ ������ �ִ� ������� ��� �� JOB_ID ��ȸ
    -- 6. ��ġ�� �μ��� �ִ� ���� ID �� ���� �̸��� ��ȸ
        SELECT D.LOCATION_ID, L.COUNTRY_ID
        FROM DEPARTMENTS D
            INNER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
            INNER JOIN COUNTRIES C ON C.COUNTRY_ID = L.COUNTRY_ID;
            
    -- 7. ��ġ ID �� 1700 �� �μ����� �ٹ��ϴ� ������� LAST_NAME, �μ� ��ȣ �� JOB_ID �� ��ȸ
        SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
        FROM EMPLOYEES
        WHERE LOCATION_ID = 1700;
        
    -- 8. LAST_NAME �� u �� ���ԵǴ� ������ ���� �μ��� �ٹ��ϴ� ������� ��� �� LAST_NAME ��ȸ
    
    -- 9. ȸ�� ��ü ��� �������� �� �޴� ������� ��� �� LAST_NAME ��ȸ
        SELECT LAST_NAME
        FROM EMPLOYEES
        WHERE SALARY > AVG(SALARY);
        
    -- 10. LAST_NAME �� Zlotkey �� ������ �μ��� �ٹ��ϴ� ��� ������� ��� �� ��볯¥ ��ȸ. ��������� Zlotkey�� ����
    -- 11. �μ� ��, ��ġ ID, �� �μ� �� ��� �� ��, �� �μ� �� ��� ���� ��ȸ. ��� ������ �Ҽ��� 2 �ڸ������� ǥ��
    -- 12. �Ŵ����� ��� �� �� �Ŵ��� �� ����� �� �ּ� ������ �޴� ����� ���� ��ȸ. �Ŵ����� ���� ������� ����. �ּ� ������ 6000 �̸��� ��� ����. ���� ���� �������� ��ȸ.
    -- 13. �系�� �ִ� ���� �� �ּ� ������ ���̸� ��ȸ
        SELECT MAX(SALARY) - MIN(SALARY)
        FROM EMPLOYEES;
    -- 14. �� JOB_ID ��, �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.    
    
    
    
    -- 15. ȸ�� ��ü�� �ִ� ����, �ּ� ����, ���� �� �� �� ��� ���� ��ȸ.
        SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY))
        FROM EMPLOYEES;
    
    -- 16. LAST_NAME �� DAVIES �� ������� �Ŀ� ���� ������� LAST_NAME �� HIRE_DATE ��ȸ
    
    -- 17. �þ�Ʋ�� ��� ������� LAST_NAME, �μ� ��, ���� ID �� ���ø� ��ȸ
        SELECT LAST_NAME, DEPARTMENT_NAME, L.LOCATION_ID, CITY
        FROM EMPLOYEES E, DEPART
        
        
    -- 18. �Ŵ����� �ִ� ������� LAST_NAME �� JOB_ID ��ȸ
        SELECT LAST_NAME, JOB_ID
        FROM EMPLOYEES
        WHERE MANAGER_ID IS NOT NULL;
        
        
    -- 19. 1994�⵵�� ���� ��� ������� LAST_NAME �� ����� ��ȸ
        SELECT LAST_NAME
        FROM EMPLOYEES
        WHERE HIRE_DATE LIKE '1994%';
        
        
    -- 20. 20 �� �� 50 �� �μ��� �ٹ��ϸ�, ������ 5000 ~ 12,000 ������ ������� LAST_NAME �� ���� ��ȸ
        SELECT LAST_NAME, SALARY
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID IN (20, 50) AND
        SALARY BETWEEN 5000 AND 12000;
        