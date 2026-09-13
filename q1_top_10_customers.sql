# create database olist;

# -- Q1 - Who are the top 10 customers by total amount spent?
use olist;

select * from customers;
select * from orders;
select * from order_payments;

select
    c.customer_id,
    round(sum(op.payment_value), 2) as total_spent
from customers as c
join orders as o on c.customer_id = o.customer_id
join order_payments as op on o.order_id = op.order_id
group by  c.customer_id
order by total_spent desc
limit 10;