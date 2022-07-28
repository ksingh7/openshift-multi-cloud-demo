#!/bin/bash

project_name=$1

oc new-project $project_name

skupper init --site-name ocp1
skupper token create images/ocp1-token.yaml --uses 2

oc apply -f msa_deployment-ocp1.yaml -n $project_name


sh expose-deployments-ocp1.sh


