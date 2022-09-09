# Dotfiles

## GNU Stow
I use stow for managing symlinks from config paths to actual dotfiles.

Stow terminology in case of specific use case for managing dotfiles:
* stow directory - directory contains separate packages in private subdirectories.
  In our case is root of this project `<project>`.
* package - related collection of files. This is program you want to manage with dotfiles, e.g.
  "bash", "vim", etc. So it is also dir in this project, like `<project>/bash` or `<project>/vim`.
* target directory - root of tree where dotfiles should be installed. In our case
  is `${HOME}`.
* installation image - files that should be installed to target dir,
  these are actual config files and paths to them relative to target dir.

```bash
# clone this project to ~/.dotfiles
cd ~/.dotfiles
# use -n flag to not perform modifications, just show them
stow -d "${HOME}/.dotfiles" -t "$HOME" -vv alacritty/
```

So this command basically does this:
```
<stow dir> / <package> / <installation image>
linked by
<$HOME> / <installation image>
```
In case of Alacritty:
```
<$HOME/.dotfiles> / <alacritty> / <.config/alacritty/alacritty.yml>
linked by
<$HOME> / <.config/alacritty/alacritty.yml>

Full symlink:
$HOME/.config/alacritty/alacritty.yml -> ../../.dotfiles/alacritty/.config/alacritty/alacritty.yml
```

## Current stack

1. Window Manager - [i3-gaps](https://github.com/Airblader/i3) v4.19.1
2. Status Bar - [polybar](https://github.com/polybar/polybar) v3.6.3
3. Screen Locker - [i3lock](https://github.com/i3/i3lock)
4. Terminal - [alacritty](https://github.com/alacritty/alacritty) v0.10.1
5. Application Launcher - [rofi](https://github.com/davatorium/rofi) v1.5.4
6. Screenshot Tool - [shutter](https://github.com/shutter-project/shutter)

## Fonts
For terminal I use [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font,
but patched by [Nerd Fonts](https://www.nerdfonts.com).  
For workspace bar icons (i3bar, py3status, polybar) I use free version of
[Font Awesome 6 for the desktop](https://fontawesome.com/download) and
for bar text I use non-patched version of JetBrains Mono.

How to install fonts:
1. Download zip
1. Copy `.ttf` files to `~/.local/share/fonts`
1. `fc-cache -fv` - rebuild the font cache
1. `fc-list` - show all installed fonts

You can try different fonts on [programmingfonts.org](https://www.programmingfonts.org/#jetbrainsmono).

## Chromium default flags
Edit `/etc/chromium-browser/default`:
```
CHROMIUM_FLAGS="--password-store=kwallet"
```

## PyCharm setup
There is some annoying
[behaviour](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360001411659-Lose-Focus-after-Switching-Workspace-in-i3wm)
when switching workspaces in i3wm.

Solution: As noted in
[documentation](https://www.jetbrains.com/help/pycharm/file-idea-properties.html)
you can create custom properties: on the Help menu, click Edit Custom Properties;
or directly create file at this path:
```
~/.PyCharm<version>/config/idea.properties
```
And add this text:
```
suppress.focus.stealing=false
```

## Background image for i3lock
I use [fallout-svg](https://github.com/artslob/fallout-svg) for my lock screen.
Svg can be resized to any screen resolution.

```bash
i3lock -fe -i ~/.lock-background.png
```

## Default file manager
```bash
xdg-mime default org.kde.dolphin.desktop inode/directory
```

## Useful links
1. [Configuration of Qt5 apps under environments other than KDE Plasma](https://wiki.archlinux.org/index.php/Qt#Configuration_of_Qt5_apps_under_environments_other_than_KDE_Plasma)  
    TLDR: How to setup icons in dolphin:
    ```
    sudo apt install qt5ct
    export QT_QPA_PLATFORMTHEME="qt5ct"
    qt5ct  # choose required theme and icon theme (I use Breeze for both)
    ```
    Then add `export QT_QPA_PLATFORMTHEME="qt5ct"` to `.bashrc`.
