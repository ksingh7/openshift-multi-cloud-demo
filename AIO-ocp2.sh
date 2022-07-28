#!/bin/bash

project_name=$1

oc new-project $project_name

skupper init --site-name ocp2
skupper token create images/ocp2-token.yaml
sleep 10
skupper link create images/ocp1-token.yaml

sleep 10
oc apply -f msa_deployment-ocp2.yaml -n $project_name

sleep 10
sh expose-deployments-ocp2.sh

skupper link status