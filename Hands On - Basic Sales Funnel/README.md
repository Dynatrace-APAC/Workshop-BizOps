# Hands On - (Very) Basic Funnel Dashboard

In this lab, we will create a dashboard to display a basic sales funnel.

In the Dynatrace UI, create a new dashboard named "Sales Funnel" (**Dashboards** > **Create Dashboard**)  

1. Add the User Sessions Query to the dashboard and configure the tile

![USQL Icon](/img/usql-icon.PNG)

2. Enter the UQSL as follows

**select count(*) as "Homepage Requests" from usersession where useraction.name = "loading of page /orange.jsf"**

![USQL](/img/usql-query.PNG)

3. Click on "Save Changes to dashboard"

4. Repeat the above steps to create dashboard tiles for:

  Review Page:
  
    select count(*) as "Review Page Requests" from usersession where useraction.name="loading of page /orange.jsf" and useraction.name="loading of page /orange-booking-review.jsf"

  Payment Page:
  
    select count(*) as "Payment Page Requests" from usersession where useraction.name="loading of page /orange.jsf" and useraction.name="loading of page /orange-booking-review.jsf" and useraction.name="loading of page /orange-booking-payment.jsf"

  Finish Page:
  
    select count(*) as "Finish Page Requests" from usersession where useraction.name="loading of page /orange.jsf" and useraction.name="loading of page /orange-booking-review.jsf" and useraction.name="loading of page /orange-booking-payment.jsf" and useraction.name="loading of page /orange-booking-finish.jsf"

When you are finished your dashboard should look something like this:

![Dashboard Basic Funnel](/img/usql-basic-funnel.PNG)


:arrow_up_small: [Back to overview](/README.md)