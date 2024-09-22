{{
  config(
    materialized='table'
  )
}}

WITH t_data AS (
SELECT DISTINCT
  Style AS style,
  SKU AS sku,
  Category AS category,
  Size AS size
FROM
    `dedibimbing.dibimbing.amazon_sale_report`  -- sesuaikan dengan table kalian

)

SELECT {{ dbt_utils.generate_surrogate_key([
				'sku'
			]) }} AS product_id, *
FROM t_data
