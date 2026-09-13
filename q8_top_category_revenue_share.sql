# -- Q8 - What % of total revenue comes from the top category?
use olist;

select * from products;
select * from order_items;
select * from order_payments;

select
    p.product_category_name,
    oi.order_id,
    oi.product_id,
    op.payment_value
from products as p
join order_items as oi on p.product_id = oi.product_id
join order_payments as op on oi.order_id = op.order_id
limit 20;

select
    order_id,
    count(product_id) as product_count
from order_items
group by order_id
having count(product_id) > 1
limit 20;

select
    oi.order_id,
    count(distinct p.product_category_name) as category_count
from order_items as oi
join products as p on oi.product_id = p.product_id
group by oi.order_id
having count(distinct p.product_category_name) > 1
limit 20;

select
    oi.order_id,
    p.product_category_name,
    oi.price,
    sum(oi.price) over (partition by oi.order_id) as order_item_total,
    round(oi.price * 100.0 / sum(oi.price) over (partition by oi.order_id), 2) as category_share_percentage
from order_items as oi
join products as p on oi.product_id = p.product_id
where oi.order_id = '002f98c0f7efd42638ed6100ca699b42';

select
    oi.order_id,
    p.product_category_name,
    oi.price,
    op.payment_value,
    sum(oi.price) over (partition by oi.order_id) as order_item_total,
    round(op.payment_value * oi.price / sum(oi.price) over (partition by oi.order_id), 2) as allocated_revenue
from order_items as oi
join products as p on oi.product_id = p.product_id
join order_payments as op on oi.order_id = op.order_id
where oi.order_id = '002f98c0f7efd42638ed6100ca699b42';

with order_payment_totals as (
    select
        order_id,
        sum(payment_value) as payment_value
    from order_payments
    group by order_id
),

category_allocation as (
    select
        oi.order_id,
        coalesce(p.product_category_name, 'unknown category') as product_category,
        opt.payment_value,
        opt.payment_value * oi.price /
            nullif(
                sum(oi.price) over (
                    partition by oi.order_id
                ),
                0
            ) as allocated_revenue
    from order_items as oi
    join products as p on oi.product_id = p.product_id
    join order_payment_totals opt on oi.order_id = opt.order_id
),

category_revenue as (
    select
        product_category,
        sum(allocated_revenue) as category_revenue
    from category_allocation
    group by product_category
)

select
    product_category,
    round(category_revenue, 2) as category_revenue,
    round(
        category_revenue * 100.0 /
        sum(category_revenue) over (),
        2
    ) as revenue_percentage
from category_revenue
order by category_revenue desc
limit 1;