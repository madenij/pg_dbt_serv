{{ config(materialized='table') }} 

select *
from {{ ref('stg_green_external_table') }} as green
left join {{ ref('taxi_zone_lookup') }} as taxi
on green.pickup_locationid = taxi.location_id

-- where payment_type_description = 'Credit Card'

-- with green_data as (
--     select *,
--       'Green' as service_type
--     from {{ ref('stg_green_external_table') }}
-- ),

-- yellow_data as (
--     select *,
--     'Yellow' as service_type
--     from {{ ref('stg_yellow_external_table') }}
-- ),

-- trips_unioned as (
--     select * from green_data
--     union all
--     select * from yellow_data
-- ),

-- dim_zones as (
--     select * from {{ ref('dim_zones') }}
--     where borough != 'Unknown'
-- )
-- select
--     trips_unioned.tripid,
--     trips_unioned.vendorid,
--     trips_unioned.service_type,
--     trips_unioned.ratecodeid,
--     trips_unioned.pickup_locationid,
--     trips_unioned.dropoff_locationid,
--     trips_unioned.store_and_fwd_flag,
--     trips_unioned.passenger_count,
--     trips_unioned.trip_distance,
--     trips_unioned.fare_amount,
--     trips_unioned.extra,
--     trips_unioned.mta_tax,
--     trips_unioned.tip_amount,
--     trips_unioned.tolls_amount,
--     trips_unioned.improvement_surcharge,
--     trips_unioned.total_amount,
--     trips_unioned.payment_type,
--     trips_unioned.payment_type_description,
--     trips_unioned.congestion_surcharge
-- from trips_unioned
-- inner join dim_zones as pickup_zone
-- on trips_unioned.pickup_locationid = pickup_zone.location_id
-- inner join dim_zones as dropoff_zone
-- on trips_unioned.dropoff_locationid = dropoff_zone.location_id