{{ env_behavior_macro() }}

{% set current_env = env_var('DBT_ENVIRONMENT', 'UNKNOWN') %}
{% if current_env in ['DEV', 'QA', 'PROD'] %}
    SELECT 1 AS id, '{{ current_env }}' AS environment
{% else %}
    SELECT NULL AS id, '{{ current_env }}' AS environment
    
{% endif %}
