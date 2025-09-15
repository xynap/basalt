#!/bin/bash
set -ouex pipefail

# Install DotNet
dnf5 -y install dotnet-sdk-9.0

# Install Ghostty
dnf5 -y install --enable-repo=terra ghostty

# Install VS Code
dnf5 config-manager addrepo --id=vscode --set=baseurl=https://packages.microsoft.com/yumrepos/vscode --set=enabled=0
dnf5 -y install --enable-repo=vscode --nogpgcheck code

# Install Godot
GODOT_VERSION="4.5"
pushd "$(mktemp -d)"
mkdir -p /usr/share/godot
curl -LO https://github.com/godotengine/godot/releases/download/$GODOT_VERSION-stable/Godot_v$GODOT_VERSION-stable_mono_linux_x86_64.zip
unzip Godot_v$GODOT_VERSION-stable_mono_linux_x86_64.zip
mv Godot_v$GODOT_VERSION-stable_mono_linux_x86_64/GodotSharp /usr/share/godot/GodotSharp
mv Godot_v$GODOT_VERSION-stable_mono_linux_x86_64/Godot_v$GODOT_VERSION-stable_mono_linux.x86_64 /usr/share/godot/godot
curl -LO https://github.com/godotengine/godot/raw/refs/heads/master/icon.svg
mv icon.svg /usr/share/godot/icon.svg
popd

# Copy system files
cp -af /ctx/system_files/. /

# Clean up
dnf5 clean all
rm -rf /tmp/* /var/lib/dnf
