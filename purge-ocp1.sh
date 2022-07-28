#!/bin/bash
project_name=$1
skupper unexpose deployment productcatalogservice --address productcatalogservice
skupper unexpose deployment recommendationservice --address recommendationservice
oc delete -f msa_deployment-ocp1.yaml -n $project_name
skupper delete
oc delete project $project_name