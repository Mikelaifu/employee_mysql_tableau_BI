-- USE employees_mod;

SELECT e.gender, d.dept_name, ROUND(AVG(s.salary), 2) as avg_salary, YEAR(s.to_date) as calender_year

FROM t_employees e 
     JOIN
     t_salaries s ON e.emp_no = s.emp_no
     JOIN
     t_dept_emp de ON s.emp_no =  de.emp_no
     JOIN
     t_departments d ON de.dept_no = d.dept_no
     
GROUP BY d.dept_name, e.gender,  calender_year

HAVING calender_year <= 2002

ORDER BY d.dept_name, calender_year
;