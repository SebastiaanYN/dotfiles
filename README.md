# dotfiles

Ubuntu dotfiles

## Installation

```sh
git clone https://github.com/SebastiaanYN/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Additionally run `sudo visudo` and add `%sudo ALL=NOPASSWD: /usr/sbin/service cron start` to allow cron to start without root

After the installation the dotfiles should be symlinked to the home directory, so keep the repository on your system
