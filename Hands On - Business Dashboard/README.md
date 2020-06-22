# Hands On - Creating a Business Dashboard

In this lab, we will create the following dashboard:

![Business Dashboard](/img/business_dashboard_done.PNG)

## Dashboard Components

The above dashboard has the following components:

1) **User Behavior** > **easyTravel Website**

2) **Top conversion goals** > **easyTravel Website**

3) **Conversion goal** > **easyTravel Website** > **Sucessful Bookings**

4) **Bounce Rate** > **easyTravel Website**

5) **Key user actions** > **easyTravel Website**

6) **User Session Query** - Revenue

        SELECT SUM(doubleProperties.bookingtotal) AS "Revenue (USD)" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") 
   
7) **User Session Query** - Total Revenue by Hour  

       SELECT DISTINCT DATETIME(starttime, "HH:mm", "30m") as "Time",AVG(usersession.doubleProperties.bookingtotal) AS "Revenue (USD)" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") 

8) **User Session Query** - Revenue by Loyalty Status - Chart

       SELECT usersession.stringProperties.membershipstatus, SUM(usersession.doubleProperties.bookingtotal) AS "Revenue" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") and usersession.stringProperties.membershipstatus IS NOT NULL GROUP BY usersession.stringProperties.membershipstatus
       
9) **User Session Query** - Revenue by Loyalty Status - Table

       SELECT usersession.stringProperties.membershipstatus AS "Loyalty Status", SUM(usersession.doubleProperties.bookingtotal) AS "Revenue" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") and usersession.stringProperties.membershipstatus IS NOT NULL GROUP BY usersession.stringProperties.membershipstatus
       
10) **User Session Query** - Bookings by Trip Destination

        SELECT usersession.stringProperties.journey, SUM(usersession.doubleProperties.bookingtotal) FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") and usersession.stringProperties.journey IS NOT NULL GROUP BY usersession.stringProperties.journey    

11) **User Session Query** - Revenue by Loyalty Users

        SELECT userId AS "Customer", country AS "Origin Country", stringProperties.membershipstatus AS "Loyalty Status", SUM(doubleProperties.bookingtotal) AS "Revenue", AVG(doubleProperties.bookingtotal) AS "Average Trip Spend" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") and doubleProperties.bookingtotal IS NOT NULL AND CITY IS NOT NULL AND userId IS NOT NULL AND stringProperties.membershipstatus  IN ("Gold", "Platinum", "Silver") GROUP BY userId, country, stringProperties.membershipstatus ORDER BY sum(doubleProperties.bookingtotal) DESC
       
12) **User Session Query** - Revenue by Purchasing City

        SELECT city AS "Origin City", country AS "Origin Country", SUM(doubleProperties.bookingtotal) AS "Revenue", AVG(doubleProperties.bookingtotal) AS "Average Trip Spend" FROM usersession WHERE useraction.application="easyTravel Website" and (useraction.name="loading of page /orange-booking-finish.jsf") and doubleProperties.bookingtotal IS NOT NULL AND CITY IS NOT NULL GROUP BY city, country ORDER BY sum(doubleProperties.bookingtotal) DESC

:arrow_up_small: [Back to overview](/README.md)