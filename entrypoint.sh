#!/bin/sh -l

argocd --grpc-web --server "${ARGOCD_SERVER}" --auth-token "${ARGOCD_TOKEN}" "$@"
