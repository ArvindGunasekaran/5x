{{config( materialized='table')}}

with Inbound as 
(
    select 
    Date as DATE,
    location as LOCATION,
    Location_iso_code as ISO_CODE,
    new_cases as NEW_CASES,
    new_deaths as NEW_DEATHS,
    new_recovered as NEW_RECOVERED 
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    order by date

)

select * from Inbound
