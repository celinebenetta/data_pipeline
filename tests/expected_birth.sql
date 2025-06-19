SELECT
    *
FROM
    {{ ref('fact_birth_expectancy') }}
WHERE
    expected_birth_per_year_country < 0 