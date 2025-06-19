SELECT
    * EXCEPT (country_name)
FROM
    {{ source('public_census', 'midyear_population_5yr_age_sex') }}