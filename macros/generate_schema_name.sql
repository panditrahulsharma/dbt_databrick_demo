{% macro generate_schema_name(custom_schema_name, node) %}
    {% if custom_schema_name is none or custom_schema_name == '' %}
        {{ return(target.schema) }}
    {% else %}
        {{ return(custom_schema_name) }}
    {% endif %}
{% endmacro %}