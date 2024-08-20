#! /bin/bash
mkdir -p ~/.local/share/plasma/plasmoids/org.kde.plasma.stocks
rsync -av --delete ./org.kde.plasma.stocks/ ~/.local/share/plasma/plasmoids/org.kde.plasma.stocks
