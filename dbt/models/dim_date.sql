{{ config(materialized='table') }}

WITH t_data AS (
SELECT DISTINCT
  `Date` AS date,
  FORMAT_DATE('%A', `Date`) AS day_name,
  CASE
    WHEN FORMAT_DATE('%A', `Date`) = 'Monday' THEN '1' 
    WHEN FORMAT_DATE('%A', `Date`) = 'Tuesday' THEN '2'
    WHEN FORMAT_DATE('%A', `Date`) = 'Wednesday' THEN '3'
    WHEN FORMAT_DATE('%A', `Date`) = 'Thursday' THEN '4'
    WHEN FORMAT_DATE('%A', `Date`) = 'Friday' THEN '5'
    WHEN FORMAT_DATE('%A', `Date`) = 'Saturday' THEN '6'
    WHEN FORMAT_DATE('%A', `Date`) = 'Sunday' THEN '7'
  END AS day_number,
  FORMAT_DATE('%d', `Date`) AS day,
  FORMAT_DATE('%B', `Date`) AS month,
  FORMAT_DATE('%Y', `Date`) AS year,
  CONCAT('W', LPAD(CAST(EXTRACT(WEEK FROM `Date`) AS STRING), 2, '0'), '_', CAST(EXTRACT(YEAR FROM `Date`) AS STRING)) AS week_year
FROM
  `dedibimbing.dibimbing.amazon_sale_report`
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'date'
			]) }} AS date_id, *
FROM t_data