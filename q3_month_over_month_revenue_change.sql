# -- Q3 - What is the month-over-month change in revenue?
use olist;

select * from orders;
select * from order_payments;

with monthly_revenue as (
    select
        date_format(o.order_purchase_timestamp, '%Y-%m') as month,
        round(sum(op.payment_value), 2) as total_revenue
    from orders as o
    join order_payments as op on o.order_id = op.order_id
    group by month
)

select
    month,
    round(total_revenue,2) as total_revenue,
    round(lag(total_revenue) over (order by month),2) as previous_month_revenue,
    round(total_revenue - lag(total_revenue) over (order by month),2) as revenue_change
from monthly_revenue
order by month;