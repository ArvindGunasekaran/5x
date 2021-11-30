{{config( materialized='table')}}

with datewise_calc as 
(
    select
    Location_iso_code as ISO_CODE,
    location as LOCATION,
    max(total_cases) as TOTAL_CASES,
    max(total_deaths) as TOTAL_DEATHS,
    max(total_recovered) as TOTAL_RECOVERED    
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    group by LOCATION, ISO_CODE
)
select *, TOTAL_CASES-(TOTAL_DEATHS+TOTAL_RECOVERED) as TOTAL_ACTIVE_CASES from datewise_calc

