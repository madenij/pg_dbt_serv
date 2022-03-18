{{ config(materialized='view') }}

select * from trips_data_all.external_table
-- from {{ source('staging','external_table') }}
limit 100