# Write your MySQL query statement below
with cte1 as (
    -- 1. Map each user to the product categories they purchased
    select user_id, pp.product_id, category 
    from ProductPurchases pp
    join ProductInfo pi
    on pp.product_id = pi.product_id
), cte2 as (
    -- 2. Create unique pairs of categories bought by the same user
    select 
        cc1.category as category1,
        cc2.category as category2,
        count(distinct cc1.user_id) as customer_count 
    from cte1 cc1 
    -- Self-join on user_id to find combinations bought by the same person
    join cte1 cc2 on cc1.user_id = cc2.user_id
    -- Ensure categories are different AND strictly alphabetical 
    -- This prevents duplicate reversed pairs (e.g., getting both A-B and B-A)
    where cc1.category != cc2.category and cc1.category < cc2.category 
    group by cc1.category, cc2.category
    -- Only keep pairs bought together by 3 or more unique customers
    having count(distinct cc1.user_id) >= 3
)

-- 3. Retrieve the final list and apply the required sorting
select * from cte2
-- Sort by customer_count (desc), then category1 (asc), then category2 (asc)
order by 3 desc, 1 asc, 2 asc;