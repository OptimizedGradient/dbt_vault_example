{%- set yaml_metadata -%}
source_model: 'aircraft'
derived_columns:
    RCD_SOURCE: '!RAW_FLIGHTS'
    LOAD_DATE: 'AIRCRAFT_DATE'
    EFFECTIVE_FROM: 'AIRCRAFT_DATE'
hashed_columns:
    AIRCRAFT_PK: 'TAIL_NUM'
    AIRCRAFT_HASHDIFF:
        is_hashdiff: true
        columns:
            - 'SERIAL_NUMBER'
            - 'MFR_MDL_CODE'
            - 'ENG_MFR_MDL'
            - 'YEAR_MFR'
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