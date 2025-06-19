SELECT
    *
FROM
    {{ source('public_census', 'age_specific_fertility_rates') }}