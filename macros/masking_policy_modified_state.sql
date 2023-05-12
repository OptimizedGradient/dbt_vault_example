{% macro masking_policy_modified_state() %}

{% if execute %}
  {% do log(target, info=true) %}
{% endif %}

{% endmacro %}