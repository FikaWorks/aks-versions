#!/usr/bin/env bash
set -euo pipefail

VERSIONS=$(az aks get-versions --location westeurope | jq -r '.orchestrators[] | select(.isPreview == null) | .orchestratorVersion' | sort)

for version in ${VERSIONS}; do
	echo "aks-${version}"
	git tag "aks-${version}" || true # If already tagged, don't bother retagging.
done

git push --tags
