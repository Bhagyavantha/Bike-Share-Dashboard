Select * 
From bike_share_yr_0
Select * 
From bike_share_yr_1
Select *
From cost_table;
-- There are 3 tables in the dataset

Select * 
From bike_share_yr_0
Union
Select * 
From bike_share_yr_1
-- Appended the data from two tables

Select *
From cost_table;

With cte as (
Select * 
From bike_share_yr_0
Union
Select * 
From bike_share_yr_1)
-- Both the tables merged & named as cte for joins

Select * 
From cte
left join cost_table
on cte.yr = cost_table.yr
-- price & COGS appended to merged table

With cte as (
Select * 
From bike_share_yr_0
Union
Select * 
From bike_share_yr_1)

Select dteday, season, weekday, a.yr, hr, rider_type, riders, price, COGS, riders*price as revenue, riders*price-COGS*riders as profit
From cte a
left join cost_table b
on a.yr = b.yr
-- Selected relevant tables & calculated revenue & profit
-- Further connected this data to Power BI to create dashboard
