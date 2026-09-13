# -- Q2 - What is the monthly revenue trend across the dataset?
use olist;

select * from order_payments;
select * from orders;

select
    date_format(o.order_purchase_timestamp, '%Y-%m') as month,
    round(sum(op.payment_value), 2) as total_revenue
from orders as o
join order_payments as op on o.order_id = op.order_id
group by month
order by month;