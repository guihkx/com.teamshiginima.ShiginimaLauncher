# Shiginima Launcher

## About

Shiginima Launcher is an alternative Minecraft Launcher. The files in this repository allows us to create a [Flatpak build](https://flatpak.org/faq/) of said launcher.

## Why?

Because giving proprietary programs read/write access to all the folders in your computer is a very silly thing to do. ;)

## Installing

1. Have [Flatpak set up](https://flatpak.org/setup/) in your distro.
2. Download the [latest release](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/releases) of the launcher.
3. Open a terminal window and run:

    ```bash
    flatpak install Shiginima_Launcher_v4.400-x86_64.flatpak
    ```

4. You're good to go! You can find the Shiginima Launcher under `Applications` > `Games`.

**IMPORTANT**: Your game files (worlds, mods, shaders, etc.) will be in `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/` and **not** in `~/.minecraft/`!

## Uninstalling

In a terminal window, run:

```bash
flatpak uninstall com.teamshiginima.ShiginimaLauncher
```

Keep in mind that doing this **will not** remove any of your worlds/mods/shaders/whatever. They will be forever available in `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/`, unless you manually delete that folder.

## Building & bundling (advanced)

1. Install the `flatpak-builder` package provided by your distro.
2. Clone this repository.
3. Download the launcher (as a zip file) from the [official website](https://web.archive.org/web/20201101050543/https://teamshiginima.com/update/).
4. Place the zip file (e.g. `ShiginimaSE_v4400.zip`) inside the cloned repository.
5. Build it:

    ```bash
    flatpak-builder --user --force-clean --install-deps-from=flathub --repo=repo/ --sandbox build com.teamshiginima.ShiginimaLauncher.yml
    ```

6. After it succeeded building, you can then create a [single-file bundle](https://docs.flatpak.org/en/latest/single-file-bundles.html) (where `My_Own_Launcher.flatpak` is the output file):

    ```bash
    flatpak build-bundle repo/ My_Own_Launcher.flatpak com.teamshiginima.ShiginimaLauncher stable
    ```

## About fix_jvm_args.patch

This patch file is not *really* necessary to build and run the launcher. However, building without it will require you to manually remove `-XX:+CMSIncrementalMode` from your game's launch options, because that option is *not* compatible with the JRE v11, which is the Java runtime we are using to run the launcher.

That being said, you can also download the unpatched version in the [Releases page](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/releases).
