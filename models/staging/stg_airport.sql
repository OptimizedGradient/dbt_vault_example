{%- set yaml_metadata -%}
source_model: 'airport'
derived_columns:
    RECORD_SOURCE: '!RAW_FLIGHTS'
    LOAD_DATE: 'AIRPORT_DATE'
    EFFECTIVE_FROM: 'AIRPORT_DATE'
hashed_columns:
    AIRPORT_PK: 'AIRPORT'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set source_model = metadata_dict['source_model'] %}
{% set derived_columns = metadata_dict['derived_columns'] %}
{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}