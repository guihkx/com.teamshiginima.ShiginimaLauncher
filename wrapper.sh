#!/usr/bin/env bash

exec java -jar /app/share/com.teamshiginima.ShiginimaLauncher/launcher.jar $@ --workdir "$XDG_DATA_HOME/minecraft"
