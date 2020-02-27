# Hands On 6 - Sales Funnel Dashboard

In this lab, we will build a Sales Funnel Dashboard 

![USQL Icon](/img/sales-funnel-done.PNG)

Add the following elements to the dashboard:

### Abandons

USQL Tiles:

- Sessions:
	- USQL Category: **select count(userSessionId) as "Sessions" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Conversions:
	- USQL Category: **SELECT count(userSessionId) as "Conversions" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Lost Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Lost Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and not (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Risk Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Risk Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and (userExperienceScore ="TOLERATED" or userExperienceScore ="FRUSTRATED" or userExperienceScore ="UNDEFINED")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Abandons:
	- USQL Category: **SELECT count(userSessionId) as "Abandons" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and not (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- New User Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "New User Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and newUser IS true**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Returning User Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Returning User Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and newUser IS false**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**



- Book Travel User Journey:
	- USQL Category: **SELECT FUNNEL((useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  AS "Homepage", (useraction.name="click on ""login"" on page /") AS "Login", (useraction.name="click on ""search"" on page /") AS "Search", (useraction.name="loading of page /orange-booking-finish.jsf") AS "Booking") FROM usersession where useraction.application="easyTravel Website"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Funnel**

- Revenue by User Experience:
	- USQL Category: **SELECT userExperienceScore, sum(usersession.doubleProperties.bookingtotal) FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") group by userExperienceScore order by sum(usersession.doubleProperties.bookingtotal) desc**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Pie chart**
	
Homepage  
    Conversion Goal > easyTravel > Homepage
    
Review  
    Conversion Goal > easyTravel > Review
      
Payment  
    Conversion Goal > easyTravel > Payment
    
Finish  
    Conversion Goal > easyTravel > Sucessful Bookings - open Final Page
    
### Abandons

Homepage - USQL

    select count(*) as "Abandons" from usersession where useraction.name="Loading of page /orange.jsf" and useraction.name!="Loading of page /orange-booking-review.jsf"  
    
Review - USQL
      
    select count(*) as "Abandons" from usersession where useraction.name="Loading of page /orange.jsf" and useraction.name="Loading of page /orange-booking-review.jsf" and useraction.name!="Loading of page /orange-booking-payment.jsf"  
      
Payment - USQL
    
    select count(*) as "Abandons" from usersession where useraction.name="Loading of page /orange.jsf" and useraction.name="Loading of page /orange-booking-review.jsf" and useraction.name="Loading of page /orange-booking-payment.jsf" and useraction.name!="Loading of page /orange-booking-finish.jsf"  

Finish - USQL
     
    select count(*) as "Abandons" from usersession where useraction.name="Loading of page /orange.jsf " and useraction.name="Loading of page /orange-booking-review.jsf" and useraction.name="Loading of page /orange-booking-payment.jsf" and useraction.name="Loading of page /orange-booking-finish.jsf"

### Errors

Homepage - USQL
      
     select sum(errorCount) as "Errors" from useraction where name="Loading of page /orange.jsf"
    
Review - USQL
     
     select sum(errorCount) as "Errors" from useraction where name="Loading of page /orange-booking-review.jsf"
      
Payment - USQL
     
     select sum(errorCount) as "Errors" from useraction where name="Loading of page /orange-booking-payment.jsf"

Finish - USQL
     
     select sum(errorCount) as "Errors" from useraction where name="Loading of page /orange-booking-finish.jsf"

      
When you are finished your dashboard should look something like this:

![Dashboard Basic Funnel](/img/usql-basic-funnel.PNG)

:arrow_up_small: [Back to overview](/README.md)