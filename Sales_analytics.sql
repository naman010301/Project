/*
DISCOVERING THE SALES TREND OVER TIME
*/
-- Monthly Trend
SELECT
    -- YEAR(order_date) AS Year,
    MONTH(order_date) AS Months,
	COUNT(DISTINCT Order_ID) AS Sales 
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY MONTH(order_date);
/*
	Months	    Sales
	     1	     9262
	     2	    11496
	     3	    14549
	     4	    17528
	     5	    15836
	     6	    12989
	     7	    13761
	     8	    11484
	     9	    11202
	    10	    19436
	    11      16859
	    12	    24004
*/

-- Quarterly Trend
SELECT
    -- YEAR(order_date) AS Year,
    QUARTER(order_date) AS Quarter,
     COUNT(DISTINCT Order_ID) AS Sales 
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP BY YEAR(order_date),
         QUARTER(order_date);
/*
	Quarter	    Sales
	      1	    35307
	      2	    46353
	      3	    36447
	      4     60299
*/

         

/*
DISCOVERING THE SALES TREND BY PRODUCT
*/
-- Products Sales
SELECT
     Product AS Product_Category,
     COUNT(DISTINCT order_id) Sales
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP By 1
ORDER BY 2 DESC;
/*
	Product_Category	             Sales
	USB-C Charging Cable	             21851
	Lightning Charging Cable	     21599
	AAA Batteries (4-pack)	             20590
	AA Batteries (4-pack)	             20542
	Wired Headphones	             18846
	Apple Airpods Headphones	     15521
	Bose SoundSport Headphones	     13295
	27in FHD Monitor	              7495
	iPhone	                              6838
	27in 4K Gaming Monitor	              6224
	34in Ultrawide Monitor	              6174
	Google Phone	                      5521
	Flatscreen TV	                      4793
	Macbook Pro Laptop	              4720
	ThinkPad Laptop	                      4124
	20in Monitor	                      4096
	Vareebadd Phone	                      2064
	LG Washing Machine	               666
	LG Dryer	                       646
*/

-- Products Revenue
SELECT
     Product AS Product_Category,
     SUM(Sales) Revenue
FROM sales_data
WHERE order_date < '2020-01-01'
GROUP By 1
ORDER BY 2 DESC;
/*
	Product_Category	                       Revenue
	Macbook Pro Laptop	                       8035900
	iPhone	                                       4792900
	ThinkPad Laptop	                     4127958.720000435
	Google Phone	                               3318600
	27in 4K Gaming Monitor	            2434707.5700001474
	34in Ultrawide Monitor	             2355558.010000103
	Apple Airpods Headphones	               2348550
	Flatscreen TV	                               1445400
	Bose SoundSport Headphones	      1345265.45999989
	27in FHD Monitor	              1131974.52999994
	Vareebadd Phone	                                826800
	20in Monitor	                     453818.7399999756
	LG Washing Machine	                        399600
	LG Dryer	                                387600
	Lightning Charging Cable	     347004.4500001342
	USB-C Charging Cable	            286453.45000010455
	Wired Headphones	            246430.46999995195
	AA Batteries (4-pack)	            106118.39999995397
	AAA Batteries (4-pack)	             92725.88000001597
*/

-- Quantity Ordered by Products
SELECT
     product,
     SUM(quantity_ordered)
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC;
/*
	product	                     SUM(quantity_ordered)
	AAA Batteries (4-pack)	                     31017
	AA Batteries (4-pack)	                     27635
	USB-C Charging Cable	                     23975
	Lightning Charging Cable	             23217
	Wired Headphones	                     20557
	Apple Airpods Headphones	             15661
	Bose SoundSport Headphones	             13457
	27in FHD Monitor	                      7550
	iPhone	                                      6849
	27in 4K Gaming Monitor	                      6244
	34in Ultrawide Monitor	                      6199
	Google Phone	                              5532
	Flatscreen TV	                              4819
	Macbook Pro Laptop	                      4728
	ThinkPad Laptop                               4130
	20in Monitor	                              4129
	Vareebadd Phone	                              2068
	LG Washing Machine	                       666
	LG Dryer	                               646
*/

-- Revenue/Profit Margin
SELECT
     SUM(sales) AS Revenue,
     SUM(sales - price_each) AS Profit_margin
FROM sales_data
WHERE order_date < '2020-01-01';
/*
Revenue	                         Profit_margin
34483365.679932654	    202738.39999998594
*/


/*
DISCOVERING THE SALES TREND BY LOCATION
*/
-- Revenue by City
SELECT
     DISTINCT city AS City,
     Sum(sales) AS Revenue
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC;
/*
     City	                         Revenue
	 San Francisco	       8262203.910003985
	 Los Angeles	       5452570.800002047
	 New York City	       4664317.430001547
	 Boston	              3661642.0100008966
	 Atlanta	      2795498.5800003316
	 Dallas	              2767975.4000003412
	 Seattle	       2747755.480000308
	 Portland	      2320490.6100000422
	 Austin	              1819581.7499999115
*/