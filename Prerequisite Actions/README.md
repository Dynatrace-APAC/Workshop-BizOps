# Prerequisites Actions for the Dynatrace BizOps Workshop 

## Create easyTravel Application

The following conatins the instructions to create the easyTravel application which will be used during this workshop.

Access your AWS console and navigate to the **EC2** service.

Select **Instances** > **Launch Instance**

Search the **Community AMIs** for "Dynatrace Bizops Workshop"

![Deploy](/assets/pre-publicami.png)

Click **Select** to start in deployment wizard.

Use the defaults to create the instance except:

* Instance Type: **t2.medium**
	
* Security group: Ensure the security group includes **SSH** and **HTTP** ports


![Deploy](/assets/pre-securitygroup.png)

Create a new key pair or use an existing one. **Please note: you will need the PEM key to access the instance via SSH.**

Launch the instance...

Wait for the Status Checks to read 2/2 checks 


## Deploy Oneagent and Application Configuration to Dynatrace 

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


---
:arrow_up_small: [Back to overview](/README.md)