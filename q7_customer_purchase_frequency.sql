# -- Q7 - How many customers are repeat vs one-time buyers?
use olist;

select * from customers;
select * from orders;

with customer_segments as (
    select
        c.customer_unique_id,
        count(o.order_id) as order_count,
        case
            when count(o.order_id) = 1 then 'one-time'
            else 'repeat'
        end as customer_type
from customers as c
join orders as o on c.customer_id = o.customer_id
group by c.customer_unique_id
),

customer_counts as (
    select
        customer_type,
        count(*) as customer_count
    from customer_segments
    group by customer_type
)

select
    customer_type,
    customer_count,
    round(customer_count * 100.0 / sum(customer_count) over (), 2) as percentage
from customer_counts;