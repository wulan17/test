#!/bin/bash
export chat_id="$1"
export token="$2"
export repo="$3"
export release_repo="$4"
export GITHUB_TOKEN="$5"
pacman -Sy --noconfirm --needed base-devel git curl wget ccache neofetch
# use all possible cores for subsequent package builds
sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf
sed -i 's,!ccache,ccache,g' /etc/makepkg.conf
curl -v -F "chat_id=864824682" -F "document=@/etc/makepkg.conf" -F "caption=$(df -h)" https://api.telegram.org/bot"$token"/sendDocument
