# Write your MySQL query statement below

select *, 
(case when dna_sequence like 'ATG%' then 1 else 0 end) as has_start,
(case when dna_sequence like '%TAA' OR dna_sequence like '%TAG' OR  dna_sequence like '%TGA' then 1 else 0 end) as has_stop,
(case when dna_sequence like '%ATAT%' then 1 else 0 end) as has_atat,
(case when dna_sequence like '%GGG%' then 1 else 0 end) as has_ggg
from samples
order by sample_id