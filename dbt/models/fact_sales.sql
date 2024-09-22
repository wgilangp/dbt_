{{ config(materialized='table') }}

SELECT index, 
  `Order ID` AS order_id, 
  {{ dbt_utils.generate_surrogate_key([
				'Date'
			]) }} AS date_id,
  Status AS status,
  {{ dbt_utils.generate_surrogate_key([
				'SKU'
			]) }} as product_id,
  {{ dbt_utils.generate_surrogate_key([
				'Fulfilment', 
				'`fulfilled-by`'
			])}} AS fulfilment_id,
  {{ dbt_utils.generate_surrogate_key([
				'`promotion-ids`'
			]) }} AS promotion_id,
  {{ dbt_utils.generate_surrogate_key([
				'`Sales Channel `'
			]) }} AS sales_channel_id,
  {{ dbt_utils.generate_surrogate_key([
				  '`Courier Status`',
          '`ship-city`',
          '`ship-postal-code`',
          '`ship-service-level`',
          '`ship-state`'
			]) }} AS shipment_id,
  Qty AS qty,
  COALESCE(Amount, 0) AS amount
FROM `dedibimbing.dibimbing.amazon_sale_report`