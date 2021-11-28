{{config(materialized='table')}}

select a.LOCATION,
(a.TOTAL_DEATHS/b.POPULATION)*10000 AS "DEATH_RATE x10^-4"
from {{ref('Location_Wise_Calculations')}} a 
left join {{ref('Location_Information')}} b on b.LOCATION=a.LOCATION
order by "DEATH_RATE x10^-4" desc
