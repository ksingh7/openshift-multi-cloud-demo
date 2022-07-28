#!/bin/bash
project_name=$1
skupper unexpose deployment emailservice --address emailservice
skupper unexpose deployment paymentservice --address paymentservice
skupper unexpose deployment shippingservice --address shippingservice
oc delete -f msa_deployment-ocp3.yaml -n $project_name
skupper link delete link1
skupper link delete link2
skupper delete
oc delete project $project_name