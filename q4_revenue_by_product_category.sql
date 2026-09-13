# -- Q4 - Which product categories generate the most revenue?
use olist;

select * from products;
select * from order_items;

select * from products limit 10;
select * from order_items limit 10;

select
    p.product_id,
    p.product_category_name,
    oi.order_id,
    oi.price
from products as p
join order_items as oi on p.product_id = oi.product_id
limit 20;

select
    p.product_category_name,
    round(sum(oi.price),2) as total_revenue
from products as p
join order_items as oi on p.product_id = oi.product_id
group by p.product_category_name
order by total_revenue desc;

select product_category_name
from products
where product_category_name is null;

select
    p.product_id,
    p.product_category_name,
    oi.order_id,
    oi.price
from products as p
join order_items as oi on p.product_id = oi.product_id
where p.product_category_name is null
limit 20;

select
    coalesce(p.product_category_name, 'unknown') as product_category,
    round(sum(oi.price), 2) as total_revenue
from products as p
join order_items as oi on p.product_id = oi.product_id
group by product_category
order by total_revenue desc;

