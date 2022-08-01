{% set source_model = "stg_flights" %}
{% set src_pk = "FLIGHT_PK" %}
{% set src_hashdiff = "FLIGHT_HASHDIFF" %}
{% set src_payload = ["ACTUAL_DEP_TIME", "CRS_DEP_TIME", "DEP_DELAY", "ACTUAL_ARR_TIME", "CRS_ARR_TIME", "ARR_DELAY", "CARRIER_DELAY", "WEATHER_DELAY", "NAS_DELAY", "SECURITY_DELAY", "LATE_AIRCRAFT_DELAY"] %}
{% set src_eff = "EFFECTIVE_FROM" %}
{% set src_ldts = "LOAD_DATE" %}
{% set src_source = "RECORD_SOURCE" %}

{{ dbtvault.sat(src_pk=src_pk,
                src_hashdiff=src_hashdiff,
                src_payload=src_payload,
                src_eff=src_eff,
                src_ldts=src_ldts,
                src_source=src_source,
                source_model=source_model) }}