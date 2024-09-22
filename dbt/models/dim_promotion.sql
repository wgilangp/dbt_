{{ config(materialized='table') }}

WITH t_data AS (
SELECT DISTINCT
  COALESCE(`promotion-ids`,'no promo') AS promotion_ids
FROM
    `dedibimbing.dibimbing.amazon_sale_report`  -- sesuaikan dengan table kalian
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'promotion_ids'
			]) }} AS promotion_id, *
FROM t_data
