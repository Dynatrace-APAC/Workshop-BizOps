# Prerequisites Actions for the Dynatrace BizOps Workshop 

## Create the easyTravel Application

The following conatins the instructions to create the easyTravel application which will be used during this workshop.

You will need your **tenant id**, **API token** and **PaaS token**.

The API token requires the following permissions: 
- Access problem and event feed, metrics, and topology
- Read synthetic monitors, locations, and nodes
- Create and read synthetic monitors, locations, and nodes
- Read configuration
- Write configuration
- User Sessions

### AWS

Access your AWS console and navigate to the **EC2** service.

Select **Instances** > **Launch Instance**

Search the **Community AMIs** for "Dynatrace Bizops Workshop"

![Deploy](/img/pre-publicami.png)

Click **Select** to start in deployment wizard.

#### Choose an Instance Type

Use Instance Type: **t2.medium**

#### Configure Instance Details

Click the arrow next to **Advanced Details** (bottom of the page) and in the **User data** field enter the following:
```bash
#!/bin/bash
cd ~
git clone https://github.com/Dynatrace-APAC/Workshop-BizOps

cd Workshop-BizOps

git pull origin master

export API_TOKEN=<YOUR_API_TOKEN>
export PAAS_TOKEN=<YOUR_PaaS_TOKEN>
export TENANTID=<YOUR_TenantID_TOKEN>
export ENVIRONMENTID=

cd util
./deployDynatrace.sh


```
Replace the values with the values you collected from your Dynatrace environment.

![AWS Userdata](/img/aws_userdata.PNG)

#### Add Storage
Accept the defaults

#### Add Tags
Accept the defaults

#### Configure Security Group
Ensure the security group includes **SSH** and **HTTP** ports

![Deploy](/img/pre-securitygroup.png)

#### Review Instance Launch
Create a new key pair or use an existing one. **Please note: you may need the PEM key to access the instance via SSH.**

Launch the instance...

Wait for the Status Checks to read 2/2 checks 

It may take 5 - 10 mins for the server to launch.

Once complete, in Dynatrace you should see the easyTravel application.

---
:arrow_up_small: [Back to overview](/README.md)

# Troubleshooting

If the above instructions fail to deploy the one agent correcly or the application rules are not correct follow the following instructions:

## Deploy Oneagent and Application Configuration to Dynatrace 

SSH into the instance (using the your PEM Key)

Clone this repository to the server

```bash
$  git clone https://github.com/Dynatrace-APAC/Workshop-BizOps
Cloning into 'Workshop-BizOps'...
remote: Enumerating objects: 108, done.
remote: Counting objects: 100% (108/108), done.
remote: Compressing objects: 100% (85/85), done.
remote: Total 108 (delta 19), reused 99 (delta 10), pack-reused 0
Receiving objects: 100% (108/108), 5.78 MiB | 4.10 MiB/s, done.
Resolving deltas: 100% (19/19), done.

```
Change directory to the untils directory
```bash
$  cd Workshop-BizOps/util
```

Execute defineCredentials.sh and enter your:

Dynatrace Tenant ID
Dynatrace Environment ID (Leave Blank if using Dynatrace SaaS)
Dynatrace API Token
Dynatrace PaaS Token

Press "y" to confirm your credentials are correct, if you make a mistake simply run defineCredentials.sh again

```bash
$  ./defineCredentials.sh
Please enter the credentials as requested below:
Dynatrace Tenant ID (ex. https://<TENANT_ID>.live.dynatrace.com or https://<TENANT_ID>.dynatrace-managed.com): xxx
Dynatrace Environment ID (Dynatrace Managed Only - https://<TENANT_ID>.dynatrace-managed.com/e/<ENVIRONMENT_ID>):
Dynatrace API Token: xxxxxx
Dynatrace PaaS Token: xxxxxx


Please confirm all are correct:
Dynatrace Tenant ID: xxx
Dynatrace Environment ID:
Dynatrace API Token: xxxxxx
Dynatrace PaaS Token: xxxxxx
Is this all correct? (y/n) : y
{
    "dynatraceTenantID": "xxx",
    "dynatraceEnvironmentID": "",
    "dynatraceApiToken": "xxxxxx",
    "dynatracePaaSToken": "xxxxxx"
}
The credentials file can be found here: ./creds.json
```

Execute /manualDeployDynatrace.sh 
---
:arrow_up_small: [Back to overview](/README.md)