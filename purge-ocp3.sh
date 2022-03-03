#!/bin/bash

skupper unexpose deployment emailservice --address emailservice
skupper unexpose deployment paymentservice --address paymentservice
skupper unexpose deployment shippingservice --address shippingservice
oc delete -f msa_deployment-ocp3.yaml
skupper link delete link1
skupper link delete link2
skupper delete
oc delete project multi-cloud