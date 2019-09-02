-- USE employees;
-- use from_date is to get what is the year the employees firstly sig the contracts
SELECT 

    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees

FROM
    t_employees e
        JOIN
    t_dept_emp d ON d.emp_no = e.emp_no

GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;