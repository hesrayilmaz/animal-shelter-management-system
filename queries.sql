/* 1-Finding the properties of the most vaccinated animal.*/

select *
from "Animal"
where id in (SELECT animal_id 
FROM "Receive" r
group by animal_id 
order by count(animal_id) desc 
limit 1) ;

/*2-Finding the salaries of employees who care for more than one animal in ascending order.*/

select employee_id, e.salary 
from "Care" c , "Employee" e 
where c.employee_id = e.id
group by c.employee_id, e.salary
having count(animal_id) > 1
order by e.salary asc;


/*3-Finding female visitors who adopt animals.*/

select a.visitor_id 
from "Adopt" a, "Visitor" v 
where  a.visitor_id =v.id and v.gender = 'Female';


/*4-Finding vaccinated animals in the last six months of 2015 and last six months of 2016.*/

(select r.animal_id, r.receive_date 
from "Receive" r where r.receive_date > date '2015-06-01' and r.receive_date < date '2015-12-29')
union
(select r.animal_id, r.receive_date 
from "Receive" r where r.receive_date > date '2016-06-01' and r.receive_date < date '2016-12-29');



/*5-Finding visitors whose donation amount is greater than donations after 2019.*/

select visitor_id, donation_amount
from "Donation" 
where donation_amount > all (select donation_amount
				from "Donation"
where donation_time> date '2019-12-31');



/*6-Finding id of visitors with "io" in their name and their donation amount.*/

select v.id , names.fullname, d.donation_amount 
from (select fullname 
       from "Visitor" where fullname like  '%io%') as names, "Donation" d, "Visitor" v 
where v.id = d.visitor_id and names.fullname=v.fullname ;


/*7-Finding full names of people who have visited the shelter more than once and have the letter 'a' in it.*/


select v2.fullname, count(v3.visitor_id) as NumberOfVisit
from "Visitor" v2 , "Visit" v3 
where v2.id in (select v.visitor_id
				from "Visit" v 
				group by v.visitor_id
				having count(v.visitor_id) > 1) and v2.fullname like '%a%' and v2.id = v3.visitor_id 
group by v2.fullname ;


/*8-Finding shots of the youngest vaccinated animal.*/


select a.id, a.birthdate as youngestanimal, s.shot_id, s.name
from "Animal" a natural join "Shot" s natural join "Receive" r 
where a.id in (select a.id 
		from "Receive" r, "Animal" a
		where a.id = r.animal_id 
		order by a.birthdate desc 
		limit 1) and a.id = r.animal_id ;


/*9-Finding the visitors who have visited the shelter in 2019 and 2020.*/

(select id, fullname , phone_number 
from "Visitor" v , "Visit" v2 
where id=v2.visitor_id and v2.visit_date between '2019-01-01' and '2019-12-31')
intersect 
(select id, fullname , phone_number 
from "Visitor" v , "Visit" v2 
where id=v2.visitor_id and v2.visit_date between '2020-01-01' and '2020-12-31') ;




/*10-Finding total salary according to the positions of employees who care for animals.*/


select e.position, sum(e.salary) 
from "Employee" e
where exists (select employee_id from "Care" where e.id = employee_id)
group by e.position ;


/*11-Finding the name of the employee whose salarys is null converted to uppercase.*/

select upper(e.fullname) as upper_fullname
from "Employee" e
where salary is null or e.salary<3500;



/*12-Finding animals with incurable diseases and their disease starting dates.*/


select h.animal_id, notreatment.id, h.starting_date
from  (select id
		from "Disease"
		except
		select disease_id
		from "Cure" ) as notreatment, "Have" h  
where notreatment.id=h.disease_id ;



/*13-Finding out which visitor donated how much*/

select id,fullname,donation_amount
from "Visitor" v left outer join "Donation" d on v.id=d.visitor_id ;




/*14-Finding colors of animals other than dogs*/

select distinct color_name, species
from "Color" c, "Animal" a
where c.animal_id =a.id and color_name not in (select color_name from "Color" c2 where c2.animal_id =a.id and a.species = 'Dog' );



/*15-Finding employees with higher than average salary.*/

with avr_salary (averagesalary) as (select (max(e.salary)+min(e.salary))/2  from "Employee" e)

select e.id, e.salary, a.averagesalary
from "Employee" e, avr_salary a
where e.salary>a.averagesalary; 



/*16-Finding visitors with more donations than all donations made after 2019.*/

select visitor_id, donation_amount
from "Donation" 
where donation_amount > all (select donation_amount
				 from "Donation"
				 where donation_time> date '2019-12-31');





/*17-Finding cats older than some animals born after 2018.*/

select id,breed,birthdate
from "Animal" 
where species = 'Cat' and birthdate > some (select birthdate
						from "Animal"
						where birthdate>date '2018-12-31');




/*18-Finding employees who are not involved in animal care and have a salary of more than 3,000.*/

select id,position,salary
from "Employee" e 
where not exists (select employee_id from "Care" c where e.id=c.employee_id) and   salary>3000; 






/*19-Finding number of animals who live in 1A room.*/

select distinct(room_id), (select count(*) from "LivesIn" where room_id = '1A') as numberofanimals
from "LivesIn"
where room_id = '1A';



 		
 		
 		 		
/*Question 1:List the information of the most sick animal species and their recovery percentages, sorted by species name*/
 		

WITH tedavi2 ( id, breed, species, sex, numberofdisease, treatmentnumber ) AS 
 (
    SELECT a.id, a.breed,a.species,a.sex,Count(h.animal_id) AS numberofdisease, t.treatmentnumber 
    FROM "Animal" a,"Have" h,(SELECT animal_id, Count(h.animal_id) AS treatmentnumber 
            			    FROM "Have" h natural JOIN "Cure" c 
            			    GROUP BY animal_id 
            			    ORDER BY animal_id) t 
    
    WHERE a.id = h.animal_id AND t.animal_id = a.id 
    GROUP BY a.id,a.breed,a.species,a.sex,t.treatmentnumber 
    HAVING a.id IN (SELECT h2.animal_id 
            		FROM "Have" h2,"Animal" a2 
            		WHERE a2.id = h2.animal_id AND a2.species = 'Dog' 
            		GROUP BY h2.animal_id 
            		ORDER BY Count(h2.animal_id) DESC limit 1)
        OR a.id IN (SELECT h2.animal_id 
                	FROM "Have" h2, "Animal" a2,"Cure" c2 
                	WHERE a2.id = h2.animal_id  AND a2.species = 'Cat' 
                	GROUP BY h2.animal_id 
                	ORDER BY Count(h2.animal_id) DESC limit 1)
        OR a.id IN (SELECT h2.animal_id 
                	FROM "Have" h2, "Animal" a2, "Cure" c2 
                	WHERE a2.id = h2.animal_id  AND a2.species = 'Bird' 
                	GROUP BY h2.animal_id 
                	ORDER BY Count(h2.animal_id) DESC limit 1)
        
)
SELECT id,breed,species,sex,numberofdisease,treatmentnumber, 
Sum((treatmentnumber*100) / (numberofdisease)) AS recovery_percentage 
FROM tedavi2 
GROUP BY id,breed,species,sex,numberofdisease,treatmentnumber
ORDER BY species;



/*Question 2: List the Information of visitors who came to the shelter more than 4 times in the last five years but did not adopt any animals*/

select *
from "Visitor" 
where id in (select visitor_id
			from  "Visit"
			where visit_date > date '2016-12-31'
			group by visitor_id
			having  count(visit_date)>4 
 			except (select visitor_id from "Adopt")) ;



