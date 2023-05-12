{% macro generate_database_name(custom_database_name=none, node=none) -%}
    {%- set default_database = target.database -%}
    {%- set env = ['STG', 'PROD'] -%}
    {%- if target.name in env -%}
        {%- if custom_database_name is none -%}
            {{ target.name | trim }}_{{ default_database | trim }}
        {%- else -%}
            {{ target.name | trim }}_{{ custom_database_name | trim }}
        {%- endif -%}
    {%- else -%}
        {%- if custom_database_name is none -%}
            DEV_{{ default_database | trim }}
        {%- else -%}
            DEV_{{ custom_database_name | trim }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}