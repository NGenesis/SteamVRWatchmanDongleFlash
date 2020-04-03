# SteamVR Watchman Dongle Flash
Converts any plugged in Steam Controller dongles into SteamVR Watchman Dongles that you can pair with HTC Vive controllers/trackers and Valve Index controllers.

Usage:
Close SteamVR and Steam.
Plug in any dongles you want to flash.
Run the batch file as Administrator.

If everything works, you should get an output similar to the following:
```Steam installation found at "X:\path\to\steam"
SteamVR Watchman Dongle Updater utility found at "X:\path\to\steam\steamapps\common\SteamVR\tools\lighthouse\bin\win32\lighthouse_watchman_update.exe"
Running SteamVR Watchman Dongle Updater utility...
Version:  lighthouse_watchman_update.exe (buildbot_vortex-windows_steamvr_rel_win32@vortex-windows)  05771536
Attempting to update Watchman Dongles to version 1461100729...
Found a dongle already in the bootloader...
Looking for 1 bootloaders
Attempting to convert Steam Controller dongle into Watchman Dongle...
Valve Nordic bootloader version 19.0
P2vvX........vvvvvvvvP3X........vvvvvvvvP4X........vvvvvvvvP5X........vvvvvvvvP6X........vvvvvvvvP7X........vvvvvvvvP8X........vvvvvvvvP9X........vvvvvvvvP10X........vvvvvvvvP11X........vvvvvvvvP12X........vvvvvvvvP13X........vvvvvvvvP14X........vvvvvvvvP15X........vvvvvvvvP16X........vvvvvvvvP17X........vvvvvvvvP18X........vvvvvvvvP19X........vvvvvvvvP20X........vvvvvvvvP21X........vvvvvvvvP22X........vvvvvvvvP23X........vvvvvvvvP24X........vvvvvvvvP25X........vvvvvvvvP26X........vvvvvvvvP27X........vvvvvvvvP28X........vvvvvvvvP29X........vvvvvvvvP30X........vvvvvvvvP31X........vvvvvvvvP32X........vvvvvvvvP33X........vvvvvvvvP34X........vvvvvvvvP35X........vvvvvvvvP1vvvvvvvvP0X........vvvvvvvv
Successfully converted firmware.
Found all expected bootloaders
SteamVR Watchman Dongle Updater utility has finished.
```

If you receive an error similar to `Timed out looking for 1 bootloaders. Only found 0` , make sure that the batch file is run with Administrative privileges otherwise the flashing attempt will fail.
