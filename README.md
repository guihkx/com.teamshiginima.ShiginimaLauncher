# Shiginima Launcher (NOT OFFICIAL)

## About

*Shiginima Launcher: Sponge Edition* is an alternative Minecraft Launcher. The files in this git repository allows us to create a [Flatpak build](https://flatpak.org/) of it.

## FAQ

**Q: Why a Flatpak build of Shiginima Launcher?**

A: Flatpak allows us to provide a better desktop integration for Java programs, while also improving security by running the launcher in a sandboxed environment, e.g. preventing mods from accessing sensitive files and folders on your computer.

**Q: Are you a member of Team Shiginima?**

A: No, not at all. I also don't know anyone who's part of the team. I simply like the launcher for its simplicity and wanted to make a Flatpak build of it.

**Q: Do you have the source-code of Shiginima Launcher?**

A: Nope.

**Q: Will this work on Windows?**

A: No, sorry. This is only intended for Linux distributions.

**Q: Minecraft doesn't seem to open anymore, what to do?**

A: Try running `flatpak update`, then re-open the launcher. If that doesn't work, feel free to [open an issue](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/issues).

## Installing

1. [Set up Flatpak](https://flatpak.org/setup/).
2. Download the [latest release](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/releases) of the launcher.
3. Open a terminal window and run:

    ```bash
    flatpak install Shiginima_Launcher_v4.400-x86_64.flatpak
    ```

4. You're good to go! You can find the Shiginima Launcher under `Applications` > `Games`.

**IMPORTANT**: Your game files, including worlds, mods, shaders, etc. will be in `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/` and **not** in `~/.minecraft/`!

## Uninstalling

In a terminal window, run:

```bash
flatpak uninstall com.teamshiginima.ShiginimaLauncher
```

Additionally, if you want to delete Minecraft itself, including worlds, mods, shaders, etc. you'll have to delete this folder as well: `~/.var/app/com.teamshiginima.ShiginimaLauncher/`.

## Building & bundling (advanced)

1. [Set up Flatpak](https://flatpak.org/setup/).
2. Install `flatpak-builder`.
3. Clone this repository.
4. Download the ZIP file of the launcher from the [official website](https://web.archive.org/web/20201101050543/https://teamshiginima.com/update/).
5. Place the zip file (`ShiginimaSE_v4400.zip`) inside the cloned repository.
6. Then build:

    ```bash
    flatpak-builder --user --arch=x86_64 --force-clean --install-deps-from=flathub --repo=repo/ --sandbox build com.teamshiginima.ShiginimaLauncher.yaml
    ```

7. After it succeeds building, you can then create a [single-file bundle](https://docs.flatpak.org/en/latest/single-file-bundles.html) (where `Shiginima_Launcher.flatpak` is the output file):

    ```bash
    flatpak build-bundle --arch=x86_64 repo/ Shiginima_Launcher.flatpak com.teamshiginima.ShiginimaLauncher stable
    ```

## About fix_jvm_args.patch

This patch file simply removes two incompatible Java launch options: `-XX:+CMSIncrementalMode` and `-XX:+UseConcMarkSweepGC`.
Although this patch file is not mandatory to make the launcher itself work, it *is* required to make Minecraft run out-of-the-box, as these two options are incompatible with the Java Runtime version we're using (16).
