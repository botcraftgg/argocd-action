#!/bin/sh -l

argocd --grpc-web --server "${ARGOCD_SERVER}" --token "${ARGOCD_TOKEN}" "$@"
