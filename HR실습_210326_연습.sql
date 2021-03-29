    /*
        <연습 문제>
        
        1. 각 부서별 평균 연봉보다 높은 동일부서 근무사원들의 LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉 조회.결과는 부서별 연봉을 기준으로 정렬
        2. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회
        3. 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회
        4. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회
        5. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
        6. 위치한 부서가 있는 국가 ID 및 국가 이름을 조회
        7. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회
        8. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 조회
        9. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 조회
        10. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜 조회. 결과값에서 Zlotkey는 제외
        11. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉 조회. 평균 연봉은 소수점 2 자리까지만 표현
        12. 매니저의 사번 및 그 매니저 및 사원들 중 최소 연봉을 받는 사원의 연봉 조회. 매니저가 없는 사람들은 제외. 최소 연봉이 6000 미만인 경우 제외. 연봉 기준 역순으로 조회.
        13. 사내의 최대 연봉 및 최소 연봉의 차이를 조회
        14. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.
        15. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.
        16. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 조회
        17. 시애틀에 사는 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시명 조회
        18. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 조회
        19. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일 조회
        20. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉 조회
        
    */
        SELECT * FROM DEPARTMENTS;
        SELECT * FROM EMPLOYEES;
        
        SELECT E.lastname, E.salary, (SELECT department_name
                                                            FROM departments
                                                            WHERE client.department_id = departments.department_id)
                                                            AVG(E.salary)
        FROM EMPLOYEES
        
    -- 2. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회
    -- 3. 직업 ID 가 SA_MAN 인 사원들의 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회
    -- 4. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회
        SELECT LAST_NAME, DEPARTMENT_ID, AVG(SALARY)
        FROM EMPLOYEES
        WHERE COMMISSION_PCT IS NOT NULL;
        
    -- 5. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 조회
    -- 6. 위치한 부서가 있는 국가 ID 및 국가 이름을 조회
        SELECT D.LOCATION_ID, L.COUNTRY_ID
        FROM DEPARTMENTS D
            INNER JOIN LOCATIONS L ON L.LOCATION_ID = D.LOCATION_ID
            INNER JOIN COUNTRIES C ON C.COUNTRY_ID = L.COUNTRY_ID;
            
    -- 7. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회
        SELECT LAST_NAME, DEPARTMENT_ID, JOB_ID
        FROM EMPLOYEES
        WHERE LOCATION_ID = 1700;
        
    -- 8. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 조회
    
    -- 9. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 조회
        SELECT LAST_NAME
        FROM EMPLOYEES
        WHERE SALARY > AVG(SALARY);
        
    -- 10. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜 조회. 결과값에서 Zlotkey는 제외
    -- 11. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉 조회. 평균 연봉은 소수점 2 자리까지만 표현
    -- 12. 매니저의 사번 및 그 매니저 및 사원들 중 최소 연봉을 받는 사원의 연봉 조회. 매니저가 없는 사람들은 제외. 최소 연봉이 6000 미만인 경우 제외. 연봉 기준 역순으로 조회.
    -- 13. 사내의 최대 연봉 및 최소 연봉의 차이를 조회
        SELECT MAX(SALARY) - MIN(SALARY)
        FROM EMPLOYEES;
    -- 14. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.    
    
    
    
    -- 15. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉 조회.
        SELECT MAX(SALARY), MIN(SALARY), SUM(SALARY), ROUND(AVG(SALARY))
        FROM EMPLOYEES;
    
    -- 16. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 조회
    
    -- 17. 시애틀에 사는 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시명 조회
        SELECT LAST_NAME, DEPARTMENT_NAME, L.LOCATION_ID, CITY
        FROM EMPLOYEES E, DEPART
        
        
    -- 18. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 조회
        SELECT LAST_NAME, JOB_ID
        FROM EMPLOYEES
        WHERE MANAGER_ID IS NOT NULL;
        
        
    -- 19. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일 조회
        SELECT LAST_NAME
        FROM EMPLOYEES
        WHERE HIRE_DATE LIKE '1994%';
        
        
    -- 20. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉 조회
        SELECT LAST_NAME, SALARY
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID IN (20, 50) AND
        SALARY BETWEEN 5000 AND 12000;
        