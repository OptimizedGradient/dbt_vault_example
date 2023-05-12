{% macro generate_post_hooks(yaml_metadata) %}
  -- establish post hooks variable
  {% set post_hooks = [] %}
  -- create dictionary of yaml metadata
  {% set metadata_dict = fromyaml(yaml_metadata) %}
  -- loop through keys
  {% for key in metadata_dict %}
    {% if (metadata_dict[key]['type']|upper) == 'PRIMARY_KEY' %}
        {{ post_hooks.append("ALTER TABLE {this} ADD PRIMARY KEY (" ~ ','.join(metadata_dict[key].values()) ~ ")") }}
    {% endif %}
  {% endfor %}
  -- return post hooks separated by new line
  {{ return(post_hooks|join('\n')) }}
{% endmacro %}