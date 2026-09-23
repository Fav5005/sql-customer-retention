-- Daily Revenue & Rolling 7-Day Moving Average
WITH daily_revenue AS (
	SELECT
		DATE_TRUNC('day', order_date)::DATE AS sales_date,
		SUM(total_amount) AS daily_total
	FROM orders
	GROUP BY DATE_TRUNC('day', order_date)
)
SELECT
	sales_date,
	daily_total,
	ROUND(
		AVG(daily_total) OVER (
			ORDER BY sales_date
			ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
		), 2
	) AS rolling_7day_avg_revenue
FROM daily_revenue
ORDER BY sales_date;
