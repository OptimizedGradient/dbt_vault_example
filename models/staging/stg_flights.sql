{%- set yaml_metadata -%}
source_model: 'flights'
derived_columns:
    RECORD_SOURCE: '!RAW_FLIGHTS'
    LOAD_DATE: 'FLIGHT_DATE'
    EFFECTIVE_FROM: 'FLIGHT_DATE'
hashed_columns:
    AIRCRAFT_PK: 'TAIL_NUM'
    DEST_PK: 'DEST'
    ORIGIN_PK: 'ORIGIN'
    FLIGHT_PK:
        - 'FLIGHT_NUM'
        - 'DEST'
        - 'ORIGIN'
    FLIGHT_AIRCRAFT_PK:
        - 'FLIGHT_NUM'
        - 'DEST'
        - 'ORIGIN'
        - 'TAIL_NUM'
    FLIGHT_TO_PK:
        - 'FLIGHT_NUM'
        - 'DEST'
    FLIGHT_FROM_PK:
        - 'FLIGHT_NUM'
        - 'ORIGIN'
    FLIGHT_HASHDIFF:
        is_hashdiff: true
        columns:
            - 'ACTUAL_DEP_TIME'
            - 'CRS_DEP_TIME'
            - 'DEP_DELAY'
            - 'ACTUAL_ARR_TIME'
            - 'CRS_ARR_TIME'
            - 'ARR_DELAY'
            - 'CARRIER_DELAY'
            - 'WEATHER_DELAY'
            - 'NAS_DELAY'
            - 'SECURITY_DELAY'
            - 'LATE_AIRCRAFT_DELAY'
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