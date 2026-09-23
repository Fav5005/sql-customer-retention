-- Monthly Cohort Retention Analysis
WITH user_cohorts AS (
	SELECT
		user_id,
		DATE_TRUNC('month', created_at) AS cohort_month
	FROM users
),
user_activity AS (
	SELECT DISTINCT
		o.user_id,
		DATE_TRUNC('month', o.order_date) AS activity_month
	FROM orders o
),
cohort_size AS (
	SELECT
		cohort_month,
		COUNT(user_id) AS total_users
	FROM user_cohorts
	GROUP BY cohort_month
),
retention AS (
	SELECT
		c.cohort_month,
		a.activity_month,
		(EXTRACT(YEAR FROM a.activity_month) - EXTRACT(YEAR FROM c.cohort_month)) * 12 +
		(EXTRACT(MONTH FROM a.activity_month) - EXTRACT(MONTH FROM c.cohort_month)) AS month_offset,
		COUNT(DISTINCT c.user_id) AS retained_users
	FROM user_cohorts c
	JOIN user_activity a ON c.user_id = a.user_id
	GROUP BY c.cohort_month, a.activity_month
)
SELECT
	r.cohort_month::DATE,
	cs.total_users AS cohort_size,
	r.month_offset,
	r.retained_users,
	ROUND((r.retained_users::NUMERIC / cs.total_users) * 100, 2) AS retention_percentage
FROM retention r
JOIN cohort_size cs ON r.cohort_month = cs.cohort_month
ORDER BY r.cohort_month, r.month_offset;
