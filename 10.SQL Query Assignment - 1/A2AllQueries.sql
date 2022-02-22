-- 1. Find out the number of documentaries with deleted scenes.
select count(title) from film 
	where special_features LIKE '%Deleted Scenes%' 
		and film_id in 
			(select fid from film_list
				where category='Documentary'
                );


-- 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.
select count(*)
from rental r,inventory i, film_list fl

where
	fl.category='Sci-Fi' and
    fl.fid = i.film_id and
    i.inventory_id = r.inventory_id and
	r.staff_id in(select staff_id from staff where first_name='Jon' and last_name='Stephens');


-- 3. Find out the total sales from Animation movies.
select sum(amount)  from payment where rental_id in 
(select r.rental_id from film_list  fl, rental r, inventory i
	where fl.category='Animation'
	and i.film_id = fl.fid
	and r.inventory_id = i.inventory_id
);


-- 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.
select fl.category ,count(fl.category) from film_list fl
	where fl.FID in(
		select i.film_id from rental r, inventory i
			where r.inventory_id = i.inventory_id 
				and r.customer_id in (
						select customer_id from customer where first_name='Patricia' and last_name='JOHNSON'
						)
        )
	 group by(fl.category) order by count(fl.category) desc limit 3;

-- 5. Find out the number of R rated movies rented by “SUSAN WILSON”.


select fl.title from film_list fl
	where fl.rating='R' and fl.FID in(
		select i.film_id from rental r, inventory i
			where r.inventory_id = i.inventory_id 
				and r.customer_id in (
						select customer_id from customer where first_name='Susan' and last_name='Wilson'
						)
				);
