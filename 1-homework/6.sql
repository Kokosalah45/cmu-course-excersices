-- 1900 1798 - 1798 1790 if < 10 1790 + s
-- 1901 1900 - 1901 1 if < 10 1900 + s

select decade , count(*) as count
from (
    select artist.name , artist_type.name as type, area.name as area ,case when  begin_date_year - (ceil(begin_date_year / 10) * 10) < 10 then (floor(begin_date_year / 10) * 10)::integer || 's' else (ceil(begin_date_year / 10) * 10)::integer || 's' end as decade
    from artist
    join artist_type on artist_type.id = artist.type
    join area on area.id = artist.area 
    where area.name = 'United States' and artist_type.name = 'Group' and begin_date_year is not null
    order by begin_date_year
)
group by decade
order by decade ; 

