
# Hands On 8 - Pull Dynatrace data into Excel using Power BI

In this lab is split into two sections, the first section generates an API token request URL we can use the fetch data from Dynatrace. The second section uses this URL to import data into Excel.
If you already have an API token and URL then jump stright to the part of this lab


## Section 1 - Create API Token & Timeseries API Call

### Create API Token

First we need to create a API token.

In the Dynatrace dashboard, navigate to the Configuration API: **Settings -> Integration -> Dynatrace API**

1. Click **Generate token**

![Generate Token](/img/gen-token-button.PNG)

2. Enter a name for your token and select the appropriate access switches for the token, then click **Generate**.

In this lab we will only need **Access problem and event feed, metrics and topology**

![Add Token Name](/img/gen-my-token.PNG)

3. Click the down arrow (under the edit column) to display your token. **Take note of the token for later use.**

![Add Token Name](/img/gen-my-token-result.PNG)

### Access API Explorer

In the Dynatrace dashboard, navigate to the Configuration API: **Settings -> Integration -> Dynatrace API**

1. Click **Dynatrace API Explorer**

Ensure you are using **Environment API v2** (top right corner of the screen)

2. Click **Authorize**

3. Enter your API token under the **DataExport** (apiKey) and click **Authorise**

![Authorise API with Token](/img/api-auth-key.PNG)

4. Click **Close**

![Authorise API](/img/api-auth.PNG)

### Timeseries API Call 

1. In the API list select **Metrics**

2. Select **GET /metrics/query**

3. Click **Try it out**

![Tryout Timeseries API](/img/tryout-timeseries-api-v2.PNG)

4. Enter the following parameters: 

	* metricSelector: **builtin:apps.web.apdex.userType:filter(eq(User type,Real users)):names**
	* resolution: **5m**
	* from: **now-4h**

5. Change Response content type to **text/csv; header=present; charset=utf-8**

![Tryout Timeseries API](/img/tryout-timeseries-api-header-v2.PNG)

6. Click **Execute**. If successful the result should be shown looking something like this:

Copy the **Request URL** for use in the next section.

![API Result](/img/api-result-v2.PNG)



## Section 2 - Create API Token & Timeseries API Call

 1. Open Excel and create a new workbook.

 2. Select: **Data > From Web**

 3. Select **Advanced**
 
 4. Enter your **Request URL** and append **&Api-Token=<your-API-token>**

The URL will look something like this:

https://jlp305.dynatrace-managed.com/e/10-Sydney-Perform-2019--CreatedDate-8-8-2019/api/v2/metrics/series/builtin%3Aapps.web.action.apdex?resolution=120&from=now-1d&Api-Token=1234567890

5. Add the following **HTTP request header parameter**

     Accept 
     text/csv; header=present; charset=utf-8

![API Result](/img/excel-import-fromweb-v2.PNG)

6. Click Load

![API Result](/img/excel-import-data-v2.PNG)

7. You data sould be imported

![API Result](/img/excel-formatted-data-v2.PNG)

:arrow_up_small: [Back to overview](/README.md)