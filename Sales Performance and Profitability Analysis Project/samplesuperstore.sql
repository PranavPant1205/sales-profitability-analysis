create database superstore_project;
use superstore_project;

select count(*) from samplesuperstore;

-- What is the total sales and total profit of the company?
select round(sum(sales),2) as total_sales,round(sum(profit),2) as total_profit
from samplesuperstore;

-- which Region is bringing the most sales?
select region,round(sum(sales),2) as total_sales,round(sum(profit),2) as total_profit
from samplesuperstore
group by region 
order by total_sales desc;

-- checks if there is any null value or not
select sum(case when sales is null then 1 else 0 end) as null_sales,
sum(case when profit is null then 1 else 0 end) as null_profit,
sum(case when region is null then 1 else 0 end) as null_region
from samplesuperstore;

-- Negative Profit Check
select count(*) as loss_orders
from samplesuperstore
where profit<0;

-- Lowest Profit Margin
select region,round(sum(profit)/sum(sales)*100,2) as profit_margin_percent
from samplesuperstore
group by region
order by profit_margin_percent;

-- Loss in the central region
select count(*) as loss_orders,round(sum(profit),2) as total_loss
from samplesuperstore
where region='central'
and profit<0;

-- Due to which category the loss is happening in the central region?
select category,count(*) as loss_orders,round(sum(profit),2) as total_loss
from samplesuperstore
where region='central'
and profit<0
group by category
order by total_loss;

-- Why office supplies is going in loss,so we will find discount vs Profit
select round(avg(discount),2) as avg_discount,
round(avg(profit),2) as avg_profit
from samplesuperstore
where region='central'
and category='office supplies';