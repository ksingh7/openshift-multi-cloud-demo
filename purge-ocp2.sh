#!/bin/bash


skupper unexpose deployment checkoutservice --address checkoutservice
skupper unexpose deployment cartservice --address cartservice
skupper unexpose deployment currencyservice --address currencyservice
skupper unexpose deployment redis-cart --address redis-cart
skupper unexpose deployment adservice --address adservice
oc delete -f msa_deployment-ocp2.yaml
skupper link delete link1
skupper delete
oc delete project multi-cloud