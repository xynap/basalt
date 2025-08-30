# vim: set ft=make :

# Install Godot Mono | https://godotengine.org/download/linux/
install-godot-mono:
    #!/usr/bin/bash
    pushd "$(mktemp -d)"
    GODOT_VERSION="4.4.1"
    echo "Installing Godot Mono ${GODOT_VERSION}"
    curl -LO https://github.com/godotengine/godot/releases/download/$GODOT_VERSION-stable/Godot_v$GODOT_VERSION-stable_mono_linux_x86_64.zip
    unzip Godot_v$GODOT_VERSION-stable_mono_linux_x86_64.zip
    mkdir -p $HOME/.local/share/Godot/
    mv Godot_v$GODOT_VERSION-stable_mono_linux_x86_64/Godot_v$GODOT_VERSION-stable_mono_linux.x86_64 $HOME/.local/share/Godot/Godot_mono
    mv Godot_v$GODOT_VERSION-stable_mono_linux_x86_64/GodotSharp $HOME/.local/share/Godot/GodotSharp
    echo "Launching Godot Mono"
    $HOME/.local/share/Godot/Godot_mono &
