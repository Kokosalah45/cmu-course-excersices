
select work_name, work_type, comment, comment_length
from (
    select work_type.name as work_type, work.name as work_name, comment , LENGTH(comment) comment_length , DENSE_RANK() over (
        partition by work_type.name 
        order by LENGTH(comment) desc
    ) longest_comment_ranking 
    from work
    join work_type on work.type = work_type.id
    where LENGTH(comment) <> 0 and comment is not null
    order by work_type.name asc , work.name asc
)

where  longest_comment_ranking = 1;