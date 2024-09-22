{{ config(materialized='table') }}

WITH t_data AS (
SELECT DISTINCT
  `Courier Status` AS courier_status,
  `ship-city` AS ship_city,
  COALESCE(`ship-country`,'IN') AS ship_country,
  `ship-postal-code` AS ship_postal_code,
  `ship-service-level` AS ship_service_level,
  `ship-state` AS ship_state
FROM
  `dedibimbing.dibimbing.amazon_sale_report`
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'courier_status',
                'ship_city',
                'ship_postal_code',
                'ship_service_level',
                'ship_state'
			]) }} AS shipment_id, *
FROM t_data
