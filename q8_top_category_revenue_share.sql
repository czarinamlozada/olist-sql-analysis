# -- Q8 - What % of total revenue comes from the top category?
use olist;

select * from products
select * from order_items

select
    coalesce(p.product_category_name, 'unknown category') as product_category,
    round(sum(oi.price), 2) as category_revenue
from products as p
join order_items as oi
    on p.product_id = oi.product_id
group by product_category
order by category_revenue desc;

select
    coalesce(p.product_category_name, 'unknown category') as product_category,
    round(sum(oi.price), 2) as category_revenue,
    round(
        sum(oi.price) * 100.0 /
        (select sum(price) from order_items),
        2
    ) as revenue_percentage
from products as p
join order_items as oi
    on p.product_id = oi.product_id
group by product_category
order by category_revenue desc
limit 1;
