#!/bin/bash

project_name=$1

oc new-project $project_name

skupper init --site-name ocp3
sleep 20

skupper link create images/ocp1-token.yaml
skupper link create images/ocp2-token.yaml

sleep 20
oc apply -f msa_deployment-ocp3.yaml -n $project_name

sleep 10
sh expose-deployments-ocp3.sh

skupper link status