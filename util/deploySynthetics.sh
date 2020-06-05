#!/bin/bash

#assume tenant and passtoken have already been set
export TENANT=$TENANT
export PAASTOKEN=$APITOKEN

echo "Deploying Dynatrace Sythetics using the following credentials: "
echo "APITOKEN = $APITOKEN"
echo "TENANT = $TENANT"

pwd


deployApplicationConfig()
{
	cd Workshop-BizOps/util
	
	export PUBLIC_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
	export PRIVATE_HOSTNAME=$(hostname)
	
	## Create Application
	echo "Creating application in Dynatrace..."
		
	export APPLICATION_ID=$(curl -sX POST "https://"$TENANT".live.dynatrace.com/api/config/v1/applications/web" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$APITOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/application.json | jq -r '.id')

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
	

	curl -sX POST "https://"$TENANT".live.dynatrace.com/api/config/v1/applicationDetectionRules/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$APITOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/privatedetectionrule.json
	
	curl -sX POST "https://"$TENANT".live.dynatrace.com/api/config/v1/applicationDetectionRules/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$APITOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/publicdetectionrule.json
	
	echo "Detection rules created."
	
	
	## Synthetic Monitor...
	echo "Creating sythetic monitor in Dynatrace..."
	
	sed -i 's/PUBLIC_HOSTNAME/'$PUBLIC_HOSTNAME'/' json/syntheticmonitor.json
	
	curl -sX POST "https://"$TENANT".live.dynatrace.com/api/v1/synthetic/monitors/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$APITOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/syntheticmonitor.json

	echo "Sythetic monitor created."
	
}


deployApplicationConfig
