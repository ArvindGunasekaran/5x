{{config( materialized='table')}}

with loc as 
(
    select 

   
    location as LOCATION,
    sum(new_cases_per_million) as NEW_CASES_PER_MILLION,
    max(total_cases_per_million) as TOTAL_CASES_PER_MILLION,
    max(new_deaths_per_million) as NEW_DEATHS_PER_MILLION,
    max(case_fatality_rate) as MAX_CASE_FATALITY_RATE,
    max(growth_factor_of_new_cases) as MAX_NEW_CASES_GROWTH_FACTOR,
    max(growth_factor_of_new_deaths) as MAX_NEW_DEATHS_GROWTH_FACTOR
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
    group by location
)

select * from loc