with ranked_months as (
    select 
        a.name,
        ri.date_month,
        count(*) as number_of_releases,
        dense_rank() over (partition by a.name order by count(*) desc, ri.date_month) as rank
    from 
        artist a
        join artist_type at on at.id = a.type
        join artist_credit_name acn on acn.artist = a.id
        join artist_credit ac on ac.id = acn.artist_credit
        join release r on r.artist_credit = ac.id
        join release_info ri on ri.release = r.id
    where 
        a.name like 'Elvis%'
        and at.name = 'Person'
        and ri.date_month is not null
    group by 
        a.name, ri.date_month
)



select 
    name,
    date_month as month_with_most_releases,
    number_of_releases
from 
    ranked_months
where 
    rank = 1
order by 
    number_of_releases desc,
    name;
