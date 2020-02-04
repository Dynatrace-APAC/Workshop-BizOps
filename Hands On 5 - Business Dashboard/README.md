# Hands On 5 - Creating a Business Dashboard

In this lab, we will create the following dashboard:

![Business Dashboard](/img/business_dashboard_done.PNG)

## Dashboard Components

The above dashboard has the following components:

1) **User Behavior** > **easyTravel**

2) **Top conversion goals** > **easyTravel**

3) **Conversion goal** > **easyTravel** > **Sucessful Bookings**

4) **Bounce Rate** > **easyTravel**

5) **Key user actions** > **easyTravel**

6) **User Session Query** - Revenue

        SELECT SUM(doubleProperties.bookingtotal) AS "Revenue (USD)" FROM usersession WHERE doubleProperties.bookingtotal IS NOT NULL
   
7) **User Session Query** - Booking Total over Time:  

       SELECT DATETIME(starttime, 'MM/dd/yyyy hh:mm', '30m'),AVG(usersession.doubleProperties.bookingtotal) AS "Revenue" FROM usersession WHERE usersession.doubleProperties.bookingtotal IS NOT NULL GROUP BY DATETIME(starttime, 'MM/dd/yyyy hh:mm', '30m')

8) **User Session Query** - Revenue by Loyalty Status - Chart

       SELECT usersession.stringProperties.membershipstatus, SUM(usersession.doubleProperties.bookingtotal) AS "Revenue" FROM usersession WHERE usersession.stringProperties.membershipstatus IS NOT NULL GROUP BY usersession.stringProperties.membershipstatus
       
9) **User Session Query** - Revenue by Loyalty Status - Table

       SELECT stringProperties.membershipstatus AS "Loyalty Status", SUM(doubleProperties.bookingtotal) AS "Revenue (USD)" FROM usersession WHERE stringProperties.membershipstatus IS NOT NULL AND doubleProperties.bookingtotal IS NOT NULL GROUP BY stringProperties.membershipstatus
       
10) **User Session Query** - Booking Value by Trip Destination

        SELECT usersession.stringProperties.destination, SUM(usersession.doubleProperties.bookingtotal) FROM usersession WHERE usersession.stringProperties.destination IS NOT NULL GROUP BY usersession.stringProperties.destination  

11) **User Session Query** - Revenue by Loyalty User

        SELECT userId AS "Customer", country AS "Origin Country", stringProperties.membershipstatus AS "Loyalty Status", SUM(doubleProperties.bookingtotal) AS "Revenue", AVG(doubleProperties.bookingtotal) AS "Average Trip Spend" FROM usersession WHERE doubleProperties.bookingtotal IS NOT NULL AND CITY IS NOT NULL AND userId IS NOT NULL AND stringProperties.membershipstatus  IN ("Gold", "Platinum", "Silver") GROUP BY userId, country, stringProperties.membershipstatus ORDER BY sum(doubleProperties.bookingtotal) DESC
       
12) **User Session Query** - Revenue by Purchasing City

        SELECT city AS "Origin City", country AS "Origin Country", SUM(doubleProperties.bookingtotal) AS "Revenue", AVG(doubleProperties.bookingtotal) AS "Average Trip Spend" FROM usersession WHERE doubleProperties.bookingtotal IS NOT NULL AND CITY IS NOT NULL GROUP BY city, country ORDER BY sum(doubleProperties.bookingtotal) DESC

:arrow_up_small: [Back to overview](/README.md)