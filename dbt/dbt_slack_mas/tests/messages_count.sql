with count_rows as(
    select 
        count(*) as c_rows
    
    from {{ref('stg_channel_members')}}
        where date(emitted_at) = '2021-08-10'
),
has_error as(
select
    case 
        when c_rows = 12114 then 0
        else 1 
    end
    as error
from count_rows
)

select * from has_error where "error" = 1