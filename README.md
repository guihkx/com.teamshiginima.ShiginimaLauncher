# Shiginima Launcher

## About

Shiginima Launcher is an alternative Minecraft Launcher. The files in this repository allows us to create a [Flatpak build](https://flatpak.org/faq/) of said launcher.

## Why?

Because I'm always worried to run *\~unknown programs\~* on my computer. But thanks to Flatpak, I don't have to. The launcher and the game will both run in a sandboxed environment.

## Installing

1. First, you have to [set up Flatpak](https://flatpak.org/setup/).
2. After that, Download the [latest release](/releases) of the launcher.
3. To install it, open a terminal window and run:

    ```bash
    flatpak install Shiginima_Launcher_v4.400-x86_64.flatpak
    ```

4. And you're good to go! You can find the Shiginima Launcher under `Applications` > `Games`.

**IMPORTANT**: Your game files (worlds, mods, shaders, etc.) will be on `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/` and **not** on `~/.minecraft/`!

## Uninstalling

In a terminal window, run:

```bash
flatpak uninstall com.teamshiginima.ShiginimaLauncher
```

Keep in mind that doing this **will not** remove any of your worlds/mods/shaders/whatever. They will be forever available on `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/`, unless you manually delete that folder.

## Building & bundling (advanced)

This section aimed at advanced users, so proceed at your own discretion.

1. Install the `flatpak-builder` package provided by your distro.
2. Clone this repo.
3. Download the launcher (as a zip file) from the [official website](https://teamshiginima.com/update/).
4. Place the zip file (e.g. `ShiginimaSE_v4400.zip`) inside the cloned repository.
5. Then, build:

    ```bash
    flatpak-builder --user --force-clean --install-deps-from=flathub --repo=repo/ --sandbox build com.teamshiginima.ShiginimaLauncher.yml
    ```

6. After it succeeded building, you can then create a [single-file bundle](https://docs.flatpak.org/en/latest/single-file-bundles.html) (where `My_Own_Launcher.flatpak` is the output file):

    ```bash
    flatpak build-bundle repo/ My_Own_Launcher.flatpak com.teamshiginima.ShiginimaLauncher master
    ```

## About fix_jvm_args.patch

This patch file is not *really* necessary to build and run the launcher. However, building without it will require you to manually remove `-XX:+CMSIncrementalMode` from your game's launch options, because that option is *not* compatible with the JRE v11, which is the Java runtime we are using to run the launcher.

That being said, keep in mind that all binaries in the [Releases page](/releases) are built with that patch enabled.
