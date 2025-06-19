SELECT
    {{
        dbt_utils.generate_surrogate_key (
            ['sc.country_code', 'ifc.year']
        )
    }} AS country_year_key,
    sc.*,
    year,
    ifc.expected_birth_per_year_country
FROM
    {{ ref('stg_country_names_area') }} sc
LEFT JOIN
    {{ ref('int_fertility_calc') }} ifc
ON 
    sc.country_code = ifc.country_code
ORDER BY
    year