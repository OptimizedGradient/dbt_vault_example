{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    {%- set env = ['STG', 'PROD'] -%}
    {%- if target.name in env -%}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ custom_schema_name | trim }}
        {%- endif -%}
    {%- else -%}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name | trim }}
        {%- endif -%}
    {%- endif -%}
{%- endmacro %}