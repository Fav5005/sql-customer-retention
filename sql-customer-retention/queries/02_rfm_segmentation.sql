-- Customer RFM (Recency, Frequency, Monetary) Segmentation
WITH customer_aggregates AS (
	SELECT
		u.user_id,
		u.email,
		MAX(o.order_date) AS last_order_date,
		COUNT(o.order_id) AS frequency,
		COALESCE(SUM(o.total_amount), 0) AS monetary
	FROM users u
	LEFT JOIN orders o ON u.user_id = o.user_id
	GROUP BY u.user_id, u.email
),
rfm_scores AS (
	SELECT
		user_id,
		email,
		frequency,
		monetary,
		NTILE(3) OVER (ORDER BY last_order_date DESC) AS recency_score,
		NTILE(3) OVER (ORDER BY frequency ASC) AS frequency_score,
		NTILE(3) OVER (ORDER BY monetary ASC) AS monetary_score
	FROM customer_aggregates
)
SELECT
	user_id,
	email,
	frequency,
	monetary,
	CONCAT(recency_score, frequency_score, monetary_score) AS rfm_cell,
	CASE
		WHEN recency_score = 3 AND frequency_score = 3 AND monetary_score = 3 THEN 'VIP / Champions'
		WHEN recency_score >= 2 AND frequency_score >= 2 THEN 'Loyal Customers'
		WHEN recency_score = 1 THEN 'At-Risk / Inactive'
		ELSE 'Regular Customers'
	END AS customer_segment
FROM rfm_scores
ORDER BY monetary DESC;
