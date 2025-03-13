#!/bin/bash
set -e

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "${VERSION}" == "latest" ]; then
	versionStr=$(curl -sSL "https://azuresearch-usnc.nuget.org/query?q=packageid:GitVersion.Tool&prerelease=false" | jq -r '.data[0].version')
else
	versionStr=${VERSION}
fi

echo "Installing GitVersion ${versionStr}..."

dotnet tool install --global GitVersion.Tool --version ${versionStr} --verbosity diag

# Verify installation
echo "Verifying GitVersion installation..."
if ! dotnet-gitversion --version >/dev/null 2>&1; then
    echo "ERROR: GitVersion installation verification failed. The 'dotnet-gitversion' command is not working."
    exit 1
fi

# Set up shell alias
echo "Setting up shell alias for gitversion..."

# Determine shell configuration file
if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -f "$HOME/.bash_profile" ]; then
    SHELL_RC="$HOME/.bash_profile"
else
    echo "Could not find shell configuration file. Please add the following line to your shell configuration:"
    echo "alias gitversion='dotnet-gitversion'"
    exit 0
fi

# Check if alias already exists
if ! grep -q "alias gitversion='dotnet-gitversion'" "$SHELL_RC"; then
    echo "# GitVersion alias" >> "$SHELL_RC"
    echo "alias gitversion='dotnet-gitversion'" >> "$SHELL_RC"
    echo "Alias 'gitversion' has been added to $SHELL_RC"
fi

