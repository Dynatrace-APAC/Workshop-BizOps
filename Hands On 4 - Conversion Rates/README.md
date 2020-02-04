# Hands On 4 - Creating Conversion Rates

In this lab, we will create conversion goals for the easyTravel application

## Key User Action
First we need to mark the page (/orange-booking-finish.jsf) as a key user action:
1) Access the easyTravel application

2) Under **Top 3 user actions** click **View full details**

3) Scroll down to **Top 100 user a actions** and filter for **orange-booking-finish.jsf**

![Conversion Goal](/img/conversion_goal_filter.PNG)

4) Click on the user user action **Loading of page /orange-booking-finish.jsf** then click on **Matk as key user action**

![Conversion Goal](/img/conversion_goal_makua.PNG)

## Conversion Goal

5) Access the easyTravel application monitoring settings
  Applications > easyTravel > (...) > Edit

6) Select **Conversion Goals** and click **Add goal** and enter the following:

   Name: **Successful Bookings - open final Page**  
   Type of goal: **Destination** > **contains** > **/orange-booking-finish.jsf**  

![Conversion Goal](/img/conversion_goal.PNG)

Check results aginst the application: **easyTravel** > **User behavior**  

![Conversion Goal](/img/conversion_goal-done.PNG)

## Create 3 more Convertion Goals

Follow the above steps to create 3 more conversion goals for:  

Homepage:
  * Name: Homepage  
  * Type of goal: User Action  
  * Rule applies to: Load actions  
  * Rule: Action Name > begins with > **Loading of page /orange.jsf**  
  
Review Page:
  * Name: Review  
  * Type of goal: Destination > contains > **/orange-booking-review.jsf**  
  
Payment Page:
  * Name: Payment  
  * Type of goal: Destination > contains > **/orange-booking-payment.jsf**

:arrow_up_small: [Back to overview](/README.md)