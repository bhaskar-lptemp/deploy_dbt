{% macro env_behavior_macro() %}
    {% set current_env = env_var('DBT_ENVIRONMENT', 'UNKNOWN') %}
    {% set allowed_envs = ['DEV', 'QA', 'PROD'] %}

    {% do log("💡 Current environment: " ~ current_env, info=True) %}

    {% if current_env in allowed_envs %}
        {% do log("✅ Running macro logic in allowed environment: " ~ current_env, info=True) %}
        {% set test_sql %}
            SELECT '{{ current_env }}' AS allowed_env
        {% endset %}
        {% do run_query(test_sql) %}
    {% else %}
        {% do log("⛔ Skipping macro logic in unsupported environment: " ~ current_env, info=True) %}
    {% endif %}
{% endmacro %}
