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

- Satisfied Users
	- USQL Category: **select count(usersessionid) as "Satisfied Users" from usersession where userExperienceScore="SATISFIED"**
	- Compare with previous timeframe: **true**
	- Dynamic time-frame shift: **true**

- Action count (by Apdex category)
	- Category: Applications
	- Metric: Action count (by Apdex category) (Sum)
	- View Results as: Pie
	- Filtered by: Application: **easyTravel Website**

- Real User Errors
	- Category: Applications
	- Metric: Count of errors (by user type, error type and error origin) (Sum)
	- View Results as: Pie
	- User type: Filtered by: **Real Users**
	- Filtered by: Application: **easyTravel Website**
	
- Active Sessions
	- Category: Applications
	- Metric: Active Sessions
	- View Results as: Top List
	- Filtered by: Application: **easyTravel Website**
	
- Session Duration
	- Category: Applications
	- Metric: Session Duration
	- View Results as: Top List
	- Filtered by: Application: **easyTravel Website**

:arrow_up_small: [Back to overview](/README.md)