# -- Q5 - Rank top 3 products within each category by revenue.
use olist;

select * from products;
select * from order_items;

select
    p.product_id,
    p.product_category_name,
    oi.price
from products as p
join order_items as oi on p.product_id = oi.product_id
limit 20;

select
    p.product_category_name,
    p.product_id,
    round(sum(oi.price), 2) as product_revenue
from products as p
join order_items as oi on p.product_id = oi.product_id
group by p.product_category_name, p.product_id
order by product_revenue desc;

with product_revenue as (
    select
        coalesce(p.product_category_name, 'unknown') as product_category,
        p.product_id,
        round(sum(oi.price), 2) as product_revenue
    from products as p
    join order_items as oi on p.product_id = oi.product_id
    group by p.product_category_name, p.product_id
),
ranked_products as (
    select
        product_category,
        product_id,
        product_revenue,
        row_number() over (
            partition by product_category
            order by product_revenue desc
            ) as product_rank
    from product_revenue
)

select
    product_category,
    product_id,
    product_revenue,
    product_rank
from ranked_products
where product_rank <= 3
order by product_category, product_rank;