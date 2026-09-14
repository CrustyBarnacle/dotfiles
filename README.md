# Dotfiles Management (finally!)
Managing my dotfiles with [`yadm`](https://yadm.io/) :-D

A mishmash of my Arch Linux config files for the system itself (wayland stuff like sway, waybar, ...),
shell config (.zshrc, .bashrc, ghostty, ...) as well as for utilities/apps like mpd + rmpc.

It's primarily for my own use/backup, but I hope to update this README and whatnot for others' use and learning.

### Usage
This repo *is* `$HOME` — yadm tracks a bare git repo at `~/.local/share/yadm/repo.git` with
`$HOME` as its working tree, so files stay in place with no symlinks.

To pull these onto a new machine:
```
yadm clone <repo-url>
yadm config --add local.class <workstation|laptop|server>
yadm bootstrap
```
These configs are tailored to my own hardware/preferences — treat them as reference, not a
drop-in install.

### Bootstrap
`yadm` includes the ability to run a bootstrap file (an executable) to take care of initial
system config/setup tasks for you. Mine restores packages, installs a pacman hook for
package-list tracking, sets up system services (firewall, MPD, rfkill workaround), builds
a couple of Podman images, and — on machines classed `laptop` — configures a hibernation
safety net (swapfile, resume kernel params, UPower/logind drop-ins).
 - My current [bootstrap](.config/yadm/bootstrap).

### References
 - [`yadm` man page (EN) - Arch](https://man.archlinux.org/man/yadm.1.en)
 - [yadm website](https://yadm.io)
 - [github yadm repo](https://github.com/yadm-dev/yadm)
