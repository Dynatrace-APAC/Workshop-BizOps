
# Hands On - Pull Dynatrace data into Excel using Power BI

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


![API Result](/img/api-result-v2.PNG)

Copy the **Request URL** for use in the next section.

## Section 2 - Create API Token & Timeseries API Call

 1. Open Excel and create a new workbook.

 2. Select: **Data > From Web**

 3. Select **Advanced**
 
 4. Enter your **Request URL** in **URL Parts** 

5. Add the following **HTTP request header parameter** then click **OK** and **Connect**

     Accept text/csv; header=present; charset=utf-8
	 Authorization Api-Token <your-API-token>

![API Result](/img/bi-fromweb.PNG)

6. Click Load

![API Result](/img/excel-import-data-v2.PNG)

7. You data sould be imported

![API Result](/img/excel-formatted-data-v2.PNG)

:arrow_up_small: [Back to overview](/README.md)