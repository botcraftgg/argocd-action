## About

A GitHub action to run the Argo CD cli.

## Usage

You must set server, token, and args to run a command successfully.

```yaml
name: ci

on:
  push:
    branches: main

jobs:
   build:
      name: Build
      runs-on: ubuntu-latest
      if: github.ref == 'refs/heads/main'
      outputs:
        image-tag: ${{ steps.docker_build.outputs.digest }}
      steps:
        - name: Build docker image
          # ...

  deploy:
      name: Deploy
      runs-on: ubuntu-latest
      needs:
        - build
      steps:
        - name: Set Argo CD parameter
          uses: botcraftgg/argocd-action@main
          with:
            server: argocd.cloud.botcraft.gg
            token: ${{ secrets.ARGOCD_TOKEN }}
            args: app set my-app --kustomize-image my-image:${{ needs.build.outputs.image-tag }}
```
