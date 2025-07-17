{{
    config(
        materialized='incremental',
        unique_key='C_CUSTKEY'
    )
}}

with cte as (


    select * from {{ ref('stg_customer') }}
    
)
select * from cte where C_MKTSEGMENT='FURNITURE'
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    AND UPDATED_AT > (select max(UPDATED_AT) from {{ this }}) 
{% endif %}
