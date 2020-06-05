#!/bin/bash

#assume tenant and passtoken have already been set
#export TENANT=$TENANT
#export APITOKEN=$APITOKEN

echo "Deploying Dynatrace Sythetics using the following credentials: "
echo "APITOKEN = $APITOKEN"
echo "TENANT = $TENANT"

pwd


deploySyntheticConfig()
{
	
	export PUBLIC_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
	
	## Synthetic Monitor...
	echo "Creating sythetic monitor in Dynatrace..."
	
	sed -i 's/PUBLIC_HOSTNAME/'$PUBLIC_HOSTNAME'/' json/syntheticmonitor.json
	
	curl -sX POST $TENANT"/api/v1/synthetic/monitors/" -H "accept: application/json; charset=utf-8" -H "Authorization: Api-Token "$APITOKEN -H "Content-Type: application/json; charset=utf-8" -d @json/syntheticmonitor.json

	echo "Sythetic monitor created."
	
}


deploySyntheticConfig
