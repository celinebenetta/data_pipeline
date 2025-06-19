SELECT
    *
FROM
    {{ source('public_census', 'country_names_area') }}