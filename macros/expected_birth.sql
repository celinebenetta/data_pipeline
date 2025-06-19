{% macro expected_birth(fertility_rate, population_female, scale=2) %}
    ({{ fertility_rate }} * {{ population_female }})
{% endmacro %}