@ECHO OFF
SET "steampath="
FOR /F "tokens=1,2*" %%A IN ('REG QUERY "HKCU\SOFTWARE\Valve\Steam" 2^> NUL') DO (IF "%%A" EQU "SteamPath" (SET "steampath=%%C" GOTO :SteamPathFound))
IF NOT DEFINED steampath (GOTO :SteamPathNotFound)

:SteamPathFound
ECHO Steam installation found at "%steampath:/=\%"
SET "steamvrpath=%steampath:/=\%\steamapps\common\SteamVR\tools\lighthouse\bin\win32\lighthouse_watchman_update.exe"
IF NOT EXIST %steamvrpath% (GOTO :SteamVRPathNotFound)
ECHO SteamVR Watchman Dongle Updater utility found at "%steamvrpath%"
GOTO :Menu
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

:Menu
ECHO.
ECHO -----------------------------------------------------------------------------
ECHO -                     STEAM / STEAMVR DONGLE FLASHER                        -
ECHO -----------------------------------------------------------------------------
ECHO.
ECHO WARNING: Before running this, ensure you do the following first:
ECHO  - This batch file is being run with Administrative privileges.
ECHO  - Exit SteamVR and Steam.
ECHO  - Power off all VR headsets and VR controllers.
ECHO  - Disconnect any dongles you don't want to flash from the computer.
ECHO  - Connect any dongles you want to flash to the computer.
ECHO.
ECHO 1. Convert [ Steam Controller Dongle ] to [ SteamVR Watchman Dongle ]
ECHO 2. Revert [ SteamVR Watchman Dongle ] back into [ Steam Controller Dongle ]
ECHO 3. Exit
ECHO.
:RequestMenuOption
SET /P option="Type an option from [ 1, 2, 3 ] then press ENTER: "
IF NOT DEFINED option GOTO :RequestMenuOption
IF %option%==1 GOTO :ConvertDongle
IF %option%==2 GOTO :RevertDongle
IF %option%==3 EXIT /B
GOTO :RequestMenuOption

:ConvertDongle
PUSHD "%steampath:/=\%\steamapps\common\SteamVR\tools\lighthouse"
ECHO Converting all connected Steam Controller Dongles to SteamVR Watchman Dongles...
bin\win32\lighthouse_watchman_update.exe -D firmware\vr_controller\archive\htc_vrc_dongle_1461100729_2016_04_19.bin
POPD
ECHO SteamVR Watchman Dongle Updater utility has finished.
PAUSE
EXIT /B

:RevertDongle
PUSHD "%steampath:/=\%\steamapps\common\SteamVR\tools\lighthouse"
ECHO Reverting all connected SteamVR Watchman Dongles back into Steam Controller Dongles...
bin\win32\lighthouse_watchman_update.exe -e firmware\vr_controller\archive\htc_vrc_dongle_1461100729_2016_04_19.bin
POPD
ECHO SteamVR Watchman Dongle Updater utility has finished.
PAUSE
EXIT /B