# Dotfiles

## Nerd Fonts
For coding I use [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font,
but patched by [Nerd Fonts](https://www.nerdfonts.com):
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
