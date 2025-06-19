WITH

total_pop AS (
    SELECT
        country_code,
        year,
        SUM(midyear_population) AS total_midyear_population,
        SUM(midyear_population_male) AS total_midyear_population_male,
        SUM(midyear_population_female) AS total_midyear_population_female
    FROM
        {{ ref('stg_midyear_population_5yr_age_sex') }}
    GROUP BY
        country_code, year
)

SELECT
    sfr.country_code,
    sfr.year,
    total_fertility_rate,
    total_midyear_population_female,
    {{ expected_birth('sfr.total_fertility_rate', 'pop.total_midyear_population_female') }} AS expected_birth_per_year_country
FROM    
    {{ ref('stg_fertility_rates') }} sfr
LEFT JOIN
    total_pop pop
ON
    sfr.country_code = pop.country_code
    AND sfr.year = pop.year
ORDER BY
    sfr.country_code,
    sfr.year