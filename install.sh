#/bin/bash

sudo rpm-ostree override remove firefox firefox-langpacks
sudo rpm-ostree upgrade
sudo rpm-ostree install vim opendoas zsh zsh-autosuggestions zsh-syntax-highlighting gh rust aspnetcore-runtime-9.0 dotnet-sdk-9.0 java-25-openjdk k9s helm kustomize docker-buildx docker-compose docker-cli golang alacritty fuzzel gparted fastfetch tmate xwayland-satellite keepassxc opentofu htop p7zip unar cargo source-foundry-hack-fonts syncthing ghex
sudo usermod -aG docker $USER

echo 'zsh' >> ~/.bashrc
cp .zshrc ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget https://downloads.cursor.com/production/823f58d4f60b795a6aefb9955933f3a2f0331d7b/linux/x64/Cursor-1.5.5-x86_64.AppImage -O ~/.local/bin/cursor.AppImage
chmod +x ~/.local/bin/cursor.AppImage
cp cursor-ai.desktop ~/.local/share/applications/cursor-ai.desktop
cp cursor.png /home/user/Pictures/cursor.png

mkdir -p ~/.config/sway
cp config ~/.config/sway/config

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
sudo chmod +x /usr/local/bin/kubectl

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub io.gitlab.librewolf-community
flatpak install flathub io.github.ungoogled_software.ungoogled_chromium
flatpak install flathub org.signal.Signal

#wait for press key to generate ssh key
read -n 1 -s -r -p "Press any key to generate ssh key"
ssh-keygen -t ed25519-sk

#wait for press key to reboot
read -n 1 -s -r -p "Press any key to reboot"
systemctl reboot
