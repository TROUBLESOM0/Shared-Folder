@echo off
title CONFIGURE FOR SHARED FOLDER ON %COMPUTERNAME%
color 2
if %COMPUTERNAME%==CI-D514 (
	set host=uhd312
) else if %COMPUTERNAME%==CI-D504 (
	set host=uhd311
) else if %COMPUTERNAME%==CI-D513 (
	set host=super311312
) else if %COMPUTERNAME%==CI-L696 (
	set host=CV-Laptop
) else if %COMPUTERNAME%==CI-L210 (
	set host=uhd311-Laptop
) else (
	goto noname)
echo "Configuring Shared Folder on %host%"
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
) else if %host%==CV-Laptop (
	echo "Setting up for Control Van Laptop"
) else if %host%==uhd311-Laptop (
	echo "Setting up for UHD311 Laptop"
) else (goto broken)
for /L %%A in (1,1,5) do (
	<nul set /p "=."& >nul timeout 1
	)
timeout /t 1 /nobreak >nul
echo So far everything looks good, but you need to confirm you can see the server.
timeout /t 4 /nobreak >nul
echo:
echo Couldn't get it to work consistently , so ... You need to type:
echo ping 192.168.60.130
echo into command prompt    oh wait, I can do that and just query you
timeout /t 5 /nobreak >nul
echo:
ping -n 1 192.168.60.100
echo:
echo " ******** READ THE ABOVE FEW LINES AND SEE IF YOU HAVE COMMS ******** "
echo " ******** YOU SHOULD SEE SOMETHING LIKE ... bytes=32 time<1ms TTL=128 ... AND SHOULDN'T SEE - Destination host unreachable ******** "
echo " ********************************************************************************************************************************** "
echo " ******** IF IT ALL LOOKS OKAY, TYPE LOWERCASE y ******** " 
set /p input=Was the ping successfull and you want to continue setting up on %host% ? (type y/n)
if %input%==y (goto connect) else (goto end)

:connect
echo:
echo Located 192.168.60.100 on this network. Setting up Shared Drive...
net use S: \\192.168.60.100\SHARED /user:CI-D022\%host% Open1234 /persistent:Yes
echo: :::
echo There should now be a network drive labeled "S:Shared" in the left column in Windows Explorer.
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
echo Goodbye
pause >nul
exit

:broken
echo Somehting Went TErrivllei RWongr
pause >nul
exit

:end
echo Press any key to end program ....
pause >nul
exit