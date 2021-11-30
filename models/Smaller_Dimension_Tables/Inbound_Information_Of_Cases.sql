{{config( materialized='table')}}

with Inbound as 
(
    select 
    to_date(date,'mm/dd/yyyy') as DATE,
    location as LOCATION,
    Location_iso_code as ISO_CODE,
    new_cases as NEW_CASES,
    new_deaths as NEW_DEATHS,
    new_recovered as NEW_RECOVERED,
    total_cases as TOTAL_CASES,
    total_deaths as TOTAL_DEATHS,
    total_recovered as TOTAL_RECOVERY,
    total_active_cases as TOTAL_ACTIVE_CASES
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    order by year(date), month(date), day(date)
    limit 16285
)



select * from Inbound
