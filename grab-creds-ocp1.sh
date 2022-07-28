#!/bin/bash

project_name=$1

echo "http://"$(oc get service frontend-external -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

oc get route skupper -n $project_name

oc get secret skupper-console-users -o json -n $project_name | jq -r .data.admin | base64 -d

echo ""
