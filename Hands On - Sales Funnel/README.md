# Hands On - Sales Funnel Dashboard

In this lab, we will build a Sales Funnel Dashboard 

![Sales Funnel](/img/sales-funnel-done.png)

Add the following elements to the dashboard:

### Single Value Tiles

USQL Tiles:

- Sessions:
	- USQL Category: **select count(userSessionId) as "Sessions" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Conversions:
	- USQL Category: **SELECT count(userSessionId) as "Conversions" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Lost Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Lost Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and not (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Risk Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Risk Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and (userExperienceScore ="TOLERATED" or userExperienceScore ="FRUSTRATED" or userExperienceScore ="UNDEFINED")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Abandons:
	- USQL Category: **SELECT count(userSessionId) as "Abandons" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and not (useraction.name="loading of page /orange-booking-finish.jsf")**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- New User Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "New User Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and newUser IS true**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Returning User Revenue:
	- USQL Category: **select sum(usersession.doubleProperties.bookingtotal) as "Returning User Revenue" FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") and newUser IS false**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**


### Sales Funnel

- Book Travel User Journey:
	- USQL Category: **SELECT FUNNEL((useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  AS "Homepage", (useraction.name="click on ""login"" on page /orange.jsf" or useraction.name="click on ""login"" on page /") AS "Login", (useraction.name="click on ""search"" on page /orange.jsf" or useraction.name="click on ""search"" on page /") AS "Search", (useraction.name="loading of page /orange-booking-finish.jsf") AS "Booking") FROM usersession where useraction.application="easyTravel Website"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Funnel**

### Charts

- Revenue by User Experience (Chart):
	- USQL Category: **SELECT userExperienceScore, sum(usersession.doubleProperties.bookingtotal) FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and (useraction.name="loading of page /orange-booking-finish.jsf") group by userExperienceScore order by sum(usersession.doubleProperties.bookingtotal) desc**
	- Compare with previous timeframe: **false**
	- Visualization types: **Pie chart**

- Revenue by User Experience (Table):
	- USQL Category: **SELECT userExperienceScore as "APDEX", sum(usersession.doubleProperties.bookingtotal) as "Revenue" FROM usersession where useraction.application="easyTravel Website" and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp") and (useraction.name="loading of page /orange-booking-finish.jsf") group by userExperienceScore order by sum(usersession.doubleProperties.bookingtotal) desc**
	- Compare with previous timeframe: **false**
	- Visualization types: **Table only**

- Lost Revenue by User Experience:
	- USQL Category: **SELECT userExperienceScore, sum(usersession.doubleProperties.bookingtotal) FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange.jsf" or useraction.name="loading of page /" OR useraction.name="loading of page /special-offers.jsp")  and not (useraction.name="loading of page /orange-booking-finish.jsf") group by userExperienceScore order by sum(usersession.doubleProperties.bookingtotal) desc**
	- Compare with previous timeframe: **false**
	- Visualization types: **Pie chart**

- Conversions by User Experience:
	- USQL Category: **SELECT userExperienceScore, count(userSessionId) FROM usersession where useraction.application="easyTravel Website"  and (useraction.name="loading of page /orange-booking-finish.jsf") group by userExperienceScore order by count(userSessionId) desc**
	- Compare with previous timeframe: **false**
	- Visualization types: **Pie chart**
	
	

:arrow_up_small: [Back to overview](/README.md)