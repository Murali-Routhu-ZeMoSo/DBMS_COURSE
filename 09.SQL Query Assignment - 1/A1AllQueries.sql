-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

Select f.film_id, f.title,f.rating,c.name  from film f , category c , film_category fc
 where c.name='Comedy' 
	AND fc.film_id = f.film_id 
    and c.category_id = fc.category_id
    and f.rating ='PG-13';




-- 2. Find out the top 3 rented horror movies.
Select fl.title, COUNT(all fl.title) 
	from film_list fl,rental r, inventory i
    where fl.category='Horror'
    and fl.FID = i.film_id
    and i.inventory_id = r.inventory_id
    group by fl.title
    order by count(all fl.title) desc
    limit 3;



-- 3. Find out the list of customers from India who have rented sports movies.

select * from customer_list cl where cl.country='India' and ID in(
	select r.customer_id from film_list fl, rental r, inventory i
		where fl.category='Sports'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id);


-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select * from customer_list cl
	where cl.country= 'Canada' and ID in 
		(select r.customer_id from  actor a ,film_actor fa,  inventory i,rental r
			where
				a.first_name='NICK' and a.last_name='WAHLBERG' and a.actor_id =fa.actor_id
                and fa.film_id = i.film_id
                and i.inventory_id = r.inventory_id);

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted.
select count(*) from film_list where FID in(
	select fa.film_id from film_actor fa,actor a
    where a.first_name='SEAN' and a.last_name='WILLIAMS'
		and fa.actor_id =a.actor_id);

