# Hands On - Sessions Properties - Part 1

In this lab, we will create a session properties to expose business data to Dynatrace

## Membership Status

1) Access the easyTravel Website application monitoring settings

Applications > easyTravel Website > (...) Edit

2) Select **Session and User action properties**, and click **Custom defined property** and enter the following:

   * Expression Type: **CSS Selector**  
   * Data Type: **String**  
   * Display Name:  **Membership Status**  
   * Key:  **membershipstatus**  
   * CSS Selector:  `#loginForm\:j_idt43`   
   * Store as user action property: **false**  
   * Store as session property: **true**  
   * Apply cleanup rule: **true**  
   * Cleanup Rule Regex: `(.*?) status!`  

![User Session Property Config](/img/userproperty-config-membership.PNG)

3) Click **Save Property**

It may take 5-10 mins to see results in Dynatrace because session properties are only available when the user session is completed.

You can view the user sessions that have the membershipstatus set  by running the following USQL: 

    SELECT * FROM usersession WHERE stringProperties.membershipstatus IS NOT NULL ORDER BY startTime DESC


:arrow_up_small: [Back to overview](/README.md)
