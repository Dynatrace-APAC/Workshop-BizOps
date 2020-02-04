#!/bin/bash


export API_TOKEN=$(cat creds.json | jq -r '.dynatraceApiToken')
export PAAS_TOKEN=$(cat creds.json | jq -r '.dynatracePaaSToken')
export TENANTID=$(cat creds.json | jq -r '.dynatraceTenantID')
export ENVIRONMENTID=$(cat creds.json | jq -r '.dynatraceEnvironmentID')

echo "Deploying Dynatrace Oneagent using the following credentials: "
echo "API_TOKEN = $API_TOKEN"
echo "PAAS_TOKEN = $PAAS_TOKEN"
echo "TENANTID = $TENANTID"
echo "ENVIRONMENTID = $ENVIRONMENTID"

echo ""
read -p "Is this all correct? (y/n) : " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "Download Dynatrace OneAgent from Cluster..."
else
    exit 1
fi
