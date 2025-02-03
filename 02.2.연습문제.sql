------------------------------- 종합 문제 ----------------------------------
-- 1. JOB 테이블에서 모든 정보 조회
select * from job;
-- 2. JOB 테이블에서 직급 이름 조회
select job_name from job;
-- 3. DEPARTMENT 테이블에서 모든 정보 조회
select * from department;
select * from employee;
-- 4. EMPLOYEE테이블의 직원명, 이메일, 전화번호, 고용일 조회
select EMP_NAME, email, phone, hire_date from employee;
-- 5. EMPLOYEE테이블의 고용일, 사원 이름, 월급 조회
select hire_date, EMP_NAME, salary from employee;
-- 6. EMPLOYEE테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총수령액 - (연봉*세금 3%)) 조회
select EMP_NAME, salary*12 as 연봉, salary*12*(1+bonus) as 총수령액, salary*12*(1+bonus)-(salary*12*0.03) as 실수령액
from employee;
-- 7. EMPLOYEE테이블에서 JOB_CODE가 J1인 사원의 이름, 월급, 고용일, 연락처 조회
select emp_name, salary, hire_date, phone
from employee
where job_code = 'J1';
-- 8. EMPLOYEE테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
select EMP_NAME, salary, salary*12*(1+bonus)-(salary*12*0.03) as 실수령액, hire_date
from employee
where salary*12*(1+bonus)-(salary*12*0.03) >= 5000000;

-- 9. EMPLOYEE테이블에 월급이 4000000이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
select *
from employee
where salary>=4000000 and job_code = 'J2';
-- 10. EMPLOYEE테이블에 DEPT_CODE가 D9이거나 D5인 사원 중 
--     고용일이 02년 1월 1일보다 빠른 사원의 이름, 부서코드, 고용일 조회
select emp_name, dept_code, hire_date
from employee
where hire_date>'020101';
-- 11. EMPLOYEE테이블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회
select *
from employee
where hire_date>'900101' and hire_date<'010101';
-- 12. EMPLOYEE테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
select emp_name
from employee
where emp_name like '%연';
-- 13. EMPLOYEE테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
select emp_name, phone
from employee
where not phone like '010%';
-- 14. EMPLOYEE테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고 
--     고용일이 90/01/01 ~ 00/12/01이고, 급여가 270만 이상인 사원의 전체를 조회
select *
from employee
where email like '____$_%' ESCAPE '$' and dept_code in ('D9','D6') and
hire_date between '900101' and '001201' and salary >=2700000;