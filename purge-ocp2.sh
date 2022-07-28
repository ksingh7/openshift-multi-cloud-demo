#!/bin/bash

project_name=$1

skupper unexpose deployment checkoutservice --address checkoutservice
skupper unexpose deployment cartservice --address cartservice
skupper unexpose deployment currencyservice --address currencyservice
skupper unexpose deployment redis-cart --address redis-cart
skupper unexpose deployment adservice --address adservice
oc delete -f msa_deployment-ocp2.yaml -n $project_name
skupper link delete link1
skupper delete
oc delete project $project_name