

select r.name , a.name , ri.date_year 
from artist a
join artist_credit_name acn on acn.artist_credit = a.id
join artist_credit ac on ac.id = acn.artist_credit
join release r on r.artist_credit = ac.id
join release_info ri on ri.release = r.id
join medium m on m.release = r.id
join medium_format mf on mf.id = m.format
where mf.name = 'Cassette' 
order by ri.date_year desc , ri.date_month desc , ri.date_day desc
limit 10;


