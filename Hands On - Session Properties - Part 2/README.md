# Hands On 3 - Creating Sessions Properties - Part 2

In this lab, we will create a session properties to expose business data Booking Total and Destination to Dynatrace

## Booking Total

First get the **CSS selector** for the Booking Total field.

1) Assess the easyTravel homepage (the URL provied to you)
2) Seach for a destination e.g. Gold Coast and click **Book Now**

![easyTravel Step 1](/img/easytravel-step1.png)

3) Login with username: **janet** and password: **janet** and click **Next**

![easyTravel Step 2](/img/easytravel-step2.png)

4) Right click on the Round-trip ticket price $ value and click **inspect**

![easyTravel Step 3](/img/easytravel-step3.png)

5) Right click on the td element and select **Copy** > **Copy Selector**

![easyTravel Step 4](/img/easytravel-step4.png)


Second create the session property in Dynatrace.


1) Access the easyTravel application monitoring settings
  Applications > easyTravel > (...) Edit

2) Select **Session and User action properties** and click **Custom defined property** and enter the following:

   * Expression Type: **CSS Selector**  
   * Data Type: **Double**  
   
   * CSS Selector:  **The CSS Selector you copied above**  e.g `#iceform\:j_idt77-11-1 > span`
   
   * Display Name:  **Booking Total**  
   * Key:  **bookingtotal**  
   
   * Display Name: **Booking Total**  
   * Store as user action property: **false**  
   * Store as session property: **true**  
   * Apply cleanup rule: **true**  
   * Cleanup Rule Regex: `\$(.*+)`
   
You can view the user sessions that have the booking total value by running the following USQL: 

    SELECT * FROM usersession WHERE doubleProperties.bookingtotal IS NOT NULL ORDER BY startTime DESC
   
## Trip Journey

For the trip Journey, back in easyTravel:

1) Right click on the **Journey** value and click **inspect**

![easyTravel Step 3](/img/easytravel-dest-step3.png)

2) Right click on the span element and select **Copy** > **Copy Selector**

![easyTravel Step 4](/img/easytravel-dest-step4.png)


Create the session property in Dynatrace.

1) Select **Session and User action properties** and click **Custom defined property** and enter the following:

   * Expression Type: **CSS Selector**  
   * Data Type: **String**  
   
   * CSS Selector:  **The CSS Selector you copied above** e.g. `#iceform\:popupDetailsLink`
   
   * Display Name: **Journey**
   * Key:  **journey**  
   
   * Store as user action property: **false**  
   * Store as session property: **true**  
   * Apply cleanup rule: **false**  

You can view the user sessions that have the destination value by running the following USQL: 

    SELECT * FROM usersession WHERE stringProperties.journey IS NOT NULL ORDER BY startTime DESC
    
    
It may take 5-10 mins to see results in Dynatrace because session properties are only available when the user session is completed.

If you get stuck the use the following:



:arrow_up_small: [Back to overview](/README.md)