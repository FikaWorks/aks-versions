#!/usr/bin/env bash
set -euo pipefail

VERSIONS=$(az aks get-versions --location westeurope | jq -r '.orchestrators[] | select(.isPreview == null) | .orchestratorVersion' | sort)

for version in ${VERSIONS}; do
	TAG="aks-${version}"
	if ! git rev-parse "${TAG}" &>/dev/null; then
		git tag "${TAG}" || true # If already tagged, don't bother retagging.
		echo "'${TAG}' tracking"
	else
		echo "'${TAG}' already tracked"
	fi
done

git push --tags
