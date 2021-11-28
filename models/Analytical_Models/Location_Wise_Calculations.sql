{{config( materialized='table')}}

with datewise_calc as 
(
    select
    Location_iso_code as ISO_CODE,
    location as LOCATION,
    sum(NEW_active_cases) as NEW_ACTIVE_CASES,
    max(total_cases) as TOTAL_CASES,
    max(total_deaths) as TOTAL_DEATHS,
    max(total_recovered) as TOTAL_RECOVERED,
    max(total_active_cases) as TOTAL_ACTIVE_CASES
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    group by LOCATION, ISO_CODE
)
select * from datewise_calc
