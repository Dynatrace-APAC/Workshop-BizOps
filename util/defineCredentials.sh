#!/bin/bash


YLW='\033[1;33m'
NC='\033[0m'

CREDS=./creds.json
rm $CREDS 2> /dev/null

echo -e "${YLW}Please enter the credentials as requested below: ${NC}"
read -p "Dynatrace Tenant ID (ex. https://<TENANT_ID>.live.dynatrace.com or https://<TENANT_ID>.dynatrace-managed.com): " DTTEN
read -p "Dynatrace Environment ID (Dynatrace Managed Only - https://<TENANT_ID>.dynatrace-managed.com/e/<ENVIRONMENT_ID>): " DTENV
read -p "Dynatrace API Token: " DTAPI
read -p "Dynatrace PaaS Token: " DTPAAS

echo ""


echo ""
echo -e "${YLW}Please confirm all are correct: ${NC}"
echo "Dynatrace Tenant ID: $DTTEN"
echo "Dynatrace Environment ID: $DTENV"
echo "Dynatrace API Token: $DTAPI"
echo "Dynatrace PaaS Token: $DTPAAS"

read -p "Is this all correct? (y/n) : " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm $CREDS 2> /dev/null
    cat ./creds.sav | sed 's~DYNATRACE_TENANT_ID~'"$DTTEN"'~' | \
      sed 's~DYNATRACE_ENVIRONMENT_ID~'"$DTENV"'~' | \
      sed 's~DYNATRACE_API_TOKEN~'"$DTAPI"'~' | \
      sed 's~DYNATRACE_PAAS_TOKEN~'"$DTPAAS"'~' >> $CREDS
	
	export API_TOKEN=$(cat creds.json | jq -r '.dynatraceApiToken')
	export PAAS_TOKEN=$(cat creds.json | jq -r '.dynatracePaaSToken')
	export TENANTID=$(cat creds.json | jq -r '.dynatraceTenantID')
	export ENVIRONMENTID=$(cat creds.json | jq -r '.dynatraceEnvironmentID')
fi

cat $CREDS
echo ""
echo "The credentials file can be found here:" $CREDS
echo ""