#!/bin/bash
set -ouex pipefail

# Install DotNet
dnf5 -y install dotnet-sdk-9.0

# Install Ghostty
dnf5 -y install --enable-repo=terra ghostty

# Install VS Code
dnf5 config-manager addrepo --id=vscode --set=baseurl=https://packages.microsoft.com/yumrepos/vscode --set=enabled=0
dnf5 -y install --enable-repo=vscode --nogpgcheck code

# Copy system files
cp -af /ctx/system_files/. /
echo "import \"/usr/share/ublue-os/just/95-basalt.just\"" >> /usr/share/ublue-os/justfile

# Clean up
dnf5 clean all
rm -rf /var/lib/dnf
