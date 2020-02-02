# Dotfiles

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
To crate background image from svg run this:
```bash
sudo apt install imagemagick
convert input.svg -resize 1366x768 -gravity center -extent 1366x768 out.png
# to lock screen
i3lock -fe -i out.png
```
Change `1366x768` to your desired screen resolution.

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
