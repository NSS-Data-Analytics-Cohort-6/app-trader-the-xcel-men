-- select price
-- from play_store_apps
-- where price <> '0'

select *
from play_store_apps as p
inner join app_store_apps as a
on p.name = a.name