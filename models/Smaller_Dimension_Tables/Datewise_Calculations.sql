{{config( materialized='table')}}

with datewise_calc as 
(
    select
    date as DATE,
    Location_iso_code as ISO_CODE,
    location as LOCATION,
    NEW_active_cases as NEW_ACTIVE_CASES,
    total_cases as TOTAL_CASES,
    total_deaths as TOTAL_DEATHS,
    total_recovered as TOTAL_RECOVERED,
    total_active_cases as TOTAL_ACTIVE_CASES
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    order by date
)
select * from datewise_calc