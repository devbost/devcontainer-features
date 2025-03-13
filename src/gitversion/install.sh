#!/bin/bash
set -e

if [ "${VERSION}" == "latest" ]; then
	versionStr=$(curl -sSL "https://azuresearch-usnc.nuget.org/query?q=packageid:GitVersion.Tool&prerelease=false" | jq -r '.data[0].version')
else
	versionStr=${VERSION}
fi

# Install the tool
echo "Installing GitVersion ${versionStr}..."
dotnet tool install --global GitVersion.Tool --version ${versionStr} --verbosity diag

# Create a symbolic link to the tool
ln -s /root/.dotnet/tools/dotnet-gitversion /usr/bin/gitversion
