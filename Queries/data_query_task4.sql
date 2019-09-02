-- exploring the range

-- SELECT MIN(salary) as min_sal, MAX(salary) as max_sal FROM t_salaries;

DROP procedure IF EXISTS `emp_gender_dept_avg_salary`;

DELIMITER $$
CREATE PROCEDURE emp_gender_dept_avg_salary (IN p_lower_salary float, IN p_higher_salary float)
BEGIN
     SELECT e.gender, d.dept_name, ROUND(AVG(s.salary), 2) AS avg_salary 
     FROM 
        t_employees e 
        
        JOIN t_salaries s ON  e.emp_no= s.emp_no
        
        JOIN t_dept_emp de ON  de.emp_no= e.emp_no
        
        JOIN t_departments d ON  d.dept_no= de.dept_no
        
      WHERE s.salary BETWEEN p_lower_salary AND p_higher_salary
      GROUP BY e.gender, d.dept_name
      ORDER BY d.dept_name;
   
END$$

DELIMITER ;


-- call employees_mod.emp_gender_dept_avg_salary(50000, 90000);