# Hands On - Creating Conversion Rates

In this lab, we will create conversion goals for the easyTravel application

## Conversion Goal

Access the easyTravel Website application monitoring settings
  Applications > easyTravel Website > (...) > Edit

Select **Conversion Goals** and click **Add goal** and enter the following:

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