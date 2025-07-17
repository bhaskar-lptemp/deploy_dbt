{{
    config(
        materialized='view'
        
    )
}}

with cte as (

    select * from {{ source('tpcds', 'RAW_CUSTOMER') }}


)
select * from cte
