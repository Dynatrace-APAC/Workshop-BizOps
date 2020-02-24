# Creating a Dashboard using API

In this lab, we will create a dashsboard using the Dashboard API.

You will need an API token with the **Read configuration** and **Write Configuration** permissions for this session.

![Dashboard API Permissions](/img/dashboard-api-permis.PNG)

## Step-by-step Guide - Access API Explorer

In the Dynatrace dashboard, navigate to the Configuration API: **Settings -> Integration -> Dynatrace API > Dynatrace API Explorer**

Select **Configuration API** from the top right drop down menu.

Authorise **ReadConfigToken (apiKey)** and **WriteConfigToken (apiKey)** for this session.

## Step-by-step Guide - Create Dashboard using API

1. In the API list select **Dashboards** 

2. Select **POST /dashboards**

![Dashboard API](/img/dashboard-config-post.png)

3. Select **Try it Out**

4. The following json will create a dashboard. Copy the JSON into the Example Value field

```json
{
  "dashboardMetadata": {
    "name": "Executive Overview Dashboard",
    "shared": false,
    "sharingDetails": {
      "linkShared": true,
      "published": false
    },
    "dashboardFilter": {
      "timeframe": "l_2_HOURS",
      "managementZone": null
    }
  },
  "tiles": [
    {
      "name": "Top web applications",
      "tileType": "APPLICATIONS_MOST_ACTIVE",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 0,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      }
    },
    {
      "name": "Overview",
      "tileType": "HEADER",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 0,
        "width": 304,
        "height": 38
      },
      "tileFilter": {
        "managementZone": null
      }
    },
    {
      "name": "Problems",
      "tileType": "OPEN_PROBLEMS",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 0,
        "width": 152,
        "height": 152
      },
      "tileFilter": {
        "managementZone": null
      }
    },
    {
      "name": "Service health",
      "tileType": "SERVICES",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 152,
        "width": 152,
        "height": 152
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": null,
      "chartVisible": true
    },
    {
      "name": "Host health",
      "tileType": "HOSTS",
      "configured": true,
      "bounds": {
        "top": 798,
        "left": 0,
        "width": 152,
        "height": 152
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": null,
      "chartVisible": true
    },
    {
      "name": "Application health",
      "tileType": "APPLICATIONS",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 152,
        "width": 152,
        "height": 152
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": null,
      "chartVisible": true
    },
    {
      "name": "World map",
      "tileType": "APPLICATION_WORLDMAP",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 380,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ],
      "metric": "APDEX"
    },
    {
      "name": "User behavior",
      "tileType": "SESSION_METRICS",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 380,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ]
    },
    {
      "name": "User breakdown",
      "tileType": "USERS",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 684,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ]
    },
    {
      "name": "Bounce rate",
      "tileType": "BOUNCE_RATE",
      "configured": true,
      "bounds": {
        "top": 342,
        "left": 988,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ]
    },
    {
      "name": "JavaScript errors",
      "tileType": "UEM_JSERRORS_OVERALL",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 380,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ]
    },
    {
      "name": "Resources",
      "tileType": "RESOURCES",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 988,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ],
      "metric": "ACTION_COUNT"
    },
    {
      "name": "Most used 3rd parties",
      "tileType": "THIRD_PARTY_MOST_ACTIVE",
      "configured": true,
      "bounds": {
        "top": 646,
        "left": 684,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ],
      "metric": "ACTION_COUNT"
    },
    {
      "name": "Live user activity",
      "tileType": "UEM_ACTIVE_SESSIONS",
      "configured": true,
      "bounds": {
        "top": 190,
        "left": 0,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      }
    },
    {
      "name": "Web application",
      "tileType": "APPLICATION",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 988,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ]
    },
    {
      "name": "World map",
      "tileType": "APPLICATION_WORLDMAP",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 684,
        "width": 304,
        "height": 304
      },
      "tileFilter": {
        "managementZone": null
      },
      "assignedEntities": [
        "APPLICATION-534A6A58D004195A"
      ],
      "metric": "SESSION_USERS"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 0,
        "left": 380,
        "width": 1254,
        "height": 38
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "##[easyTravel Production Overview](#uemapplications/uemappmetrics;uemapplicationId=APPLICATION-534A6A58D004195A)"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 266,
        "left": 1330,
        "width": 304,
        "height": 38
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "### [Hosts Overview](#newhosts)\n\n"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 38,
        "left": 1330,
        "width": 304,
        "height": 38
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "###[Services Overview](#newservices)"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 494,
        "left": 1330,
        "width": 304,
        "height": 38
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "### [Database Overview](#databases)"
    },
    {
      "name": "",
      "tileType": "SERVICES",
      "configured": true,
      "bounds": {
        "top": 76,
        "left": 1330,
        "width": 152,
        "height": 190
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": {
        "type": "SERVICE",
        "customName": "Java",
        "defaultName": "Java",
        "chartConfig": {
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "SERVICE": {
            "SERVICE_SOFTWARE_TECH": [
              "JAVA"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 722,
        "left": 1330,
        "width": 152,
        "height": 228
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "## Links\n---\n[Docker Overview](#docker)  \n[AWS Overview](#awses)  \n[Azure Overview](#azures)  \n[VMWare Overview](#vcenters)  \n[Network Overview](#networkoverview)"
    },
    {
      "name": "Markdown",
      "tileType": "MARKDOWN",
      "configured": true,
      "bounds": {
        "top": 722,
        "left": 1482,
        "width": 152,
        "height": 228
      },
      "tileFilter": {
        "managementZone": null
      },
      "markdown": "## Help\n---\n[Dynatrace Help](https://www.dynatrace.com/support/help/)  \n[Contact Support](https://www.dynatrace.com/support/contact-support/)  \n[What is Dynatrace?](https://www.dynatrace.com/support/help/get-started/what-is-dynatrace/)  \n[Dynatrace University](https://university.dynatrace.com/)  \n[Dynatrace Youtube](https://www.youtube.com/channel/UCcYJ-5q_AfmjQ4XTjTS0o3g)"
    },
    {
      "name": "",
      "tileType": "SERVICES",
      "configured": true,
      "bounds": {
        "top": 76,
        "left": 1482,
        "width": 152,
        "height": 190
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": {
        "type": "SERVICE",
        "customName": "Nginx Services",
        "defaultName": "Nginx Services",
        "chartConfig": {
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "SERVICE": {
            "SERVICE_SOFTWARE_TECH": [
              "NGINX"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "",
      "tileType": "HOSTS",
      "configured": true,
      "bounds": {
        "top": 304,
        "left": 1330,
        "width": 304,
        "height": 190
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": {
        "type": "HOST",
        "customName": "AWS Hosts",
        "defaultName": "AWS Hosts",
        "chartConfig": {
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {
          "HOST": {
            "HOST_VIRTUALIZATION": [
              "1"
            ]
          }
        }
      },
      "chartVisible": true
    },
    {
      "name": "",
      "tileType": "DATABASES_OVERVIEW",
      "configured": true,
      "bounds": {
        "top": 532,
        "left": 1330,
        "width": 304,
        "height": 190
      },
      "tileFilter": {
        "managementZone": null
      },
      "filterConfig": {
        "type": "DATABASE",
        "customName": "Databases",
        "defaultName": "Databases",
        "chartConfig": {
          "type": "TIMESERIES",
          "series": [],
          "resultMetadata": {}
        },
        "filtersPerEntityType": {}
      },
      "chartVisible": true
    }
  ]
}
```

5. Select **Execute**, to create your browser test. 

The server response should be response code **201** with a response body like the following:

```json
{
  "id": "8f721746-8e2b-40fe-bd3b-61c1657d59df",
  "name": "Executive Overview Dashboard"
}
```

Navigate back to the Dynatrace dashboards. The dashboard should look something like this:

![Dashboard](/img/dashboard-api-dashboard.PNG)

:arrow_up_small: [Back to overview](/README.md)