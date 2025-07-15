with source_data as (
    select * from {{ source('tpcds', 'customer') }}
)

select * from source_data