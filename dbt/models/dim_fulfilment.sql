{{ config(materialized='table') }}

With t_data AS (
SELECT DISTINCT 
  Fulfilment AS fulfilment, 
  `fulfilled-by` AS fulfilled_by
FROM `dedibimbing.dibimbing.amazon_sale_report` -- Sesuaikan dengan table kalian
)

SELECT 
{{ dbt_utils.generate_surrogate_key([
				'fulfilment', 
				'fulfilled_by'
			])}} AS fulfilment_id, *
FROM t_data

