#!/bin/bash


export API_TOKEN=$(cat ../1-Credentials/creds.json | jq -r '.dynatraceApiToken')
export PAAS_TOKEN=$(cat ../1-Credentials/creds.json | jq -r '.dynatracePaaSToken')
export TENANTID=$(cat ../1-Credentials/creds.json | jq -r '.dynatraceTenantID')
export ENVIRONMENTID=$(cat ../1-Credentials/creds.json | jq -r '.dynatraceEnvironmentID')

echo "Deploying Dynatrace Oneagent using the following credentials: "
echo "API_TOKEN = $API_TOKEN"
echo "PAAS_TOKEN = $PAAS_TOKEN"
echo "TENANTID = $TENANTID"
echo "ENVIRONMENTID = $ENVIRONMENTID"

echo ""
read -p "Is this all correct? (y/n) : " -n 1 -r
echo ""

echo "Download Dynatrace OneAgent from Cluster..."