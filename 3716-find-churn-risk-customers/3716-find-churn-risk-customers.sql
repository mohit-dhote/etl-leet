# Write your MySQL query statement below
# Write your MySQL query statement below
WITH active_users 
AS
(SELECT
user_id,
event_date,
plan_name AS current_plan,
monthly_amount as current_monthly_amount
FROM
(SELECT 
    user_id,
    RANK() OVER (PARTITION BY user_id ORDER BY event_date DESC) AS date_ranking,
    event_date,
    plan_name,
    monthly_amount
FROM subscription_events
)s
WHERE 
    plan_name IS NOT NULL
    AND date_ranking = 1
),
downgrade_users
AS
(
    SELECT
        user_id
    FROM 
        subscription_events
    WHERE
        event_type = 'downgrade'
    GROUP BY
        user_id

),
max_revenue AS
(
    SELECT
        user_id,
        MAX(monthly_amount) AS max_historical_amount
    FROM subscription_events
    GROUP BY 
        user_id
),
subscription_start AS
(SELECT
    user_id,
    start_date AS latest_start_date
FROM
(SELECT
    user_id,
    event_date AS start_date,
    RANK() OVER (PARTITION BY user_id ORDER BY event_date DESC) AS start_ranking
FROM 
    subscription_events
WHERE
    event_type = 'start'
) s
WHERE start_ranking = 1
)
SELECT 
    au.user_id,
    au.current_plan,
    au.current_monthly_amount,
    m.max_historical_amount,
    DATEDIFF(au.event_date, ss.latest_start_date) AS days_as_subscriber
FROM 
    active_users au
INNER JOIN 
    downgrade_users du 
ON 
    au.user_id = du.user_id
INNER JOIN 
    max_revenue m
ON 
    m.user_id = au.user_id
INNER JOIN 
    subscription_start ss 
ON 
    au.user_id = ss.user_id
WHERE
    DATEDIFF(au.event_date, ss.latest_start_date) >= 60
    AND 1.0*au.current_monthly_amount / m.max_historical_amount < 0.50
ORDER BY
    5 DESC,
    au.user_id ASC