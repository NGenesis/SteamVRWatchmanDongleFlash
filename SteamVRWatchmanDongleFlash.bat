@ECHO OFF
SET "steampath="
FOR /F "tokens=1,2*" %%A IN ('REG QUERY "HKCU\SOFTWARE\Valve\Steam" 2^> NUL') DO (IF "%%A" EQU "SteamPath" (SET "steampath=%%C" GOTO :SteamPathFound))
IF NOT DEFINED steampath (GOTO :SteamPathNotFound)

:SteamPathFound
ECHO Steam installation found at "%steampath:/=\%"
SET "steamvrpath=%steampath:/=\%\steamapps\common\SteamVR\tools\lighthouse\bin\win32\lighthouse_watchman_update.exe"
IF NOT EXIST %steamvrpath% (GOTO :SteamVRPathNotFound)
ECHO SteamVR Watchman Dongle Updater utility found at "%steamvrpath%"
PUSHD "%steampath:/=\%\steamapps\common\SteamVR"
ECHO Running SteamVR Watchman Dongle Updater utility...
tools\lighthouse\bin\win32\lighthouse_watchman_update.exe -D tools\lighthouse\firmware\vr_controller\archive\htc_vrc_dongle_1461100729_2016_04_19.bin
POPD
ECHO SteamVR Watchman Dongle Updater utility has finished.
PAUSE
EXIT /B

:SteamVRPathNotFound
ECHO Error: Failed to find SteamVR Watchman Dongle Updater utility.
PAUSE
EXIT /B

:SteamPathNotFound
ECHO Error: Failed to find Steam installation path.
PAUSE
EXIT /B