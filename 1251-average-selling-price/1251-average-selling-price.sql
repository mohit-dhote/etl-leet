# Write your MySQL query statement below
with cte_sum as(
    select p.product_id,
    SUM(p.price * u.units) as total_price,
    sum(u.units) as total_units
    from prices p 
    left join unitssold u 
    ON p.product_id = u.product_id
    And u.purchase_date BETWEEN p.start_date AND p.end_date
    group by p.product_id 
)
SELECT 
    product_id,
    ROUND( IFNULL (total_price / total_units, 0), 2) AS average_price
FROM cte_sum;