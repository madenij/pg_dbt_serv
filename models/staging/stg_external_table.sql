{{ config(materialized='view') }}

select * from {{ source('staging','external_table') }}
limit 100