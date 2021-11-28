{{config( materialized='table')}}

with datewise_adv_calc as 
(
    select 
    date as DATE,
    Location_iso_code as ISO_CODE,
    location as LOCATION,
    new_cases_per_million as NEW_CASES_PER_MILLION,
    total_cases_per_million as TOTAL_CASES_PER_MILLION,
    new_deaths_per_million as NEW_DEATHS_PER_MILLION,
    case_fatality_rate as CASE_FATALITY_RATE,
    growth_factor_of_new_cases as NEW_CASES_GROWTH_FACTOR,
    growth_factor_of_new_deaths as NEW_DEATHS_GROWTH_FACTOR
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    order by date
)
select * from datewise_adv_calc   