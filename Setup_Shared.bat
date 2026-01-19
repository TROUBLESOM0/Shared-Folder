@REM v.11.1
@echo off
title CONFIGURE FOR SHARED FOLDER ON %COMPUTERNAME%
color 2
if %COMPUTERNAME%==CI-D514 (
  set host=uhd312
) else if %COMPUTERNAME%==CI-D504 (
  set host=uhd311
) else if %COMPUTERNAME%==CI-D513 (
  set host=super311312
) else if %COMPUTERNAME%==CI-L210 (
  set host=uhd311-Laptop
) else if %COMPUTERNAME%==CI-L223 (
  set host=uhd312-Laptop
) else if %COMPUTERNAME%==CI-L696 (
  set host=CV-Laptop
) else if %COMPUTERNAME%==UHD311D (
  set host=WV-Desktop
) else if %COMPUTERNAME%==Workshop (
  set host=Workshop
) else if %COMPUTERNAME%==CI-D541 (
  set host=CI-D541
) else if %COMPUTERNAME%==DESKTOP-ICGA7FO (
  set host=DESKTOP-ICGA7F0
) else if %COMPUTERNAME%==DESKTOP-A55D57I (
  set host=DESKTOP-A55D57I
) else (
goto noname
)
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
echo "ver. 11 - Configures shared folder for 11 PC's"
echo "Configuring Shared Folder on %host%"
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
echo:
echo:
echo %date% %time%
echo:
echo Checking IP Configuration
for /L %%A in (1,1,3) do (
	<nul set /p "=-"& >nul timeout 1
	)
if %host%==uhd312 (
  echo "Setting up for UHD312"
) else if %host%==uhd311 (
  echo "Setting up for UHD311"
) else if %host%==super311312 (
  echo "Setting up for Super311312"
) else if %host%==uhd311-Laptop (
  echo "Setting up for uhd311-Laptop"
) else if %host%==uhd312-Laptop (
  echo "Setting up for uhd312-Laptop"
) else if %host%==CV-Laptop (
  echo "Setting up for CV-Laptop"
) else if %host%==WV-Desktop (
  echo "Setting up for WV-Desktop"
) else if %host%==Workshop (
  echo "Setting up for Workshop"
) else if %host%==CI-D541 (
  echo "Setting up for CI-D541"
) else if %host%==DESKTOP-ICGA7F0 (
  echo "Setting up for DESKTOP-ICGA7F0"
) else if %host%==DESKTOP-A55D57I (
  echo "Setting up for DESKTOP-A55D57I"
) else (
goto broken
)

echo So far everything looks good, but you need to confirm you can see the server.
timeout /t 4 /nobreak >nul
echo:
echo:
echo:
echo      oh wait, I can do that and just query you
timeout /t 5 /nobreak >nul
ping -n 1 192.168.60.100
echo:
echo:
set /p input=Was the ping successfull and you want to continue setting up on %host% ? (type y/n)
if %input%==y (goto connect) else (goto end)

:connect
echo:
echo Located 192.168.60.100 on this network. Setting up Shared Drive...
net use S: \\192.168.60.100\SHARED /user:CI-D022\%host% Open1234 /persistent:Yes
echo:
echo:
echo:
echo:
echo There should now be a network drive labeled "S:Shared" in the left column in Windows Explorer.
echo --------------------------------------------
echo - Open Windows Explorer and select "This PC"
echo - Right Click the "SHARED (S:)" folder and select "Create shortcut"
echo - Select "YES"... because you do want to put it on the desktop
echo - Then, probably, just rename the file to "SHARED" because sometimes having
echo     just the word "shortcut" in there has confused some people.
echo --------------------------------------------
echo:
echo:
echo If it disappears or you are unable to connect, Run this program again.
goto end

:notconnect
echo:
echo Unable to locate 192.168.60.100 ...
echo Check that this computer has an IP Address in the range "192.168.60.xxx"
echo Or verify the Shared Computer is powered on and logged in with:
echo User: uhd
echo Password: Open1234
echo And has the IP Address of 192.168.60.100
echo:
echo Then come back and run program again.
echo:
echo:
goto end

:noname
echo The computer you are attempting to configure is not in the list
echo Nothing left to do here except changing this code

set "d=%USERPROFILE%\Desktop"
set "o=%d%\Shared_Run_Debug.bar"
systeminfo > "%o%"
echo "File Shared_Run_Debug.bar was created on Desktop.  Send this for debugging"
echo If you can't find the file, then
echo Open Command Prompt and type "ipconfig /all". Send me what is listed as "Host Name:"
echo Goodbye
pause >nul
exit

:broken
echo Somehting Went TErrivllei RWongr
echo Open Command Prompt and type "systeminfo". Send me what is listed as "Host Name:"
echo Goodbye
pause >nul
exit

:end
echo Press any key to end program ....
pause >nul
exit



