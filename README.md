# Dotfiles

## Useful links
1. [Configuration of Qt5 apps under environments other than KDE Plasma](https://wiki.archlinux.org/index.php/Qt#Configuration_of_Qt5_apps_under_environments_other_than_KDE_Plasma)  
    TLDR: How to setup icons in dolphin:
    ```
    sudo apt install qt5ct
    export QT_QPA_PLATFORMTHEME="qt5ct"
    qt5ct  # choose required theme (I use Breeze)
    ```
    Then add `export QT_QPA_PLATFORMTHEME="qt5ct"` to `.bashrc`.
