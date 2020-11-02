SELECT * FROM toprate_sql.departments;

/*cau 1*/
select d.department_id, d.department_name, count(e.employee_id) as count_employee
from departments d join employees e
where d.department_id=e.department_id
group by department_id;


/*cau 2*/
select d.department_id, d.department_name, avg(e.salary) as avg_salary
from departments d join employees e
where d.department_id=e.department_id
group by department_id;

/*cau 3*/
select e.employee_id, e.first_name, e.last_name, d.department_name
from departments d inner join employees e
where d.department_id=e.department_id;

/*cau 4*/
select d.department_id, d.department_name, c.country_name
from locations l inner join departments d on d.location_id=l.location_id
inner join countries c on l.country_id=c.country_id
order by d.department_id;

/*cau 5*/
select d.department_name, count(e.employee_id) as count_employee
from departments d join employees e
where d.department_id=e.department_id
group by d.department_id having count(e.employee_id) > 10;


/*cau 6*/
select d.department_id, d.department_name, c.country_name
from departments d inner join locations l on d.location_id=l.location_id
inner join countries c on l.country_id=c.country_id
group by d.department_id having count(c.country_id) >= 3;

/*cau 7*/
select d.department_name, e.first_name, e.last_name, max(e.salary) as max_salary
from departments d join employees e 
where d.department_id=e.department_id
group by d.department_id;


/*cau 8*/
select e.first_name, e.last_name, e.salary
from departments d join employees e 
where e.salary > 
		(select max(e.salary) from departments d join employees e where d.department_id=e.department_id
        and d.department_name='IT');

/*cau 9*/
select d.department_id, d.department_name, count(*) as count_employee
from departments d join employees e 
where d.department_id=e.department_id
group by department_id
order by count_employee desc;

/*cau 10*/
select d.department_id, d.department_name, count(*) as count_employee
from departments d join employees e 
where d.department_id=e.department_id
group by department_id having count_employee=0;





