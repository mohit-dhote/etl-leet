# Write your MySQL query statement below
select
    date_id, make_name, 
    count(distinct partner_id) as unique_partners, 
    count(distinct lead_id) as unique_leads
    from dailysales
    group by date_id, make_name
order by date_id;