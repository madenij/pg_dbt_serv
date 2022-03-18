{{ config(materialized='view') }}

select *
from {{ source('staging','green_external_table') }}
limit 100