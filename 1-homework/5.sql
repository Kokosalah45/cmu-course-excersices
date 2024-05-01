select a.name ,  ri.date_month , count(a.name) as number_of_releases_each_month
from artist a
join artist_type at on at.id = a.type
join artist_credit_name acn on acn.artist = a.id
join artist_credit ac on ac.id = acn.artist_credit
join release r on r.artist_credit = ac.id
join release_info ri on ri.release = r.id
where a.name like 'Elvis%' and at.name = 'Person' and ri.date_month is not null
group by a.name , ri.date_month
order by a.name , ri.date_month , number_of_releases_each_month desc;