# Hands On - Creating a Basic USQL Dashboard

In this lab, we will create the following dashboard:

![Basic Dashboard](/img/basic_usql_dashboard_done.PNG)

## Dashboard Components

The above dashboard has the following components:

Out of the Box Tiles:

- **Live user activity**
- **Top web applications**
- **Application health** 

USQL Tiles:

### Single Value Tiles

- Satisfied Users
	- USQL Category: **select count(usersessionid) as "Satisfied Users" from usersession where userExperienceScore="SATISFIED"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Tolerated Users
	- USQL Category: **select count(usersessionid) as "Tolerated Users" from usersession where userExperienceScore="TOLERATED"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Frustrated Users
	- USQL Category: **select count(usersessionid) as "Frustrated Users" from usersession where userExperienceScore="FRUSTRATED"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**
	
- Duration 90th Percentile
	- USQL Category: **select PERCENTILE(duration,90) as "Duration 90th Percentile" from useraction**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Visually Complete 90th Percentile
	- USQL Category: **select PERCENTILE(visuallyCompleteTime,90) as "Visually Complete 90th Percentile" from useraction**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

- Speed Index 90th Percentile
	- USQL Category: **select PERCENTILE(speedIndex,90) as "Speed Index 90th Percentile" from useraction**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**
	- Visualization types: **Single value**

### Charts
	
- Duration
	- USQL Category: **select DISTINCT DATETIME(starttime, "HH:mm", "10m") as "Time", avg(useraction.duration) as "Duration" from useraction**
	- Compare with previous timeframe: **false**
	- Visualization types: **Bar chart**

- Visually Complete
	- USQL Category: **select DISTINCT DATETIME(starttime, "HH:mm", "10m") as "Time", AVG(visuallyCompleteTime) as "Visually Complete" from useraction**
	- Compare with previous timeframe: **false**
	- Visualization types: **Bar chart**

- Speed Index
	- USQL Category: **select DISTINCT DATETIME(starttime, "HH:mm", "10m") as "Time", AVG(speedIndex) as "Speed Index" from useraction**
	- Compare with previous timeframe: **false**
	- Visualization types: **Bar chart**
	

:arrow_up_small: [Back to overview](/README.md)