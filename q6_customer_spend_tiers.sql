# -- Q6 - Segment customers into spend tiers (Low/Medium/High).
use olist;

select * from customers;
select * from order_payments;
select * from orders;

select
    c.customer_unique_id,
    round(sum(op.payment_value), 2) as total_spent
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_payments as op on o.order_id = op.order_id
group by c.customer_unique_id
order by total_spent desc;

with customer_spending as (
    select
        c.customer_unique_id,
        round(sum(op.payment_value), 2) as total_spent
    from customers as c
    join orders as o on c.customer_id = o.customer_id
    join order_payments as op on o.order_id = op.order_id
    group by c.customer_unique_id
)

select
    case
        when total_spent < 100 then 'Low'
        when total_spent <= 500 then 'Medium'
        else 'High'
    end as spend_tier,
    count(*) as customer_count,
    round (
        count(*) * 100.0 / sum(count(*)) over (), 2
    ) as customer_percentage
from customer_spending
group by
    case
        when total_spent < 100 then 'Low'
        when total_spent <= 500 then 'Medium'
        else 'High'
    end
order by customer_count desc;
