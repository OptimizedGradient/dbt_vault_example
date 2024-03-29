{% set source_model = "stg_aircraft" %}
{% set src_pk = "AIRCRAFT_PK" %}
{% set src_hashdiff = "AIRCRAFT_HASHDIFF" %}
{% set src_payload = ["SERIAL_NUMBER", "MFR_MDL_CODE", "ENG_MFR_MDL", "YEAR_MFR"] %}
{% set src_eff = "EFFECTIVE_FROM" %}
{% set src_ldts = "LOAD_DATE" %}
{% set src_source = "RCD_SOURCE" %}

{{ dbtvault.sat(src_pk=src_pk,
                src_hashdiff=src_hashdiff,
                src_payload=src_payload,
                src_eff=src_eff,
                src_ldts=src_ldts,
                src_source=src_source,
                source_model=source_model) }}