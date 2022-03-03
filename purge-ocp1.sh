#!/bin/bash
skupper unexpose deployment productcatalogservice --address productcatalogservice
skupper unexpose deployment recommendationservice --address recommendationservice
oc delete -f msa_deployment-ocp1.yaml
skupper delete
oc delete project multi-cloud