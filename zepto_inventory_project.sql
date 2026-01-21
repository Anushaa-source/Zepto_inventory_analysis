delete table if exists zepto;

create table zepto(
sku_id SERIAL primary key,
category varchar(120),
Name varchar(120) NOT NULL,
mrp numeric(8,2),
discountpercent numeric(5,2),
availablequantity integer,
discountsellingprice numeric(8,2),
weigthingms integer,
outofstock boolean,
quantity integer
);

--data exploration

--count of all rows
select count(*) from zepto;

--sample data
select * from zepto
limit 10;

--null values
SELECT *
FROM zepto
WHERE sku_id is null
   OR category IS NULL
   OR mrp IS NULL
   OR discountpercent IS NULL
   OR availablequantity IS NULL
   OR discountsellingprice IS NULL
   OR weigthingms IS NULL
   OR outofstock IS NULL
   OR quantity IS NULL;


--differnt product categories
select distinct category
from zepto
order by category;

--products instock vs outofstock
select outofstock,count(sku_id)
from zepto
group by outofstock;

--multiple appreance of product names
select name, count(sku_id) as number_of_skus
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning
--products with price=0

select *
from zepto
where mrp=0 or discountpercent=0 ;

delete from zepto
where mrp=0;

--convert paisa to rupees

update zepto
set mrp=mrp/100.0,
discountsellingprice=discountsellingprice/100.0;

select discountsellingprice,mrp from zepto;

--find the best top 10 value products based on the discount percentage

select distinct name , mrp,discountpercent
from zepto
order by discountpercent desc
limit 10;

--what are the products with high mrp but out of stock

select distinct name,mrp
from zepto
where outofstock=True and mrp>300
order by mrp desc;

--calculate estimated revenue for each of the category

select  category,
    sum(discountsellingprice * quantity) AS revenue
from zepto
group by category
order by sum(discountsellingprice * quantity);

--find all products where mrp is greater than 500rs and discount is less than 10%

select distinct name,mrp,discountpercent
from zepto
where mrp >500 and discountpercent<10
order by mrp desc, discountpercent desc;

--find the top 5 categories offering the highest average discount percentage

select category, round(avg(discountpercent),2) as averagepercent
from zepto
group by category
order by avg(discountpercent) desc
limit 5;

--find the price per gram for products above 100g and sort by best value
select distinct name,mrp,weigthingms,
round((discountsellingprice/weigthingms),2)as price_per_gram
from zepto
where weigthingms>=100
order by price_per_gram;


-- group the product into categories like low,medium,bulk
SELECT
    DISTINCT name,
    weigthingms,
    CASE
        WHEN weigthingms < 1000 THEN 'low'
        WHEN weigthingms < 5000 THEN 'medium'
        ELSE 'bulk'
    END AS weigthcategory
FROM zepto;


-- what is the total inventory weight per category

SELECT category,
    SUM(weigthingms * quantity) AS total_inventory_weight_gms
FROM zepto
group by category
order by SUM(weigthingms * quantity);


