#!/bin/bash


export TENANTID=$TENANTID

echo "Deploying Dynatrace Oneagent using the following credentials: "
echo "API_TOKEN = $API_TOKEN"
echo "PAAS_TOKEN = $PAAS_TOKEN"
echo "TENANTID = $TENANTID"
echo "ENVIRONMENTID (Dynatrace Managed) = $ENVIRONMENTID"

pwd

echo ""
#read -p "Is this all correct? (y/n) : " -n 1 -r
echo ""


deployOneAgent()
{

	case $ENVIRONMENTID in
			'')
			echo "SaaS Deplyoment..."
			#sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$TENANTID'.live.dynatrace.com\/api/' cr.yaml
			wget  -O Dynatrace-OneAgent-Linux.sh --header="Authorization: Api-Token "$PAAS_TOKEN "https://"$TENANTID".live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?arch=x86&flavor=default"
			;;
			*)
			echo "Managed Deployment..."
			#sed -i 's/apiUrl: https:\/\/ENVIRONMENTID.live.dynatrace.com\/api/apiUrl: https:\/\/'$TENANTID'.dynatrace-managed.com\/e\/'$ENVIRONMENTID'\/api/' cr.yaml
			wget  -O Dynatrace-OneAgent-Linux.sh --header="Authorization: Api-Token "$PAAS_TOKEN "https://"$TENANTID".live.dynatrace.com/e/"$ENVIRONMENTID"/api/v1/deployment/installer/agent/unix/default/latest?arch=x86&flavor=default"
			;;
	esac
	
	echo "Installing Dynatrace OneAgent..."
	sudo /bin/sh Dynatrace-OneAgent-Linux.sh APP_LOG_CONTENT_ACCESS=1 INFRA_ONLY=0
	echo "Dynatrace OneAgent Installed."
	
	echo "Restarting easyTravel..."
	
	/home/ubuntu/./restart_easyTravel.sh
	
	echo "easyTravel restarted."
	
}

deployApplicationConfig()
{
	cd Workshop-BizOps/util
	
	export PUBLIC_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
	export PRIVATE_HOSTNAME=$(hostname)
	
	## Create Application
	echo "Creating application in Dynatrace..."
		
	export APPLICATION_ID=$(curl -sX POST "https://"$TENANTID".live.dynatrace.com/api/config/v1/applications/web" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$API_TOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/application.json | jq -r '.id')

	echo "Application ID: $APPLICATION_ID"
	
	echo "Application created."
	
	#APPLICATION-6D7CE8352E9AD9BC
	##curl http://169.254.169.254/latest/meta-data/public-hostname
	##ec2-xxx-xxx-xxx-xxx.ap-southeast-2.compute.amazonaws.com

	## Create Detection Rule
	echo "Creating application detection rule in Dynatrace..."
	

	cp json/detectionrule.json json/privatedetectionrule.json 
	cp json/detectionrule.json json/publicdetectionrule.json 

	sed -i 's/"applicationIdentifier": "APPLICATION_ID",/"applicationIdentifier": "'$APPLICATION_ID'",/' json/privatedetectionrule.json	
	sed -i 's/"applicationIdentifier": "APPLICATION_ID",/"applicationIdentifier": "'$APPLICATION_ID'",/' json/publicdetectionrule.json
	
	sed -i 's/"pattern": "PATTERN",/"pattern": "'$PRIVATE_HOSTNAME'",/' json/privatedetectionrule.json
	sed -i 's/"pattern": "PATTERN",/"pattern": "'$PUBLIC_HOSTNAME'",/' json/publicdetectionrule.json
	

	curl -sX POST "https://"$TENANTID".live.dynatrace.com/api/config/v1/applicationDetectionRules/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$API_TOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/privatedetectionrule.json
	
	curl -sX POST "https://"$TENANTID".live.dynatrace.com/api/config/v1/applicationDetectionRules/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$API_TOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/publicdetectionrule.json
	
	echo "Detection rules created."
	
	
	## Synthetic Monitor...
	echo "Creating sythetic monitor in Dynatrace..."
	
	sed -i 's/PUBLIC_HOSTNAME/'$PUBLIC_HOSTNAME'/' json/syntheticmonitor.json
	
	curl -sX POST "https://"$TENANTID".live.dynatrace.com/api/v1/synthetic/monitors/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$API_TOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/syntheticmonitor.json

	echo "Sythetic monitor created."
	
	## Create Dashboards?
}


echo "Download Dynatrace OneAgent from Cluster..."
deployOneAgent
deployApplicationConfig
