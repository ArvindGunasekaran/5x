{{config( materialized='table')}}

with location_info as 
(
    select 
    Location_iso_code as ISO_CODE,
    location as LOCATION,
    location_level as LOCATION_LEVEL,
    country as COUNTRY,
    continent as CONTINENT,
    Island as ISLAND,
    time_zone as TIME_ZONE,
    total_regencies as TOTAL_REGENCIES,
    total_cities as TOTAL_CITIES,
    total_districts as TOTAL_DISTRICTS,
    total_urban_villages as TOTAL_URBAN_VILLAGES, 
    total_rural_villages as TOTAL_RURAL_VILLAGES,
    area_km_2_ as AREA_KM_2,
    population as POPULATION,
    population_density as POPULATION_DENSITY,
    longitude as LONGITUDE,
    latitude as LATITUDE 
    from FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_ARVIND_GUNASEKARAN
     
)

select distinct * from location_info
