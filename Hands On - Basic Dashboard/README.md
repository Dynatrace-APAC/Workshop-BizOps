# Hands On - Creating a Basic Dashboard

In this lab, we will create the following dashboard:

![Basic Dashboard](/img/basic_dashboard_done.PNG)

## Dashboard Components

The above dashboard has the following components:

Out of the Box Tiles:

- **Application Health**
- **Top web applications**
- **Web Application** > easyTravel Website

Custom Chart Tiles:

- Action count (by Apdex category)
	- Category: Applications
	- Metric: Action count (by Apdex category) (Sum)
	- View Results as: Timeseries
	- Dimensions to split by: 
		- Web Application: true, Filtered by **easyTravel Website**
		- Apdex category: true
		

- Action count (by Apdex category)
	- Category: Applications
	- Metric: Action count (by Apdex category) (Sum)
	- View Results as: Pie
	- Dimensions to split by: 
		- Web Application: true, Filtered by **easyTravel Website**
		- Apdex category: true

- Real User Errors
	- Category: Applications
	- Metric: Count of errors (by user type, error type and error origin) (Sum)
	- View Results as: Pie
	- Dimensions to split by: 
		- Web Application: true, Filtered by **easyTravel Website**
		- User type: true, Filtered by: **Real Users**
		- Error origin: true
	
- Active Sessions
	- Category: Applications
	- Metric: Active Sessions
	- View Results as: Top List
	- Dimensions to split by: 
		- Web Application: true, Filtered by **easyTravel Website**
		- Users: true
		- User type: true
		
	
- Session Duration
	- Category: Applications
	- Metric: Session Duration
	- View Results as: Top List
		- Dimensions to split by: 
		- Web Application: true, Filtered by **easyTravel Website**
		- Users: true
		- User type: true

:arrow_up_small: [Back to overview](/README.md)